%% *EmbVision チュートリアル（５）*
%
% *映像ストリーム処理 - Simulink編 -*
%
% 新潟大学
% 村松　正吾，高橋　勇希
%
% Copyright (c), All rights reserved, 2014-2022, Shogo MURAMATSU and Yuki TAKAHASHI
% 

%%
% <part4.html Part4> |
% <index.html メニュー> |
% <part6.html Part6>

%%
% *概要*
%
% 本演習では、Simulinkにて映像ファイルの入力と表示を行うほか、
% System object(TM) から Simulink ブロックを作成する方法と、
% 同ブロックを利用した映像ストリーム処理について学ぶ。

%% Simulink モデルの作成
% まず、新しい Simulink モデルを作成するために、新規にモデルファイルを作成しよう。
%
% ホームタグから、
% 
% # 「新規作成」
% # →「Simulink モデル」
%
% を選択するか、 MATLABコマンドウィンドウ上から
% <matlab:doc('new_system') new_system> 関数と
% <matlab:doc('open_system') open_system> 関数
% を利用すればよい。
%
% 例として、コマンドウィンドウ上から'videoio' というモデルを作成してみよう。 
%
%   new_system('videoio','Model')
%   open_system('videoio')

%%
% 以下のようなウィンドウが現れる。
%
% <<videoio_slx_00.png>>
%

%%
% モデルの保存は、メニューバー上のアイコン
%
% <<file_button.png>>
%
% をクリックするか、
% MATLABコマンドウィンドウ上から
%
%   save_system('videoio')
%
% のように <matlab:doc('save_system') save_system> 関数を利用すればよい。

%%
% [ <part5.html トップ> ]

%% Simulink ライブラリブラウザー
% Simulink では、処理の構成要素となるブロックを並べて接続し、
% 各ブロックのプロパティや動作条件を設定し、
% システムのシミュレーションを行うことができる。
%
% まず、既存の構成ブロックを利用するために、メニューバー上のアイコン
%
% <<library_button.png>>
%
% をクリックしよう。すると、以下のような Simulinkライブラリブラウザーが現れる。
%
% <<library_browser.png>>

%%
% [ <part5.html トップ> ]

%% 映像ファイル入出力モデル
% では、例として映像ファイルの入力と出力を行うシステムモデルを構築しよう。
%
% まず、左側のリストから
%
% * <matlab:doc('vision') Computer Vision System Toolbox(TM)>
%
% を選択しよう。
%
% すると、ライブラリブラウザーは Computer Vision System Toolbox の
% ブロック群を表示する。
% 
% <<cvs_library.png>>
%
% MATLAB コマンドウィンドウ上から
%
%   visionlib
% 
% と打ち込んでも良い。

%%
% 右側のアイコン群から、「Sources」アイコン
% 
% <<cvs_sources.png>>
%
% をクリックし、「Computer Vision System Toolbox/Sources」 のブロック群を開こう。
%
% <<cvs_sources_blocks.png>>
%

%%
% ブロック群から 「From Multimedia File」を右クリックして、
% モデル videoio にブロックを追加しよう。
%
% <<videoio_slx_01.png>>

%%
% 続けて、Simulink ライブラリブラウザー「Computer Vision System Toolbox」から
% Sinks のアイコン
% 
% <<cvs_sinks.png>>
%
% をクリックし、「Computer Vision System Toolbox/Sinks」 のブロック群を開こう。 
%
% <<cvs_sinks_blocks.png>>
%

%%
% ブロック群から 「To Multimedia File」を右クリックして、
% モデル videoio にブロックを追加しよう。
%
% <<videoio_slx_02.png>>

%%
% 「From Multimedia File」の出力端子をドラックして、「From Multimedia File」の
% 入力端子に接続しよう。
%
% <<videoio_slx_03.png>>

%%
% モデルエディタ上の実行ボタンアイコン
%
% <<play_button.png>>
%
% を左クリックすると、作成したモデルのシミュレーションが実行される。
%
% <<videoio_slx_04.png>>

