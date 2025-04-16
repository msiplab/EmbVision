%% *EmbVision チュートリアル（１）*
% 
% *画像入出力と画素処理*
%
% 新潟大学
% 村松　正吾，高橋　勇希
%
% Copyright (c), All rights reserved, 2014-2025, Shogo MURAMATSU and Yuki TAKAHASHI
% 

%%
% <index.html メニュー> | 
% | <part2.html Part2>

%%
% *概要*
%
% 本演習では、MATLABにて画像ファイルの情報を読み込む方法のほか、
% 画像表示、画像ファイル出力、簡単な画素処理について学ぶ。
%
% 準備として、開いている全ての Figure を <matlab:doc('close') close> 関数で
% 閉じておく。

close all

%% 画像入力
% 
% MATLABにおける画像入力は、コマンドプロンプト上にて、
% <matlab:doc('imread') imread> 関数にファイル名を指定して実行される。
 
I = imread('cameraman.tif');

%%
% cameraman.tif はグレースケール画像なので、
% 変数 I は二次元配列として画像データを保持する。
%
% 特に指定をしなければ、データ型は符号なし整数８ビット型
% ( <matlab:doc('uint8') uint8> ) となる。
%
% コマンドプロンプト上で、 <matlab:doc('whos') whos> 関数により確認できる。

whos I

%%
% なお、Size は　'高さ $$\times $$ 幅'　で表示される。
%
% 画像のサイズを知るために、
% <matlab:doc('size') size> 関数を利用することもできる。

size(I)

%%
% 高さのみは、二番目の引数に '1' を指定する。

size(I,1)

%% 
% 幅のみは、二番目の引数に '2' を指定する。

size(I,2)

%%
% カラー画像の読込も可能である。

RGB = imread('peppers.png');

%%
% 変数 RGB は 三次元配列として画像データを保持する。

whos RGB

%%
% [ <part1.html トップ> ]

%% 画像表示
%
% MATLABにおける画像表示は、コマンドプロンプト上にて、
% <matlab:doc('imshow') imshow> 関数にファイル名を指定して実行される。
% 
% 変数 I の表示は以下の通り。

imshow(I)

%%
% 変数RGBの表示は以下の通り。

imshow(RGB)

%%
% カラー画像として表示される。

%%
% [ <part1.html トップ> ]

%% 配列処理
% 配列に対する演算を施すことで画像処理を実現できる。
%
% まずは簡単な配列演算を紹介しよう。例として、以下の配列を用いる。
%
% $$\mathbf{X} =\left(\begin{array}{lll}
%   1 & 2 & 3 \\ 4 & 5 & 6
%   \end{array}\right)$$
%
% MATLABコマンドプロンプト上で、

X = [ 1 2 3 ; 4 5 6 ];

%%
% のように打ち込めばよい。
%
% 配列 X の情報を確認しよう。

whos X

%%
% 倍精度実数型 $$ 2 \times 3 $$ 配列であることがわかる。
%
% <matlab:doc('disp') disp> 関数を利用して X の内容を確認しよう。

disp(X)

%%
% MATLAB上では配列に対し、多くの演算が利用できる。例えば、
% 配列の転置は、' <matlab:doc('transpose') .'> ' で実行できる。
% $$ \mathbf{X}^T $$ は、コマンドプロンプト上で、

X.' 

%%
% のように実行できる。
%
% 配列全体を定数倍するときは、 ' <matlab:doc('mtimes') *> ' 演算子を、
% 配列全体を定数で割るときは、' <matlab:doc('mdivide') /> ' 演算子を
% 利用すればよい。
%
% 例えば、 $$ 255\mathbf{X} $$ は、

255*X

%%
% のように、 $$ \mathbf{X}/255 $$ は、

X/255

%%
% のように実行できる。
%
% 次回以降、要素毎のべき乗を利用するので、ここでその演算方法を紹介しよう。
% 配列の要素毎のべき乗は、' <matlab:doc('power') .^> ' 演算子により

X.^2

%%
% のように実行できる。要素毎の平方根も

X.^(1/2)

%%
% のように計算できる。 
% この場合は、以下のように <matlab:doc('sqrt') sqrt> 関数を利用しても良い。

sqrt(X)

%%
% サイズが同じ配列同士であれば、' <matlab:doc('plus') +> ' 演算子を利用して
% 和をとることも可能である。
%
% $$ \mathbf{Y} =\left(\begin{array}{lll}
%   7 & 8 & 9 \\ 10 & 11 & 12
%   \end{array}\right)$$
%
% を定義して配列 X に足してみよう。

Y = [ 7 8 9 ; 10 11 12 ];

X+Y

%% 
% さらに、これら演算を組み合わせれば、要素毎の自乗和の平方根
%
% $$ [\mathbf{M}]_{i,j} = \sqrt{[\mathbf{X}]_{i,j}^2+[\mathbf{Y}]_{i,j}^2} $$
%
% も

M = sqrt(X.^2+Y.^2)

