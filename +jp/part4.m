%% *EmbVision チュートリアル（４）*
%
% *映像ストリーム処理 - MATLAB編 -*
%
% 新潟大学
% 村松　正吾，高橋　勇希
%
% Copyright (c), All rights reserved, 2014-2022, Shogo MURAMATSU and Yuki TAKAHASHI
% 

%%
% <part3.html Part3> |
% <index.html メニュー> |
% <part5.html Part5>

%%
% *概要*
%
% 本演習では、MATLABにて映像ファイルの情報を読み込む方法のほか、
% 映像表示、映像ファイル出力、簡単な映像ストリーム処理について学ぶ。
%
% 準備として、開いている全ての Figure を <matlab:doc('close') close> 関数で
% 閉じておく。

close all

%% 映像入力
% 
% MATLABにおける映像入力は、
% <matlab:doc('VideoReader') VideoReader> クラスの
% <matlab:doc('VideoReader.readFrame') readFrame> メソッドを
% 利用することで実現できる。
 
vrObj = VideoReader('shuttle.avi');
frame = readFrame(vrObj);

%%
% 変数 frame は映像データの最初のフレームを保持する。
% 
% shuttle.avi はRGBカラー映像なので、変数 frame は三次元配列となる。
%
% 特に指定をしなければ、データ型は符号なし整数８ビット型 uint8となる。

whos vrObj frame

%%
% frame を表示してみよう。
%
% 後ほど利用するため、imshow のハンドルオブジェクトも用意しておく。

figure(1)
hi1 = imshow(frame);

%%
% なお、変数 vrObj は、VideoReader のインスタンスオブジェクトとなっており、
% 映像に関する情報をプロパティとして保持している。
%
% 主なプロパティを以下にまとめる。
%
% * BitsPerPixel: 一画素当たりのビット数 [bpp]
% * FrameRate: フレームレート [bps]
% * Height: 画面の高さ [pixels]
% * Width: 画面の幅 [pixels]

properties(vrObj)

%%
% したがって、画面の高さや幅、フレームレートなどの情報は
% 以下のようにして取得できる。

height    = get(vrObj,'Height');
width     = get(vrObj,'Width');
frameRate = get(vrObj,'FrameRate');

%%
% さらに、 readFrame メソッドを呼び出すと次のフレームを読み込む。
%
% なお、imshow のハンドルオブジェクト hi1 の CData プロパティに frame の
% データを上書きすることで表示を更新している。

frame = readFrame(vrObj);
set(hi1,'CData',frame);

%%
% [ <part4.html トップ> ]

%% 映像表示
% 映像入力オブジェクト vrObj の時刻を 0 に戻して、全てのフレームを表示しよう。
%
% なお、 <matlab:doc('while') while> ループ内で全てのフレームが
% 表示されるよう <matlab:doc('drawnow') drawnow> 関数で
% 各フレームの描画を強制する。
%
% また、 <matlab:doc('VideoReader.hasFrame') hasFrame> メソッドで
% 最終フレームか否かの情報を取得している。

set(vrObj,'CurrentTime',0);
while (hasFrame(vrObj))
    frame = readFrame(vrObj);
    set(hi1,'CData',frame);
end

%%
% 他に、 <matlab:doc('movie') movie> 関数での映像表示も可能である。
% ここでは説明を割愛する。

%%
% [ <part4.html トップ> ]

%% 映像出力
% MATLABにおける映像出力は <matlab:doc('VideoWriter') VideoWriter> クラスの
% <matlab:doc('VideoWriter.writeVideo') writeVideo> メソッドを利用することで
% 実現できる。
%
% 映像入力オブジェクト vrObj の時刻を 0　に戻して、映像のコピーを
% AVIファイル shuttleclone.avi に出力してみよう。

set(vrObj,'CurrentTime',0);
vwObj = VideoWriter('shuttleclone.avi');
properties(vwObj)

%%

set(vwObj,'FrameRate',frameRate);
open(vwObj)
while (hasFrame(vrObj))
    frame = readFrame(vrObj);
    writeVideo(vwObj,frame);
end
close(vwObj)

%%
% AVIファイル shuttleclone.avi が出力される。
%
% 保存されたAVIファイルはMATLABの外部のツールで再生することができる。
%
% <<shuttleclone.png>>
% 

