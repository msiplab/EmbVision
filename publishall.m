function publishall(lang)
% PUBLISHALL Publish HTML Documents of EmbVision Tutorial
%
% publishall(lang) executes publish HTML documents of 
% EmbVision Tutorial. Variable lang switches the language
% between 'jp' or 'en'.
%
if nargin < 1
    lang = 'en';
end
type = 'html';
targetdir = [ '+' lang '/' type '/' ];

%% Index
publish([lang '.index'],type);

%% Part 1
close all

% Exercise 1-1
RGB = imread('peppers.png');
I = im2double(rgb2gray(RGB));
J = sqrt(I);
imwrite(J,[targetdir 'brightpeppers.png'])
fplot(@sqrt,[0 1])
xlabel('x')
ylabel('y')
axis square
print('-dpng','-r72',[targetdir 'fplotsqrt.png'])

% Exercise 1-2
HSV = rgb2hsv(RGB);
HSV(:,:,2) = 2*HSV(:,:,2);
J = hsv2rgb(HSV);
imwrite(J,[targetdir 'highsatpeppers.png'])

% Publish
publish([lang '.part1'],type);

%% Part 2
close all

% Exercise 2-1
X = imread('cameraman.tif');
X = im2double(X);

Hh = [ 1 0 -1; 1 0 -1; 1 0 -1 ];
Yh = conv2(Hh,X);
Yh = Yh(2:end-1,2:end-1);
imwrite(Yh+0.5,[targetdir 'cameramangradx.png'])

freqz2(Hh)
print('-dpng','-r72',[targetdir 'freqz2gradx.png'])

% Exercise 2-2
Hv = [ 1 1 1; 0 0 0; -1 -1 -1 ];
Yv = conv2(Hv,X);
Yv = Yv(2:end-1,2:end-1);

dXmag = sqrt(Yv.^2+Yh.^2);
dXang = atan2(Yv,Yh);

imwrite(dXmag,[targetdir 'cameramangradmag.png'])
imwrite(dXang/(2*pi)+0.5,[targetdir 'cameramangradang.png'])

% Publish
publish([lang '.part2'],type);

%% Part 3
close all

addpath('work/part3')
publish([lang '.part3'],type);
rmpath('work/part3')

%% Part 4
close all

addpath('work/part4')

%
copyfile('work/part4/shuttleclone.png',[targetdir 'shuttleclone.png']);
copyfile('work/part4/shuttlegrad.png',[targetdir 'shuttlegrad.png']);
copyfile('work/part4/shuttleave.png',[targetdir 'shuttleave.png']);
copyfile('work/part4/shuttlesobel.png',[targetdir 'shuttlesobel.png']);
copyfile('work/part4/shuttlediff.png',[targetdir 'shuttlediff.png']);

% Exercise 4-1
vrObj = VideoReader('shuttle.avi');
frameRate = get(vrObj,'FrameRate');
vwObj = VideoWriter('shuttlesobel.avi');
set(vwObj,'FrameRate',frameRate);
rgsObj = Rgb2GraySystem();
hrsObj = Hsv2RgbSystem();
gfsObj = GradFiltSystem('Kernel',[1 2 1; 0 0 0 ; -1 -2 -1]);
open(vwObj)
while (hasFrame(vrObj))
    frame     = readFrame(vrObj);         % Read frame
    graysc    = step(rgsObj,frame);       % To grayscale
    [mag,ang] = step(gfsObj,graysc);      % Gradient filtering
    ang       = (ang+pi)/(2*pi);          % Normalize angle
    mag       = min(mag,1);               % Saturate magnitude
    [r,g,b]   = step(hrsObj,ang,mag,mag); % To pseudo color
    frame     = cat(3,r,g,b);             % Concatinate RGB array
    writeVideo(vwObj,frame);              % Write frame
end
close(vwObj)

% Exercise 4-2
% vrObj = VideoReader('shuttle.avi');
% frameRate = get(vrObj,'FrameRate');
% vwObj = VideoWriter('shuttlediff.avi');
% set(vwObj,'FrameRate',frameRate);
% fdfObj = FrameDiffSystem();
% open(vwObj)
% while (hasFrame(vrObj))
%     frame = readFrame(vrObj);   % Read frame
%     frame = im2double(frame);   % To float type
%     frame = step(fdfObj,frame); % Frame difference
%     frame = frame/2+0.5;        % Adjust for display
%     writeVideo(vwObj,frame);    % Write frame
% end
% close(vwObj)

%
publish([lang '.part4'],type);
rmpath('work/part4')

%% Part 5
close all

addpath('work/part5')

