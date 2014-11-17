%% *組込みビジョン入門（３）*
%
% *クラス定義と単体テスト(MATLAB)*
%
% 新潟大学　工学部　電気電子工学科　
% 村松　正吾
%
% Copyright (c), All rights resereved, 2014, Shogo MURAMATSU
%

%%
% <part2.html Part2> |
% <index.html メニュー> |
% <part4.html Part4>

%%
% *概要*
%
% 本演習では、MATLAB(R)でのオブジェクト指向プログラミングと
% 単体テスト機能について簡単に学ぶ。
%
% 準備として、開いている全ての Figure を <matlab:doc('close') close> 関数で
% 閉じておく。

close all

%% オブジェクト指向プログラミング(OOP)
% プログラムのモジュール化は高い信頼性と広い拡張性をもたらす。
% オブジェクト指向プログラミング
% （ <matlab:doc('object-oriented-programming') OOP> ）では、
%
% *状態（プロパティ）* と *振舞い（メソッド）*
%
% をもつプログラムモジュールをクラスとして定義し、
%
% *クラスの実体（インスタンスオブジェクト）*
%
% を生成しながら組合せ、相互に作用させて大規模なプログラムを構築する。
%
% MATLABでもOOPを利用することができる。
% 
% バージョンアップを重ねる毎に
% OOP機能が強化されてきており、今では
% <matlab:doc('matlab.System') System object>  基底クラスの継承により、
%
% * ストリーム処理
% * コード生成
% * Simulink ブロック定義
%
% が容易となっている。

%%
% [ <part3.html トップ> ]

%% System objectクラスの定義
% では、例としてRGB画像 から グレースケール画像に変換する
% System object クラスの型枠を定義してみよう。
%
% ホームタグから、
% 
% # 「新規作成」
% # →「System object >」
% # →「標準」
%
% を選択するとエディタが開き以下のようなコードの編集準備が整う。

%%
%   classdef Untitled < matlab.System
%     % Untitled Add summary here
%     %
%     % This template includes the minimum set of functions required
%     % to define a System object with discrete state.
%     
%     properties
%         % Public, tunable properties.
%     end
%     
%     properties (DiscreteState)
%     end
%     
%     properties (Access = private)
%         % Pre-computed constants.
%     end
%     
%     methods (Access = protected)
%         function setupImpl(obj,u)
%             % Implement tasks that need to be performed only once,
%             % such as pre-computed constants.
%         end
%         
%         function y = stepImpl(obj,u)
%             % Implement algorithm. Calculate y as a function of
%             % input u and discrete states.
%             y = u;
%         end
%         
%         function resetImpl(obj)
%             % Initialize discrete-state properties.
%         end
%      end
%   end
%

%%
% <matlab:doc('classdef') classdef> 直後の  |Untitled|  を
% 
% |Rgb2GraySystem|  
%
% と書き換え、先頭行が以下のようになるよう編集しよう。

%%
%   classdef Rgb2GraySystem < matlab.System
%     % RGB2GRAYSYSTEM RGB to Grayscale Converter
%     %
%   

%%
% 編集したファイルを Rgb2GraySystem.m として保存しよう。
%
% なお、 |classdef|  に続く文字列はクラス名となる。
% クラス名はファイル名と一致させる必要がある。

%%
% 利用手順を以下にまとめる。
%
% # インスタンスオブジェクトを生成（コンストラクタの呼出し）
% #  |step| メソッドを実行（stepImpl()の呼出し）

%%
%   >> u = 1;
%   >> obj = Rgb2GraySystem(); % コンストラクタの呼出し
%   >> y = step(obj,u)         % stepImpl() の呼出し
%   
%   y =
%
%        1

%%
% 現時点で  |Rgb2GraySystem| のクラス定義は自動生成されたままである。
%
% |stepImpl()| メソッドは、入力 |u| をそのまま出力する。
%
%   function y = stepImpl(obj,u)
%      y = u;
%   end
%
% クラス |Rgb2GraySystem| が所望の機能を満たすためには状態（プロパティ）と
% 振舞い（メソッド）を適切に実装しなければならない。
%
% 以下では、 *テスト駆動開発* により |Rgb2GraySystem| クラスの実装を進める。

%%
% [ <part3.html トップ> ]