%%
% [ <part4.html トップ> ]

%% 映像処理
% 映像フレームの入力と出力の間に各フレームに対する処理を挿入することで、
% 映像ストリーム処理を実現できる。
%
% 以下では、演習（３）で作成した
%
% * Rgb2GraySystem
% * Hsv2RgbSystem
% * GradFiltSystem
%
% を利用して、フレーム毎の勾配フィルタ出力を映像化しよう。
% 
% まず、フレーム処理オブジェクトを生成する。

rgsObj = Rgb2GraySystem();
hrsObj = Hsv2RgbSystem();
gfsObj = GradFiltSystem();

%%
% 次に、映像入力オブジェクト vrObj の時刻を 0　に戻し、
% 出力映像を保存するAVIファイル shuttlegrad.avi の準備をする。

set(vrObj,'CurrentTime',0);
vwObj = VideoWriter('shuttlegrad.avi');
set(vwObj,'FrameRate',frameRate);
open(vwObj)

%%
% 映像処理を開始する。

while (hasFrame(vrObj))
    frame     = readFrame(vrObj);         % フレーム入力
    graysc    = step(rgsObj,frame);       % グレースケール化
    [mag,ang] = step(gfsObj,graysc);      % 勾配フィルタリング
    ang       = (ang+pi)/(2*pi);          % 偏角の正規化
    mag       = min(mag,1);               % 大きさの飽和処理
    [r,g,b]   = step(hrsObj,ang,mag,mag); % 疑似カラー化
    frame     = cat(3,r,g,b);             % RGB配列結合
    writeVideo(vwObj,frame);              % フレーム出力 
end
close(vwObj)

%%
% 処理が終了すると、AVIファイル shuttlegrad.avi に処理結果が保存される。
%
% <<shuttlegrad.png>>
% 

%%
% [ <part4.html トップ> ]

%% フレーム間処理（オプション）
% 過去のフレームを記憶する System object クラスを定義することもできる。
%
% 連続する2枚のフレームの平均を出力する FrameAveSystem クラスを作成するため、
% 以下のテストケース FrameAveSystemTestCase を用意する。
%
%   classdef FrameAveSystemTestCase < matlab.unittest.TestCase
%       %FRAMEAVESYSTEMTESTCASE FrameAveSystem のテストケース
%       properties
%       end
%       methods (Test)
%           function testFirstFrame(testCase)
%               % 準備
%               width  = 12;
%               height = 16;
%               % 入力フレーム
%               frame1 = rand(height,width,3);
%               % 期待値
%               cnt0Expctd = [];
%               cnt1Expctd = 1;
%               res1Expctd = frame1;
%               % ターゲットクラスのインスタンス化
%               obj = FrameAveSystem();
%               % 初期状態の検証
%               state      = getDiscreteState(obj);
%               cnt0Actual = state.Count;
%               testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
%               % 処理結果
%               res1Actual = step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               % 処理結果の検証
%               testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)            
%           end
%           function testThreeFrames(testCase)
%               % 準備
%               width  = 12;
%               height = 16;
%               % 入力フレーム
%               frame1 = rand(height,width,3);
%               frame2 = rand(height,width,3);
%               frame3 = rand(height,width,3);            
%               % 期待値
%               cnt1Expctd = 1;
%               cnt2Expctd = 2;            
%               cnt3Expctd = 3;                        
%               res1Expctd = frame1;
%               res2Expctd = (frame1+frame2)/2;
%               res3Expctd = (frame2+frame3)/2;
%               % ターゲットクラスのインスタンス化
%               obj = FrameAveSystem();
%               % 第１フレーム処理結果
%               res1Actual = step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               % 第２フレーム処理結果
%               res2Actual = step(obj,frame2);
%               state      = getDiscreteState(obj);
%               cnt2Actual = state.Count;            
%               % 第３フレーム処理結果
%               res3Actual = step(obj,frame3);
%               state      = getDiscreteState(obj);
%               cnt3Actual = state.Count;            
%               % 処理結果の検証
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
%               testCase.verifyEqual(cnt2Actual,cnt2Expctd)                                    
%               testCase.verifyEqual(cnt3Actual,cnt3Expctd)                                                
%               testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
%               testCase.verifyEqual(res2Actual,res2Expctd,'RelTol',1e-6)            
%               testCase.verifyEqual(res3Actual,res3Expctd,'RelTol',1e-6)                        
%           end        
%           function testReset(testCase)
%               % 準備
%               width  = 12;
%               height = 16;
%               % 入力フレーム
%               frame1 = rand(height,width,3);
%               % 期待値
%               cnt0Expctd = [];
%               cnt1Expctd = 1;
%               cntrExpctd = 0;
%               % ターゲットクラスのインスタンス化
%               obj = FrameAveSystem();
%               % 初期状態の検証
%               state      = getDiscreteState(obj);
%               cnt0Actual = state.Count;
%               testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
%               % 第一フレーム処理後の状態の検証
%               step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
%               % リセット後の状態の検証
%               reset(obj);
%               state      = getDiscreteState(obj);
%               cntrActual = state.Count;
%               testCase.verifyEqual(cntrActual,cntrExpctd)                        
%           end        
%       end
%   end

