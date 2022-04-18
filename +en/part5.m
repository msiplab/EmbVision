%% *EmbVision Tutorial: Part 5*
%
% *Video Stream Processing - Simulink -*
%
% <html>
% Shogo MURAMATSU　and Yuki TAKAHASHI <br>
% Niigata Univ.
% </html>
%
% Copyright (c), All rights reserved, 2014-2022, Shogo MURAMATSU
%

%%
% <part4.html Part4> |
% <index.html Contents> |
% <part6.html Part6>

%%
% *Summary*
%
% Through this exercise, you can learn how to deal with videos
% on Simulink model and create Simulink blocks from 
% user-defined System objects(TM). As well, you can also experiment 
% simple video stream processing by using the user defined Simulink 
% blocks.

%% Creation of Simulink Model
% First of all, create a new Simulink model 
% by starting with preparing a new model file.
%
% From the HOME tag, choose the following item.
% 
% # "New"
% # -> "Simulink Model"
%
% Otherwise, use the 
% <matlab:doc('new_system') NEW_SYSTEM> and
% <matlab:doc('open_system') OPEN_SYSTEM> function
% on the command window.
%
% For example, create a model named "videoio" from the command window.
%
%   new_system('videoio','Model')
%   open_system('videoio')

%%
% Then, a window will appearer as follows.
%
% <<videoio_slx_00.png>>
%

%%
% To save the model, click the icon 
%
% <<file_button.png>>
%
% on the menu or execute the <matlab:doc('save_system') SAVE_SYSTEM> function
% as
%
%   save_system('videoio')
%
% on the MATLAB's command window.

%%
% [ <part5.html Top> ]

%% Simulink Library Browser
% Simulink can simulate a system by deploying and connecting blocks as 
% process components. It is possible to change properties of each block and
% and simulation conditions.
%
% In order to use existing blocks, click the icon 
%
% <<library_button.png>>
%
% on the menu bar. Then, the Simulink library browser will appear 
% as follows.
%
% <<library_browser.png>>

%%
% [ <part5.html Top> ]

%% Video Input and Output Model
% Next, as an example, let us create a system model which input and output
% video files.
%
% Choose 
%
% * <matlab:doc('vision') Computer Vision System Toolbox(TM)>
%
% from the left list of the library browser.
%
% Then, the browser displays a set of blocks 
% in Computer Vision System Toolbox.
% 
% <<cvs_library.png>>
%
% One can also execute 
%
%   visionlib
% 
% on the MATLAB's command window.

%%
% Double-click the "Sources" icon
% 
% <<cvs_sources.png>>
%
% from the right menu and open the block library in 
% Computer Vision System Toolbox/Sources.
%
% <<cvs_sources_blocks.png>>
%

%%
% From the library, right-click the "From Multimedia File" block 
% and add the block to model "videoio".
%
% <<videoio_slx_01.png>>

%%
% Then, double-click the "Sinks" icon
% 
% <<cvs_sinks.png>>
%
% from the Computer Vision System Toolbox library and open the block 
% library in Computer Vision System Toolbox/Sinks.
%
% <<cvs_sinks_blocks.png>>
%

%%
% From the browser, right-click the "To Multimedia File" block 
% and add the block to model "videoio".
%
% <<videoio_slx_02.png>>

%%
% Drag the output terminal of the "From Multimedia File" block to the input terminal of 
% the "From Multimedia File" terminal to connect them.
%
% <<videoio_slx_03.png>>

%%
% By left-clicking the run button 
%
% <<play_button.png>>
%
% on the menu of the model editor, the simulation will start to run.
%
% <<videoio_slx_04.png>>

%%
% An AVI file named "output.avi" is produced.
% Play the video by using a tool outside MATLAB. 
%
% Input AVI file can be changed by editing the 
% "File name" property on the parameter dialog which 
% appears by double-clicking the "From Multimedia File" block.
%
% <<frommultimediafile_blockparameter.png>>
%

%%
% By using the "From Video Device" block in 
%
% * <matlab:doc('imaq') Image Acquisition Toolbox(TM)>
%
% video data acquired from a connected camera can be used as the input.
%
% <<imaq_blocks.png>>
%
% It is also possible to open the library by executing the 
%
%   imaqlib
% 
% function on the MATLAB's command window. 
% For the detail, refer to the document.
%

%%
% Output AVI file can be changed by editing the 
% "File name" property on the parameter dialog which appears
% by double-clicking the "To Multimedia File" block.
% 
% <<tomultimediafile_blockparameter.png>>

%%
% As the output target, one can use 
%
% * <matlab:doc('videoviewer') Video Viewer> block
% * <matlab:doc('vision/tovideodisplay') To Video Display> block (only Windows(R))
% 
% in the "Computer Vision System Toolbox/Sinks" library.
% A video viewer will appear on Simulink and the output video 
% can be monitored during the simulation.
% For the detail, refer to the document.

%%
% [ <part5.html Top> ]

%% MATLAB System Block
% MATLAB System block enable us to define a Simulink block 
% by using a System object.
% 
% As an example, let us defined a Simulink block by using 
% the Rgb2GraySystem class that was created in Exercise Part3.

%%
% Save the "videoio" model as a model named "videorgb2gray".
%
%   open_system('videoio')
%   save_system('videoio','videorgb2gray')

