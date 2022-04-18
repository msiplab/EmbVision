%% *EmbVision �`���[�g���A���i�U�j*
%
% *�f���X�g���[������ - Raspberry Pi(TM)�� -*
%
% �V����w
% �����@����C�����@�E��
%
% Copyright (c), All rights reserved, 2014-2022, Shogo MURAMATSU and Yuki TAKAHASHI
% 

%%
% <part5.html Part5> |
% <index.html ���j���[>

%% 
% *�T�v*
%
% �{���K�ł́APart5�ō쐬����Simulink ���f�� �� Raspberry Pi �Ɏ������A
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
% Raspberry Pi �p�̃u���b�N���C�u�����́ASimulink���C�u�����u���E�U�[����
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
% ���̖���������邽�߂ɁA�Q�C�������ƃf�[�^�^�ϊ����s���u���b�N
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
% ���̂��Ƃ��m���߂邽�߂ɁA�uComputer Vision System Toolbox/Sinks�v���ɂ���
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
%
% �ȍ~�A�uTo Video Display�v�u���b�N�͕s�v�Ȃ̂Ń��f������폜���Ă������B

%%
% [ <part6.html �g�b�v> ]

%% �n�[�h�E�F�A���s�̏���
% Raspberry Pi �p�ɍ\�z�������f�������ۂ̃{�[�h��œ��삳���Ă݂悤�B
%
% Simulink ���f���� Raspberry Pi ��œ��삳������@�ɂ́A
%
% * �G�N�X�^�[�i�����[�h�V�~�����[�V����
% * �X�^���h�A�������s
%
% �̓��ނ�����B
%
% �G�N�X�^�[�i�����[�h�ł́ASimulink ���f������ Raspberry Pi ���
% ���삷������R�[�h�𐶐����ARaspberry Pi ��Ŏ��ۂɓ��삳���A
% ���̏o�͂��茳�� Simulink ��Ŋm�F����B
%
% ����A�X�^���h�A�������s�ł́ASimulink ���f������ Raspberry Pi ���
% �Ɨ��ɓ��삷������R�[�h�𐶐����ARaspberry Pi ��œ��삳����B

%%
% �܂��A�����Ƃ��� Raspberry Pi model B/B+ ��p�ӂ�
%
% # MicroSD �J�[�h
% # LAN �P�[�u��
% # Web �J����
% # �d���P�[�u��
% 
% �̏��ɐڑ����悤�B
%
% <<raspi_microsd.png>>
%
% <<raspi_cableconnection.png>>
%
% �Ȃ��AMicroSD �ɂ�Raspberry Pi Support Package ����
% �t�@�[���E�F�A�C���[�W�̏������݂��������Ă�����̂Ƃ���B
%
% * [�c�[��] > [�^�[�Q�b�g�n�[�h�E�F�A�Ŏ��s ] > [�t�@�[���E�F�A�̍X�V... ]

%%
% �ł́ASimulink ���� Raspberry Pi �ւ̐ڑ����s�����߂̏��������悤�B
%
% Simulink ���f�� videogradfiltraspi �̃��j���[�o�[����
%
% * [�c�[��] > [�^�[�Q�b�g�n�[�h�E�F�A�Ŏ��s ] > [�I�v�V���� ]
%
% �ւƐi�ށB
%
% <<videogradfiltraspi_slx_05.png>>
%
% �^�[�Q�b�g�n�[�h�E�F�A�Ƃ��āuRaspberry Pi�v��I������B
%
% <<videogradfiltraspi_slx_06.png>>
%
% �ڑ�����{�[�h�̏����m�F����B
%
% <<videogradfiltraspi_slx_07.png>>
%
% ���ɁA�uBoard information�v�́uHost name�v�́A�e�{�[�h���ɐݒ肪�قȂ�̂�
% �ҏW���K�v�ƂȂ�B
%
% * ���K���ɕK�v�ȏ���񋟂���B
%
% IP�A�h���X��������΁A�ȉ��̗p�ɕҏW����΂悢�B�i192.168.11.2�͈��j
%
% <<videogradfiltraspi_ipaddress.png>>
% 
% �uOK�v���N���b�N����������������B

%%
% [ <part6.html �g�b�v> ]

%% �G�N�X�^�[�i�����[�h
% �ł́ASimulink ���f�� videogradfiltraspi ���G�N�X�^�[�i�����[�h�œ���
% �����Ă݂悤�B
% 
% �܂��A�V�~�����[�V�����̃��[�h���u�m�[�}���v����
%
% * �G�N�X�^�[�i��
%
% �ւƕύX����B
%
% <<videogradfiltraspi_external.png>>
%
% �����A���s���Ă݂悤�B
%
% <<videogradfiltraspi_slx_08.png>>
%
% Raspberry Pi �ɐڑ����� Web �J�����̏����f���� Simulink ��ŕ\�������B

%%
% [ <part6.html �g�b�v> ]

%% �X�^���h�A�������s
% �ł́ASimulink ���f�� videogradfiltraspi �� Raspberry Pi ���
% �X�^���h�A�������s���Ă݂悤�B
%
% �X�^���h�A�������s�̂��߂Ɉȉ��̏������s���B
%
% # �d���P�[�u������U�O��
% # HDMI�f�B�X�v���C�ڑ�����
% # �d���P�[�u�����ēx�ڑ�����
%
% <<raspi_hdmi.png>>
%
% �������ڑ�����Ă���΁ARasbian �̋N���� Raspberry Pi �ɐڑ�����
% �f�B�X�v���C��Ŋm�F�ł���B
%
% �Ȃ��CRaspberry Pi Camera Module �𗘗p���邽�߂ɂ͈ȉ��̃T�C�g���Q�Ƃ��Ăق����B
% 
% http://www.mathworks.com/matlabcentral/answers/122199-simulink-with-raspberry-pi-camera-capture

%%
% Simulink ���f�� videogradfiltraspi �ɖ߂�A
%
% * �u�n�[�h�E�F�A�ɓW�J�v
%
% �̃{�^�����N���b�N���悤�B
%
% <<videogradfiltraspi_slx_09.png>>
%
% Windows�̃R�}���h�E�B���h�E�������オ���ASimulink ���f���̍�����
%
% * �u���f����'Raspberry Pi' �ɐ���ɔz�z����܂����B�v
%
% �ƕ\�������ΐ����ł���B
%
% <<videogradfiltraspi_slx_10.png>>
%
% Raspberry Pi �ɐڑ����ꂽ�f�B�X�v���C��ɃJ��������̉f����
% �������ʂ��\�������B
% 
% <<raspi_videogradfilt.png>>
%

%% 
% �ȍ~�ASimulink ���f�� videogradfiltraspi ����Ă��ARaspberry Pi ���
% �����͌p�������B
%
%   close_system('videogradfiltraspi')
%

%% 
% MATLAB �R�}���h�E�B���h�E��� <matlab:help('raspberrypi') raspberrypi>
% �֐��𗘗p����ƁA�ڑ����� Raspberry Pi �̏����擾�ł���B
%
%   h = raspberrypi

%%
% Raspberry Pi ��œ��쒆�̃��f�� videogradfiltraspi ���~����ɂ́A
% stop ���\�b�h�𗘗p����B
%
%   h.stop('videogradfiltraspi')
%
    
%%
% �ēx���f�� videogradfiltraspi ���J���Arun ���\�b�h��p����΁A
% Raspberry Pi ��Ń��f�����ċN�����邱�Ƃ��ł���B
%
%   open_system('videogradfiltraspi')
%   h.run('videogradfiltraspi')

%%
% [ <part6.html �g�b�v> ]

%% ���K�ۑ�
%
% *���K�ۑ�6-1. Sobel���z�t�B���^* 
%
% ���K�ۑ�4-1�ŏЉ�� Sobel �J�[�l���ɕς��� Raspberry Pi ��ŁA
% �X�^���h�A�������s���悤�B

%%
% 
% *���K�ۑ�6-2. ���f���̎���Ǝ��s*�i�I�v�V�����j 
%
% ����f���������f����n���݌v���A
% Raspberry Pi ��ŁA�X�^���h�A�������s���悤�B
%
% �ȉ��Ɋ��҂����g����������B
% 
% * Raspberry Pi �J�������W���[������
% * �Œ菬���_����
% * ��������iRasPi2��̃N�A�b�h�R�A�p�j
% * ���̂̌��o����єF��
% * �����E�����M������
% * GPIO/I2C ����
% * �l�b�g���[�N�A�v���P�[�V�����J��
%

%%
% <html>
% <hr>
% </html>
%%
% <part5.html Part5> |
% <index.html ���j���[> |
% <part6.html �g�b�v> 
