%% *EmbVision �`���[�g���A���i�P�j*
% 
% *�摜���o�͂Ɖ�f����*
%
% �V����w
% �����@����C�����@�E��
%
% Copyright (c), All rights reserved, 2014-2025, Shogo MURAMATSU and Yuki TAKAHASHI
% 

%%
% <index.html ���j���[> | 
% <part2.html Part2>

%%
% *�T�v*
%
% �{���K�ł́AMATLAB�ɂĉ摜�t�@�C���̏���ǂݍ��ޕ��@�̂ق��A
% �摜�\���A�摜�t�@�C���o�́A�ȒP�ȉ�f�����ɂ��Ċw�ԁB
%
% �����Ƃ��āA�J���Ă���S�Ă� Figure �� <matlab:doc('close') close> �֐���
% ���Ă����B

close all

%% �摜����
% 
% MATLAB�ɂ�����摜���͂́A�R�}���h�v�����v�g��ɂāA
% <matlab:doc('imread') imread> �֐��Ƀt�@�C�������w�肵�Ď��s�����B
 
I = imread('cameraman.tif');

%%
% cameraman.tif �̓O���[�X�P�[���摜�Ȃ̂ŁA
% �ϐ� I �͓񎟌��z��Ƃ��ĉ摜�f�[�^��ێ�����B
%
% ���Ɏw������Ȃ���΁A�f�[�^�^�͕����Ȃ������W�r�b�g�^
% ( <matlab:doc('uint8') uint8> ) �ƂȂ�B
%
% �R�}���h�v�����v�g��ŁA <matlab:doc('whos') whos> �֐��ɂ��m�F�ł���B

whos I

%%
% �Ȃ��ASize �́@'���� $$\times $$ ��'�@�ŕ\�������B
%
% �摜�̃T�C�Y��m�邽�߂ɁA
% <matlab:doc('size') size> �֐��𗘗p���邱�Ƃ��ł���B

size(I)

%%
% �����݂̂́A��Ԗڂ̈����� '1' ���w�肷��B

size(I,1)

%% 
% ���݂̂́A��Ԗڂ̈����� '2' ���w�肷��B

size(I,2)

%%
% �J���[�摜�̓Ǎ����\�ł���B

RGB = imread('peppers.png');

%%
% �ϐ� RGB �� �O�����z��Ƃ��ĉ摜�f�[�^��ێ�����B

whos RGB

%%
% [ <part1.html �g�b�v> ]

%% �摜�\��
%
% MATLAB�ɂ�����摜�\���́A�R�}���h�v�����v�g��ɂāA
% <matlab:doc('imshow') imshow> �֐��Ƀt�@�C�������w�肵�Ď��s�����B
% 
% �ϐ� I �̕\���͈ȉ��̒ʂ�B

imshow(I)

%%
% �ϐ�RGB�̕\���͈ȉ��̒ʂ�B

imshow(RGB)

%%
% �J���[�摜�Ƃ��ĕ\�������B

%%
% [ <part1.html �g�b�v> ]

%% �z�񏈗�
% �z��ɑ΂��鉉�Z���{�����Ƃŉ摜�����������ł���B
%
% �܂��͊ȒP�Ȕz�񉉎Z���Љ�悤�B��Ƃ��āA�ȉ��̔z���p����B
%
% $$\mathbf{X} =\left(\begin{array}{lll}
%   1 & 2 & 3 \\ 4 & 5 & 6
%   \end{array}\right)$$
%
% MATLAB�R�}���h�v�����v�g��ŁA

X = [ 1 2 3 ; 4 5 6 ];

%%
% �̂悤�ɑł����߂΂悢�B
%
% �z�� X �̏����m�F���悤�B

whos X

%%
% �{���x�����^ $$ 2 \times 3 $$ �z��ł��邱�Ƃ��킩��B
%
% <matlab:doc('disp') disp> �֐��𗘗p���� X �̓��e���m�F���悤�B

disp(X)

%%
% MATLAB��ł͔z��ɑ΂��A�����̉��Z�����p�ł���B�Ⴆ�΁A
% �z��̓]�u�́A' <matlab:doc('transpose') .'> ' �Ŏ��s�ł���B
% $$ \mathbf{X}^T $$ �́A�R�}���h�v�����v�g��ŁA

X.' 

%%
% �̂悤�Ɏ��s�ł���B
%
% �z��S�̂�萔�{����Ƃ��́A ' <matlab:doc('mtimes') *> ' ���Z�q���A
% �z��S�̂�萔�Ŋ���Ƃ��́A' <matlab:doc('mdivide') /> ' ���Z�q��
% ���p����΂悢�B
%
% �Ⴆ�΁A $$ 255\mathbf{X} $$ �́A

255*X

%%
% �̂悤�ɁA $$ \mathbf{X}/255 $$ �́A

X/255

%%
% �̂悤�Ɏ��s�ł���B
%
% ����ȍ~�A�v�f���ׂ̂���𗘗p����̂ŁA�����ł��̉��Z���@���Љ�悤�B
% �z��̗v�f���ׂ̂���́A' <matlab:doc('power') .^> ' ���Z�q�ɂ��

X.^2

%%
% �̂悤�Ɏ��s�ł���B�v�f���̕�������

X.^(1/2)

%%
% �̂悤�Ɍv�Z�ł���B 
% ���̏ꍇ�́A�ȉ��̂悤�� <matlab:doc('sqrt') sqrt> �֐��𗘗p���Ă��ǂ��B

sqrt(X)

%%
% �T�C�Y�������z�񓯎m�ł���΁A' <matlab:doc('plus') +> ' ���Z�q�𗘗p����
% �a���Ƃ邱�Ƃ��\�ł���B
%
% $$ \mathbf{Y} =\left(\begin{array}{lll}
%   7 & 8 & 9 \\ 10 & 11 & 12
%   \end{array}\right)$$
%
% ���`���Ĕz�� X �ɑ����Ă݂悤�B

