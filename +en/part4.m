%% *EmbVision Tutorial: Part 4*
%
% *Video Stream Processing - MATLAB -*
%
% <html>
% Shogo MURAMATSU　and Yuki TAKAHASHI <br>
% Niigata Univ.
% </html>
%
% Copyright (c), All rights reserved, 2014-2025, Shogo MURAMATSU
%

%%
% <part3.html Part3> |
% <index.html Contents> |
% <part5.html Part5>

%%
% *Summary*
%
% Through this exercise, you can learn how to read,
% display and write videos. As well, you can also experiment
% simple video stream processing.
%
% As a preliminary, close all figures by using 
% function <matlab:doc('close') CLOSE>

close all

%% Video Read
% 
% To read a video from a file, MATLAB provides 
% the <matlab:doc('VideoReader.readFrame') READFRAME> method in 
% <matlab:doc('VideoReader') VIDEOREADER> class.
 
vrObj = VideoReader('shuttle.avi');
frame = readFrame(vrObj);

%%
% Variable frame stores the first frame of the video data.
% 
% Because "shuttle.avi" is RGB color video, variable frame 
% becomes 3-D array.
%
% In not specified, the data type becomes unsigned 8 bit.

whos vrObj frame

%%
% Let us display the frame.
%
% In order to use later, prepare the handle object of IMSHOW.

figure(1)
hi1 = imshow(frame);

%%
% Note that variable vrObj is an instance object of VideoReader class and
% stores the information on the video as properties.
%
% The followings summarize the main properties.
%
% * BitsPerPixel: Bits per pixel [bpp]
% * FrameRate: Frame rate [bps]
% * Height: height [pixels]
% * Width: width [pixels]

properties(vrObj)

%%
% Thus, the properties such as the height, width and frame rate
% are obtained as follows.

height    = get(vrObj,'Height');
width     = get(vrObj,'Width');
frameRate = get(vrObj,'FrameRate');

%%
% Calling the READFRAME method reads next frame.
%
% By overwriting the frame data to the CData property of 
% IMSHOW handle object hi1, the contents is updated.

frame = readFrame(vrObj);
set(hi1,'CData',frame);

%%
% [ <part4.html Top> ]

%% Video Display
% Let us set property "CurrentTime" of vrObj to 0 and
% display all of the frames.
%
% In order to force to show every frame in the <matlab:doc('while') WHILE>
% loop, one can adopt the <matlab:doc('drawnow') DRAWNOW> function.
%
% The <matlab:doc('VideoReader.hasFrame') HASFRAME> method enables us to
% detect whether the current frame is the last or not.

set(vrObj,'CurrentTime',0);
while (hasFrame(vrObj))
    frame = readFrame(vrObj);
    set(hi1,'CData',frame);
end

%%
% As another way, the <matlab:doc('movie') MOVIE> function also 
% displays videos. For the detail, refer to the document.

%%
% [ <part4.html Top> ]

%% Video Write
% MATLAB realizes the video write function by 
% the <matlab:doc('VideoWriter.writeVideo') WRITEVIDEO> method of 
% the <matlab:doc('VideoWriter') VIDEOWRITER> class.
%
% Let us rewind the CurrentTime property to 0 and write a video 
% to AVI file named "shuttleclone.avi."

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
% Then, the video is written to AVI file "shuttleclone.avi."
%
% The saved AVI file can be played by a tool outside MATLAB.
%
% <<shuttleclone.png>>
% 

%%
% [ <part4.html Top> ]

%% Video Processing
% By inserting a frame processing between reading and writing a frame,
% one can realize a video stream processing.
%
% Here, let us create a video by applying the gradient filter created
% in Exercise Part 3 to every frame. Recall the following three
% System object classes.
%
% * Rgb2GraySystem
% * Hsv2RgbSystem
% * GradFiltSystem
% 
% First, instantiate System objects for the frame processing as

