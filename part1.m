%% *�g���݃r�W��������i�P�j*
%
% *�摜���o�͂Ɖ�f����(MATLAB)*
%
% �V����w�@�H�w���@�d�C�d�q�H�w�ȁ@
% �����@����
%
% Copyright (c), All rights resereved, 2014, Shogo MURAMATSU
%

%%
% <matlab:showdemo('index') ���j���[> | 
% <matlab:showdemo('part2') Part2>

%%
% *�T�v*
%
% �{���K�ł́AMATLAB(R)�ɂĉ摜�t�@�C���̏���ǂݍ��ޕ��@�̂ق��A
% �摜�\���A�摜�t�@�C���o�́A�ȒP�ȉ�f�����ɂ��Ċw�ԁB
%

%% �摜����
% 
% MATLAB�ɂ�����摜���͂́A�R�}���h�v�����v�g��ɂāA
% <matlab:doc('imread') imread> �֐��Ƀt�@�C�������w�肵�Ď��s�����B
% 
I = imread('cameraman.tif');

%%
% cameraman.tif �̓O���[�X�P�[���摜�Ȃ̂ŁA
% �ϐ� I �͓񎟌��z��Ƃ��ĉ摜�f�[�^��ێ�����B
%
% ���Ɏw������Ȃ���΁A�f�[�^�^�͕����Ȃ������W�r�b�g
% ( <matlab:doc('uint8') uint8> ) �ƂȂ�B
%
% �R�}���h�v�����v�g��ŁA <matlab:doc('whos') whos> �֐��ɂ��m�F�ł���B
%
whos I

%%
% �Ȃ��ASize �́@'���� $$\times $$ ��'�@�ŕ\�������B
%
% �摜�̃T�C�Y��m�邽�߂ɁA
% <matlab:doc('size') size> �֐��𗘗p���邱�Ƃ��ł���B
%
size(I)

%%
% �����݂̂́A��Ԗڂ̈����� '1' ���w�肷��B
%
size(I,1)

%% 
% ���݂̂́A��Ԗڂ̈����� '2' ���w�肷��B
%
size(I,2)

%%
% �J���[�摜�̓Ǎ����\�ł���B
%
RGB = imread('peppers.png');

%%
% �ϐ� RGB �� �O�����z��Ƃ��ĉ摜�f�[�^��ێ�����B
%
whos RGB

%%
% �eR,G,B�����ɂ́A�R����( <matlab:doc(':') :> )�ɂ��C���f�b�N�X�w���
% ���p�ł���B
%
R = RGB(:,:,1);
G = RGB(:,:,2);
B = RGB(:,:,3);

%%
% �eR,G,B�����́A�񎟌��z��ƂȂ�B
%
whos R G B

%% �摜�\��
%
% MATLAB�ɂ�����摜�\���́A�R�}���h�v�����v�g��ɂāA
% <matlab:doc('imshow') imshow> �֐��Ƀt�@�C�������w�肵�Ď��s�����B
% 
% �ϐ� I �̕\���͈ȉ��̒ʂ�B
figure(1)
imshow(I)

%%
% �����ŁA <matlab:doc('figure') figure> �֐��͉摜���o�͂���E�B���h�E��
% �w�肵�Ă���B

%%
% �ϐ�RGB�̕\���͈ȉ��̒ʂ�B
%
figure(2)
imshow(RGB)

%%
% �J���[�摜�Ƃ��ĕ\�������B
%

%% ��f����
% �z��ɑ΂��鉉�Z���{�����Ƃŉ摜�����������ł���B
%
% �J���[�摜RGB���O���[�X�P�[���摜�ɕϊ����悤�B
% <matlab:doc('images/rgb2gray') rgb2gray> �֐��𗘗p����΂悢�B
%
I = rgb2gray(RGB);

%%
% �Ȃ��A�ϐ� I ���ێ����Ă���cameraman.tif �̓��e�́A
% peppers.png �̃O���[�X�P�[���摜�ɂ���ď㏑������Ă���B
%
whos I

%%
% �摜�z��ɑ΂��A���Z���{�����߂ɁA���΂��Ύ����^�ւ̕ϊ����K�v�ƂȂ�B
%
% �����^��������^�ւ̕ϊ��ɂ́A <matlab:doc('images/im2single') im2single>
% �֐��A�������� <matlab:doc('images/im2double') im2double>�@�֐���
% ���p�ł���B
%
I = im2single(I);
whos I

%%
% rgb2gray
% sqrt
% .^2

%% �摜�o��
%
% imwrite
%

%% ���K�ۑ�
%
% *1. �����ʕ\��(R,G,B)*
%
% ������
%
% *2. �F��ԕϊ�(hsv2rgb)*
%
% ������
%

%%
% <html>
% <hr>
% </html>
%%
% <matlab:showdemo('index') ���j���[> |
% <matlab:showdemo('part2') Part2>