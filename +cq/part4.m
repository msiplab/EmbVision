%% *EmbVision(CQ版) チュートリアル（４）*
% 
% *回帰分析と曲線検出*
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
% まず、データを用意する。

load census 


%%
% <matlab:doc('load') load>コマンドで読み込まれた変数 cdate, popは
% いずれも21次元ベクトルであり、その内容は以下のとおり。
% 
% * cdate: 1790年から1990年までの10年ごとの年度
% * pop: cdateの年度に対応するアメリカの人口数( $10^6$ 人単位)
% 
% <matlab:doc('plot') plot>関数で、cdateをX軸、popをY軸にしてX-Yプロットを
% 表示する。

plot(cdate,pop,'o')  
xlabel('year')
ylabel('population')

%%
% プロットされたグラフを見ると二次関数のような増え方をしている。
%
% MATLABは多項式近似を行う <matlab:doc('polyfit') polyfit>関数を提供している。
%
% $x$ を説明変数の観測データ， $y$ を目的変数の観測データとして同じ次元の
% ベクトルで与えられたとすれば、
% 
%   p = polyfit(x,y,n) 
% 
% は、未知の関数 $f(x)$ を $n$ 次多項式
%
% $$ p(x) = p_1x^n+p_2x^{n-1}+\cdots+p_nx+p_{n+1} $$
%
% で近似する。ただし、 $p_1,p_2,\cdots,p_{n+1}$ は未知パラメータで、
% データとの整合性が最小自乗誤差の意味で最適になるように選択される。

%%
% polyfit　関数をデータに適用して近似多項式を求めてみる。

n = 2;
p = polyfit(cdate,pop,n); 

%%
% づづけて、得られた近似多項式を <matlab:doc('polyval') polyval> 関数により
% 評価する。 <matlab:doc('linspace') linspace> 関数で、年度 cdate の最小値と
% 最大値の間を100点等間隔にサンプルする。

x = linspace(min(cdate),max(cdate),100);
y = polyval(p, x);  
hold on  
plot(x,y) 

%%
% [ <part4.html トップ> ]

%% XXX
%
% MATLABにおける...
% ...

...

%%
% [ <part4.html トップ> ]


%% 演習課題
%
% *課題4-1. XXX*
% 
% ...
% 

%%
% *課題4-2. XXX*
%
% ...
%
% (処理例）

%%
% <html>
% <hr>
% </html>
%%
% <part3.html Part3> |
% <index.html メニュー> |
% <part4.html トップ> |
% <part5.html Part5>
