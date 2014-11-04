% PUBLISHALL
type = 'html';

%% Index
publish('index',type);

%% Part 1

I = im2double((imread('peppers.png')));
J = sqrt(I);
imwrite(J,'html/brightpeppers.png')
fplot(@sqrt,[0 1])
xlabel('x')
ylabel('y')
axis square
print -dpng -r72 'html/fplotsqrt.png'

HSV = rgb2hsv(I);
HSV(:,:,2) = 2*HSV(:,:,2);
J = hsv2rgb(HSV);
imwrite(J,'html/highsatpeppers.png')

publish('part1',type);

%% Part 2
publish('part2',type);

%% Part 3
publish('part3',type);

%% Part 4
publish('part4',type);

%% Part 5
publish('part5',type);

%% Part 6
publish('part6',type);

