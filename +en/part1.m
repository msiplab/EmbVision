%% *EmbVision Tutorial: Part 1*
%
% *Image I/O and Pixel Processing*
%
% <html>
% Shogo MURAMATSU and Yuki TAKAHASHI <br>
% Niigata Univ.
% </html>
%
% Copyright (c), All rights reserved, 2014-2025, Shogo MURAMATSU
%

%%
% <index.html Contents> |
% | <part2.html Part2>

%%
% *Summary*
%
% Through this exercise, you can learn how to read image files,
% display images, and write image files by using MATLAB. 
% As well, you can also experiment simple pixel processing.
%
% As a preliminary, close all figures by using 
% function <matlab:doc('close') CLOSE>

close all

%% Image Read
% 
% To read an image from a file, use <matlab:doc('imread') IMREAD>
% function on the MATLAB's command window with a file name as the argument. 
 
I = imread('cameraman.tif');

%%
% Since cameraman.tif is a grayscale image, 
% variable I is stored as a 2-D array.
%
% If not specified, the data type becomes unsigned 8 bit 
% ( <matlab:doc('uint8') UINT8> ) in default. 
%
% One can verify it by using <matlab:doc('whos') WHOS> function on 
% the command window.

whos I

%%
% The size is displayed as height $$\times $$ width.
%
% In order to verify the image size, 
% <matlab:doc('size') SIZE> function can also be used.

size(I)

%%
% Set the second argument '1' in order to get the height.

size(I,1)

%% 
% Set the second argument '2' in order to get the width.

size(I,2)

%%
% Color picture is also available.

RGB = imread('peppers.png');

%%
% Variable RGB stores the pixel data as 3-D array.

whos RGB

%%
% [ <part1.html Top> ]

%% Image Display
%
% MATLAB displays an array data as an image through
% <matlab:doc('imshow') IMSHOW> function.
% 
% To display variable I as an image is as follows:

imshow(I)

%%
% Variable RGB is displayed by the following command.

imshow(RGB)

%%
% Then, a color image shows up.

%%
% [ <part1.html Top> ]

%% Array Operations
% Image processing is executed by array operations.
%
% First, we see some simple array operations. As an example, 
% we'll use the following array.
%
% $$\mathbf{X} =\left(\begin{array}{lll}
%   1 & 2 & 3 \\ 4 & 5 & 6
%   \end{array}\right)$$
%
% On the MATLAB's command window, the above array is defined by 

X = [ 1 2 3 ; 4 5 6 ];

%%
% See the information on the array X.

whos X

%%
% It is verified that X is $$ 2 \times 3 $$ array in double precision.
%
% Observe the contents of X through <matlab:doc('disp') DISP> function.

disp(X)

%%
% MATLAB provides a fruitful operations for arrays.
% For example, transposition of array is realized by 
% " <matlab:doc('transpose') .'> ".
% That is, the command 

X.' 

%%
% realizes $$ \mathbf{X}^T $$.
%
% Scaling an array is realized by operator ' <matlab:doc('mtimes') *> ' or
% ' <matlab:doc('mdivide') /> '.
%
% For example, 

255*X

%%
% executes $$ 255\mathbf{X} $$, and 

X/255

%%
% executes $$ \mathbf{X}/255 $$.
%
% Hereafter, we'll use the element-wise power operation. 
% Let us use the command as a preliminary.
% The element-wise power operation of a given array is 
% realized by operator ' <matlab:doc('power') .^> ' as follows.

X.^2

%%
% The element-wise square root operation is also executed by the following 
% command.

X.^(1/2)

%%
% In the last case, you can also use <matlab:doc('sqrt') SQRT> function 
% as below.

sqrt(X)

%%
% Given two arrays of identical dimensions, one can obtain the sum of those
% arrays by using operator ' <matlab:doc('plus') +> '.
%
% Define an array
%
% $$ \mathbf{Y} =\left(\begin{array}{lll}
%   7 & 8 & 9 \\ 10 & 11 & 12
%   \end{array}\right),$$
%
% and add this to array X.

Y = [ 7 8 9 ; 10 11 12 ];

X+Y

%% 
% Applying the above operations, the square root of the sum of squared 
% values, 
%
% $$ [\mathbf{M}]_{i,j} = \sqrt{[\mathbf{X}]_{i,j}^2+[\mathbf{Y}]_{i,j}^2} $$
%
% can also be calculated as follows.

M = sqrt(X.^2+Y.^2)