%%
% テストケース FrameAveSystemTestCase の検証を満たすように実装した
% FrameAveSystem クラスの例を以下に示す。
%
%   classdef FrameAveSystem < matlab.System
%       properties
%           preFrame % 前フレーム
%       end
%       properties (DiscreteState)
%           Count    % フレームカウント
%       end
%       properties (Access = private)
%       end
%       methods (Access = protected)
%           % セットアップ（最初のステップ直前に実行）
%           function setupImpl(obj,srcFrame)
%               % 前フレームの初期化
%               obj.preFrame = srcFrame;
%               % フレームカウントの初期化
%               obj.Count = 0;
%           end
%           % ステップ
%           function resFrame = stepImpl(obj,srcFrame)
%               % フレーム平均処理 
%               resFrame = (obj.preFrame + srcFrame)/2;
%               % 前フレームの更新←現フレーム
%               obj.preFrame = srcFrame;
%               % フレームカウントのインクリメント
%               obj.Count = obj.Count+1;
%           end
%           % リセット
%           function resetImpl(obj)
%               % フレームカウントのリセット
%               obj.Count = 0;
%           end
%       end
%   end

%%

result = run(FrameAveSystemTestCase);

%%
% FrameAveSystem の実行例を以下に示す。
%
fasObj = FrameAveSystem();

set(vrObj,'CurrentTime',0);
vwObj = VideoWriter('shuttleave.avi');
set(vwObj,'FrameRate',frameRate);
open(vwObj)
while (hasFrame(vrObj))
    frame = readFrame(vrObj);   % フレーム入力
    frame = im2double(frame);   % 実数型へ変換
    frame = step(fasObj,frame); % フレーム平均処理
    writeVideo(vwObj,frame);    % フレーム出力 
end
close(vwObj)

%%
% 処理が終了すると、AVIファイル shuttleave.avi に処理結果が保存される。
%
% <<shuttleave.png>>

%%
% [ <part4.html トップ> ]

