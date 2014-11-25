%% *MATLAB/Simulink�ɂ��g���݃r�W��������i�U�j*
%
% *�f���X�g���[������ - Raspberry Pi(TM)�� -*
%
% �V����w�@�H�w���@�d�C�d�q�H�w�ȁ@
% �����@����
%
%
% Copyright (c), All rights resereved, 2014, Shogo MURAMATSU
%

%%
% <part5.html Part5> |
% <index.html ���j���[>

%% 
% *�T�v*
%
% �{���K�ł́APart5�ō쐬����Simulink(R)���f�� �� Rasberry Pi �Ɏ������A
% �G�N�X�^�[�i�����[�h�ł̃V�~�����[�V�����̂ق��A
% �X�^���h�A�����Ŏ��s������@�ɂ��Ċw�ԁB

%% Raspberry Pi �ݒ�
% �V���O���{�[�h�R���s���[�^ Raspberry Pi �ւ̎����R�[�h��
% Simulink���f����ʂ��Đ������邱�Ƃ��ł���B
%
% �Ȃ��A�{���K�� Windows(R)���MATLAB�Ŏ��s����K�v������B
%
% �ȉ��ł́ARaspberry Pi �p�̃T�|�[�g�p�b�P�[�W
%
% * <http://jp.mathworks.com/help/simulink/ug/install-target-for-raspberry-pi-hardware.html Raspberry Pi>
%
% �����ɃC���X�g�[������Ă���O��Řb��i�߂�B

%%
% [ <part6.html �g�b�v> ]

%% �V�~�����[�V�������f��
% �܂��A�{���K Part5 �ō쐬���� Simulink ���f�� videogradfilt �� 
% Raspberry Pi �p�ɕύX���悤�B
%
% ���f�� videogradfilt ��ǂݍ��݁A videogradfiltraspi �Ƃ��ĕۑ�����B
%
%   open_system('videogradfilt')
%   save_system('videogradfilt','videogradfiltraspi')

%%
% Raspberry Pi �p�̎����R�[�h�������s�� Simulink ���f���́A
% �S�Ẵu���b�N���R�[�h�����ɑΉ����Ă���K�v������B
% ����ɁA�e����o�̓u���b�N�� Raspberry Pi �p�̃u���b�N���C�u��������
% �I�����Ďg�p����K�v������B
%
% Raspbery Pi �p�̃u���b�N���C�u�����́ASimilink���C�u�����u���E�U�[����
%
% * Simulink Support Package for Raspberry Pi hardware
% 
% ��I������΂悢�B
%
% <<raspberrypi_blocks.png>>
%
% ���邢�́AMATLAB(R) �R�}���h�E�B���h�E�ォ��
%
%   raspberrypilib
% 
% �Ƒł�����ł��ǂ��B

%%
% �f�����o�̓u���b�N�� Raspberry Pi �p�̓��o�̓u���b�N�ɒu�������悤�B
%
% * �uFrom Multimedia File�v�uRGB to Gray�v�� �uV4L2 Video Capture�v
% * �uTo Multimedia File�v �� �uSDL Video Display�v
%
% <<videogradfiltraspi_slx_00.png>>
%
% �uV4L2 Video Capture�v�u���b�N�̏o��Y�̓O���[�X�P�[���ɑΉ�����B
% �{���f���ł́A�c��̏o�� Cb,Cr�𗘗p���Ȃ����߁A�ȉ��̏I�[�u���b�N��ڑ������B
%
% * <matlab:doc('simulink/terminator') Simulink/Commonly Used Blocks/Terminator>
%
% �܂��A�uSDL Video Display�v�u���b�N�ł� RGB ���͂��ł���悤�A
% �u���b�N�p�����[�^ Pixel format �� RGB �ƕҏW�����B

%%
% �����A���s���Ă݂悤�B
%
% <<videogradfiltraspi_slx_01.png>>
%
% ����ƁA�uSDL Video Display�v�u���b�N�̓��͕��Ńf�[�^�^�̕s��v�ɂ��
% �G���[��������B
%
% �����́A�uSDL Video Display�v�u���b�N��8�r�b�g�����Ȃ������^(uint8)��
% �v������̂ɑ΂��A�uHSV to RGB�v�u���b�N�������^(double)�Ńf�[�^���o��
% ���邽�߂ł���B
%
% ���̖���������邽�߂ɁA�Q�C���������f�[�^�^�ϊ����s���u���b�N
%
% * <matlab:doc('simulink/gain') Simulink/Commonly Used Blocks/Gain>
% * <matlab:doc('simulink/datatpeconversion') Simulink/Commonly Used Blocks/Convert>
%
% ���uSDL Video Display�v�u���b�N�̓��͕��ɑ}�������s���悤�B
%
% <<videogradfiltraspi_slx_02.png>>
%
% �������s����A�_�~�[�̉f�����������s�����B  
%

%%
% ������
%
% * �uV4L2 Video Capture�v�u���b�N�͐����Ɛ�����]�u���ďo�͂���B
% * �uSDL Video Display�v�u���b�N�͓��͂̐����Ɛ�����]�u���ĕ\������B
%
% �Ƃ����_�ɒ��ӂ��Ăق����B
% ���̂��Ƃ��m���߂邽�߂ɁA�uComputer Vision System Toolbos/Sinks�v���ɂ���
%
% * <matlab:doc('vision/tovideodisplay') To Video Display> �u���b�N�iWindows(R)�̂݁j
% 
% ���ꎞ�I�� �uV4L2 Video Capture�v�̏o��Y�ɐڑ����āA�V�~�����[�V���������s
% ���Ă݂悤�B
%
% <<videogradfiltraspi_slx_03.png>>
%
% �uV4L2 Video Capture�v�̏o�͂ƁuSDL Video Display�v�̕\�����ׂ��
% �݂��ɓ]�u�̊֌W�ɂ��邱�Ƃ�������B
%
% ���������āA���z�t�B���^�̕������C�����Ȃ���΂Ȃ�Ȃ��B
% �uFilt.Grad.�v�u���b�N��Kernel�v���p�e�B��
%
% <<gradfilt_kernel.png>>
%
% �̂悤�ɓ]�u����悤�ҏW���āA���z�t�B���^�̕������C�����悤�B
%
% �ēx�A���f�� videogradfiltraspi �����s���悤�B
%
% <<videogradfiltraspi_slx_04.png>>
%
% �o�͂̍ʐF�i���z�����j���C������Ă��邱�Ƃ��m�F�ł���B

%%
% [ <part6.html �g�b�v> ]

%% �G�N�X�^�[�i�����[�h
% Raspberry Pi �p�ɍ\�z�������f�������ۂ̃{�[�h��œ��삳���Ă݂悤�B
%
% Simulink ���f���� Raspberry Pi ��œ��삳������@�ɂ́A
%
% * �G�N�X�^�[�i�����[�h�V�~�����[�V����
% * �X�^���h�A�������s
%
% �̓��ނ�����B
%
% �������� �u��
%
% Raspberry Pi ��WEB�J������ڑ�
%
% �G�N�X�^�[�i�����[�h�Ŏ��s

%%
% [�c�[��] > [�^�[�Q�b�g�n�[�h�E�F�A�Ŏ��s ] > [�t�@�[���E�F�A�̍X�V... ]
% �T�|�[�g �p�b�P�[�W: [Raspberry Pi(Simulink)] > [����]
%
% [�c�[��] > [�^�[�Q�b�g�n�[�h�E�F�A�Ŏ��s ] > [�I�v�V���� ]
%

%%
% [ <part6.html �g�b�v> ]

%% Raspberry Pi �X�^���h�A��������
%
% Raspberry Pi ��WEB�J������HDMI�f�B�X�v���C��ڑ�

%%
% [ <part6.html �g�b�v> ]

%% ���K�ۑ�
%
% *���K�ۑ�6-1.* 
%
%%
% 
% *���K�ۑ�6-2.* 
%

%%
% <html>
% <hr>
% </html>
%%
% <part5.html Part5> |
% <index.html ���j���[>
% <part6.html �g�b�v> 