%%
% Since trigonometric functions are also available, the operation
%
% $$ [\mathbf{A}]_{i,j} = \tan^{-1}\frac{[\mathbf{Y}]_{i,j}}{[\mathbf{X}]_{i,j}}$$
%
% can also be calculated by <matlab:doc('atan2') ATAN2> function as
% follows.

A = atan2(Y,X)

%%
% By indicating an index in ' () ' just after a variable name, 
% one can access an element of the array.
%
% Because the index starts with '1', the left top element of array X can be
% accessed as follows.

X(1,1)

%%
% Similarly, one can access the other elements.
%
% Using colon symbol, ( <matlab:doc(':') :> ), makes the element access 
% more flexible. For example, The first row of array Y can be accessed 
% as follows.

Y(1,:) 

%%
% Similarly, the following command accesses the second column of array M.

M(:,2)

%%
% From the second to third column at the second row of array A is accessed
% as follows

A(2,2:3)

%%
% [ <part1.html Top> ]

%% Pixel Processing
% In order to access R,G and B components of color image, 
% the colon indexing can be used.

R = RGB(:,:,1);
G = RGB(:,:,2);
B = RGB(:,:,3);

%%
% Each R, G and B component becomes a 2-D array.

whos R G B

%%
% As well, by using <matlab:doc('images/rgb2gray') RGB2GRAY> function as

I = rgb2gray(RGB);

%%
% one can convert RGB color image to grayscale image I.
%
% The content of variable I on the workspace is overwritten by 
% the grayscale image of variable RGB.

whos I

%%

imshow(I)

%%
% Applying some operations to image array often requires to convert 
% data into a float type.
%
% For conversion from integer to float, one can use
% <matlab:doc('images/im2single') IM2SINGLE> or
% <matlab:doc('images/im2double') IM2DOUBLE> function.
% These functions convert an image to single and double precision data, 
% respectively.

I = im2double(I);
whos I

%%
% The conversion functions to float, i.e., IM2SINGLE function and 
% IM2DOUBLE function, normalizes pixel values to data ranged from 0 to 1.
%
% Verify the minimum and maximum values by using 
% <matlab:doc('min') MIN> function and <matlab:doc('max') MAX> function,
% respectively.

min(I(:)) 

%%

max(I(:))

%%
% where the colon index as 'I(:)' victories any array.
% Function MIN and MAX evaluate each column for array data.
% Thus, vectorization is applied so that the minimum and maximum value of 
% whole pixels in I are obtained.
% 
% A power function can adjust image intensity.
% Because the pixel values are normalized from 0 to 1, the output values are 
% also lie between the same range.

J = I.^2;
imshow(J)

%%
% Certify the characteristics of a power function through 
% <matlab:doc('fplot') FPLOT> function.

fplot(@(x) x.^2, [0 1])  
xlabel('x') % Label for x-axis
ylabel('y') % Label for y-axis
axis square % Adjustment of aspect ratio

%%
% The power function shown here draws parabola and has an effect to 
% darken the image.

%%
% [ <part1.html Top> ]

%% Image Write
%
% By using <matlab:doc('imwrite') IMWRITE> function, the processed image
% can be stored as a file.
%
% Write image J to the file named 'darkpeppers.tif.'

imwrite(J,'darkpeppers.tif')

%%
% Then, the image is written to file 'darkpeppers.tif.'

dir *.tif

%%
% [ <part1.html Top> ]

%% Exercises
%
% *Exercise 1-1. Intensity Adjustment*
% 
% Adjust the intensity of the grayscale image of peppers.png by using
% SQRT function, and then write the result to a TIFF file named
% 'brightpeppers.tif.'
% In addition, draw the graph of the conversion function.
%
% (Example Answer)
%
%%
% <<brightpeppers.png>>
%%
% <<fplotsqrt.png>>
%%
% *Exercise 1-2. Color Space Conversion*
%
% Convert RGB color array of image file peppers.png to 
% HSV color array by using <matlab:doc('rgb2hsv') RGB2HSV> function and 
% double the intensity of the S component. Then, return the HSV color array
% back to RGB color array by using <matlab:doc('hsv2rgb') HSV2RGB> function.
% Finally, store the result to a JPEG file named 'highsatpeppers.jpg.'
%
% (Example Answer)
%
%%
% <<highsatpeppers.png>>
%

%%
% <html>
% <hr>
% </html>
%%
% <index.html Contents> |
% | <part1.html Top> |
% | <part2.html Part2>