rgsObj = Rgb2GraySystem();
hrsObj = Hsv2RgbSystem();
gfsObj = GradFiltSystem();

%%
% Then, rewind the CurrentTime property of vrObj to zero and 
% prepare an AVI file "shuttlegrad.avi" to save the output video.

set(vrObj,'CurrentTime',0);
vwObj = VideoWriter('shuttlegrad.avi');
set(vwObj,'FrameRate',frameRate);
open(vwObj)

%%
% Start the video processing.

while (hasFrame(vrObj))
    frame     = readFrame(vrObj);         % Read frame
    graysc    = step(rgsObj,frame);       % Convert to grayscale
    [mag,ang] = step(gfsObj,graysc);      % Apply gradient filtering
    ang       = (ang+pi)/(2*pi);          % Normalize the direction
    mag       = min(mag,1);               % Saturate the magnitude
    [r,g,b]   = step(hrsObj,ang,mag,mag); % Convert to pseudo color
    frame     = cat(3,r,g,b);             % Concatenate to RGB array 
    writeVideo(vwObj,frame);              % Write frame
end
close(vwObj)

%%
% After finishing the process, the result will be saved in to the
% AVI file named "shuttlegrad.avi."
%
% <<shuttlegrad.png>>
% 

%%
% [ <part4.html Top> ]

%% Inter Frame Processing (Option)
% It is possible to define a System object class which 
% stores past frames.
%
% In order to create a new class, FrameAveSystem, which produces
% average frames between successive two input frames,
% let us prepare the following test case class, FrameAveSystemTestCase.
%
%   classdef FrameAveSystemTestCase < matlab.unittest.TestCase
%       %FRAMEAVESYSTEMTESTCASE Test Case for FrameAveSystem
%       properties
%       end
%       methods (Test)
%           function testFirstFrame(testCase)
%               % Preparation
%               width  = 12;
%               height = 16;
%               % Input frame
%               frame1 = rand(height,width,3);
%               % Expectations
%               cnt0Expctd = [];
%               cnt1Expctd = 1;
%               res1Expctd = frame1;
%               % Instantiation of the target
%               obj = FrameAveSystem();
%               % Verify the initial state
%               state      = getDiscreteState(obj);
%               cnt0Actual = state.Count;
%               testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
%               % Actual values
%               res1Actual = step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               % Verify the actual values
%               testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)            
%           end
%           function testThreeFrames(testCase)
%               % Preparation
%               width  = 12;
%               height = 16;
%               % Input frames
%               frame1 = rand(height,width,3);
%               frame2 = rand(height,width,3);
%               frame3 = rand(height,width,3);            
%               % Expectations
%               cnt1Expctd = 1;
%               cnt2Expctd = 2;            
%               cnt3Expctd = 3;                        
%               res1Expctd = frame1;
%               res2Expctd = (frame1+frame2)/2;
%               res3Expctd = (frame2+frame3)/2;
%               % Instantiation of the target
%               obj = FrameAveSystem();
%               % Actual values of the process for the first frame
%               res1Actual = step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               % Actual values of the process for the second frame
%               res2Actual = step(obj,frame2);
%               state      = getDiscreteState(obj);
%               cnt2Actual = state.Count;            
%               % Actual values of the process for the third frame
%               res3Actual = step(obj,frame3);
%               state      = getDiscreteState(obj);
%               cnt3Actual = state.Count;            
%               % Verify the actual values
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
%               testCase.verifyEqual(cnt2Actual,cnt2Expctd)                                    
%               testCase.verifyEqual(cnt3Actual,cnt3Expctd)                                                
%               testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
%               testCase.verifyEqual(res2Actual,res2Expctd,'RelTol',1e-6)            
%               testCase.verifyEqual(res3Actual,res3Expctd,'RelTol',1e-6)                        
%           end        
%           function testReset(testCase)
%               % Preparation
%               width  = 12;
%               height = 16;
%               % Input frame
%               frame1 = rand(height,width,3);
%               % Expectations
%               cnt0Expctd = [];
%               cnt1Expctd = 1;
%               cntrExpctd = 0;
%               % Instantiation of the target
%               obj = FrameAveSystem();
%               % Verify the initial state
%               state      = getDiscreteState(obj);
%               cnt0Actual = state.Count;
%               testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
%               % Verify the state after processing for the first frame
%               step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
%               % Verify the state after reset
%               reset(obj);
%               state      = getDiscreteState(obj);
%               cntrActual = state.Count;
%               testCase.verifyEqual(cntrActual,cntrExpctd)                        
%           end        
%       end
%   end

