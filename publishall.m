% PUBLISHALL
type = 'html';

%% Index
publish('index',type);

%% Part 1
close all

% ‰Û‘è 1-1
I = im2double(rgb2gray(imread('peppers.png')));
J = sqrt(I);
imwrite(J,'html/brightpeppers.png')
fplot(@sqrt,[0 1])
xlabel('x')
ylabel('y')
axis square
print -dpng -r72 'html/fplotsqrt.png'

% ‰Û‘è 1-2
HSV = rgb2hsv(I);
HSV(:,:,2) = 2*HSV(:,:,2);
J = hsv2rgb(HSV);
imwrite(J,'html/highsatpeppers.png')

% Publish
publish('part1',type);

%% Part 2
close all

% ‰Û‘è 2-1
X = imread('cameraman.tif');
X = im2double(X);

Hh = [ 1 0 -1; 1 0 -1; 1 0 -1 ];
Yh = conv2(Hh,X);
Yh = Yh(2:end-1,2:end-1);
imwrite(Yh+0.5,'html/cameramangradx.png')

freqz2(Hh)
print -dpng -r72 'html/freqz2gradx.png'

% ‰Û‘è 2-2
Hv = [ 1 1 1; 0 0 0; -1 -1 -1 ];
Yv = conv2(Hv,X);
Yv = Yv(2:end-1,2:end-1);

dXmag = sqrt(Yv.^2+Yh.^2);
dXang = atan2(Yv,Yh);

imwrite(dXmag,'html/cameramangradmag.png')
imwrite(dXang/(2*pi)+0.5,'html/cameramangradang.png')

% Publish
publish('part2',type);

%% Part 3
publish('part3',type);

%% Part 4
publish('part4',type);

%% Part 5
publish('part5',type);

%% Part 6
publish('part6',type);

