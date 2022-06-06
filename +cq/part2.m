%% *EmbVision(CQ��) �`���[�g���A���i�R�j*
%
% *�t�B���^�����O�Ǝ��g������*
%
% �V����w
% �����@����C�����@�E��
%
% Copyright (c), All rights reserved, 2014-2022, Shogo MURAMATSU and Yuki TAKAHASHI
% 

%%
% <part1.html Part1> |
% <index.html ���j���[> |
% <part3.html Part3>

%%
% *�T�v*
%
% �{���K�ł́AMATLAB�ɂĈꎟ���M���̃t�B���^�����O�Ǝ��g����͖@�A
% �摜���̃t�B���^�����O�Ǝ��g����͖@�ɂ��ĊȒP�Ɋw�ԁB
%
% �����Ƃ��āA�J���Ă���S�Ă� Figure �� <matlab:doc('close') close> �֐���
% ���Ă����B

close all

%% �ꎟ���M���̎��g������
% �܂��A�\�ߗp�ӂ���Ă���I�[�f�B�I�f�[�^ chirp ��
% <matlab:doc('load') load> �֐��𗘗p���ēǂݏo���ď�������B

load chirp

%%
% �I�[�f�B�I�f�[�^�͕ϐ� y �ɔ{���x�����^�z��Ƃ��ĕێ������B
% �Ȃ��A�W�{�����g���͕ϐ� Fs �ɕێ������B

whos y Fs

%%
% ���ɁA�\�ߗp�ӂ���Ă���I�[�f�B�I�f�[�^ gong ��ǂݏo���A
% <matlab:doc('length') length> �֐��𗘗p���Ē����𑵂��A
% chirp �̃f�[�^�ƍ�������B

c = y; % �ϐ� c �ɑ��
load gong
g = y; % �ϐ� g �ɑ��

x = g(1:length(c))+c; % �����𒲐����č���

%%
% �ϐ� x �ɂ͍��������I�[�f�B�I�f�[�^���ێ������B
% <matlab:doc('plot') plot> �֐��Ŋm�F���悤�B

plot(x)

%%
% �I�[�f�B�I�Đ���������� <matlab:doc('audioplayer') audioplayer>
% �֐��𗘗p���āA�I�[�f�B�I�Đ����\�ł���B
%
% �܂��A�I�[�f�B�I�Đ��I�u�W�F�N�g�𐶐�����B

%% 
% 
%   player = audioplayer(x,Fs);
%   whos player
%

%%
% �I�[�f�B�I�Đ��́A
% <matlab:doc('audioplayer/play') play> ���\�b�h��
% �I�u�W�F�N�g player ���w�肵�Ď��s�����B

%%
%
%   play(player)
%

%%
% <matlab:doc('spectrogram') spectrogram> �֐��𗘗p���邱�ƂŁA
% �Z���ԃt�[���G�ϊ��𗘗p�����I�[�f�B�I�f�[�^�̎��g����͂����s�ł���B
%
% * ����: 256
%
% �Ƃ��Ď��s���悤�B 

figure(1)
spectrogram(x,256)
caxis([ -70 10 ])
colorbar

%%
% ��L�̑���ɂ����g�������i�X�y�N�g���O�����j���\�������B
% �����͐��K�����g��( $$ F_s/2 $$ �� 1 �Ɛ��K��)�A
% �c���͕W�{�C���f�b�N�X( $$ 1/F_s $$ �b�P��)�ł���B
%
% �Ȃ��A�l�̑傫��[dB] ��������Ղ��悤��
% <matlab:doc('caxis') caxis> �֐���
% <matlab:doc('colorbar') colorbar> �֐��𕹗p�����B
%
% <matalb:doc('view') view> �֐��Ŏ��_��ς��Ă݂悤�B

view([-15 30])

%%
% <matlab:doc('zlim') zlim> �֐��𗘗p���āA
% Z���̍��W���@-70 ���� 10 �ɒ�������B

zlim([ -70 10 ])

%%
% [ <part2.html �g�b�v> ]

%% �ꎟ���M���̃t�B���^�����O
% ���ɁA�I�[�f�B�I�f�[�^ x �ɁA���`�t�B���^����
%
% $$ y[n] = h[n] \ast x[n] = \sum_{k=0}^{N-1} h[k]x[n-k] $$
%
% ���{���Ă݂悤�B�����ŁA
%
% * $$ x[n] $$ : �t�B���^����
% * $$ y[n] $$ : �t�B���^�o�� 
% * $$ h[n] $$ : �t�B���^�W���i�C���p���X�����j
% * $$ N $$    : �t�B���^����
%
% �Ƃ���B
%
% MATLAB �ł͐��`�t�B���^������ <matlab:doc('conv') conv> �֐��𗘗p�ł���B
%
% �t�B���^�W�� 
%
% $$ h[n] = \left\{\begin{array}{ll}
%            1/3, & n=0,1,2 \\
%            0, & \mathrm{otherwise}
%           \end{array}\right. $$
% 
% �Ƃ��Đ��`�t�B���^���������s���Ă݂悤�B

h = [ 1 1 1 ]/3;
figure(2)
impz(h)

%%

y = conv(h,x);

%%
% �ϐ� y �ɂ̓t�B���^�������ʂ��ێ�����Ă���B 
% �o�� y �̎��g�������i�X�y�N�g���O�����j���m�F���悤�B

figure(3)
spectrogram(y,256);
caxis([ -70 10 ])
colorbar

%%

view([ -15 30 ])
zlim([ -70 10 ])

%%
% ���� x �Əo�� y �̃X�y�N�g���O�������r���Ă݂ė~�����B
% �ǂ̂悤�Ȃ��ƂɋC���t�����낤���H
%
% * ��悻�A���K�����g��0.4�ȏ�̍����g�������������Ă���B
% * ���ɁA0.667�t�߂̌������傫���B
%
% �Ƃ������Ƃɒ��ӂ��Ċώ@���ė~�����B
%
% �Ȃ��A�������ʂ��I�[�f�B�I�Đ��ɂ��m�F����ꍇ�́A
%
%   player = audioplayer(y,Fs);
%   play(player)
%
% �Ǝ��s����΂悢�B

%%
% [ <part2.html �g�b�v> ]

%% �ꎟ���t�B���^�̎��g������
%
% ���`�t�B���^�ɂ����g�������̕ω��́A
% �t�B���^�̎��g�������ɂ��m�F�ł���B
% 
% ���̂Ȃ�΁A���ԗ̈�ł̏􍞂݉��Z��
%
% $$ y[n] = h[n] \ast x[n] \ \stackrel{\mathrm{DTFT}}{\longleftrightarrow}\
%   Y(e^{j\omega}) = H(e^{j\omega})X(e^{j\omega}) $$
%
% �̂悤�Ɏ��g���iDTFT: ���U���ԃt�[���G�ϊ��j�̈�ł�
% �ω��Z�ɑΉ����邽�߂ł���B�����ŁA
% 
% * $$ X(e^{j\omega}) $$ : ���� $$ x[n] $$ �̎��g������
% * $$ Y(e^{j\omega}) $$ : �o�� $$ y[n] $$ �̎��g������  
% * $$ H(e^{j\omega}) $$ : �t�B���^�W���i�C���p���X�����j $$ h[n] $$ 
%   �̎��g������
%
% �ł���B
%
% �t�B���^�W�� $$ h[n] $$ �̎��g�������� <matlab:doc('freqz') freqz> �֐�
% �ɂ��m�F�ł���B

figure(4)
freqz(h)

%%
% 
% �U���������m�F����ƁA���K�����g�� 0.3 ����@0.4 �̊Ԃ��獂��ɓn��
% -6 [dB] �ȏ�̌��������������A���� 0.6 ���� 0.7 �̊Ԃő傫���������������
% �m�F�ł���B
%
% �Ȃ��A
%
% $$ H(e^{j\omega}) = \sum_{n=-\infty}^{\infty} h[n]e^{-j\omega n} 
%    = h[0]e^{-j0} + h[1]e^{-j\omega} + h[2]e^{-j2\omega} $$
%
% $$ = \frac{1}{3}(e^{j\omega} + 1 + e^{-j\omega})e^{-j\omega} 
%     = \frac{1}{3}(1 + 2\cos\omega)e^{-j\omega} $$
%
% ���A 
%
% * $$ \omega = 0 $$ �ŁA  $$ |H(e^{j\omega})| = 1 $$
% * $$ \omega = \frac{2\pi}{3} $$ �ŁA  $$ |H(e^{j\omega})| = 0 $$
%
% �ƂȂ邱�Ƃ��m�F�ł���B

%%
% [ <part2.html �g�b�v> ]

%% �񎟌��M���̎��g������
% �ł́A�摜�f�[�^�ɑ΂���t�B���^�����O�ɘb��i�߂悤�B
% ��Ɏ������I�[�f�B�I�f�[�^�Ɠ��l�ɐ��`�t�B���^�������{�����Ƃ��ł���B
% 
% �܂��A �J���Ă���S�Ă� Figure �� <matlab:doc('close') close> �֐���
% �ŕ�����A�\�ߗp�ӂ���Ă���摜�f�[�^ cameraman ��
% �ǂݍ���ŕ\�����悤�B

close all
figure(1)
X = imread('cameraman.tif');
imshow(X)

%%
% �摜�f�[�^�͕ϐ� X �ɕ����Ȃ������W�r�b�g�^�z��Ƃ��ĕێ������̂ŁA
% �����{���x�����^�ɕϊ����悤�B

X = im2double(X);
whos X

%%
% <matlab:doc('fft2') fft2> �֐��𗘗p���邱�ƂŁA
% �摜�f�[�^�̓񎟌��̎��g����͂����s�ł���B
% �摜�T�C�Y�ɍ��킹��
%
% * �񎟌�FFT�_��: $$ 256\times 256 $$
%
% �Ɛݒ肵�񎟌����g����͂����s���悤�B 

F = fft2(X,256,256);
whos F

%%
% �ϐ� F �ɓ񎟌����U�t�[���G�ϊ�(DFT)�W�����ێ������B
% �Ȃ��A���f���Ƃ��Č��ʂ������邽�߁A��Βl���Ƃ���
% �U�����������߂Ă݂悤�B

Fmag = abs(F);
whos Fmag

%%
% �ϐ� Fmag �ɂ́A�U�������Ƃ��Ď����z�񂪕ێ������B
% <matlab:doc('surface') surface> �֐��𗘗p���āA
% �������������悤�B
%
% surface �v���b�g�𒲐����邽�߂̃n���h���I�u�W�F�N�g�Ƃ���
% �ϐ� hsrfc ��p�ӂ��Ă������B

figure(2)
hsrfc = surface(20*log10(Fmag));
set(hsrfc,'EdgeColor','none');

%%
% �����ł́A�f�V�x���Ɋ��Z���Ă���_�ɒ��ӂ���B
%
% �O���t�����₷���悤�J���[�o�[��ݒu����B

colorbar
caxis([ -20 80 ])

%%
% ���S�������ƂȂ�悤�� <matlab:doc('fftshift') fftshift> �֐���p����
% �z����V�t�g����B

set(hsrfc,'ZData',fftshift(hsrfc.ZData)); % Z���̃V�t�g
set(hsrfc,'CData',fftshift(hsrfc.CData)); % �J���[���̃V�t�g

%%
% ���K�����g���ƂȂ�悤���W�̒������s���B

fstep = 1/256; % ���g���W�{�_�̊Ԋu
set(hsrfc,'XData',-0.5:fstep:0.5-fstep);
set(hsrfc,'YData',-0.5:fstep:0.5-fstep);
xlabel('F_x (\times\pi rad/sample)')
ylabel('F_y (\times\pi rad/sample)')

%%
% ���_��ς���B

view([ -15 30 ])
zlim([ -20 80 ])

%%
% [ <part2.html �g�b�v> ]

%% �񎟌��M���̃t�B���^�����O
% ���ɁA�摜�f�[�^ X �ɁA�񎟌����`�t�B���^����
%
% $$ y[n_y,n_x] = h[n_y,n_x] \ast 
% x[n_y,n_x] = \sum_{k_x=0}^{N_x-1}\sum_{k_y=0}^{N_y-1}
% h[k_y,k_x]x[n_y-k_y,n_x-k_x] $$
%
% ���{���Ă݂悤�B�����ŁA
%
% * $$ x[n_y,n_x] $$ : �t�B���^����
% * $$ y[n_y,n_x] $$ : �t�B���^�o�� 
% * $$ h[n_y,n_x] $$ : �t�B���^�W���i�C���p���X�����j
% * $$ N_y $$        : �����t�B���^����
% * $$ N_x $$        : �����t�B���^����
%
% �Ƃ���B
%
% MATLAB �ł͓񎟌����`�t�B���^������ <matlab:doc('conv2') conv2> �֐���������
% <matlab:doc('images/imfilter') imfilter> �֐��𗘗p�ł���B
%
% �t�B���^�W��  $$ h[n_y,n_x] $$ �Ƃ��Ĕz��
%
% $$ \left(\begin{array}{ccc}
%    1 &  1 & 1 \\
%    0 &  0 & 0 \\
%   -1 & -1 & -1 \\
%    \end{array}\right) $$
% 
% �𗘗p���Đ��`�t�B���^���������s���Ă݂悤�B

H = [ 1 1 1 ; 0 0 0 ; -1 -1 -1 ];
Y = conv2(H,X);

%%
% �ϐ� Y �ɂ̓t�B���^�������ʂ��ێ�����Ă���B 
% �������A

size(Y)

%%
% �̂悤�ɁA���Ƃ̔z�� X �����T�C�Y���c�� 2 ��f�Â������Ă���B
% ����́A�T�C�Y $$ M_y\times M_x $$ �̉摜�ɃT�C�Y 
% $$ L_y\times L_x $$ �̐��`�t�B���^��������Ƃ��̏o�͂̃T�C�Y��
%
% $$ (M_y+L_y-1)\times (M_x+L_x-1) $$ 
%
% �ɑ������鐫���ɂ��B
%
% �㉺���E�A1��f������āA���͉摜 X �̃T�C�Y�ɏo�͉摜 Y �̃T�C�Y��
% �������悤�B <matlab:doc('end') end> �֐��𗘗p�����z��C���f�b�N�X��
% �ő�l�w��𗘗p����ƕ֗��ł���B

Y = Y(2:end-1,2:end-1);

%%
% �܂��A�o�͉摜 Y �́A���Z�̌��ʁA

min(Y(:))

%%
% �̂悤�ɁA���̒l���܂ށB���̂��߉摜�Ƃ��ĕ\������ۂɂ͍H�v���K�v�ł���B
%
% �����^�摜�̏ꍇ�Aimshow �֐��́A��f�l�� 0 ���� 1 �ɃX�P�[������Ă����
% ���肵�ĕ\�����s���̂ŁA���̒l��0.5 �ȉ��A���̒l��0.5�ȏ�ƂȂ�悤
% Y �̒l�𒲐�����B

figure(3)
imshow(Y+0.5)

%%
% ��̃t�B���^�́A���������̔��� $$ \frac{\partial X}{\partial y} $$ 
% �̗��U�ߎ����o�͂���B
%
% �o�� Y �̎��g���������m�F���悤�B

figure(4)
F = fft2(Y,256,256);
Fmag = abs(F);
hsrfc = surface(20*log10(Fmag));
set(hsrfc,'EdgeColor','none');
colorbar
caxis([ -20 80 ])
set(hsrfc,'ZData',fftshift(hsrfc.ZData));
set(hsrfc,'CData',fftshift(hsrfc.CData));
set(hsrfc,'XData',-0.5:fstep:0.5-fstep);
set(hsrfc,'YData',-0.5:fstep:0.5-fstep);
xlabel('F_x (\times\pi rad/sample)')
ylabel('F_y (\times\pi rad/sample)')
view([ -15 30 ])
zlim([ -20 80 ])

%%
% ���� X �Əo�� Y �̎��g���������r���Ă݂ė~�����B
% �ǂ̂悤�Ȃ��ƂɋC���t�����낤���H
%
% * �����ɂ�����s�[�N���Ȃ��Ȃ�B
% * ���������̍���Ɍ�����������B
%
% �Ƃ������Ƃɒ��ӂ��Ċώ@���ė~�����B

%%
% [ <part2.html �g�b�v> ]

%% �񎟌��t�B���^�̎��g������
%
% �񎟌����`�t�B���^�ɂ����g�������̕ω��́A
% �ꎟ���̏ꍇ�Ɠ��l�ɁA�t�B���^�̎��g�������ɂ��m�F�ł���B
% 
% ���̂Ȃ�΁A��ԗ̈�ł̏􍞂݉��Z��
%
% $$ y[n_y,n_x] = h[n_y,n_x] \ast x[n_y,n_x] \ 
%    \stackrel{\mathrm{DSFT}}{\longleftrightarrow}\
%   Y(e^{j\omega_y},e^{j\omega_x}) = 
%   H(e^{j\omega_y},e^{j\omega_x})X(e^{j\omega_y},e^{j\omega_x}) $$
%
% �̂悤�Ɏ��g���iDSFT: ���U��ԃt�[���G�ϊ��j�̈�ł�
% �ω��Z�ɑΉ����邽�߂ł���B�����ŁA
% 
% * $$ X(e^{j\omega_y},e^{j\omega_x}) $$ : ���� $$ x[n_y,n_x] $$ �̎��g������
% * $$ Y(e^{j\omega_y},e^{j\omega_x}) $$ : �o�� $$ y[n_y,n_x] $$ �̎��g������  
% * $$ H(e^{j\omega_y},e^{j\omega_x}) $$ : �t�B���^�W���i�C���p���X�����j
% $$ h[n_y,n_x] $$ �̎��g������
%
% �ł���B
%
% �t�B���^�W�� $$ h[n_y,n_x] $$ �̎��g��������
% <matlab:doc('freqz2') freqz2> �֐��ɂ��m�F�ł���B

figure(5)
freqz2(H)

%%
% 
% �U���������m�F����ƁA�����Ɛ��������̍����g�������ɑ΂��錸�������������A
% ���������ɂ��Ă͑ш�ʉߓ����������Ƃ��m�F�ł���B
%
% �Ȃ��A
%
% $$ H(e^{j\omega_y},e^{j\omega_x}) = \sum_{n_x=-\infty}^{\infty}
% \sum_{n_y=-\infty}^{\infty} 
% h[n_x,n_y]e^{-j\omega_y n_y}e^{-j\omega_x n_x} $$
%
% $$ = (e^{j\omega_y} - e^{-j\omega_y})(e^{j\omega_x} + 1 + e^{-j\omega_x}) $$
%
% $$ = 2\sin\omega_y(1 + 2\cos\omega_x)e^{-j\frac{\pi}{2}} $$
%
% ���A 
%
% * $$ \omega_y = 0 $$ �ŁA
% $$ |H(e^{j\omega_y},e^{j\omega_x})| = 0 $$
% * $$ \omega_y = \pi $$ �ŁA
% $$ |H(e^{j\omega_y},e^{j\omega_x})| = 0 $$
% * $$ \omega_x = \frac{2\pi}{3} $$ �ŁA
% $$ |H(e^{j\omega_y},e^{j\omega_x})| = 0 $$
% * $$ \omega_y = \pm\frac{\pi}{2}, \omega_x = 0 $$ �ŁA
% $$ |H(e^{j\omega_y},e^{j\omega_x})| = 6 $$
%
% �ƂȂ邱�Ƃ��m�F�ł���B

%%
% [ <part2.html �g�b�v> ]

%% ���K�ۑ�
%
% *�ۑ�2-1. ���������t�B���^*
% 
% �t�B���^�W��  $$ h[n_y,n_x] $$ �Ƃ��Ĕz��
%
% $$ \left(\begin{array}{ccc}
%    1 &  0 & -1 \\
%    1 &  0 & -1 \\
%    1 &  0 & -1 \\
%    \end{array}\right) $$
% 
% �i���������̗��U�ߎ��t�B���^�j��p�ӂ��A
% �摜�t�@�C�� cameraman.tif �̃O���[�X�P�[���摜�ɑ΂���
% ���`�t�B���^�������{���A�������ʂ��摜�t�@�C�� cameramangradx.tif �ɕۑ�����B
% �i���̒l���l�����āA�l0.5 �ɂ�肩���グ���邱�Ɓj�B
%
% �܂��A�t�B���^�̎��g���������O���t�Ŋm�F����B
%
% (������j
%
%%
% <<cameramangradx.png>>
%%
% <<freqz2gradx.png>>
%%
% *�ۑ�2-2. ���z�̑傫���ƕΊp*
%
% ���������t�B���^�o�� $$ \frac{\partial X}{\partial y} $$ �� 
% ���������t�B���^�o�� $$ \frac{\partial X}{\partial x} $$ ����A
%
% * ���z�̑傫�� : $$ \|\Delta X \| = \sqrt{
% \left(\frac{\partial X}{\partial y}\right)^2
% +\left(\frac{\partial X}{\partial x}\right)^2} $$
% * ���z�̕����@ : $$ \angle \Delta X = \tan^{-1}
% \left((\frac{\partial X}{\partial y})/(
% \frac{\partial X}{\partial x})\right) $$
%
% ���v�Z���A�������ʂ����ꂼ��摜�t�@�C�� cameramangradmag.tif ��
% cameramangradang.tif �ɕۑ�����B�������A���z�̕����ɂ��ẮA
% �l�͈̔͂� 0 ���� 1 �Ɋ��Z���邱�ƁB
%
% (������j
%
%%
% <<cameramangradmag.png>>
%%
% <<cameramangradang.png>>

%%
% <html>
% <hr>
% </html>
%%
% <part1.html Part1> |
% <index.html ���j���[> |
% <part2.html �g�b�v> |
% <part3.html Part3>
