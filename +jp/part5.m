%% *EmbVision �`���[�g���A���i�T�j*
%
% *�f���X�g���[������ - Simulink�� -*
%
% �V����w
% �����@����C�����@�E��
%
% Copyright (c), All rights reserved, 2014-2022, Shogo MURAMATSU and Yuki TAKAHASHI
% 

%%
% <part4.html Part4> |
% <index.html ���j���[> |
% <part6.html Part6>

%%
% *�T�v*
%
% �{���K�ł́ASimulink�ɂĉf���t�@�C���̓��͂ƕ\�����s���ق��A
% System object(TM) ���� Simulink �u���b�N���쐬������@�ƁA
% ���u���b�N�𗘗p�����f���X�g���[�������ɂ��Ċw�ԁB

%% Simulink ���f���̍쐬
% �܂��A�V���� Simulink ���f�����쐬���邽�߂ɁA�V�K�Ƀ��f���t�@�C�����쐬���悤�B
%
% �z�[���^�O����A
% 
% # �u�V�K�쐬�v
% # ���uSimulink ���f���v
%
% ��I�����邩�A MATLAB�R�}���h�E�B���h�E�ォ��
% <matlab:doc('new_system') new_system> �֐���
% <matlab:doc('open_system') open_system> �֐�
% �𗘗p����΂悢�B
%
% ��Ƃ��āA�R�}���h�E�B���h�E�ォ��'videoio' �Ƃ������f�����쐬���Ă݂悤�B 
%
%   new_system('videoio','Model')
%   open_system('videoio')

%%
% �ȉ��̂悤�ȃE�B���h�E�������B
%
% <<videoio_slx_00.png>>
%

%%
% ���f���̕ۑ��́A���j���[�o�[��̃A�C�R��
%
% <<file_button.png>>
%
% ���N���b�N���邩�A
% MATLAB�R�}���h�E�B���h�E�ォ��
%
%   save_system('videoio')
%
% �̂悤�� <matlab:doc('save_system') save_system> �֐��𗘗p����΂悢�B

%%
% [ <part5.html �g�b�v> ]

%% Simulink ���C�u�����u���E�U�[
% Simulink �ł́A�����̍\���v�f�ƂȂ�u���b�N����ׂĐڑ����A
% �e�u���b�N�̃v���p�e�B�⓮�������ݒ肵�A
% �V�X�e���̃V�~�����[�V�������s�����Ƃ��ł���B
%
% �܂��A�����̍\���u���b�N�𗘗p���邽�߂ɁA���j���[�o�[��̃A�C�R��
%
% <<library_button.png>>
%
% ���N���b�N���悤�B����ƁA�ȉ��̂悤�� Simulink���C�u�����u���E�U�[�������B
%
% <<library_browser.png>>

%%
% [ <part5.html �g�b�v> ]

%% �f���t�@�C�����o�̓��f��
% �ł́A��Ƃ��ĉf���t�@�C���̓��͂Əo�͂��s���V�X�e�����f�����\�z���悤�B
%
% �܂��A�����̃��X�g����
%
% * <matlab:doc('vision') Computer Vision System Toolbox(TM)>
%
% ��I�����悤�B
%
% ����ƁA���C�u�����u���E�U�[�� Computer Vision System Toolbox ��
% �u���b�N�Q��\������B
% 
% <<cvs_library.png>>
%
% MATLAB �R�}���h�E�B���h�E�ォ��
%
%   visionlib
% 
% �Ƒł�����ł��ǂ��B

%%
% �E���̃A�C�R���Q����A�uSources�v�A�C�R��
% 
% <<cvs_sources.png>>
%
% ���N���b�N���A�uComputer Vision System Toolbox/Sources�v �̃u���b�N�Q���J�����B
%
% <<cvs_sources_blocks.png>>
%

%%
% �u���b�N�Q���� �uFrom Multimedia File�v���E�N���b�N���āA
% ���f�� videoio �Ƀu���b�N��ǉ����悤�B
%
% <<videoio_slx_01.png>>

%%
% �����āASimulink ���C�u�����u���E�U�[�uComputer Vision System Toolbox�v����
% Sinks �̃A�C�R��
% 
% <<cvs_sinks.png>>
%
% ���N���b�N���A�uComputer Vision System Toolbox/Sinks�v �̃u���b�N�Q���J�����B 
%
% <<cvs_sinks_blocks.png>>
%

%%
% �u���b�N�Q���� �uTo Multimedia File�v���E�N���b�N���āA
% ���f�� videoio �Ƀu���b�N��ǉ����悤�B
%
% <<videoio_slx_02.png>>

%%
% �uFrom Multimedia File�v�̏o�͒[�q���h���b�N���āA�uFrom Multimedia File�v��
% ���͒[�q�ɐڑ����悤�B
%
% <<videoio_slx_03.png>>

%%
% ���f���G�f�B�^��̎��s�{�^���A�C�R��
%
% <<play_button.png>>
%
% �����N���b�N����ƁA�쐬�������f���̃V�~�����[�V���������s�����B
%
% <<videoio_slx_04.png>>

%%
% AVI�t�@�C�� output.avi ���o�͂����B
% MATLAB�̊O���̃c�[���ōĐ����Ċm�F���Ăق����B
%
% ����AVI�t�@�C����ς������ꍇ�ɂ́A�uFrom Multimedia File�v�u���b�N��
% �_�u���N���b�N���āA�p�����[�^�_�C�A���O���J���A�uFile name�v��ύX����B
%
% <<frommultimediafile_blockparameter.png>>
%

%%
% ���C�u�����u���E�U�[����
%
% * <matlab:doc('imaq') Image Acquisition Toolbox(TM)>
%
% ��I�����āA�uFrom Video Device�v�u���b�N�𗘗p����΁A
% �ڑ����ꂽ�J��������̉f������͂Ƃ��ė��p�ł���B
%
% <<imaq_blocks.png>>
%
% MATLAB �R�}���h�E�B���h�E�ォ��
%
%   imaqlib
% 
% �Ƒł�����ł��ǂ��B�ڍׂ͊�������B
%

%%
% �o��AVI�t�@�C����ς������ꍇ�ɂ́A�uTo Multimedia File�v�u���b�N��
% �_�u���N���b�N���āA�p�����[�^�_�C�A���O���J���A�uFile name�v��ύX����B
% 
% <<tomultimediafile_blockparameter.png>>

%%
% �o�͐�Ƃ��āuComputer Vision System Toolbox/Sinks�v���ɂ���
%
% * <matlab:doc('videoviewer') Video Viewer> �u���b�N
% * <matlab:doc('vision/tovideodisplay') To Video Display> �u���b�N�iWindows(R)�̂݁j
% 
% �𗘗p����΁ASimulink ��Ńr���[���[������A
% �V�~�����[�V���������Ȃ���o�͉f�����m�F���邱�Ƃ��ł���B�ڍׂ͊�������B

%%
% [ <part5.html �g�b�v> ]

%% MATLAB System �u���b�N
% MATLAB System �u���b�N�𗘗p����ƁASystem object �� Simulink �u���b�N
% �Ƃ��ė��p���邱�Ƃ��ł���B
% 
% ��Ƃ��āA�{���K Part3 �ō쐬���� Rgb2GraySystem ���u���b�N�Ƃ���
% ���p���Ă݂悤�B

%%
% ���f�� videoio �� videorgb2gray �Ƃ��ĕۑ�����B
%
%   open_system('videoio')
%   save_system('videoio','videorgb2gray')

%%
% Simulink ���C�u�����u���E�U�[����uSimulink/User-Defined Functions�v��
% �u���b�N�Q��\�����A���̒�����
%
% * MATLAB System �u���b�N
%
% ��I�����āA���f�� videorgb2gray �ɒǉ����悤
%
% <<udf_blocks.png>>

%%
% ���f�� videorgb2gray �͈ȉ��̗l�ȏ�ԂƂȂ�B
%
% <<videorgb2gray_slx_00.png>>

%%
% MATLAB System �u���b�N���f�����o�͂̊Ԃɋ��݁A�v���p�e�B�_�C�A���O���J����
% 
% * System object��: Rgb2GraySystem
%
% ��ݒ肵�悤�B
%
% <<videorgb2gray_slx_01.png>>

%%
% �uOK�v�{�^�����N���b�N���āA�����̃u���b�N��K���ɑ傫���L����ƈȉ��̗l��
% ��ԂƂȂ�B
%
% <<videorgb2gray_slx_02.png>>

%%
% ���s���āAAVI�t�@�C�� output.avi ���m�F���Ă݂悤�B

%%
% [ <part5.html �g�b�v> ] 

%% �A�C�R���̃J�X�^�}�C�Y
% MATLAB System �u���b�N�̓��o�͖��́A�Ăяo����� System object ���
% �J�X�^�}�C�Y�ł���B
%
% ���o�̓|�[�g���Ȃǂ��w�肵�Ă݂悤�B
% �u���b�N�p�����[�^�_�C�A���O���� Rgb2GraySystem �̃\�[�X�R�[�h���J�����B
%
% <<matlabsystem_blockparameter.png>>
%
% ���ɁAmethods(Access=protected) �u���b�N�ɁA�ȉ��̃��\�b�h��ǋL����B
%
%   methods (Access=protected)
%      ...�i�ȗ��j
%      % ���̓|�[�g��
%      function N = getNumInputsImpl(obj)
%          N = 1; 
%      end
%      % �o�̓|�[�g��        
%      function N = getOutputNamesImpl(obj)
%          N = 1;
%      end      
%      % ���̓|�[�g��
%      function inputName = getInputNamesImpl(obj)
%             inputName = 'RGB';
%      end
%      % �o�̓|�[�g��
%      function outputName = getOutputNamesImpl(obj)
%             outputName = 'Gray';
%      end
%      ...�i�ȗ��j
%   end

%% 
% ����ɁA
%
% * <matlab:doc('matlab.system.mixin.CustomIcon') matlab.system.mixin.CustomIcon>
%
% ���p�����邱�ƂŁA�A�C�R�����J�X�^�}�C�Y�ł���B
% 
% �܂��A�\�[�X�R�[�h�� classdef �̍s���ȉ��̂悤�ɏC������B
%
%   classdef Rgb2GraySystem < matlab.System ...
%         & matlab.system.mixin.CustomIcon
%
% ���ɁAmethods(Access=protected) �u���b�N�ɁA�ȉ��̃��\�b�h��ǋL����B
%
%   methods (Access=protected)
%      ...�i�ȗ��j
%      % �A�C�R��
%      function icon = getIconImpl(obj)
%         icon = sprintf('RGB to Gray');
%      end
%      ...�i�ȗ��j
%   end

%%
% �uOK�v�{�^�����N���b�N���āA�_�C�A���O�����ƈȉ��̗l�ɁA
% �����u���b�N�̓��o�͖��ƃA�C�R�������w��ʂ�̏�ԂƂȂ�B
%
% <<videorgb2gray_slx_03.png>>


%%
% [ <part5.html �g�b�v> ]

%% ���Z���x�ƐM�������`���i�I�v�V�����j
%
% * <matlab:doc('matlab.system.mixin.Propagates') matlab.system.mixin.Propagates>
%
% �i�������j

