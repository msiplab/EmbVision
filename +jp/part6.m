%% *EmbVision チュートリアル（６）*
%
% *映像ストリーム処理 - Raspberry Pi(TM)編 -*
%
% 新潟大学
% 村松　正吾，高橋　勇希
%
% Copyright (c), All rights reserved, 2014-2022, Shogo MURAMATSU and Yuki TAKAHASHI
% 

%%
% <part5.html Part5> |
% <index.html メニュー>

%% 
% *概要*
%
% 本演習では、Part5で作成したSimulink モデル を Raspberry Pi に実装し、
% エクスターナルモードでのシミュレーションのほか、
% スタンドアロンで実行する方法について学ぶ。

%% Raspberry Pi 設定
% シングルボードコンピュータ Raspberry Pi への実装コードを
% Simulinkモデルを通じて生成することができる。
%
% なお、本演習は Windows(R)上のMATLABで実行する必要がある。
%
% 以下では、Raspberry Pi 用のサポートパッケージ
%
% * <http://jp.mathworks.com/help/simulink/ug/install-target-for-raspberry-pi-hardware.html Raspberry Pi>
%
% が既にインストールされている前提で話を進める。

%%
% [ <part6.html トップ> ]

%% シミュレーションモデル
% まず、本演習 Part5 で作成した Simulink モデル videogradfilt を 
% Raspberry Pi 用に変更しよう。
%
% モデル videogradfilt を読み込み、 videogradfiltraspi として保存する。
%
%   open_system('videogradfilt')
%   save_system('videogradfilt','videogradfiltraspi')

%%
% Raspberry Pi 用の実装コード生成を行う Simulink モデルは、
% 全てのブロックがコード生成に対応している必要がある。
% さらに、各種入出力ブロックは Raspberry Pi 用のブロックライブラリから
% 選択して使用する必要がある。
%
% Raspberry Pi 用のブロックライブラリは、Simulinkライブラリブラウザーから
%
% * Simulink Support Package for Raspberry Pi hardware
% 
% を選択すればよい。
%
% <<raspberrypi_blocks.png>>
%
% あるいは、MATLAB(R) コマンドウィンドウ上から
%
%   raspberrypilib
% 
% と打ち込んでも良い。

%%
% 映像入出力ブロックを Raspberry Pi 用の入出力ブロックに置き換えよう。
%
% * 「From Multimedia File」「RGB to Gray」→ 「V4L2 Video Capture」
% * 「To Multimedia File」 → 「SDL Video Display」
%
% <<videogradfiltraspi_slx_00.png>>
%
% 「V4L2 Video Capture」ブロックの出力Yはグレースケールに対応する。
% 本モデルでは、残りの出力 Cb,Crを利用しないため、以下の終端ブロックを接続した。
%
% * <matlab:doc('simulink/terminator') Simulink/Commonly Used Blocks/Terminator>
%
% また、「SDL Video Display」ブロックでは RGB 入力ができるよう、
% ブロックパラメータ Pixel format を RGB と編集した。

%%
% 早速、実行してみよう。
%
% <<videogradfiltraspi_slx_01.png>>
%
% すると、「SDL Video Display」ブロックの入力部でデータ型の不一致による
% エラーが生じる。
%
% 原因は、「SDL Video Display」ブロックが8ビット符号なし整数型(uint8)を
% 要求するのに対し、「HSV to RGB」ブロックが実数型(double)でデータを出力
% するためである。
%
% この問題を回避するために、ゲイン調整とデータ型変換を行うブロック
%
% * <matlab:doc('simulink/gain') Simulink/Commonly Used Blocks/Gain>
% * <matlab:doc('simulink/datatpeconversion') Simulink/Commonly Used Blocks/Convert>
%
% を「SDL Video Display」ブロックの入力部に挿入し実行しよう。
%
% <<videogradfiltraspi_slx_02.png>>
%
% 無事実行され、ダミーの映像処理が実行される。  
%

%%
% ここで
%
% * 「V4L2 Video Capture」ブロックは水平と垂直を転置して出力する。
% * 「SDL Video Display」ブロックは入力の水平と垂直を転置して表示する。
%
% という点に注意してほしい。
% このことを確かめるために、「Computer Vision System Toolbox/Sinks」内にある
%
% * <matlab:doc('vision/tovideodisplay') To Video Display> ブロック（Windows(R)のみ）
% 
% を一時的に 「V4L2 Video Capture」の出力Yに接続して、シミュレーションを実行
% してみよう。
%
% <<videogradfiltraspi_slx_03.png>>
%
% 「V4L2 Video Capture」の出力と「SDL Video Display」の表示を比べると
% 互いに転置の関係にあることが分かる。
%
% したがって、勾配フィルタの方向を修正しなければならない。
% 「Filt.Grad.」ブロックのKernelプロパティを
%
% <<gradfilt_kernel.png>>
%
% のように転置するよう編集して、勾配フィルタの方向を修正しよう。
%
% 再度、モデル videogradfiltraspi を実行しよう。
%
% <<videogradfiltraspi_slx_04.png>>
%
% 出力の彩色（勾配方向）が修正されていることが確認できる。
%
% 以降、「To Video Display」ブロックは不要なのでモデルから削除しておこう。

%%
% [ <part6.html トップ> ]

