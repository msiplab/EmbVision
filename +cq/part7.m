%% *EmbVision(CQ��) �`���[�g���A���i�V�j*
% 
% *��A���͂ƋȐ����o - MATLAB�� -*
%
% �V����w
% �����@����C�����@�E��
%
% Copyright (c), All rights reserved, 2014-2022, Shogo MURAMATSU and Yuki TAKAHASHI
% 

%%
% <part6.html Part6> |
% <index.html ���j���[> |
% <part8.html Part8>

%%
% *�T�v*
%
% �{���K�ł́ASystem object �̉��p��Ƃ��āA
% ��������A�𗘗p�����摜����̋Ȑ����o����������B
%
% �����Ƃ��āA�J���Ă���S�Ă� Figure �� <matlab:doc('close') close> �֐���
% ���Ă����B

close all

%% ��A����
% 
% ��A���͂ł́A����ϐ� $y$ �Ƃ���ϐ� $x$ �̊Ԃ�
%
% $$ y = f(x) $$
%
% �̂悤�Ɋ֌W�Â��関�m�̊֐� $f(\cdot)$ �����肷��B
% ��A���͂́A���̂悤�Ȗ��m�̊֐� $f(\cdot)$ ���ϑ��\�ȃf�[�^���琄�_����
% ���v�I��@�ł���B
% 
% �ϐ� $x$ ������ϐ��Ƃ�сA�ϐ� $y$ ��ړI�ϐ��Ƃ�ԁB
% �܂��A���̖��m�֐��̐��_���t�B�b�e�B���O�Ƃ�ԁB
% 
% �ȉ��ł́A��A���͂̈��Ƃ��ăf�[�^�̑������ߎ������݂�B
% �܂��A��������A���������߂̃f�[�^��p�ӂ��悤�B

load census 


%%
% <matlab:doc('load') load>�R�}���h�œǂݍ��܂ꂽ�ϐ� cdate, pop��
% �������21�����x�N�g���ł���A���̓��e�͈ȉ��̂Ƃ���B
% 
% * cdate: 1790�N����1990�N�܂ł�10�N���Ƃ̔N�x
% * pop: cdate�̔N�x�ɑΉ�����A�����J�̐l����( $10^6$ �l�P��)
% 
% <matlab:doc('plot') plot>�֐��ŁAcdate��X���Apop��Y���ɂ���X-Y�v���b�g��
% �\�����悤�B

plot(cdate,pop,'o')  
xlabel('year')
ylabel('population')

%%
% �v���b�g���ꂽ�O���t������Ɠ񎟊֐��̂悤�ȑ����������Ă���B
%
% MATLAB�͑������ߎ����s�� <matlab:doc('polyfit') polyfit>�֐���񋟂��Ă���B
% $x$ ������ϐ��̊ϑ��f�[�^�C $y$ ��ړI�ϐ��̊ϑ��f�[�^�Ƃ��ē���������
% �x�N�g���ŗ^����ꂽ�Ƃ���΁A�R�}���h
% 
% >> p = polyfit(x,y,n) 
% 
% �́A���m�̊֐� $f(x)$ �� $n$ ��������
%
% $$ p(x) = p_1x^n+p_2x^{n-1}+\cdots+p_nx+p_{n+1} $$
%
% �ŋߎ�����B�������A $p_1,p_2,\cdots,p_{n+1}$ �͖��m�p�����[�^�ŁA
% �f�[�^�Ƃ̐��������ŏ�����덷�̈Ӗ��ōœK�ɂȂ�悤�ɑI�������B

%%
% polyfit�@�֐����f�[�^�ɓK�p���ċߎ������������߂Ă݂悤�B

n = 2;
p = polyfit(cdate,pop,n); 

%%
% �ÂÂ��āA����ꂽ�ߎ��������� <matlab:doc('polyval') polyval> �֐��ɂ��
% �]�����悤�B <matlab:doc('linspace') linspace> �֐��ŁA�N�x cdate �̍ŏ��l��
% �ő�l�̊Ԃ�100�_���Ԋu�ɃT���v������B

x = linspace(min(cdate),max(cdate),100);
y = polyval(p, x);  
hold on  
plot(x,y) 

%%
% [ <part7.html �g�b�v> ]

%% �Ȑ����o
%
% System object �̉��p��Ƃ��āA�Ȑ����܂ޓ�l�摜���瑽�����ߎ��ɂ��
% �Ȑ����ߎ����郂�W���[�����쐬����B
%
% �ȉ��̃e�X�g�N���X���`����B

