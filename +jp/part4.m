%% *EmbVision �`���[�g���A���i�S�j*
%
% *�f���X�g���[������ - MATLAB�� -*
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
% �{���K�ł́AMATLAB�ɂĉf���t�@�C���̏���ǂݍ��ޕ��@�̂ق��A
% �f���\���A�f���t�@�C���o�́A�ȒP�ȉf���X�g���[�������ɂ��Ċw�ԁB
%
% �����Ƃ��āA�J���Ă���S�Ă� Figure �� <matlab:doc('close') close> �֐���
% ���Ă����B

close all

%% �f������
% 
% MATLAB�ɂ�����f�����͂́A
% <matlab:doc('VideoReader') VideoReader> �N���X��
% <matlab:doc('VideoReader.readFrame') readFrame> ���\�b�h��
% ���p���邱�ƂŎ����ł���B
 
vrObj = VideoReader('shuttle.avi');
frame = readFrame(vrObj);

%%
% �ϐ� frame �͉f���f�[�^�̍ŏ��̃t���[����ێ�����B
% 
% shuttle.avi ��RGB�J���[�f���Ȃ̂ŁA�ϐ� frame �͎O�����z��ƂȂ�B
%
% ���Ɏw������Ȃ���΁A�f�[�^�^�͕����Ȃ������W�r�b�g�^ uint8�ƂȂ�B

whos vrObj frame

%%
% frame ��\�����Ă݂悤�B
%
% ��قǗ��p���邽�߁Aimshow �̃n���h���I�u�W�F�N�g���p�ӂ��Ă����B

figure(1)
hi1 = imshow(frame);

%%
% �Ȃ��A�ϐ� vrObj �́AVideoReader �̃C���X�^���X�I�u�W�F�N�g�ƂȂ��Ă���A
% �f���Ɋւ�������v���p�e�B�Ƃ��ĕێ����Ă���B
%
% ��ȃv���p�e�B���ȉ��ɂ܂Ƃ߂�B
%
% * BitsPerPixel: ���f������̃r�b�g�� [bpp]
% * FrameRate: �t���[�����[�g [bps]
% * Height: ��ʂ̍��� [pixels]
% * Width: ��ʂ̕� [pixels]

properties(vrObj)

%%
% ���������āA��ʂ̍����╝�A�t���[�����[�g�Ȃǂ̏���
% �ȉ��̂悤�ɂ��Ď擾�ł���B

height    = get(vrObj,'Height');
width     = get(vrObj,'Width');
frameRate = get(vrObj,'FrameRate');

%%
% ����ɁA readFrame ���\�b�h���Ăяo���Ǝ��̃t���[����ǂݍ��ށB
%
% �Ȃ��Aimshow �̃n���h���I�u�W�F�N�g hi1 �� CData �v���p�e�B�� frame ��
% �f�[�^���㏑�����邱�Ƃŕ\�����X�V���Ă���B

frame = readFrame(vrObj);
set(hi1,'CData',frame);

%%
% [ <part4.html �g�b�v> ]

%% �f���\��
% �f�����̓I�u�W�F�N�g vrObj �̎����� 0 �ɖ߂��āA�S�Ẵt���[����\�����悤�B
%
% �Ȃ��A <matlab:doc('while') while> ���[�v���őS�Ẵt���[����
% �\�������悤 <matlab:doc('drawnow') drawnow> �֐���
% �e�t���[���̕`�����������B
%
% �܂��A <matlab:doc('VideoReader.hasFrame') hasFrame> ���\�b�h��
% �ŏI�t���[�����ۂ��̏����擾���Ă���B

set(vrObj,'CurrentTime',0);
while (hasFrame(vrObj))
    frame = readFrame(vrObj);
    set(hi1,'CData',frame);
end

%%
% ���ɁA <matlab:doc('movie') movie> �֐��ł̉f���\�����\�ł���B
% �����ł͐�������������B

%%
% [ <part4.html �g�b�v> ]

%% �f���o��
% MATLAB�ɂ�����f���o�͂� <matlab:doc('VideoWriter') VideoWriter> �N���X��
% <matlab:doc('VideoWriter.writeVideo') writeVideo> ���\�b�h�𗘗p���邱�Ƃ�
% �����ł���B
%
% �f�����̓I�u�W�F�N�g vrObj �̎����� 0�@�ɖ߂��āA�f���̃R�s�[��
% AVI�t�@�C�� shuttleclone.avi �ɏo�͂��Ă݂悤�B

set(vrObj,'CurrentTime',0);
vwObj = VideoWriter('shuttleclone.avi');
properties(vwObj)

%%

set(vwObj,'FrameRate',frameRate);
open(vwObj)
while (hasFrame(vrObj))
    frame = readFrame(vrObj);
    writeVideo(vwObj,frame);
end
close(vwObj)

%%
% AVI�t�@�C�� shuttleclone.avi ���o�͂����B
%
% �ۑ����ꂽAVI�t�@�C����MATLAB�̊O���̃c�[���ōĐ����邱�Ƃ��ł���B
%
% <<shuttleclone.png>>
% 

%%
% [ <part4.html �g�b�v> ]

%% �f������
% �f���t���[���̓��͂Əo�͂̊ԂɊe�t���[���ɑ΂��鏈����}�����邱�ƂŁA
% �f���X�g���[�������������ł���B
%
% �ȉ��ł́A���K�i�R�j�ō쐬����
%
% * Rgb2GraySystem
% * Hsv2RgbSystem
% * GradFiltSystem
%
% �𗘗p���āA�t���[�����̌��z�t�B���^�o�͂��f�������悤�B
% 
% �܂��A�t���[�������I�u�W�F�N�g�𐶐�����B

rgsObj = Rgb2GraySystem();
hrsObj = Hsv2RgbSystem();
gfsObj = GradFiltSystem();

%%
% ���ɁA�f�����̓I�u�W�F�N�g vrObj �̎����� 0�@�ɖ߂��A
% �o�͉f����ۑ�����AVI�t�@�C�� shuttlegrad.avi �̏���������B

set(vrObj,'CurrentTime',0);
vwObj = VideoWriter('shuttlegrad.avi');
set(vwObj,'FrameRate',frameRate);
open(vwObj)

%%
% �f���������J�n����B

while (hasFrame(vrObj))
    frame     = readFrame(vrObj);         % �t���[������
    graysc    = step(rgsObj,frame);       % �O���[�X�P�[����
    [mag,ang] = step(gfsObj,graysc);      % ���z�t�B���^�����O
    ang       = (ang+pi)/(2*pi);          % �Ίp�̐��K��
    mag       = min(mag,1);               % �傫���̖O�a����
    [r,g,b]   = step(hrsObj,ang,mag,mag); % �^���J���[��
    frame     = cat(3,r,g,b);             % RGB�z�񌋍�
    writeVideo(vwObj,frame);              % �t���[���o�� 
end
close(vwObj)

%%
% �������I������ƁAAVI�t�@�C�� shuttlegrad.avi �ɏ������ʂ��ۑ������B
%
% <<shuttlegrad.png>>
% 

%%
% [ <part4.html �g�b�v> ]

%% �t���[���ԏ����i�I�v�V�����j
% �ߋ��̃t���[�����L������ System object �N���X���`���邱�Ƃ��ł���B
%
% �A������2���̃t���[���̕��ς��o�͂��� FrameAveSystem �N���X���쐬���邽�߁A
% �ȉ��̃e�X�g�P�[�X FrameAveSystemTestCase ��p�ӂ���B
%
%   classdef FrameAveSystemTestCase < matlab.unittest.TestCase
%       %FRAMEAVESYSTEMTESTCASE FrameAveSystem �̃e�X�g�P�[�X
%       properties
%       end
%       methods (Test)
%           function testFirstFrame(testCase)
%               % ����
%               width  = 12;
%               height = 16;
%               % ���̓t���[��
%               frame1 = rand(height,width,3);
%               % ���Ғl
%               cnt0Expctd = [];
%               cnt1Expctd = 1;
%               res1Expctd = frame1;
%               % �^�[�Q�b�g�N���X�̃C���X�^���X��
%               obj = FrameAveSystem();
%               % ������Ԃ̌���
%               state      = getDiscreteState(obj);
%               cnt0Actual = state.Count;
%               testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
%               % ��������
%               res1Actual = step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               % �������ʂ̌���
%               testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)            
%           end
%           function testThreeFrames(testCase)
%               % ����
%               width  = 12;
%               height = 16;
%               % ���̓t���[��
%               frame1 = rand(height,width,3);
%               frame2 = rand(height,width,3);
%               frame3 = rand(height,width,3);            
%               % ���Ғl
%               cnt1Expctd = 1;
%               cnt2Expctd = 2;            
%               cnt3Expctd = 3;                        
%               res1Expctd = frame1;
%               res2Expctd = (frame1+frame2)/2;
%               res3Expctd = (frame2+frame3)/2;
%               % �^�[�Q�b�g�N���X�̃C���X�^���X��
%               obj = FrameAveSystem();
%               % ��P�t���[����������
%               res1Actual = step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               % ��Q�t���[����������
%               res2Actual = step(obj,frame2);
%               state      = getDiscreteState(obj);
%               cnt2Actual = state.Count;            
%               % ��R�t���[����������
%               res3Actual = step(obj,frame3);
%               state      = getDiscreteState(obj);
%               cnt3Actual = state.Count;            
%               % �������ʂ̌���
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
%               testCase.verifyEqual(cnt2Actual,cnt2Expctd)                                    
%               testCase.verifyEqual(cnt3Actual,cnt3Expctd)                                                
%               testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
%               testCase.verifyEqual(res2Actual,res2Expctd,'RelTol',1e-6)            
%               testCase.verifyEqual(res3Actual,res3Expctd,'RelTol',1e-6)                        
%           end        
%           function testReset(testCase)
%               % ����
%               width  = 12;
%               height = 16;
%               % ���̓t���[��
%               frame1 = rand(height,width,3);
%               % ���Ғl
%               cnt0Expctd = [];
%               cnt1Expctd = 1;
%               cntrExpctd = 0;
%               % �^�[�Q�b�g�N���X�̃C���X�^���X��
%               obj = FrameAveSystem();
%               % ������Ԃ̌���
%               state      = getDiscreteState(obj);
%               cnt0Actual = state.Count;
%               testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
%               % ���t���[��������̏�Ԃ̌���
%               step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
%               % ���Z�b�g��̏�Ԃ̌���
%               reset(obj);
%               state      = getDiscreteState(obj);
%               cntrActual = state.Count;
%               testCase.verifyEqual(cntrActual,cntrExpctd)                        
%           end        
%       end
%   end

%%
% �e�X�g�P�[�X FrameAveSystemTestCase �̌��؂𖞂����悤�Ɏ�������
% FrameAveSystem �N���X�̗���ȉ��Ɏ����B
%
%   classdef FrameAveSystem < matlab.System
%       properties
%           preFrame % �O�t���[��
%       end
%       properties (DiscreteState)
%           Count    % �t���[���J�E���g
%       end
%       properties (Access = private)
%       end
%       methods (Access = protected)
%           % �Z�b�g�A�b�v�i�ŏ��̃X�e�b�v���O�Ɏ��s�j
%           function setupImpl(obj,srcFrame)
%               % �O�t���[���̏�����
%               obj.preFrame = srcFrame;
%               % �t���[���J�E���g�̏�����
%               obj.Count = 0;
%           end
%           % �X�e�b�v
%           function resFrame = stepImpl(obj,srcFrame)
%               % �t���[�����Ϗ��� 
%               resFrame = (obj.preFrame + srcFrame)/2;
%               % �O�t���[���̍X�V�����t���[��
%               obj.preFrame = srcFrame;
%               % �t���[���J�E���g�̃C���N�������g
%               obj.Count = obj.Count+1;
%           end
%           % ���Z�b�g
%           function resetImpl(obj)
%               % �t���[���J�E���g�̃��Z�b�g
%               obj.Count = 0;
%           end
%       end
%   end

%%

result = run(FrameAveSystemTestCase);

%%
% FrameAveSystem �̎��s����ȉ��Ɏ����B
%
fasObj = FrameAveSystem();

set(vrObj,'CurrentTime',0);
vwObj = VideoWriter('shuttleave.avi');
set(vwObj,'FrameRate',frameRate);
open(vwObj)
while (hasFrame(vrObj))
    frame = readFrame(vrObj);   % �t���[������
    frame = im2double(frame);   % �����^�֕ϊ�
    frame = step(fasObj,frame); % �t���[�����Ϗ���
    writeVideo(vwObj,frame);    % �t���[���o�� 
end
close(vwObj)

%%
% �������I������ƁAAVI�t�@�C�� shuttleave.avi �ɏ������ʂ��ۑ������B
%
% <<shuttleave.png>>

%%
% [ <part4.html �g�b�v> ]

%% ���K�ۑ�
% *���K�ۑ�4-1. Sobel�����t�B���^*
%
% ���������t�B���^�W���Ƃ��Ĕz��
%
% $$ \left(\begin{array}{ccc}
%    1 &  2 &  1 \\
%    0 &  0 &  0 \\
%   -1 & -2 & -1 \\
%    \end{array}\right) $$
%
% ���A���������t�B���^�W���Ƃ��Ĕz��
%
% $$ \left(\begin{array}{ccc}
%    1 &  0 & -1 \\
%    2 &  0 & -2 \\
%    1 &  0 & -1 \\
%    \end{array}\right) $$
% 
% �𗘗p�������z�t�B���^�I�u�W�F�N�g
%
%    gfs = GradFiltSystem('Kernel',[ 1 2 1 ; 0 0 0 ; -1 -2 -1 ]); 
%
% �𐶐����A�f���f�[�^ shuttle.avi �ɑ΂���ȉ��̏������e�t���[���ɑ΂���
% �{���Ă݂悤�B
% �܂��A���̏������ʂ�AVI�t�@�C�� shuttlesobel.avi �ɕۑ����悤�B
%
%    graysc    = step(rgsObj,frame);       % �O���[�X�P�[����
%    [mag,ang] = step(gfsObj,graysc);      % ���z�t�B���^�����O
%    ang       = (ang+pi)/(2*pi);          % �Ίp�̐��K��
%    mag       = min(mag,1);               % �傫���̖O�a����
%    [r,g,b]   = step(hrsObj,ang,mag,mag); % �^���J���[��
%    frame     = cat(3,r,g,b);             % RGB�z�񌋍�
%
% (������j
%
% <<shuttlesobel.png>>

%%
% *���K�ۑ�4-2. �t���[������*�i�I�v�V�����j
%
% �ȉ��̃e�X�g�P�[�X FrameDiffSystemTestCase �̌��؂𖞂����悤��
% �A������2���̃t���[���̍������o�͂��� FrameDiffSystem �N���X���쐬���悤�B
%
%   classdef FrameDiffSystemTestCase < matlab.unittest.TestCase
%       %FRAMEDIFFSYSTEMTESTCASE FrameDiffSystem �̃e�X�g�P�[�X
%       properties
%       end
%       methods (Test)
%           function testFirstFrame(testCase)
%               % ����
%               width  = 12;
%               height = 16;
%               % ���̓t���[��
%               frame1 = rand(height,width);
%               % ���Ғl
%               cnt0Expctd = [];
%               cnt1Expctd = 1;
%               res1Expctd = zeros(height,width);
%               % �^�[�Q�b�g�N���X�̃C���X�^���X��
%               obj = FrameDiffSystem();
%               % ������Ԃ̌���
%               state      = getDiscreteState(obj);
%               cnt0Actual = state.Count;
%               testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
%               % ��������
%               res1Actual = step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               % �������ʂ̌���
%               testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)            
%           end
%           function testThreeFrames(testCase)
%               % ����
%               width  = 12;
%               height = 16;
%               % ���̓t���[��
%               frame1 = rand(height,width);
%               frame2 = rand(height,width);
%               frame3 = rand(height,width);            
%               % ���Ғl
%               cnt1Expctd = 1;
%               cnt2Expctd = 2;            
%               cnt3Expctd = 3;                        
%               res1Expctd = zeros(height,width);
%               res2Expctd = (frame2-frame1);
%               res3Expctd = (frame3-frame2);
%               % �^�[�Q�b�g�N���X�̃C���X�^���X��
%               obj = FrameDiffSystem();
%               % ��P�t���[����������
%               res1Actual = step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               % ��Q�t���[����������
%               res2Actual = step(obj,frame2);
%               state      = getDiscreteState(obj);
%               cnt2Actual = state.Count;            
%               % ��R�t���[����������
%               res3Actual = step(obj,frame3);
%               state      = getDiscreteState(obj);
%               cnt3Actual = state.Count;            
%               % �������ʂ̌���
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
%               testCase.verifyEqual(cnt2Actual,cnt2Expctd)                                    
%               testCase.verifyEqual(cnt3Actual,cnt3Expctd)                                                
%               testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
%               testCase.verifyEqual(res2Actual,res2Expctd,'RelTol',1e-6)            
%               testCase.verifyEqual(res3Actual,res3Expctd,'RelTol',1e-6)                        
%           end        
%           function testReset(testCase)
%               % ����
%               width  = 12;
%               height = 16;
%               % ���̓t���[��
%               frame1 = rand(height,width);
%               % ���Ғl
%               cnt0Expctd = [];
%               cnt1Expctd = 1;
%               cntrExpctd = 0;
%               % �^�[�Q�b�g�N���X�̃C���X�^���X��
%               obj = FrameDiffSystem();
%               % ������Ԃ̌���
%               state      = getDiscreteState(obj);
%               cnt0Actual = state.Count;
%               testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
%               % ���t���[��������̏�Ԃ̌���
%               step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
%               % ���Z�b�g��̏�Ԃ̌���
%               reset(obj);
%               state      = getDiscreteState(obj);
%               cntrActual = state.Count;
%               testCase.verifyEqual(cntrActual,cntrExpctd)                        
%           end        
%       end
%   end

%%
% �i������j

result = run(FrameDiffSystemTestCase);

%%
%
vrObj = VideoReader('shuttle.avi');
frameRate = get(vrObj,'FrameRate');
vwObj = VideoWriter('shuttlediff.avi');
set(vwObj,'FrameRate',frameRate);
fdfObj = FrameDiffSystem();
open(vwObj)
while (hasFrame(vrObj))
    frame = readFrame(vrObj);   % �t���[������
    frame = im2double(frame);   % �����^�ւ̕ϊ�
    frame = step(fdfObj,frame); % �t���[����������
    frame = frame/2+0.5;
    writeVideo(vwObj,frame);    % �t���[���o��
end
close(vwObj)

%%
% <<shuttlediff.png>>
%
%%
% <html>
% <hr>
% </html>
%%
% <part3.html Part3> |
% <index.html ���j���[> |
% <part4.html �g�b�v> |
% <part5.html Part5>