%%
% AVIファイル output.avi が出力される。
% MATLABの外部のツールで再生して確認してほしい。
%
% 入力AVIファイルを変えたい場合には、「From Multimedia File」ブロックを
% ダブルクリックして、パラメータダイアログを開き、「File name」を変更する。
%
% <<frommultimediafile_blockparameter.png>>
%

%%
% ライブラリブラウザーから
%
% * <matlab:doc('imaq') Image Acquisition Toolbox(TM)>
%
% を選択して、「From Video Device」ブロックを利用すれば、
% 接続されたカメラからの映像を入力として利用できる。
%
% <<imaq_blocks.png>>
%
% MATLAB コマンドウィンドウ上から
%
%   imaqlib
% 
% と打ち込んでも良い。詳細は割愛する。
%

%%
% 出力AVIファイルを変えたい場合には、「To Multimedia File」ブロックを
% ダブルクリックして、パラメータダイアログを開き、「File name」を変更する。
% 
% <<tomultimediafile_blockparameter.png>>

%%
% 出力先として「Computer Vision System Toolbox/Sinks」内にある
%
% * <matlab:doc('videoviewer') Video Viewer> ブロック
% * <matlab:doc('vision/tovideodisplay') To Video Display> ブロック（Windows(R)のみ）
% 
% を利用すれば、Simulink 上でビューワーが現れ、
% シミュレーションをしながら出力映像を確認することができる。詳細は割愛する。

%%
% [ <part5.html トップ> ]

%% MATLAB System ブロック
% MATLAB System ブロックを利用すると、System object を Simulink ブロック
% として利用することができる。
% 
% 例として、本演習 Part3 で作成した Rgb2GraySystem をブロックとして
% 利用してみよう。

%%
% モデル videoio を videorgb2gray として保存する。
%
%   open_system('videoio')
%   save_system('videoio','videorgb2gray')

%%
% Simulink ライブラリブラウザーから「Simulink/User-Defined Functions」の
% ブロック群を表示し、その中から
%
% * MATLAB System ブロック
%
% を選択して、モデル videorgb2gray に追加しよう
%
% <<udf_blocks.png>>

%%
% モデル videorgb2gray は以下の様な状態となる。
%
% <<videorgb2gray_slx_00.png>>

%%
% MATLAB System ブロックを映像入出力の間に挟み、プロパティダイアログを開いて
% 
% * System object名: Rgb2GraySystem
%
% を設定しよう。
%
% <<videorgb2gray_slx_01.png>>

%%
% 「OK」ボタンをクリックして、中央のブロックを適当に大きく広げると以下の様な
% 状態となる。
%
% <<videorgb2gray_slx_02.png>>

%%
% 実行して、AVIファイル output.avi を確認してみよう。

%%
% [ <part5.html トップ> ] 

%% アイコンのカスタマイズ
% MATLAB System ブロックの入出力名は、呼び出される System object 上で
% カスタマイズできる。
%
% 入出力ポート名などを指定してみよう。
% ブロックパラメータダイアログから Rgb2GraySystem のソースコードを開こう。
%
% <<matlabsystem_blockparameter.png>>
%
% 次に、methods(Access=protected) ブロックに、以下のメソッドを追記する。
%
%   methods (Access=protected)
%      ...（省略）
%      % 入力ポート数
%      function N = getNumInputsImpl(obj)
%          N = 1; 
%      end
%      % 出力ポート数        
%      function N = getOutputNamesImpl(obj)
%          N = 1;
%      end      
%      % 入力ポート名
%      function inputName = getInputNamesImpl(obj)
%             inputName = 'RGB';
%      end
%      % 出力ポート名
%      function outputName = getOutputNamesImpl(obj)
%             outputName = 'Gray';
%      end
%      ...（省略）
%   end