%%
% The following is an example of the FrameAveSystem class that 
% satisfies the above test case class, FrameAveSystemTestCase.
% 
%
%   classdef FrameAveSystem < matlab.System
%       properties
%           preFrame % Previous frame
%       end
%       properties (DiscreteState)
%           Count    % Frame count
%       end
%       properties (Access = private)
%       end
%       methods (Access = protected)
%           % Setup (evaluated just before the first call of STEP)
%           function setupImpl(obj,srcFrame)
%               % Initialization of the previous frame
%               obj.preFrame = srcFrame;
%               % Initialization of the frame count
%               obj.Count = 0;
%           end
%           % Step 
%           function resFrame = stepImpl(obj,srcFrame)
%               % Taking average of frames
%               resFrame = (obj.preFrame + srcFrame)/2;
%               % Update the previous frame by the current one
%               obj.preFrame = srcFrame;
%               % Increment the frame count
%               obj.Count = obj.Count+1;
%           end
%           % Reset
%           function resetImpl(obj)
%               % Reset the frame count
%               obj.Count = 0;
%           end
%       end
%   end

%%

result = run(FrameAveSystemTestCase);

%%
% An example script of using the FrameAveSystem class is shown below.
%
fasObj = FrameAveSystem();

set(vrObj,'CurrentTime',0);
vwObj = VideoWriter('shuttleave.avi');
set(vwObj,'FrameRate',frameRate);
open(vwObj)
while (hasFrame(vrObj))
    frame = readFrame(vrObj);   % Read frame
    frame = im2double(frame);   % Convert to double type
    frame = step(fasObj,frame); % Take average of frames
    writeVideo(vwObj,frame);    % Write frame
end
close(vwObj)

%%
% After finishing the process, the result will be saved in to the
% AVI file named "shuttleave.avi."
%
% <<shuttleave.png>>

%%
% [ <part4.html top> ]

%% Exercises
% *Exercise 4-1. Sobel Gradient Filter*
%
% Instantiate a gradient filter object 
%
%    gfs = GradFiltSystem('Kernel',[ 1 2 1 ; 0 0 0 ; -1 -2 -1 ]); 
%
%
% by using vertical differential filter coefficients
%
% $$ \left(\begin{array}{ccc}
%    1 &  2 &  1 \\
%    0 &  0 &  0 \\
%   -1 & -2 & -1 \\
%    \end{array}\right) $$,
%
% and horizontal differential filter coefficients
%
% $$ \left(\begin{array}{ccc}
%    1 &  0 & -1 \\
%    2 &  0 & -2 \\
%    1 &  0 & -1 \\
%    \end{array}\right) $$.
%
% Then, apply the following process to video "shuttle.avi."
%
%    graysc    = step(rgsObj,frame);       % Convert to grayscale
%    [mag,ang] = step(gfsObj,graysc);      % Apply gradient filtering
%    ang       = (ang+pi)/(2*pi);          % Normalize the direction
%    mag       = min(mag,1);               % Saturate the magnitude
%    [r,g,b]   = step(hrsObj,ang,mag,mag); % Convert to pseudo color
%    frame     = cat(3,r,g,b);             % Concatenate to RGB array
%
% Save the result to AVI file "shuttlesobel.avi."
%
% (Example Answer)
%
% <<shuttlesobel.png>>