Y = [ 7 8 9 ; 10 11 12 ];

X+Y

%% 
% ����ɁA����牉�Z��g�ݍ��킹��΁A�v�f���̎���a�̕�����
%
% $$ [\mathbf{M}]_{i,j} = \sqrt{[\mathbf{X}]_{i,j}^2+[\mathbf{Y}]_{i,j}^2} $$
%
% ��

M = sqrt(X.^2+Y.^2)

%%
% �̂悤�Ɏ����ł���B�O�p�֐������p�ł���̂ŁA
%
% $$ [\mathbf{A}]_{i,j} = \tan^{-1}\frac{[\mathbf{Y}]_{i,j}}{[\mathbf{X}]_{i,j}}$$
%
% �̂悤�ȕ��G�ȉ��Z�� <matlab:doc('atan2') atan2> �֐���p���āA

A = atan2(Y,X)

%%
% �̂悤�Ɏ����ł���B

%%
% �Ȃ��A�ϐ����̒���Ɋۊ��� ' () ' ���Ŋe�����̃C���f�b�N�X���w�肷�邱�Ƃ�
% �z��̗v�f�ɃA�N�Z�X���邱�Ƃ��\�ł���B
%
% �C���f�b�N�X�� '1' ����n�܂邱�Ƃɒ��ӂ���ƁA
% �z�� X �̍���̗v�f�ւ́A

X(1,1)

%%
% �̂悤�ɃA�N�Z�X�ł���B���̗v�f�ւ����l�ɃA�N�Z�X�ł���B
%
% �R����( <matlab:doc(':') :> )�ɂ��C���f�b�N�X�w����s���ƁA
% ���_��ȃA�N�Z�X���\�ƂȂ�B�Ⴆ�΁A�z�� Y �� 1 �s�ڂ́A

Y(1,:) 

%%
% �̂悤�ɁA�z�� M �� 2 ��ڂ́A

M(:,2)

%%
% �̂悤�ɁA�z�� A �� 2�s�ڂ�2��ڂ���3��ڂ�

A(2,2:3)

%%
% �̂悤�ɃA�N�Z�X�ł���B

%%
% [ <part1.html �g�b�v> ]