%% テスト駆動開発
% プログラムの信頼性を向上させるためには、テスト用のコードを充実させると良い。
% 
% MATLABでは、モジュール毎の <matlab:doc('matlab.unittest') 単体テスト> 
% を自動化するフレームワークが提供されている。
%
% 単体テストはクラス単位で行うテストで、実装コードよりもテストの記述を
% 優先するテスト駆動開発に欠かせない。
%
% テストを優先して充実させることで
% バグが少なく改変や拡張に強いプログラムを開発できる。
% 
% 一般に、テスト駆動開発では、
% 
% * テストメソッドの実装 
% * → ダミーメソッドでの失敗の確認
% * → ターゲットメソッドの実装
% * → ターゲットメソッドでの成功の確認
% 
% を繰返し、テストクラスとターゲットクラスを充実させる。

%%
% 以下の手順で、 |Rgb2GraySystem| のクラス実装を進めよう。
% 
% # テストクラス |Rgb2GraySystemTestCase| の定義
% # テストクラス |Rgb2GraySystemTestCase| へのメソッド |testSize()| の実装
% # ターゲットクラス |Rgb2GraySystem| のメソッド |testSize()| の失敗の確認
% # ターゲットクラス |Rgb2GraySystem| のメソッド |stepImpl()| の実装
% # ターゲットクラス |Rgb2GraySystem| のメソッド |testSize()| の成功の確認

%% テストクラスの定義
% では、テストクラス |Rgb2GraySystemTestCase| を定義してみよう。
%
% ホームタグから、
% 
% # 「新規作成」
% # →「クラス」
%
% を選択するとエディタが開き以下のようなコードの編集準備が整う。
% 
%   classdef Untitled
%   %UNTITLED このクラスの概要をここに記述
%      %   詳細説明をここに記述
%       
%      properties
%      end
%       
%      methods
%      end
%        
%   end

%%
% <matlab:doc('matlab.unittest.TestCase') matlab.unittest.TestCase> 
% クラスを継承して、テストクラス |Rgb2GraySystemTestCase| を定義すればよい。
%
% すなわち、先頭部 |classdef| の行を
%
%   classdef Rgb2GraySystemTestCase < matlab.unittest.TestCase
%   %RGB2GRAYSYSTEMTESTCASER Rgb2GraySystem のテストケース
%
% と書き換えればよい。
%
% また、 Test 属性の付いた <matlab:doc('methods') methods> ブロック
%
%   methods (Test)
%   end
% 
% を用意する。

%%
% 編集後のコード全体は以下のようになる。
%
%   classdef Rgb2GraySystemTestCase < matlab.unittest.TestCase
%       %RGB2GRAYSYSTEMTESTCASE Rgb2GraySystem のテストケース
%       
%       properties
%       end
%       
%       methods (Test)
%       end
%       
%   end
%
% 編集したファイルを Rgb2GraySystemTestCase.m として保存しよう。

%%
% [ <part3.html トップ> ]

%% テストメソッドの追加
% では、テストクラス |Rgb2GraySystemTestCase| に
% テストメソッドを追加しよう。
% 
% Test 属性のついた methods ブロック内に
% テストの内容を記述したメソッドを追加すればよい。
% 同ブロック内の全てのメソッドが自動的にテストの対象となる。
%
% テストメソッド
%   
%   function testSize(testCase)
%      % 準備
%      u = zeros(1,2,3);   % 1行2列3成分の三次元配列
%      % 期待値
%      szExpctd = [ 1 2 ]; % 1行2列の二次元配列
%      % ターゲットのインスタンス化
%      obj = Rgb2GraySystem();
%      % 実行結果
%      y = step(obj,u);
%      % サイズの検証
%      testCase.verifySize(y,szExpctd);
%   end
%
% を |Rgb2GraySystemTestCase| の methos (Test) ブロックに追加しよう。

%%
% コマンドウィンドウ上で <matlab:doc('matlab.unittest.TestCase.run') run> 
% メソッドを呼び出してテストを実行しよう。
%
%   >> result = run(Rgb2GraySystemTestCase);
%
% |Rgb2GraySystem| の実装が不十分なので、検証は失敗に終わる。

%% ターゲットクラスの実装
% 検証の失敗を回避するためにクラス |Rgb2GraySystem| の |stepImpl()| メソッド
% を
% 
%   function y = stepImpl(obj,u)
%      y = zeros(size(u,1),size(u,2));
%   end
%
% と定義しなおして、再度テストを実行しよう。
%
%   >> result = run(Rgb2GraySystemTestCase);
%  
%   Rgb2GraySystemTestCase を実行しています
%   .
%   Rgb2GraySystemTestCase が完了しました
%   __________

