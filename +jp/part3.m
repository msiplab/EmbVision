%% *EmbVision �`���[�g���A���i�R�j*
%
% *�N���X��`�ƒP�̃e�X�g*
%
% �V����w�@�H�w���@�d�C�d�q�H�w�ȁ@
% �����@����
%
% Copyright (c), All rights reserved, 2014-2015, Shogo MURAMATSU
%

%%
% <part2.html Part2> |
% <index.html ���j���[> |
% <part4.html Part4>

%%
% *�T�v*
%
% �{���K�ł́AMATLAB�ł̃I�u�W�F�N�g�w���v���O���~���O��
% �P�̃e�X�g�@�\�ɂ��ĊȒP�Ɋw�ԁB

%% �I�u�W�F�N�g�w���v���O���~���O(OOP)
% �v���O�����̃��W���[�����͍����M�����ƍL���g�����������炷�B
% �I�u�W�F�N�g�w���v���O���~���O
% �i <matlab:doc('object-oriented-programming') OOP> �j�ł́A
%
% *��ԁi�v���p�e�B�j* �� *�U�����i���\�b�h�j*
%
% �����v���O�������W���[�����N���X�Ƃ��Ē�`���A
%
% *�N���X�̎��́i�C���X�^���X�I�u�W�F�N�g�j*
%
% �𐶐����Ȃ���g�����A���݂ɍ�p�����đ�K�͂ȃv���O�������\�z����B
%
% MATLAB�ł�OOP�𗘗p���邱�Ƃ��ł���B
% 
% �o�[�W�����A�b�v���d�˂閈��
% OOP�@�\����������Ă��Ă���A���ł�
% <matlab:doc('matlab.System') System object(TM)>  ���N���X�̌p���ɂ��A
%
% * �X�g���[������
% * �R�[�h����
% * Simulink �u���b�N��`
%
% ���e�ՂƂȂ��Ă���B

%%
% [ <part3.html �g�b�v> ]

%% System object�N���X�̒�`
% �ł́A��Ƃ���RGB�摜 ���� �O���[�X�P�[���摜�ɕϊ�����
% System object �N���X�̌^�g���`���Ă݂悤�B
%
% �z�[���^�O����A
% 
% # �u�V�K�쐬�v
% # ���uSystem object >�v
% # ���u�W���v
%
% ��I������ƃG�f�B�^���J���ȉ��̂悤�ȃR�[�h�̕ҏW�����������B

%%
%   classdef Untitled < matlab.System
%     % Untitled Add summary here
%     %
%     % This template includes the minimum set of functions required
%     % to define a System object with discrete state.
%     properties
%         % Public, tunable properties.
%     end
%     properties (DiscreteState)
%     end
%     properties (Access = private)
%         % Pre-computed constants.
%     end
%     methods (Access = protected)
%         function setupImpl(obj,u)
%             % Implement tasks that need to be performed only once,
%             % such as pre-computed constants.
%         end
%         function y = stepImpl(obj,u)
%             % Implement algorithm. Calculate y as a function of
%             % input u and discrete states.
%             y = u;
%         end
%         function resetImpl(obj)
%             % Initialize discrete-state properties.
%         end
%      end
%   end

%%
% <matlab:doc('classdef') classdef> �����  Untitled  ��
% 
% Rgb2GraySystem  
%
% �Ə��������A�擪�s���ȉ��̂悤�ɂȂ�悤�ҏW���悤�B

%%
%   classdef Rgb2GraySystem < matlab.System
%     % RGB2GRAYSYSTEM RGB to Grayscale Converter
%     %
%   

%%
% �ҏW�����t�@�C���� Rgb2GraySystem.m �Ƃ��ĕۑ����悤�B
%
% �Ȃ��A classdef  �ɑ���������̓N���X���ƂȂ�B
% �N���X���̓t�@�C�����ƈ�v������K�v������B

%%
% ���p�菇���ȉ��ɂ܂Ƃ߂�B
%
% # �C���X�^���X�I�u�W�F�N�g�𐶐��i�R���X�g���N�^�̌ďo���j
% #  step ���\�b�h�����s�istepImpl�̌ďo���j

%%
%   >> u = 1;
%   >> obj = Rgb2GraySystem(); % �R���X�g���N�^�̌ďo��
%   >> y = step(obj,u)         % stepImpl �̌ďo��
%   
%   y =
%
%        1

%%
% �����_��  Rgb2GraySystem �̃N���X��`�͎����������ꂽ�܂܂ł���B
%
% stepImpl ���\�b�h�́A���� u �����̂܂܏o�͂���B
%
%   function y = stepImpl(obj,u)
%      y = u;
%   end
%
% �N���X Rgb2GraySystem �����]�̋@�\�𖞂������߂ɂ͏�ԁi�v���p�e�B�j��
% �U�����i���\�b�h�j��K�؂Ɏ������Ȃ���΂Ȃ�Ȃ��B
%
% �ȉ��ł́A *�e�X�g�쓮�J��* �ɂ�� Rgb2GraySystem �N���X�̎�����i�߂�B

%%
% [ <part3.html �g�b�v> ]

%% �e�X�g�쓮�J��
% �v���O�����̐M���������コ���邽�߂ɂ́A�e�X�g�p�̃R�[�h���[��������Ɨǂ��B
% 
% MATLAB�ł́A���W���[������ <matlab:doc('matlab.unittest') �P�̃e�X�g> 
% ������������t���[�����[�N���񋟂���Ă���B
%
% �P�̃e�X�g�̓N���X�P�ʂōs���e�X�g�ŁA�����R�[�h�����e�X�g�̋L�q��
% �D�悷��e�X�g�쓮�J���Ɍ������Ȃ��B
%
% �e�X�g��D�悵�ď[�������邱�Ƃ�
% �o�O�����Ȃ����ς�g���ɋ����v���O�������J���ł���B
% 
% ��ʂɁA�e�X�g�쓮�J���ł́A
% 
% * �e�X�g���\�b�h�̎��� 
% * �� �_�~�[���\�b�h�ł̎��s�̊m�F
% * �� �^�[�Q�b�g���\�b�h�̎���
% * �� �^�[�Q�b�g���\�b�h�ł̐����̊m�F
% 
% ���J�Ԃ��A�e�X�g�N���X�ƃ^�[�Q�b�g�N���X���[��������B

%%
% �ȉ��̎菇�ŁA Rgb2GraySystem �̃N���X������i�߂悤�B
% 
% # �e�X�g�N���X Rgb2GraySystemTestCase �̒�`
% # �e�X�g�N���X Rgb2GraySystemTestCase �ւ̃��\�b�h testSize �̎���
% # �^�[�Q�b�g�N���X Rgb2GraySystem �̃��\�b�h testSize �̎��s�̊m�F
% # �^�[�Q�b�g�N���X Rgb2GraySystem �̃��\�b�h stepImpl �̎���
% # �^�[�Q�b�g�N���X Rgb2GraySystem �̃��\�b�h testSize �̐����̊m�F

%% �e�X�g�N���X�̒�`
% �ł́A�e�X�g�N���X Rgb2GraySystemTestCase ���`���Ă݂悤�B
%
% �z�[���^�O����A
% 
% # �u�V�K�쐬�v
% # ���u�N���X�v
%
% ��I������ƃG�f�B�^���J���ȉ��̂悤�ȃR�[�h�̕ҏW�����������B
% 
%   classdef Untitled
%   %UNTITLED ���̃N���X�̊T�v�������ɋL�q
%      %   �ڍא����������ɋL�q
%      properties
%      end
%      methods
%      end
%   end

%%
% <matlab:doc('matlab.unittest.TestCase') matlab.unittest.TestCase> 
% �N���X���p�����āA�e�X�g�N���X Rgb2GraySystemTestCase ���`����΂悢�B
%
% ���Ȃ킿�A�擪�� classdef �̍s��
%
%   classdef Rgb2GraySystemTestCase < matlab.unittest.TestCase
%   %RGB2GRAYSYSTEMTESTCASER Rgb2GraySystem �̃e�X�g�P�[�X
%
% �Ə���������΂悢�B
%
% �܂��A Test �����̕t���� <matlab:doc('methods') methods> �u���b�N
%
%   methods (Test)
%   end
% 
% ��p�ӂ���B

%%
% �ҏW��̃R�[�h�S�͈̂ȉ��̂悤�ɂȂ�B
%
%   classdef Rgb2GraySystemTestCase < matlab.unittest.TestCase
%       %RGB2GRAYSYSTEMTESTCASE Rgb2GraySystem �̃e�X�g�P�[�X
%       properties
%       end
%       methods (Test)
%       end
%   end
%
% �ҏW�����t�@�C���� Rgb2GraySystemTestCase.m �Ƃ��ĕۑ����悤�B

%%
% [ <part3.html �g�b�v> ]

%% �e�X�g���\�b�h�̒ǉ�
% �ł́A�e�X�g�N���X Rgb2GraySystemTestCase ��
% �e�X�g���\�b�h��ǉ����悤�B
% 
% Test �����̂��� methods �u���b�N����
% �e�X�g�̓��e���L�q�������\�b�h��ǉ�����΂悢�B
% ���u���b�N���̑S�Ẵ��\�b�h�������I�Ƀe�X�g�̑ΏۂƂȂ�B
%
% �e�X�g���\�b�h
%   
%   function testSize(testCase)
%      % ����
%      u = zeros(1,2,3);   % 1�s2��3�����̎O������z��
%      % ���Ғl
%      szExpctd = [ 1 2 ]; % 1�s2��̓񎟌��z��
%      % �^�[�Q�b�g�̃C���X�^���X��
%      obj = Rgb2GraySystem();
%      % ���s����
%      y = step(obj,u);
%      % �T�C�Y�̌���
%      testCase.verifySize(y,szExpctd);
%   end
%
% �� Rgb2GraySystemTestCase �� methos (Test) �u���b�N�ɒǉ����悤�B
%
% �Ȃ��A <matlab:doc('matlab.unittest.qualifications.Verifiable.verifySize')
% verifySize> �́A�l���w�肳�ꂽ�T�C�Y�ł��邱�Ƃ����؂���B
%
% <matlab:doc('zeros') zeros> �֐��́A�w�肳�ꂽ�T�C�Y�̗�z���
% ��������B

%%
% �R�}���h�E�B���h�E��� <matlab:doc('matlab.unittest.TestCase.run') run> 
% ���\�b�h���Ăяo���ăe�X�g�����s���悤�B
%
%   >> result = run(Rgb2GraySystemTestCase);
%
% Rgb2GraySystem �̎������s�\���Ȃ̂ŁA���؂͎��s�ɏI���B

%% �^�[�Q�b�g�N���X�̎���
% ���؂̎��s��������邽�߂ɃN���X Rgb2GraySystem �� stepImpl ���\�b�h
% ��
% 
%   function y = stepImpl(obj,u)
%      y = zeros(size(u,1),size(u,2));
%   end
%
% �ƒ�`���Ȃ����āA�ēx�e�X�g�����s���悤�B
%
%   >> result = run(Rgb2GraySystemTestCase);
%  
%   Rgb2GraySystemTestCase �����s���Ă��܂�
%   .
%   Rgb2GraySystemTestCase ���������܂���
%   __________

%%
% ���ʂ͎��s���琬���ɕς��B

%% �e�X�g�N���X�ƃ^�[�Q�b�g�N���X�̏[����
% �ȍ~�A�ȉ��̎菇���J��Ԃ��ăe�X�g�N���X�ƃ^�[�Q�b�g�N���X���[��������B
%
% # �e�X�g�N���X�ւ̃e�X�g���\�b�h�̎���
% # �^�[�Q�b�g�N���X�̃e�X�g���s�̊m�F
% # �^�[�Q�b�g�N���X�ւ̃��\�b�h�̎���
% # �^�[�Q�b�g�N���X�̃e�X�g�����̊m�F

%%
% ���̃e�X�g�N���X
%
%   classdef Rgb2GraySystemTestCase < matlab.unittest.TestCase
%       %RGB2GRAYSYSTEMTESTCASE Rgb2GraySystem �̃e�X�g�P�[�X
%       properties
%       end
%       methods (Test)
%           function testSize(testCase)
%               % ����
%               u = zeros(1,2,3);   % 1�s2��3�����̎O�����z��
%               % ���Ғl
%               szExpctd = [ 1 2 ]; % 1�s2��̓񎟌��z��
%               % �^�[�Q�b�g�̃C���X�^���X��
%               obj = Rgb2GraySystem();
%               % ���s����
%               y = step(obj,u);
%               % �T�C�Y�̌���
%               testCase.verifySize(y,szExpctd);
%           end
%           function testValues(testCase)
%               % ����
%               u = rand(4,6,3);        % �O���������_���z��
%               % ���Ғl
%               arrayExpctd = rgb2gray(u); % �O���[�X�P�[���̊��Ғl
%               % �^�[�Q�b�g�̃C���X�^���X��
%               obj = Rgb2GraySystem();
%               % ���s����
%               arrayActual = step(obj,u);
%               % �z��̒l�̌���
%               testCase.verifyEqual(arrayActual,arrayExpctd);
%           end
%       end
%   end
%
% �𖞑�����悤�ɁA Rgb2GraySystem �N���X���������悤�B
%
% �Ȃ��A <matlab:doc('matlab.unittest.qualifications.Verifiable.verifyEqual')
% verifyEqual> �́A�l���w��l�Ɠ��������Ƃ����؂���B
% 
% <matlab:doc('rand') rand> �֐��́A0����1�̎����^�̈�l�����𐶐�
% ����B

result = run(Rgb2GraySystemTestCase);

%%
% Rgb2GraySystem �𐳂��������ł���΁A�e�X�g�͐�������B

%%
% [ <part3.html �g�b�v> ]

%% �v���p�e�B�̗��p
% �N���X�͐U�����i���\�b�h�j�̑��ɏ�ԁi�v���p�e�B�j�������Ƃ��ł���B
%
% �N���X�̏�Ԃ� <matlab:doc('properties') properties> �u���b�N����
% �v���p�e�B����񋓂���B
%
% �Ⴆ�΁A Kernel �Ƃ������O�̃v���p�e�B������ GradFiltSystem �Ƃ�������
% System object �N���X�̒�`��
%
%   classdef GradFiltSystem < matlab.System
%       properties
%          Kernel % �ǉ������v���p�e�B
%       end
%       properties (DiscreteState)
%       end
%       properties (Access = private)
%       end
%       methods (Access = protected)
%           % �Z�b�g�A�b�v�i�ŏ��̃X�e�b�v���O�Ɏ��s�j
%           function setupImpl(obj,srcImg)
%           end
%           % �X�e�b�v
%           function resImg = stepImpl(obj,srcImg)
%              resImg = srcImg;
%           end
%           % ���Z�b�g
%           function resetImpl(obj)
%           end
%        end
%    end
%
% �̂悤�ɋL�q�����B

%% 
% �v���p�e�B�ɂ͏����l��^���邱�Ƃ��ł���B
% �v���p�e�B Kernel �̏����l��
%
%   Kernel = [  1  1  1 ; 
%               0  0  0 ;
%              -1 -1 -1 ];
%
% �ƂȂ邱�Ƃ����҂���e�X�g�N���X���������悤�B
%
%   classdef GradFiltSystemTestCase < matlab.unittest.TestCase
%       %GRADFILTSYSTEMTESTCASE GradFiltSystem �̃e�X�g�P�[�X
%       properties
%       end
%       methods (Test)
%           function testDefaultKernel(testCase)
%               % ���Ғl�@
%               kernelExpctd = [  1  1  1 ;
%                                 0  0  0 ;
%                               -1 -1 -1 ];
%               % �^�[�Q�b�g�N���X�̃C���X�^���X��
%               obj = GradFiltSystem();
%               % �v���p�e�B�[ Kernel �̎擾
%               kernelActual = get(obj,'Kernel');
%               % �v���p�e�B�[ Kernel �̌���
%               testCase.verifyEqual(kernelActual,kernelExpctd)
%           end
%       end
%   end

%%
% GradFiltSystem �N���X����̃e�X�g���ʂ�悤�� Kernel �v���p�e�B��
% �ҏW����B
%
%   properties
%       Kernel = [  1  1  1 ; % �����������v���p�e�B
%                   0  0  0 ;
%                  -1 -1 -1 ];
%   end

%%
% �Ȃ��A���\�b�h���Ńv���p�e�B�ɃA�N�Z�X�́A
%
%   function y = stepImpl(obj,u)
%      y = conv2(obj.Kernel,u); 
%   end
%
% �̂悤�ɁA�������i��̗�ł͕ϐ� obj �j����ăh�b�g(.)�ɂ��s���B

%%
% [ <part3.html �g�b�v> ]

%% �R���X�g���N�^
% �v���p�e�B Kernel �́A GradFiltSystem �N���X��
% �C���X�^���X�I�u�W�F�N�g�𐶐�����ۂɕύX���邱�Ƃ��ł���B
% �܂��A�ȉ��̃e�X�g���\�b�h�� GradFiltSystemTestCase �ɒǉ����悤�B
%
%   methods (Test)
%      ...�i�ȗ��j
%      function testSobelKernel(testCase)
%         % ���Ғl
%         kernelExpctd = [  1  2  1 ;
%                           0  0  0 ;
%                          -1 -2 -1 ];
%         % �^�[�Q�b�g�N���X�̃C���X�^���X��
%         obj = GradFiltSystem('Kernel',kernelExpctd);
%         % �v���p�e�B�[ Kernel �̎擾
%         kernelActual = get(obj,'Kernel');
%         % �v���p�e�B�[ Kernel �̌���
%         testCase.verifyEqual(kernelActual,kernelExpctd)
%      end     
%      ...�i�ȗ��j
%   end

%%
% ��̃e�X�g��ʉ߂���悤�ɃR���X�g���N�^���`���悤�B
%
% �R���X�g���N�^�́A �������w�肵�Ȃ�methods�u���b�N�i�p�u���b�N�j����
% �N���X���Ɠ������O�̃��\�b�h�Ƃ��Ē�`����B
%
%   methods
%      % �R���X�g���N�^
%      function obj = GradFiltSystem(varargin)
%         setProperties(obj,nargin,varargin{:})
%      end
%   end
%   methods (Access = protected)
%      ...
%   end

%%
% <matlab:doc('varargin') varargin> �͉ϒ��̈������͂��󂯎��B
% <matlab:doc('matlab.System.setProperties') setProperties> �́A
%
% _'�v���p�e�B��1'_, _�v���p�e�B�l1_,_'�v���p�e�B��2'_, _�v���p�e�B�l2_,...
%
% �̑g�����ł̐ݒ���\�Ƃ���B

%%
% [ <part3.html �g�b�v> ]

%% ���K�ۑ�
%
% *�ۑ�3-1. HSV2RGB�N���X*
% 
% ���̃e�X�g�N���X
%
%   classdef Hsv2RgbSystemTestCase < matlab.unittest.TestCase
%       %HSV2RGBSYSTEMTESTCASE Hsv2RgbSystem �̃e�X�g�P�[�X
%       properties
%       end
%       methods (Test)
%           function testSize(testCase)
%               % ����
%               h = zeros(1,2);
%               s = zeros(1,2);
%               v = zeros(1,2);
%               % ���Ғl
%               szRExpctd = [ 1 2 ];
%               szGExpctd = [ 1 2 ];
%               szBExpctd = [ 1 2 ];
%               % �^�[�Q�b�g�̃C���X�^���X��
%               obj = Hsv2RgbSystem();
%               % ���s����
%               [r,g,b] = step(obj,h,s,v);
%               % �T�C�Y�̌���
%               testCase.verifySize(r,szRExpctd);
%               testCase.verifySize(g,szGExpctd);
%               testCase.verifySize(b,szBExpctd);
%           end
%           function testValues(testCase)
%               % ����
%               h = rand(4,6);
%               s = rand(4,6);
%               v = rand(4,6);
%               hsv = cat(3,h,s,v); % �O�����z��
%               % ���Ғl
%               rgbExpctd = hsv2rgb(hsv); 
%               % �^�[�Q�b�g�̃C���X�^���X��
%               obj = Hsv2RgbSystem();
%               % ���s����
%               [rActual,gActual,bActual] = step(obj,h,s,v);
%               % �z��̒l�̌���
%               testCase.verifyEqual(rActual,rgbExpctd(:,:,1));
%               testCase.verifyEqual(gActual,rgbExpctd(:,:,2));
%               testCase.verifyEqual(bActual,rgbExpctd(:,:,3));
%           end
%       end
%   end
%
% �𖞑�����悤�ɁA Hsv2RgbSystem �N���X���������悤�B
%
% �Ȃ��A <matlab:doc('cat') cat> �֐��͎w�肵�������̕����ɔz��̌�����
% �s���B

result = run(Hsv2RgbSystemTestCase);

%%
% Hsv2RgbSystem �𐳂��������ł���΁A�e�X�g�͐�������B

%%
% *�ۑ�3-2. ���z�t�B���^�N���X*
%
% ���̃e�X�g�N���X
%
%   classdef GradFiltSystemTestCase < matlab.unittest.TestCase
%       %GRADFILTSYSTEMTESTCASE GradFiltSystem �̃e�X�g�P�[�X
%       properties
%       end
%       methods (Test)
%           function testDefaultKernel(testCase)
%               % ���Ғl
%               kernelExpctd = [  1  1  1 ;
%                                 0  0  0 ;
%                                -1 -1 -1 ];
%               % �^�[�Q�b�g�N���X�̃C���X�^���X��
%               obj = GradFiltSystem();
%               % �v���p�e�B�[ Kernel �̎擾
%               kernelActual = get(obj,'Kernel');
%               % �v���p�e�B�[ Kernel �̌���
%               testCase.verifyEqual(kernelActual,kernelExpctd)
%           end
%           function testSobelKernel(testCase)
%               % ���Ғl
%               kernelExpctd = [  1  2  1 ;
%                                 0  0  0 ;
%                                -1 -2 -1 ];
%               % �^�[�Q�b�g�N���X�̃C���X�^���X��
%               obj = GradFiltSystem('Kernel',kernelExpctd);
%               % �v���p�e�B�[ Kernel �̎擾
%               kernelActual = get(obj,'Kernel');
%               % �v���p�e�B�[ Kernel �̌���
%               testCase.verifyEqual(kernelActual,kernelExpctd)
%           end        
%           function testStepWithPrewittKernel(testCase)
%               % ����
%               H = [  1  1  1 ;
%                      0  0  0 ;
%                     -1 -1 -1 ];
%               % ���Ғl�̏���
%               I  = imread('cameraman.tif');
%               X  = im2double(I);
%               Yv = conv2(H  ,X);        % �������z�̌v�Z
%               Yv = Yv(2:end-1,2:end-1); % �����摜�̃N���b�s���O
%               Yh = conv2(H.',X);        % �������z�̌v�Z�@
%               Yh = Yh(2:end-1,2:end-1); % �����摜�̃N���b�s���O
%               magExpctd = sqrt(Yv.^2+Yh.^2); % ���z�̑傫���̊��Ғl
%               angExpctd = atan2(Yv,Yh);     % ���z�̕Ίp�̂̊��Ғl
%               % �^�[�Q�b�g�N���X�̃C���X�^���X��
%               obj = GradFiltSystem();
%               % ��������
%               [magActual,angActual] = step(obj,X);
%               % �������ʂ̌���
%               testCase.verifyEqual(magActual,magExpctd,'AbsTol',1e-6)
%               testCase.verifyEqual(angActual,angExpctd,'AbsTol',1e-6)
%           end        
%       end
%   end
%
% �𖞑�����悤�ɁA GradFiltSystem �N���X���������悤�B

result = run(GradFiltSystemTestCase);

%%
% GradFiltSystem �𐳂��������ł���΁A�e�X�g�͐�������B

%%
% �i������j

hrs = Hsv2RgbSystem();        
gfs = GradFiltSystem();

I = imread('cameraman.tif');     % �摜����
[mag,ang] = step(gfs,I);         % ���z�t�B���^�����O
ang = (ang+pi)/(2*pi);           % �Ίp�̐��K��
mag = min(mag,1);                % �傫���̖O�a����
[R,G,B] = step(hrs,ang,mag,mag); % �^���J���[��
J = cat(3,R,G,B);                % RGB�z�񌋍�
imshow(J)                        % �摜�\��

%%
% <html>
% <hr>
% </html>
%%
% <part2.html Part2> |
% <index.html ���j���[> |
% <part3.html �g�b�v> |
% <part4.html Part4>
