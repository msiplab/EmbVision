% PUBLISHALL
type = 'html';

%% Index
publish('index',type);

%% Part 1
close all

% �ۑ� 1-1
RGB = imread('peppers.png');
I = im2double(rgb2gray(RGB));
J = sqrt(I);
imwrite(J,'html/brightpeppers.png')
fplot(@sqrt,[0 1])
xlabel('x')
ylabel('y')
axis square
print -dpng -r72 'html/fplotsqrt.png'

% �ۑ� 1-2
HSV = rgb2hsv(RGB);
HSV(:,:,2) = 2*HSV(:,:,2);
J = hsv2rgb(HSV);
imwrite(J,'html/highsatpeppers.png')

% Publish
publish('part1',type);

%% Part 2
close all

% �ۑ� 2-1
X = imread('cameraman.tif');
X = im2double(X);

Hh = [ 1 0 -1; 1 0 -1; 1 0 -1 ];
Yh = conv2(Hh,X);
Yh = Yh(2:end-1,2:end-1);
imwrite(Yh+0.5,'html/cameramangradx.png')

freqz2(Hh)
print -dpng -r72 'html/freqz2gradx.png'

% �ۑ� 2-2
Hv = [ 1 1 1; 0 0 0; -1 -1 -1 ];
Yv = conv2(Hv,X);
Yv = Yv(2:end-1,2:end-1);

dXmag = sqrt(Yv.^2+Yh.^2);
dXang = atan2(Yv,Yh);

imwrite(dXmag,'html/cameramangradmag.png')
imwrite(dXang/(2*pi)+0.5,'html/cameramangradang.png')

% Publish
publish('part2',type);

%% Part 3
close all

addpath('work/part3')
publish('part3',type);
rmpath('work/part3')

%% Part 4
close all

addpath('work/part4')

%
copyfile('work/part4/shuttleclone.png','html/shuttleclone.png');
copyfile('work/part4/shuttlegrad.png','html/shuttlegrad.png');
copyfile('work/part4/shuttleave.png','html/shuttleave.png');
copyfile('work/part4/shuttlesobel.png','html/shuttlesobel.png');
copyfile('work/part4/shuttlediff.png','html/shuttlediff.png');

% �ۑ� 4-1
vrObj = VideoReader('shuttle.avi');
frameRate = get(vrObj,'FrameRate');
vwObj = VideoWriter('shuttlesobel.avi');
set(vwObj,'FrameRate',frameRate);
rgsObj = Rgb2GraySystem();
hrsObj = Hsv2RgbSystem();
gfsObj = GradFiltSystem('Kernel',[1 2 1; 0 0 0 ; -1 -2 -1]);
open(vwObj)
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

% �ۑ�4-2
% vrObj = VideoReader('shuttle.avi');
% frameRate = get(vrObj,'FrameRate');
% vwObj = VideoWriter('shuttlediff.avi');
% set(vwObj,'FrameRate',frameRate);
% fdfObj = FrameDiffSystem();
% open(vwObj)
% while (hasFrame(vrObj))
%     frame = readFrame(vrObj);   % �t���[������
%     frame = im2double(frame);   % �����^�ւ̕ϊ�
%     frame = step(fdfObj,frame); % �t���[����������
%     frame = frame/2+0.5;        % �\���̂��߂̒���
%     writeVideo(vwObj,frame);    % �t���[���o�� 
% end
% close(vwObj)

%
publish('part4',type);
rmpath('work/part4')

%% Part 5
close all

publish('part5',type);

%% Part 6
close all

publish('part6',type);

%% ZIP
close all

zip('embvision','html')
movefile('embvision.zip','html')

%% Open index.html
showdemo('index')