%% ハードウェア実行の準備
% Raspberry Pi 用に構築したモデルを実際のボード上で動作させてみよう。
%
% Simulink モデルを Raspberry Pi 上で動作させる方法には、
%
% * エクスターナルモードシミュレーション
% * スタンドアロン実行
%
% の二種類がある。
%
% エクスターナルモードでは、Simulink モデルから Raspberry Pi 上で
% 動作する実装コードを生成し、Raspberry Pi 上で実際に動作させ、
% その出力を手元の Simulink 上で確認する。
%
% 一方、スタンドアロン実行では、Simulink モデルから Raspberry Pi 上で
% 独立に動作する実装コードを生成し、Raspberry Pi 上で動作させる。

%%
% まず、準備として Raspberry Pi model B/B+ を用意し
%
% # MicroSD カード
% # LAN ケーブル
% # Web カメラ
% # 電源ケーブル
% 
% の順に接続しよう。
%
% <<raspi_microsd.png>>
%
% <<raspi_cableconnection.png>>
%
% なお、MicroSD にはRaspberry Pi Support Package から
% ファームウェアイメージの書き込みが完了しているものとする。
%
% * [ツール] > [ターゲットハードウェアで実行 ] > [ファームウェアの更新... ]

%%
% では、Simulink から Raspberry Pi への接続を行うための準備をしよう。
%
% Simulink モデル videogradfiltraspi のメニューバーから
%
% * [ツール] > [ターゲットハードウェアで実行 ] > [オプション ]
%
% へと進む。
%
% <<videogradfiltraspi_slx_05.png>>
%
% ターゲットハードウェアとして「Raspberry Pi」を選択する。
%
% <<videogradfiltraspi_slx_06.png>>
%
% 接続するボードの情報を確認する。
%
% <<videogradfiltraspi_slx_07.png>>
%
% 特に、「Board information」の「Host name」は、各ボード毎に設定が異なるので
% 編集が必要となる。
%
% * 演習中に必要な情報を提供する。
%
% IPアドレスが分かれば、以下の用に編集すればよい。（192.168.11.2は一例）
%
% <<videogradfiltraspi_ipaddress.png>>
% 
% 「OK」をクリックし準備を完了する。

%%
% [ <part6.html トップ> ]

%% エクスターナルモード
% では、Simulink モデル videogradfiltraspi をエクスターナルモードで動作
% させてみよう。
% 
% まず、シミュレーションのモードを「ノーマル」から
%
% * エクスターナル
%
% へと変更する。
%
% <<videogradfiltraspi_external.png>>
%
% 早速、実行してみよう。
%
% <<videogradfiltraspi_slx_08.png>>
%
% Raspberry Pi に接続した Web カメラの処理映像が Simulink 上で表示される。

%%
% [ <part6.html トップ> ]

%% スタンドアロン実行
% では、Simulink モデル videogradfiltraspi を Raspberry Pi 上で
% スタンドアロン実行してみよう。
%
% スタンドアロン実行のために以下の準備を行う。
%
% # 電源ケーブルを一旦外す
% # HDMIディスプレイ接続する
% # 電源ケーブルを再度接続する
%
% <<raspi_hdmi.png>>
%
% 正しく接続されていれば、Rasbian の起動を Raspberry Pi に接続した
% ディスプレイ上で確認できる。
%
% なお，Raspberry Pi Camera Module を利用するためには以下のサイトを参照してほしい。
% 
% http://www.mathworks.com/matlabcentral/answers/122199-simulink-with-raspberry-pi-camera-capture

%%
% Simulink モデル videogradfiltraspi に戻り、
%
% * 「ハードウェアに展開」
%
% のボタンをクリックしよう。
%
% <<videogradfiltraspi_slx_09.png>>
%
% Windowsのコマンドウィンドウが立ち上がらり、Simulink モデルの左下に
%
% * 「モデルは'Raspberry Pi' に正常に配布されました。」
%
% と表示されれば成功である。
%
% <<videogradfiltraspi_slx_10.png>>
%
% Raspberry Pi に接続されたディスプレイ上にカメラからの映像の
% 処理結果が表示される。
% 
% <<raspi_videogradfilt.png>>
%

%% 
% 以降、Simulink モデル videogradfiltraspi を閉じても、Raspberry Pi 上の
% 処理は継続される。
%
%   close_system('videogradfiltraspi')
%

%% 
% MATLAB コマンドウィンドウ上で <matlab:help('raspberrypi') raspberrypi>
% 関数を利用すると、接続中の Raspberry Pi の情報を取得できる。
%
%   h = raspberrypi

%%
% Raspberry Pi 上で動作中のモデル videogradfiltraspi を停止するには、
% stop メソッドを利用する。
%
%   h.stop('videogradfiltraspi')
%
    
%%
% 再度モデル videogradfiltraspi を開き、run メソッドを用いれば、
% Raspberry Pi 上でモデルを再起動することもできる。
%
%   open_system('videogradfiltraspi')
%   h.run('videogradfiltraspi')

%%
% [ <part6.html トップ> ]

%% 演習課題
%
% *演習課題6-1. Sobel勾配フィルタ* 
%
% 演習課題4-1で紹介した Sobel カーネルに変えて Raspberry Pi 上で、
% スタンドアロン実行しよう。

%%
% 
% *演習課題6-2. モデルの自作と実行*（オプション） 
%
% 自ら映像処理モデルを創造設計し、
% Raspberry Pi 上で、スタンドアロン実行しよう。
%
% 以下に期待される拡張例を示す。
% 
% * Raspberry Pi カメラモジュール制御
% * 固定小数点実装
% * 並列実装（RasPi2上のクアッドコア用）
% * 物体の検出および認識
% * 音声・音響信号処理
% * GPIO/I2C 制御
% * ネットワークアプリケーション開発
%

%%
% <html>
% <hr>
% </html>
%%
% <part5.html Part5> |
% <index.html メニュー> |
% <part6.html トップ> 