%% 演習課題
% *演習課題4-1. Sobel微分フィルタ*
%
% 垂直微分フィルタ係数として配列
%
% $$ \left(\begin{array}{ccc}
%    1 &  2 &  1 \\
%    0 &  0 &  0 \\
%   -1 & -2 & -1 \\
%    \end{array}\right) $$
%
% を、水平微分フィルタ係数として配列
%
% $$ \left(\begin{array}{ccc}
%    1 &  0 & -1 \\
%    2 &  0 & -2 \\
%    1 &  0 & -1 \\
%    \end{array}\right) $$
% 
% を利用した勾配フィルタオブジェクト
%
%    gfs = GradFiltSystem('Kernel',[ 1 2 1 ; 0 0 0 ; -1 -2 -1 ]); 
%
% を生成し、映像データ shuttle.avi に対する以下の処理を各フレームに対して
% 施してみよう。
% また、その処理結果をAVIファイル shuttlesobel.avi に保存しよう。
%
%    graysc    = step(rgsObj,frame);       % グレースケール化
%    [mag,ang] = step(gfsObj,graysc);      % 勾配フィルタリング
%    ang       = (ang+pi)/(2*pi);          % 偏角の正規化
%    mag       = min(mag,1);               % 大きさの飽和処理
%    [r,g,b]   = step(hrsObj,ang,mag,mag); % 疑似カラー化
%    frame     = cat(3,r,g,b);             % RGB配列結合
%
% (処理例）
%
% <<shuttlesobel.png>>

%%
% *演習課題4-2. フレーム差分*（オプション）
%
% 以下のテストケース FrameDiffSystemTestCase の検証を満たすように
% 連続する2枚のフレームの差分を出力する FrameDiffSystem クラスを作成しよう。
%
%   classdef FrameDiffSystemTestCase < matlab.unittest.TestCase
%       %FRAMEDIFFSYSTEMTESTCASE FrameDiffSystem のテストケース
%       properties
%       end
%       methods (Test)
%           function testFirstFrame(testCase)
%               % 準備
%               width  = 12;
%               height = 16;
%               % 入力フレーム
%               frame1 = rand(height,width);
%               % 期待値
%               cnt0Expctd = [];
%               cnt1Expctd = 1;
%               res1Expctd = zeros(height,width);
%               % ターゲットクラスのインスタンス化
%               obj = FrameDiffSystem();
%               % 初期状態の検証
%               state      = getDiscreteState(obj);
%               cnt0Actual = state.Count;
%               testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
%               % 処理結果
%               res1Actual = step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               % 処理結果の検証
%               testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)            
%           end
%           function testThreeFrames(testCase)
%               % 準備
%               width  = 12;
%               height = 16;
%               % 入力フレーム
%               frame1 = rand(height,width);
%               frame2 = rand(height,width);
%               frame3 = rand(height,width);            
%               % 期待値
%               cnt1Expctd = 1;
%               cnt2Expctd = 2;            
%               cnt3Expctd = 3;                        
%               res1Expctd = zeros(height,width);
%               res2Expctd = (frame2-frame1);
%               res3Expctd = (frame3-frame2);
%               % ターゲットクラスのインスタンス化
%               obj = FrameDiffSystem();
%               % 第１フレーム処理結果
%               res1Actual = step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               % 第２フレーム処理結果
%               res2Actual = step(obj,frame2);
%               state      = getDiscreteState(obj);
%               cnt2Actual = state.Count;            
%               % 第３フレーム処理結果
%               res3Actual = step(obj,frame3);
%               state      = getDiscreteState(obj);
%               cnt3Actual = state.Count;            
%               % 処理結果の検証
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
%               testCase.verifyEqual(cnt2Actual,cnt2Expctd)                                    
%               testCase.verifyEqual(cnt3Actual,cnt3Expctd)                                                
%               testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
%               testCase.verifyEqual(res2Actual,res2Expctd,'RelTol',1e-6)            
%               testCase.verifyEqual(res3Actual,res3Expctd,'RelTol',1e-6)                        
%           end        
%           function testReset(testCase)
%               % 準備
%               width  = 12;
%               height = 16;
%               % 入力フレーム
%               frame1 = rand(height,width);
%               % 期待値
%               cnt0Expctd = [];
%               cnt1Expctd = 1;
%               cntrExpctd = 0;
%               % ターゲットクラスのインスタンス化
%               obj = FrameDiffSystem();
%               % 初期状態の検証
%               state      = getDiscreteState(obj);
%               cnt0Actual = state.Count;
%               testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
%               % 第一フレーム処理後の状態の検証
%               step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
%               % リセット後の状態の検証
%               reset(obj);
%               state      = getDiscreteState(obj);
%               cntrActual = state.Count;
%               testCase.verifyEqual(cntrActual,cntrExpctd)                        
%           end        
%       end
%   end

%%
% （処理例）

result = run(FrameDiffSystemTestCase);

%%
%
vrObj = VideoReader('shuttle.avi');
frameRate = get(vrObj,'FrameRate');
vwObj = VideoWriter('shuttlediff.avi');
set(vwObj,'FrameRate',frameRate);
fdfObj = FrameDiffSystem();
open(vwObj)
while (hasFrame(vrObj))
    frame = readFrame(vrObj);   % フレーム入力
    frame = im2double(frame);   % 実数型への変換
    frame = step(fdfObj,frame); % フレーム差分処理
    frame = frame/2+0.5;
    writeVideo(vwObj,frame);    % フレーム出力
end
close(vwObj)

%%
% <<shuttlediff.png>>
%
%%
% <html>
% <hr>
% </html>
%%
% <part3.html Part3> |
% <index.html メニュー> |
% <part4.html トップ> |
% <part5.html Part5>