%%
% *Exercise 4-2. Frame Difference* (Option)
%
% Implement a class named "FrameDiffSystem,"
% which produces difference between successive frames
% so that the following test case passes.
%
%   classdef FrameDiffSystemTestCase < matlab.unittest.TestCase
%       %FRAMEDIFFSYSTEMTESTCASE Test Case for FrameDiffSystem
%       properties
%       end
%       methods (Test)
%           function testFirstFrame(testCase)
%               % Preparation
%               width  = 12;
%               height = 16;
%               % Input frame
%               frame1 = rand(height,width);
%               % Expectations
%               cnt0Expctd = [];
%               cnt1Expctd = 1;
%               res1Expctd = zeros(height,width);
%               % Instantiation of the target
%               obj = FrameDiffSystem();
%               % Verify the initial state
%               state      = getDiscreteState(obj);
%               cnt0Actual = state.Count;
%               testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
%               % Actual values
%               res1Actual = step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               % Verify the actual values
%               testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)            
%           end
%           function testThreeFrames(testCase)
%               % Preparation
%               width  = 12;
%               height = 16;
%               % Input frames
%               frame1 = rand(height,width);
%               frame2 = rand(height,width);
%               frame3 = rand(height,width);            
%               % Expectations
%               cnt1Expctd = 1;
%               cnt2Expctd = 2;            
%               cnt3Expctd = 3;                        
%               res1Expctd = zeros(height,width);
%               res2Expctd = (frame2-frame1);
%               res3Expctd = (frame3-frame2);
%               % Instantiation of the target
%               obj = FrameDiffSystem();
%               % Actual values of the process for the first frame
%               res1Actual = step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               % Actual values of the process for the second frame
%               res2Actual = step(obj,frame2);
%               state      = getDiscreteState(obj);
%               cnt2Actual = state.Count;            
%               % Actual values of the process for the third frame
%               res3Actual = step(obj,frame3);
%               state      = getDiscreteState(obj);
%               cnt3Actual = state.Count;            
%               % Verify the actual values
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
%               testCase.verifyEqual(cnt2Actual,cnt2Expctd)                                    
%               testCase.verifyEqual(cnt3Actual,cnt3Expctd)                                                
%               testCase.verifyEqual(res1Actual,res1Expctd,'RelTol',1e-6)
%               testCase.verifyEqual(res2Actual,res2Expctd,'RelTol',1e-6)            
%               testCase.verifyEqual(res3Actual,res3Expctd,'RelTol',1e-6)                        
%           end        
%           function testReset(testCase)
%               % Preparation
%               width  = 12;
%               height = 16;
%               % Input frame
%               frame1 = rand(height,width);
%               % Expectations
%               cnt0Expctd = [];
%               cnt1Expctd = 1;
%               cntrExpctd = 0;
%               % Instantiation of the target
%               obj = FrameDiffSystem();
%               % Verify the initial state
%               state      = getDiscreteState(obj);
%               cnt0Actual = state.Count;
%               testCase.verifyEqual(cnt0Actual,cnt0Expctd)            
%               % Verify the state after the process for the first frame
%               step(obj,frame1);
%               state      = getDiscreteState(obj);
%               cnt1Actual = state.Count;
%               testCase.verifyEqual(cnt1Actual,cnt1Expctd)                        
%               % Verify the state after reset
%               reset(obj);
%               state      = getDiscreteState(obj);
%               cntrActual = state.Count;
%               testCase.verifyEqual(cntrActual,cntrExpctd)                        
%           end        
%       end
%   end

%%
% (Example Answer)

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
    frame = readFrame(vrObj);   % Frame input
    frame = im2double(frame);   % Convert to double type
    frame = step(fdfObj,frame); % Frame difference
    frame = frame/2+0.5;
    writeVideo(vwObj,frame);    % Frame output
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
% <index.html Contents> |
% <part4.html Top> |
% <part5.html Part5>