%% �t�B�[�h�X���[�i�I�v�V�����j
%
% * <matlab:doc('matlab.system.mixin.Nondirect') matlab.system.mixin.Nondirect>
%
% �i�������j

%%
% [ <part5.html �g�b�v> ]

%% ���K�ۑ�
% *���K�ۑ�5-1. Prewitt���z�t�B���^*
%
% �{���KPart4�ō쐬���� System object �N���X
%
%   * Rgb2GraySystem
%   * GradFiltSystem
%   * Hsv2RgbSystem
%
% �� MATLAB System �u���b�N�Ƃ��ė��p���A�ȉ��� MATLAB �R�[�h�� Simulink ���
% ���f�������悤�B
% 
%   vrObj = VideoReader('vipmen.avi');
%   frameRate = get(vrObj,'FrameRate');
%   vwObj = VideoWriter('vipmengradfilt.avi');
%   set(vwObj,'FrameRate',frameRate);
%   rgsObj = Rgb2GraySystem();
%   hrsObj = Hsv2RgbSystem();
%   gfsObj = GradFiltSystem();
%   open(vwObj)
%   while (hasFrame(vrObj))
%      frame     = readFrame(vrObj);         % �t���[������
%      graysc    = step(rgsObj,frame);       % �O���[�X�P�[����
%      [mag,ang] = step(gfsObj,graysc);      % ���z�t�B���^�����O
%      ang       = (ang+pi)/(2*pi);          % �Ίp�̐��K��
%      mag       = min(mag,1);               % �傫���̖O�a����
%      [r,g,b]   = step(hrsObj,ang,mag,mag); % �^���J���[��
%      frame     = cat(3,r,g,b);             % RGB�z�񌋍�
%      writeVideo(vwObj,frame);              % �t���[���o�� 
%   end
%   close(vwObj)
%
% �i���f����j
%
% <<videogradfilt_slx_00.png>>
%
% �������A�ȉ��̃u���b�N�𗘗p�B
%
% * <matlab:doc('simulink/saturation') Simulink/Commonly Used Blocks/Saturation>
% * <matlab:doc('simulink/constant') Simulink/Commonly Used Blocks/Constant>
% * <matlab:doc('simulink/add') Simulink/Commonly Used Blocks/Sum>
% * <matlab:doc('simulink/gain') Simulink/Commonly Used Blocks/Gain>
%
% �i������j
%
% <<vipmengradfilt_avi.png>>

%%
% *���K�ۑ�5-2. Sobel���z�t�B���^*
%
% ���K�ۑ�5-1�ō쐬���� Prewitt ���z�t�B���^���f���̃t�B���^�J�[�l��
% �����K�ۑ�4-1�ŏЉ�� Sobel �J�[�l���ɕς��ăV�~�����[�V���������s
% ���Ă݂悤�B
% 
% * �q���g�FGradFilterSystem �u���b�N�̃p�����[�^ Kernel ���C������΂悢�B
%
% �i������j
%
% <<vipmengradfilt_sobel_avi.png>>

%%
% <html>
% <hr>
% </html>
%%
% <part4.html Part4> |
% <index.html ���j���[> |
% <part5.html �g�b�v> |
% <part6.html Part6>