%%
%   classdef PolyfitSystemTestCase < matlab.unittest.TestCase
%       methods(Test)
%           % Test methods
%           function testDefaultDegree(testCase)
%               % ���Ғl�@
%               degExpctd = 3;
%               % �^�[�Q�b�g�N���X�̃C���X�^���X��
%               obj = PolyfitSystem();
%               % �v���p�e�B Degree �̎擾
%               degActual = obj.Degree;
%               % �v���p�e�B Degree �̌���
%               testCase.verifyEqual(degActual,degExpctd)
%           end
%           function testCoefs(testCase)
%               % ����
%               xmax = 4;
%               x = 1:xmax; % �����ϐ�
%               y = x.^2;   % �ړI�ϐ�
%               BW = zeros(xmax^2,xmax); % ���W���l�摜�ɕϊ� 
%               for idx = 1:length(x)
%                   BW(y(idx),x(idx)) = 1;
%               end
%               deg = 3;  % ����
%               % ���Ғl�̐ݒ�
%               coefsExpctd = polyfit(x,y,deg);
%               % �^�[�Q�b�g�̃C���X�^���X��
%               obj = PolyfitSystem();
%               % ���s���ʁi�����l�̎擾�j
%               coefsActual = obj.step(BW);
%               % �z��̒l�̌���
%               testCase.verifyEqual(coefsActual,coefsExpctd,'AbsTol',1e-9);
%           end
%           function testSetDegree(testCase)
%               % ���Ғl
%               degExpctd = 2;
%               % �^�[�Q�b�g�N���X�̃C���X�^���X��
%               obj = PolyfitSystem('Degree',degExpctd);
%               % �v���p�e�B�[ Degree �̎擾
%               degActual = obj.Degree;
%               % �v���p�e�B�[ Degree �̌���
%               testCase.verifyEqual(degActual,degExpctd)
%           end
%       end
%   end

%%
% ��L�̃e�X�g�N���X�𖞑�����^�[�Q�b�g�N���X�Ƃ��Ĉȉ���System object���`���悤�B
%
%   classdef PolyfitSystem < matlab.System
%       % POLYFITSYSTEM
%       properties(Nontunable)
%           Degree = 3;
%       end
%       methods
%          % �R���X�g���N�^
%          function obj = PolyfitSystem(varargin)
%             setProperties(obj,nargin,varargin{:})
%          end
%       end
%       methods(Access = protected)
%           function p = stepImpl(obj,BW)
%               % Implement algorithm. Calculate y as a function of input u and
%               % discrete states.
%               [y,x] = find(BW); % �摜�����W�ɕϊ�
%               p = polyfit(x,y,obj.Degree); % �������ߎ�
%           end
%       end
%   end

%%
%

% sz = [288 352];
% BW = zeros(sz);
% ndata = 21;
% x = randi(sz(2),ndata,1);
% deg = 3;
% c = 1e-6*randn(deg,1);
% y = round(x.^(deg:-1:1)*c+sz(1)/2);
% for idx = 1:ndata
%     BW(y(idx),x(idx)) = 1;
% end
% p = polyfit(x,y,deg);
% obj = PolyfitSystem('Degree',deg);
% obj.step(BW)

%%
% [ <part7.html �g�b�v> ]

%% �Ȑ��`��
%

%%
% [ <part7.html �g�b�v> ]

%% ���K�ۑ�
%
% *�ۑ�7-1. XXX*
% 
% ...
% 

%%
% *�ۑ�7-2. XXX*
%
% ...
%
% (������j

%%
% <html>
% <hr>
% </html>
%%
% <part6.html Part6> |
% <index.html ���j���[> |
% <part7.html �g�b�v> |
% <part8.html Part8>
