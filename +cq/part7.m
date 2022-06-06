%% *EmbVision(CQ版) チュートリアル（７）*
% 
% *回帰分析と曲線検出 - MATLAB編 -*
%
% 新潟大学
% 村松　正吾，高橋　勇希
%
% Copyright (c), All rights reserved, 2014-2022, Shogo MURAMATSU and Yuki TAKAHASHI
% 

%%
% <part6.html Part6> |
% <index.html メニュー> |
% <part8.html Part8>

%%
% *概要*
%
% 本演習では、System object の応用例として、
% 多項式回帰を利用した画像からの曲線検出を実装する。
%
% 準備として、開いている全ての Figure を <matlab:doc('close') close> 関数で
% 閉じておく。

close all

%% 回帰分析
% 
% 回帰分析では、ある変数 $y$ とある変数 $x$ の間を
%
% $$ y = f(x) $$
%
% のように関係づける未知の関数 $f(\cdot)$ を仮定する。
% 回帰分析は、このような未知の関数 $f(\cdot)$ を観測可能なデータから推論する
% 統計的手法である。
% 
% 変数 $x$ を説明変数とよび、変数 $y$ を目的変数とよぶ。
% また、この未知関数の推論をフィッティングとよぶ。
% 
% 以下では、回帰分析の一例としてデータの多項式近似を試みる。
% まず、多項式回帰を試すためのデータを用意しよう。

load census 


%%
% <matlab:doc('load') load>コマンドで読み込まれた変数 cdate, popは
% いずれも21次元ベクトルであり、その内容は以下のとおり。
% 
% * cdate: 1790年から1990年までの10年ごとの年度
% * pop: cdateの年度に対応するアメリカの人口数( $10^6$ 人単位)
% 
% <matlab:doc('plot') plot>関数で、cdateをX軸、popをY軸にしてX-Yプロットを
% 表示しよう。

plot(cdate,pop,'o')  
xlabel('year')
ylabel('population')

%%
% プロットされたグラフを見ると二次関数のような増え方をしている。
%
% MATLABは多項式近似を行う <matlab:doc('polyfit') polyfit>関数を提供している。
% $x$ を説明変数の観測データ， $y$ を目的変数の観測データとして同じ次元の
% ベクトルで与えられたとすれば、コマンド
% 
% >> p = polyfit(x,y,n) 
% 
% は、未知の関数 $f(x)$ を $n$ 次多項式
%
% $$ p(x) = p_1x^n+p_2x^{n-1}+\cdots+p_nx+p_{n+1} $$
%
% で近似する。ただし、 $p_1,p_2,\cdots,p_{n+1}$ は未知パラメータで、
% データとの整合性が最小自乗誤差の意味で最適になるように選択される。

%%
% polyfit　関数をデータに適用して近似多項式を求めてみよう。

n = 2;
p = polyfit(cdate,pop,n); 

%%
% づづけて、得られた近似多項式を <matlab:doc('polyval') polyval> 関数により
% 評価しよう。 <matlab:doc('linspace') linspace> 関数で、年度 cdate の最小値と
% 最大値の間を100点等間隔にサンプルする。

x = linspace(min(cdate),max(cdate),100);
y = polyval(p, x);  
hold on  
plot(x,y) 

%%
% [ <part7.html トップ> ]

%% 曲線検出
%
% System object の応用例として、曲線を含む二値画像から多項式近似により
% 曲線を近似するモジュールを作成する。
%
% 以下のテストクラスを定義する。

%%
%   classdef PolyfitSystemTestCase < matlab.unittest.TestCase
%       methods(Test)
%           % Test methods
%           function testDefaultDegree(testCase)
%               % 期待値　
%               degExpctd = 3;
%               % ターゲットクラスのインスタンス化
%               obj = PolyfitSystem();
%               % プロパティ Degree の取得
%               degActual = obj.Degree;
%               % プロパティ Degree の検証
%               testCase.verifyEqual(degActual,degExpctd)
%           end
%           function testCoefs(testCase)
%               % 準備
%               xmax = 4;
%               x = 1:xmax; % 説明変数
%               y = x.^2;   % 目的変数
%               BW = zeros(xmax^2,xmax); % 座標を二値画像に変換 
%               for idx = 1:length(x)
%                   BW(y(idx),x(idx)) = 1;
%               end
%               deg = 3;  % 次数
%               % 期待値の設定
%               coefsExpctd = polyfit(x,y,deg);
%               % ターゲットのインスタンス化
%               obj = PolyfitSystem();
%               % 実行結果（実現値の取得）
%               coefsActual = obj.step(BW);
%               % 配列の値の検証
%               testCase.verifyEqual(coefsActual,coefsExpctd,'AbsTol',1e-9);
%           end
%           function testSetDegree(testCase)
%               % 期待値
%               degExpctd = 2;
%               % ターゲットクラスのインスタンス化
%               obj = PolyfitSystem('Degree',degExpctd);
%               % プロパティー Degree の取得
%               degActual = obj.Degree;
%               % プロパティー Degree の検証
%               testCase.verifyEqual(degActual,degExpctd)
%           end
%       end
%   end

%%
% 上記のテストクラスを満足するターゲットクラスとして以下のSystem objectを定義しよう。
%
%   classdef PolyfitSystem < matlab.System
%       % POLYFITSYSTEM
%       properties(Nontunable)
%           Degree = 3;
%       end
%       methods
%          % コンストラクタ
%          function obj = PolyfitSystem(varargin)
%             setProperties(obj,nargin,varargin{:})
%          end
%       end
%       methods(Access = protected)
%           function p = stepImpl(obj,BW)
%               % Implement algorithm. Calculate y as a function of input u and
%               % discrete states.
%               [y,x] = find(BW); % 画像を座標に変換
%               p = polyfit(x,y,obj.Degree); % 多項式近似
%           end
%       end
%   end

%%
%

% sz = [288 352];
% BW = zeros(sz);
% ndata = 21;
% x = randi(sz(2),ndata,1);
% deg = 3;
% c = 1e-6*randn(deg,1);
% y = round(x.^(deg:-1:1)*c+sz(1)/2);
% for idx = 1:ndata
%     BW(y(idx),x(idx)) = 1;
% end
% p = polyfit(x,y,deg);
% obj = PolyfitSystem('Degree',deg);
% obj.step(BW)

%%
% [ <part7.html トップ> ]

%% 曲線描画
%

%%
% [ <part7.html トップ> ]

%% 演習課題
%
% *課題7-1. XXX*
% 
% ...
% 

%%
% *課題7-2. XXX*
%
% ...
%
% (処理例）

%%
% <html>
% <hr>
% </html>
%%
% <part6.html Part6> |
% <index.html メニュー> |
% <part7.html トップ> |
% <part8.html Part8>