%% 
% さらに、
%
% * <matlab:doc('matlab.system.mixin.CustomIcon') matlab.system.mixin.CustomIcon>
%
% を継承することで、アイコンをカスタマイズできる。
% 
% まず、ソースコードの classdef の行を以下のように修正する。
%
%   classdef Rgb2GraySystem < matlab.System ...
%         & matlab.system.mixin.CustomIcon
%
% 次に、methods(Access=protected) ブロックに、以下のメソッドを追記する。
%
%   methods (Access=protected)
%      ...（省略）
%      % アイコン
%      function icon = getIconImpl(obj)
%         icon = sprintf('RGB to Gray');
%      end
%      ...（省略）
%   end

%%
% 「OK」ボタンをクリックして、ダイアログを閉じると以下の様に、
% 中央ブロックの入出力名とアイコン名が指定通りの状態となる。
%
% <<videorgb2gray_slx_03.png>>


%%
% [ <part5.html トップ> ]

%% 演算精度と信号特性伝搬（オプション）
%
% * <matlab:doc('matlab.system.mixin.Propagates') matlab.system.mixin.Propagates>
%
% （準備中）

%% フィードスルー（オプション）
%
% * <matlab:doc('matlab.system.mixin.Nondirect') matlab.system.mixin.Nondirect>
%
% （準備中）

%%
% [ <part5.html トップ> ]

%% 演習課題
% *演習課題5-1. Prewitt勾配フィルタ*
%
% 本演習Part4で作成した System object クラス
%
%   * Rgb2GraySystem
%   * GradFiltSystem
%   * Hsv2RgbSystem
%
% を MATLAB System ブロックとして利用し、以下の MATLAB コードを Simulink 上で
% モデル化しよう。
% 
%   vrObj = VideoReader('vipmen.avi');
%   frameRate = get(vrObj,'FrameRate');
%   vwObj = VideoWriter('vipmengradfilt.avi');
%   set(vwObj,'FrameRate',frameRate);
%   rgsObj = Rgb2GraySystem();
%   hrsObj = Hsv2RgbSystem();
%   gfsObj = GradFiltSystem();
%   open(vwObj)
%   while (hasFrame(vrObj))
%      frame     = readFrame(vrObj);         % フレーム入力
%      graysc    = step(rgsObj,frame);       % グレースケール化
%      [mag,ang] = step(gfsObj,graysc);      % 勾配フィルタリング
%      ang       = (ang+pi)/(2*pi);          % 偏角の正規化
%      mag       = min(mag,1);               % 大きさの飽和処理
%      [r,g,b]   = step(hrsObj,ang,mag,mag); % 疑似カラー化
%      frame     = cat(3,r,g,b);             % RGB配列結合
%      writeVideo(vwObj,frame);              % フレーム出力 
%   end
%   close(vwObj)
%
% （モデル例）
%
% <<videogradfilt_slx_00.png>>
%
% ただし、以下のブロックを利用。
%
% * <matlab:doc('simulink/saturation') Simulink/Commonly Used Blocks/Saturation>
% * <matlab:doc('simulink/constant') Simulink/Commonly Used Blocks/Constant>
% * <matlab:doc('simulink/add') Simulink/Commonly Used Blocks/Sum>
% * <matlab:doc('simulink/gain') Simulink/Commonly Used Blocks/Gain>
%
% （処理例）
%
% <<vipmengradfilt_avi.png>>

%%
% *演習課題5-2. Sobel勾配フィルタ*
%
% 演習課題5-1で作成した Prewitt 勾配フィルタモデルのフィルタカーネル
% を演習課題4-1で紹介した Sobel カーネルに変えてシミュレーションを実行
% してみよう。
% 
% * ヒント：GradFilterSystem ブロックのパラメータ Kernel を修正すればよい。
%
% （処理例）
%
% <<vipmengradfilt_sobel_avi.png>>

%%
% <html>
% <hr>
% </html>
%%
% <part4.html Part4> |
% <index.html メニュー> |
% <part5.html トップ> |
% <part6.html Part6>