%%
% Chose 
%
% * MATLAB System block
%
% from the "Simulink/User-Defined Functions" library and add the block 
% to the "videorgb2gray" mode.
%
% <<udf_blocks.png>>

%%
% The "videorgb2gray" becomes like the following picture.
%
% <<videorgb2gray_slx_00.png>>

%%
% Insert the MATLAB System block between the video input and output blocks.
% Then, open the property dialog and set the property as follows.
% 
% * System object name: Rgb2GraySystem
%
% <<videorgb2gray_slx_01.png>>

%%
% By clicking the "OK" button and appropriately stretching the center block,
% one can obtain a model looks like the following picture.
% 状態となる。
%
% <<videorgb2gray_slx_02.png>>

%%
% Run the model and verify the AVI file "output.avi".

%%
% [ <part5.html Top> ] 

%% Customization of Icon
% Input and output names of an MATLAB System block 
% can be customized by the definition of the original System object.
%
% Let us set the names of input and output ports.
% One can open the source code of the Rgb2GraySystem class from 
% the block parameter dialog.
%
% <<matlabsystem_blockparameter.png>>
%
% Next, add the following method
%
%   methods (Access=protected)
%      ...（省略）
%      % # of input ports
%      function N = getNumInputsImpl(obj)
%          N = 1; 
%      end
%      % # of output ports
%      function N = getOutputNamesImpl(obj)
%          N = 1;
%      end      
%      % Names of input ports
%      function inputName = getInputNamesImpl(obj)
%             inputName = 'RGB';
%      end
%      % Names of output ports
%      function outputName = getOutputNamesImpl(obj)
%             outputName = 'Gray';
%      end
%      ...（省略）
%   end
%
% to the methods(Access=protected) section.

%% 
% Furthermore, by extending the 
%
% * <matlab:doc('matlab.system.mixin.CustomIcon') matlab.system.mixin.CustomIcon>
%
% class, one can customize the icon on the simulink mode editor.
% 
% First, revise the first CLASSDEF line of the source code as follows.
%
%   classdef Rgb2GraySystem < matlab.System ...
%         & matlab.system.mixin.CustomIcon
%
% Second, add the following method
%
%   methods (Access=protected)
%      ...
%      % Icon
%      function icon = getIconImpl(obj)
%         icon = sprintf('RGB to Gray');
%      end
%      ...
%   end
%
% to the methods(Access=protected) section.

%%
% Click the "OK" button to close the dialog. Then, the names of the 
% input, output and icon in the center block become as indicated 
% in the System object definition.
%
% <<videorgb2gray_slx_03.png>>

%%
% [ <part5.html Top> ]

%% Precision and Propagation (Option)
%
% * <matlab:doc('matlab.system.mixin.Propagates') matlab.system.mixin.Propagates>
%
% (Under construction)

%% Feed Through (Option)
%
% * <matlab:doc('matlab.system.mixin.Nondirect') matlab.system.mixin.Nondirect>
%
% (Under construction)

%%
% [ <part5.html Top> ]

%% Exercises
% *Exercise 5-1. Prewitt Gradient Filter*
%
% By using the following System object classes 
%
%   * Rgb2GraySystem
%   * GradFiltSystem
%   * Hsv2RgbSystem
%
% which are created in Exercise Part 4 as MATLAB System blocks,
% create a Simulink model of the following MATLAB code.
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
%      frame     = readFrame(vrObj);         % Read frame
%      graysc    = step(rgsObj,frame);       % Convert to grayscale
%      [mag,ang] = step(gfsObj,graysc);      % Apply gradient filtering
%      ang       = (ang+pi)/(2*pi);          % Normalize the direction
%      mag       = min(mag,1);               % Saturate the magnitude
%      [r,g,b]   = step(hrsObj,ang,mag,mag); % Convert to pseudo color
%      frame     = cat(3,r,g,b);             % Concatenate RGB array
%      writeVideo(vwObj,frame);              % Write frame
%   end
%   close(vwObj)
%
% (Example Model)
%
% <<videogradfilt_slx_00.png>>
%
% In the above mode, the following existing blocks were used.
%
% * <matlab:doc('simulink/saturation') Simulink/Commonly Used Blocks/Saturation>
% * <matlab:doc('simulink/constant') Simulink/Commonly Used Blocks/Constant>
% * <matlab:doc('simulink/add') Simulink/Commonly Used Blocks/Sum>
% * <matlab:doc('simulink/gain') Simulink/Commonly Used Blocks/Gain>
%
% (Example Answer)
%
% <<vipmengradfilt_avi.png>>

%%
% *Exercise 5-2. Sobel Gradient Filter*
%
% Change the filter kernel of the Prewitt gradient filter model 
% developed in Exercise 5-1 to Sobel Kernel described in Exercise 4-1.
% Then, run the simulation of the model.
% 
% * Hint: Revise the "Kernel" parameter of the GradFilterSystem block.
%
% (Example Answer)
%
% <<vipmengradfilt_sobel_avi.png>>

%%
% <html>
% <hr>
% </html>
%%
% <part4.html Part4> |
% <index.html Contents> |
% <part5.html Top> |
% <part6.html Part6>