%
copyfile('work/part5/videoio_slx_00.png', [targetdir 'videoio_slx_00.png']);
copyfile('work/part5/videoio_slx_01.png', [targetdir 'videoio_slx_01.png']);
copyfile('work/part5/videoio_slx_02.png', [targetdir 'videoio_slx_02.png']);
copyfile('work/part5/videoio_slx_03.png', [targetdir 'videoio_slx_03.png']);
copyfile('work/part5/videoio_slx_04.png', [targetdir 'videoio_slx_04.png']);
copyfile('work/part5/videorgb2gray_slx_00.png', [targetdir 'videorgb2gray_slx_00.png']);
copyfile('work/part5/videorgb2gray_slx_01.png', [targetdir 'videorgb2gray_slx_01.png']);
copyfile('work/part5/videorgb2gray_slx_02.png', [targetdir 'videorgb2gray_slx_02.png']);
copyfile('work/part5/videorgb2gray_slx_03.png', [targetdir 'videorgb2gray_slx_03.png']);
copyfile('work/part5/videogradfilt_slx_00.png', [targetdir 'videogradfilt_slx_00.png']);
copyfile('work/part5/file_button.png', [targetdir 'file_button.png']);
copyfile('work/part5/library_button.png', [targetdir 'library_button.png']);
copyfile('work/part5/play_button.png', [targetdir 'play_button.png']);
copyfile('work/part5/library_browser.png', [targetdir 'library_browser.png']);
copyfile('work/part5/cvs_library.png', [targetdir 'cvs_library.png']);
copyfile('work/part5/cvs_sources.png', [targetdir 'cvs_sources.png']);
copyfile('work/part5/cvs_sources_blocks.png',[targetdir 'cvs_sources_blocks.png']);
copyfile('work/part5/cvs_sinks.png', [targetdir 'cvs_sinks.png']);
copyfile('work/part5/cvs_sinks_blocks.png', [targetdir 'cvs_sinks_blocks.png']);
copyfile('work/part5/frommultimediafile_blockparameter.png', [targetdir 'frommultimediafile_blockparameter.png']);
copyfile('work/part5/tomultimediafile_blockparameter.png', [targetdir 'tomultimediafile_blockparameter.png']);
copyfile('work/part5/matlabsystem_blockparameter.png', [targetdir 'matlabsystem_blockparameter.png']);
copyfile('work/part5/imaq_blocks.png', [targetdir 'imaq_blocks.png']);
copyfile('work/part5/udf_blocks.png', [targetdir 'udf_blocks.png']);
copyfile('work/part5/vipmengradfilt_avi.png', [targetdir 'vipmengradfilt_avi.png']);
copyfile('work/part5/vipmengradfilt_sobel_avi.png', [targetdir 'vipmengradfilt_sobel_avi.png']);

%
publish([lang '.part5'],type);
rmpath('work/part5')

%% Part 6
close all

addpath('work/part6')

copyfile('work/part6/raspberrypi_blocks.png', [targetdir 'raspberrypi_blocks.png']);
copyfile('work/part6/gradfilt_kernel.png', [targetdir 'gradfilt_kernel.png']);
copyfile('work/part6/raspi_microsd.png', [targetdir 'raspi_microsd.png']);
copyfile('work/part6/raspi_cableconnection.png', [targetdir 'raspi_cableconnection.png']);
copyfile('work/part6/raspi_hdmi.png', [targetdir 'raspi_hdmi.png']);
copyfile('work/part6/raspi_videogradfilt.png', [targetdir 'raspi_videogradfilt.png']);
copyfile('work/part6/videogradfiltraspi_slx_00.png', [targetdir 'videogradfiltraspi_slx_00.png']);
copyfile('work/part6/videogradfiltraspi_slx_01.png', [targetdir 'videogradfiltraspi_slx_01.png']);
copyfile('work/part6/videogradfiltraspi_slx_02.png', [targetdir 'videogradfiltraspi_slx_02.png']);
copyfile('work/part6/videogradfiltraspi_slx_03.png', [targetdir 'videogradfiltraspi_slx_03.png']);
copyfile('work/part6/videogradfiltraspi_slx_04.png', [targetdir 'videogradfiltraspi_slx_04.png']);
copyfile('work/part6/videogradfiltraspi_slx_05.png', [targetdir 'videogradfiltraspi_slx_05.png']);
copyfile('work/part6/videogradfiltraspi_slx_06.png', [targetdir 'videogradfiltraspi_slx_06.png']);
copyfile('work/part6/videogradfiltraspi_slx_07.png', [targetdir 'videogradfiltraspi_slx_07.png']);
copyfile('work/part6/videogradfiltraspi_slx_08.png', [targetdir 'videogradfiltraspi_slx_08.png']);
copyfile('work/part6/videogradfiltraspi_slx_09.png', [targetdir 'videogradfiltraspi_slx_09.png']);
copyfile('work/part6/videogradfiltraspi_slx_10.png', [targetdir 'videogradfiltraspi_slx_10.png']);
copyfile('work/part6/videogradfiltraspi_external.png', [targetdir 'videogradfiltraspi_external.png']);
copyfile('work/part6/videogradfiltraspi_ipaddress.png', [targetdir 'videogradfiltraspi_ipaddress.png']);
copyfile('work/part6/videogradfiltraspi_toolchain.png', [targetdir 'videogradfiltraspi_toolchain.png']);

%
publish([lang '.part6'],type);
rmpath('work/part6')

%% ZIP
close all

cdir = pwd;
cd(['+' lang])
if exist(['html/embvision_' lang '.zip'],'file')==2
    delete(['html/embvision_' lang '.zip'])
    disp(['Old embvision_' lang '.zip was deleted.'])
end
zip(['embvision_' lang], 'html')
movefile(['embvision_' lang '.zip'], 'html')
cd(cdir)

%% Open index.html
showdemo([lang '.index'])