%%
% のように実現できる。三角関数も利用できるので、
%
% $$ [\mathbf{A}]_{i,j} = \tan^{-1}\frac{[\mathbf{Y}]_{i,j}}{[\mathbf{X}]_{i,j}}$$
%
% のような複雑な演算も <matlab:doc('atan2') atan2> 関数を用いて、

A = atan2(Y,X)

%%
% のように実現できる。

%%
% なお、変数名の直後に丸括弧 ' () ' 内で各次元のインデックスを指定することで
% 配列の要素にアクセスすることが可能である。
%
% インデックスは '1' から始まることに注意すると、
% 配列 X の左上の要素へは、

X(1,1)

%%
% のようにアクセスできる。他の要素へも同様にアクセスできる。
%
% コロン( <matlab:doc(':') :> )によるインデックス指定を行うと、
% より柔軟なアクセスが可能となる。例えば、配列 Y の 1 行目は、

Y(1,:) 

%%
% のように、配列 M の 2 列目は、

M(:,2)

%%
% のように、配列 A の 2行目の2列目から3列目は

A(2,2:3)

%%
% のようにアクセスできる。

%%
% [ <part1.html トップ> ]

%% 画素処理
% カラー画像RGBの各R,G,B成分にアクセスするためにも、
% コロンによるインデックス指定が利用できる。

R = RGB(:,:,1);
G = RGB(:,:,2);
B = RGB(:,:,3);

%%
% 各R,G,B成分は、二次元配列となる。

whos R G B

%%
% また、 <matlab:doc('images/rgb2gray') rgb2gray> 関数を利用することで、

I = rgb2gray(RGB);

%%
% のようにカラー画像RGBをグレースケール画像 I に変換できる。
%
% なお、変数 I が保持していた内容は上記の操作により 
% 変数 RGB のグレースケール画像によって上書きされる。

whos I

%%

imshow(I)

%%
% 画像配列に対し、先に紹介した演算を施すためには、
% しばしば実数型への変換が必要となる。
%
% 整数型から実数型への変換には、 <matlab:doc('images/im2single') im2single>
% 関数、もしくは <matlab:doc('images/im2double') im2double>　関数を
% 利用できる。それぞれ、画像を単精度実数型、倍精度実数型に変換する。

I = im2double(I);
whos I

%%
% 実数型への変換 im2single 関数、im2double 関数は画素値を 0 から 1 
% の範囲に正規化する処理も同時に行われる。
%
% <matlab:doc('min') min>関数で最小値を <matlab:doc('max') max> 関数で
% 最大値を確認しよう。

min(I(:)) 

%%

max(I(:))

%%
% なお、'I(:)' のようにコロンを利用すると配列の列ベクトル化が行われる。
% min 関数、max 関数に配列を与えると各列毎の評価となるため、全画素に渡る
% 最小値、最大値を求めるためにここでは列ベクトル化を行った。
% 
% 0 から 1 の範囲に正規化された画像は、累乗則変換により、
% 0 から 1 の範囲内で明るさを調整できる。

J = I.^2;
imshow(J)

%%
% <matalb:doc('fplot') fplot> 関数により上記の累乗則変換の特性を確認しよう。

fplot(@(x) x.^2, [0 1])  
xlabel('x') % 横軸のラベル
ylabel('y') % 縦軸のラベル
axis square % 縦横比の調整

%%
% ここで採用した累乗則変換は放物線を描き、画像を暗くする効果がある。 

%%
% [ <part1.html トップ> ]

%% 画像出力
%
% <matlab:doc('imwrite') imwrite> 関数を利用することで、処理した結果画像を
% ファイルに保存することも可能である。
%
% 画像 J をファイル darkpeppers.tif に保存しよう。

imwrite(J,'darkpeppers.tif')

%%
% 画像ファイル darkpeppers.tif が出力される。

dir *.tif

%%
% [ <part1.html トップ> ]

%% 演習課題
%
% *課題1-1. 明るさ調整*
% 
% 画像ファイル peppers.png のグレースケール画像に対し、sqrt関数による明るさ
% 調整を施し、処理結果を画像ファイル brightpeppers.tif に保存せよ。
% また、変換の特性をグラフで確認せよ。
%
% (処理例）
%
%%
% <<brightpeppers.png>>
%%
% <<fplotsqrt.png>>
%%
% *課題1-2. 色空間変換*
%
% 画像ファイル peppers.png の RGBカラー配列を <matlab:doc('rgb2hsv') rgb2hsv>
% 関数で HSVカラー配列へ変換し、S 成分を2倍して 
% <matlab:doc('hsv2rgb') hsv2rgb> にてRGBカラー配列に戻し、処理結果を
% 画像ファイル highsatpeppers.jpg に保存せよ。
%
% (処理例）
%
%%
% <<highsatpeppers.png>>
%

%%
% <html>
% <hr>
% </html>
%%
% <index.html メニュー> |
% | <part1.html トップ> |
% | <part2.html Part2>
