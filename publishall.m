% PUBLISHALL
type = 'html';

%% Index
publish('index',type);

%% Part 1
close all

% 課題 1-1
RGB = imread('peppers.png');
I = im2double(rgb2gray(RGB));
J = sqrt(I);
imwrite(J,'html/brightpeppers.png')
fplot(@sqrt,[0 1])
xlabel('x')
ylabel('y')
axis square
print -dpng -r72 'html/fplotsqrt.png'

% 課題 1-2
HSV = rgb2hsv(RGB);
HSV(:,:,2) = 2*HSV(:,:,2);
J = hsv2rgb(HSV);
imwrite(J,'html/highsatpeppers.png')

% Publish
publish('part1',type);

%% Part 2
close all

% 課題 2-1
X = imread('cameraman.tif');
X = im2double(X);

Hh = [ 1 0 -1; 1 0 -1; 1 0 -1 ];
Yh = conv2(Hh,X);
Yh = Yh(2:end-1,2:end-1);
imwrite(Yh+0.5,'html/cameramangradx.png')

freqz2(Hh)
print -dpng -r72 'html/freqz2gradx.png'

% 課題 2-2
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

% 課題 4-1
vrObj = VideoReader('shuttle.avi');
frameRate = get(vrObj,'FrameRate');
vwObj = VideoWriter('shuttlesobel.avi');
set(vwObj,'FrameRate',frameRate);
rgsObj = Rgb2GraySystem();
hrsObj = Hsv2RgbSystem();
gfsObj = GradFiltSystem('Kernel',[1 2 1; 0 0 0 ; -1 -2 -1]);
open(vwObj)
while (hasFrame(vrObj))
    frame     = readFrame(vrObj);         % フレーム入力
    graysc    = step(rgsObj,frame);       % グレースケール化
    [mag,ang] = step(gfsObj,graysc);      % 勾配フィルタリング
    ang       = (ang+pi)/(2*pi);          % 偏角の正規化
    mag       = min(mag,1);               % 大きさの飽和処理
    [r,g,b]   = step(hrsObj,ang,mag,mag); % 疑似カラー化
    frame     = cat(3,r,g,b);             % RGB配列結合
    writeVideo(vwObj,frame);              % フレーム出力 
end
close(vwObj)

% 課題4-2
% vrObj = VideoReader('shuttle.avi');
% frameRate = get(vrObj,'FrameRate');
% vwObj = VideoWriter('shuttlediff.avi');
% set(vwObj,'FrameRate',frameRate);
% fdfObj = FrameDiffSystem();
% open(vwObj)
% while (hasFrame(vrObj))
%     frame = readFrame(vrObj);   % フレーム入力
%     frame = im2double(frame);   % 実数型への変換
%     frame = step(fdfObj,frame); % フレーム差分処理
%     frame = frame/2+0.5;        % 表示のための調整
%     writeVideo(vwObj,frame);    % フレーム出力 
% end
% close(vwObj)

%
publish('part4',type);
rmpath('work/part4')

%% Part 5
close all

addpath('work/part5')

%
copyfile('work/part5/videoio_slx_00.png','html/videoio_slx_00.png');
copyfile('work/part5/videoio_slx_01.png','html/videoio_slx_01.png');
copyfile('work/part5/videoio_slx_02.png','html/videoio_slx_02.png');
copyfile('work/part5/videoio_slx_03.png','html/videoio_slx_03.png');
copyfile('work/part5/videoio_slx_04.png','html/videoio_slx_04.png');
copyfile('work/part5/videorgb2gray_slx_00.png','html/videorgb2gray_slx_00.png');
copyfile('work/part5/videorgb2gray_slx_01.png','html/videorgb2gray_slx_01.png');
copyfile('work/part5/videorgb2gray_slx_02.png','html/videorgb2gray_slx_02.png');
copyfile('work/part5/videorgb2gray_slx_03.png','html/videorgb2gray_slx_03.png');
copyfile('work/part5/videogradfilt_slx_00.png','html/videogradfilt_slx_00.png');
copyfile('work/part5/file_button.png','html/file_button.png');
copyfile('work/part5/library_button.png','html/library_button.png');
copyfile('work/part5/play_button.png','html/play_button.png');
copyfile('work/part5/library_browser.png','html/library_browser.png');
copyfile('work/part5/cvs_library.png','html/cvs_library.png');
copyfile('work/part5/cvs_sources.png','html/cvs_sources.png');
copyfile('work/part5/cvs_sources_blocks.png','html/cvs_sources_blocks.png');
copyfile('work/part5/cvs_sinks.png','html/cvs_sinks.png');
copyfile('work/part5/cvs_sinks_blocks.png','html/cvs_sinks_blocks.png');
copyfile('work/part5/frommultimediafile_blockparameter.png','html/frommultimediafile_blockparameter.png');
copyfile('work/part5/tomultimediafile_blockparameter.png','html/tomultimediafile_blockparameter.png');
copyfile('work/part5/matlabsystem_blockparameter.png','html/matlabsystem_blockparameter.png');
copyfile('work/part5/imaq_blocks.png','html/imaq_blocks.png');
copyfile('work/part5/udf_blocks.png','html/udf_blocks.png');
copyfile('work/part5/vipmengradfilt_avi.png','html/vipmengradfilt_avi.png');
copyfile('work/part5/vipmengradfilt_sobel_avi.png','html/vipmengradfilt_sobel_avi.png');

%
publish('part5',type);
rmpath('work/part5')

%% Part 6
close all

publish('part6',type);

%% ZIP
close all

zip('embvision','html')
movefile('embvision.zip','html')

%% Open index.html
showdemo('index')