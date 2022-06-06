%% *EmbVision(CQ��) �`���[�g���A���i�S�j*
% 
% *��A���͂ƋȐ����o*
%
% �V����w
% �����@����C�����@�E��
%
% Copyright (c), All rights reserved, 2014-2022, Shogo MURAMATSU and Yuki TAKAHASHI
% 

%%
% <part3.html Part3> |
% <index.html ���j���[> |
% <part5.html Part5>

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
% �܂��A�f�[�^��p�ӂ���B

load census 


%%
% <matlab:doc('load') load>�R�}���h�œǂݍ��܂ꂽ�ϐ� cdate, pop��
% �������21�����x�N�g���ł���A���̓��e�͈ȉ��̂Ƃ���B
% 
% * cdate: 1790�N����1990�N�܂ł�10�N���Ƃ̔N�x
% * pop: cdate�̔N�x�ɑΉ�����A�����J�̐l����( $10^6$ �l�P��)
% 
% <matlab:doc('plot') plot>�֐��ŁAcdate��X���Apop��Y���ɂ���X-Y�v���b�g��
% �\������B

plot(cdate,pop,'o')  
xlabel('year')
ylabel('population')

%%
% �v���b�g���ꂽ�O���t������Ɠ񎟊֐��̂悤�ȑ����������Ă���B
%
% MATLAB�͑������ߎ����s�� <matlab:doc('polyfit') polyfit>�֐���񋟂��Ă���B
%
% $x$ ������ϐ��̊ϑ��f�[�^�C $y$ ��ړI�ϐ��̊ϑ��f�[�^�Ƃ��ē���������
% �x�N�g���ŗ^����ꂽ�Ƃ���΁A
% 
%   p = polyfit(x,y,n) 
% 
% �́A���m�̊֐� $f(x)$ �� $n$ ��������
%
% $$ p(x) = p_1x^n+p_2x^{n-1}+\cdots+p_nx+p_{n+1} $$
%
% �ŋߎ�����B�������A $p_1,p_2,\cdots,p_{n+1}$ �͖��m�p�����[�^�ŁA
% �f�[�^�Ƃ̐��������ŏ�����덷�̈Ӗ��ōœK�ɂȂ�悤�ɑI�������B

%%
% polyfit�@�֐����f�[�^�ɓK�p���ċߎ������������߂Ă݂�B

n = 2;
p = polyfit(cdate,pop,n); 

%%
% �ÂÂ��āA����ꂽ�ߎ��������� <matlab:doc('polyval') polyval> �֐��ɂ��
% �]������B <matlab:doc('linspace') linspace> �֐��ŁA�N�x cdate �̍ŏ��l��
% �ő�l�̊Ԃ�100�_���Ԋu�ɃT���v������B

x = linspace(min(cdate),max(cdate),100);
y = polyval(p, x);  
hold on  
plot(x,y) 

%%
% [ <part4.html �g�b�v> ]

%% XXX
%
% MATLAB�ɂ�����...
% ...

...

%%
% [ <part4.html �g�b�v> ]


%% ���K�ۑ�
%
% *�ۑ�4-1. XXX*
% 
% ...
% 

%%
% *�ۑ�4-2. XXX*
%
% ...
%
% (������j

%%
% <html>
% <hr>
% </html>
%%
% <part3.html Part3> |
% <index.html ���j���[> |
% <part4.html �g�b�v> |
% <part5.html Part5>