%%
% 結果は失敗から成功に変わる。

%% テストクラスとターゲットクラスの充実化
% 以降、以下の手順を繰り返してテストクラスとターゲットクラスを充実させる。
%
% # テストクラスへのテストメソッドの実装
% # ターゲットクラスのテスト失敗の確認
% # ターゲットクラスへのメソッドの実装
% # ターゲットクラスのテスト成功の確認

%%
% 次のテストクラス
%
%   classdef Rgb2GraySystemTestCase < matlab.unittest.TestCase
%       %RGB2GRAYSYSTEMTESTCASE Rgb2GraySystem のテストケース
%     
%       properties
%       end
%     
%       methods (Test)
%          
%           function testSize(testCase)
%               % 準備
%               u = zeros(1,2,3);   % 1行2列3成分の三次元配列
%               % 期待値
%               szExpctd = [ 1 2 ]; % 1行2列の二次元配列
%               % ターゲットのインスタンス化
%               obj = Rgb2GraySystem();
%               % 実行結果
%               y = step(obj,u);
%               % サイズの検証
%               testCase.verifySize(y,szExpctd);
%           end
%         
%           function testValues(testCase)
%               % 準備
%               u = rand(4,6,3);        % 三次元ランダム配列
%               % 期待値
%               arrayExpctd = rgb2gray(u); % グレースケールの期待値
%               % ターゲットのインスタンス化
%               obj = Rgb2GraySystem();
%               % 実行結果
%               arrayActual = step(obj,u);
%               % 配列の値の検証
%               testCase.verifyEqual(arrayActual,arrayExpctd);
%           end
%       end
%   end
%
% を満足するように、 |Rgb2GraySystem| クラスを実装しよう。

result = run(Rgb2GraySystemTestCase);

%%
% [ <part3.html トップ> ]

%% 状態（プロパティ）の利用
% 
% （準備中）
%

%% 演習課題
%
% *課題3-1. HSV2RGBクラス*
% 
% 次のテストクラス
%
%   classdef Hsv2RgbSystemTestCase < matlab.unittest.TestCase
%       %HSV2RGBSYSTEMTESTCASE Hsv2RgbSystem のテストケース
%     
%       properties
%       end
%     
%       methods (Test)
%         
%           function testSize(testCase)
%               % 準備
%               h = zeros(1,2);
%               s = zeros(1,2);
%               v = zeros(1,2);
%               hsv = cat(3,h,s,v); % 三次元配列化
%               % 期待値
%               szRExpctd = [ 1 2 ];
%               szGExpctd = [ 1 2 ];
%               szBExpctd = [ 1 2 ];
%               % ターゲットのインスタンス化
%               obj = Hsv2RgbSystem();
%               % 実行結果
%               [r,g,b] = step(obj,h,s,v);
%               % サイズの検証
%               testCase.verifySize(r,szRExpctd);
%               testCase.verifySize(g,szGExpctd);
%               testCase.verifySize(b,szBExpctd);
%           end
%         
%           function testValues(testCase)
%               % 準備
%               h = rand(4,6);
%               s = rand(4,6);
%               v = rand(4,6);
%               hsv = cat(3,h,s,v); % 三次元配列化
%               % 期待値
%               rgbExpctd = hsv2rgb(hsv); 
%               % ターゲットのインスタンス化
%               obj = Hsv2RgbSystem();
%               % 実行結果
%               [rActual,gActual,bActual] = step(obj,h,s,v);
%               % 配列の値の検証
%               testCase.verifyEqual(rActual,rgbExpctd(:,:,1));
%               testCase.verifyEqual(gActual,rgbExpctd(:,:,2));
%               testCase.verifyEqual(bActual,rgbExpctd(:,:,3));
%           end
%       end
%   end
%
% を満足するように、 |Hsv2RgbSystem| クラスを実装しよう。

result = run(Hsv2RgbSystemTestCase);

%%
% *課題3-2. 勾配フィルタクラス*
%
% 次のテストクラス
%
% （準備中）
%
% を満足するように、 |GradFiltSystem| クラスを実装しよう。

result = run(GradFiltSystemTestCase);

%% 参考文献
% （準備中）

%%
% <html>
% <hr>
% </html>
%%
% <part2.html Part2> |
% <index.html メニュー> |
% <part3.html トップ> |
% <part4.html Part4>