%% ��f����
% �J���[�摜RGB�̊eR,G,B�����ɃA�N�Z�X���邽�߂ɂ��A
% �R�����ɂ��C���f�b�N�X�w�肪���p�ł���B

R = RGB(:,:,1);
G = RGB(:,:,2);
B = RGB(:,:,3);

%%
% �eR,G,B�����́A�񎟌��z��ƂȂ�B

whos R G B

%%
% �܂��A <matlab:doc('images/rgb2gray') rgb2gray> �֐��𗘗p���邱�ƂŁA

I = rgb2gray(RGB);

%%
% �̂悤�ɃJ���[�摜RGB���O���[�X�P�[���摜 I �ɕϊ��ł���B
%
% �Ȃ��A�ϐ� I ���ێ����Ă������e�͏�L�̑���ɂ�� 
% �ϐ� RGB �̃O���[�X�P�[���摜�ɂ���ď㏑�������B

whos I

%%

imshow(I)

%%
% �摜�z��ɑ΂��A��ɏЉ�����Z���{�����߂ɂ́A
% ���΂��Ύ����^�ւ̕ϊ����K�v�ƂȂ�B
%
% �����^��������^�ւ̕ϊ��ɂ́A <matlab:doc('images/im2single') im2single>
% �֐��A�������� <matlab:doc('images/im2double') im2double>�@�֐���
% ���p�ł���B���ꂼ��A�摜��P���x�����^�A�{���x�����^�ɕϊ�����B

I = im2double(I);
whos I

%%
% �����^�ւ̕ϊ� im2single �֐��Aim2double �֐��͉�f�l�� 0 ���� 1 
% �͈̔͂ɐ��K�����鏈���������ɍs����B
%
% <matlab:doc('min') min>�֐��ōŏ��l�� <matlab:doc('max') max> �֐���
% �ő�l���m�F���悤�B

min(I(:)) 

%%

max(I(:))

%%
% �Ȃ��A'I(:)' �̂悤�ɃR�����𗘗p����Ɣz��̗�x�N�g�������s����B
% min �֐��Amax �֐��ɔz���^����Ɗe�񖈂̕]���ƂȂ邽�߁A�S��f�ɓn��
% �ŏ��l�A�ő�l�����߂邽�߂ɂ����ł͗�x�N�g�������s�����B
% 
% 0 ���� 1 �͈̔͂ɐ��K�����ꂽ�摜�́A�ݏ摥�ϊ��ɂ��A
% 0 ���� 1 �͈͓̔��Ŗ��邳�𒲐��ł���B

J = I.^2;
imshow(J)

%%
% <matalb:doc('fplot') fplot> �֐��ɂ���L�̗ݏ摥�ϊ��̓������m�F���悤�B

fplot(@(x) x.^2, [0 1])  
xlabel('x') % �����̃��x��
ylabel('y') % �c���̃��x��
axis square % �c����̒���

%%
% �����ō̗p�����ݏ摥�ϊ��͕�������`���A�摜���Â�������ʂ�����B 

%%
% [ <part1.html �g�b�v> ]

%% �摜�o��
%
% <matlab:doc('imwrite') imwrite> �֐��𗘗p���邱�ƂŁA�����������ʉ摜��
% �t�@�C���ɕۑ����邱�Ƃ��\�ł���B
%
% �摜 J ���t�@�C�� darkpeppers.tif �ɕۑ����悤�B

imwrite(J,'darkpeppers.tif')

%%
% �摜�t�@�C�� darkpeppers.tif ���o�͂����B

dir *.tif

%%
% [ <part1.html �g�b�v> ]

%% ���K�ۑ�
%
% *�ۑ�1-1. ���邳����*
% 
% �摜�t�@�C�� peppers.png �̃O���[�X�P�[���摜�ɑ΂��Asqrt�֐��ɂ�閾�邳
% �������{���A�������ʂ��摜�t�@�C�� brightpeppers.tif �ɕۑ�����B
% �܂��A�ϊ��̓������O���t�Ŋm�F����B
%
% (������j
%
%%
% <<brightpeppers.png>>
%%
% <<fplotsqrt.png>>
%%
% *�ۑ�1-2. �F��ԕϊ�*
%
% �摜�t�@�C�� peppers.png �� RGB�J���[�z��� <matlab:doc('rgb2hsv') rgb2hsv>
% �֐��� HSV�J���[�z��֕ϊ����AS ������2�{���� 
% <matlab:doc('hsv2rgb') hsv2rgb> �ɂ�RGB�J���[�z��ɖ߂��A�������ʂ�
% �摜�t�@�C�� highsatpeppers.jpg �ɕۑ�����B
%
% (������j
%
%%
% <<highsatpeppers.png>>
%

%%
% <html>
% <hr>
% </html>
%%
% <index.html ���j���[> |
% <part1.html �g�b�v> |
% <part2.html Part2>
