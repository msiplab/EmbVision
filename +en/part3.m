%% *EmbVision Tutorial: Part 3*
%
% *Class Definition and Unit Testing*
%
% <html>
% Shogo MURAMATSU and Yuki TAKAHASHI <br>
% Niigata Univ.
% </html>
%
% Copyright (c), All rights reserved, 2014-2022, Shogo MURAMATSU
%

%%
% <part2.html Part2> |
% <index.html Contents> |
% <part4.html Part4>

%%
% *Summary*
%
% Through this exercise, you can learn how to develop 
% MATLAB codes with a manner of object-oriented programming (OOP) 
% and how to use unit testing framework in MATLAB.

%% Object-Oriented Programming (OOP)
% Modularization of programs brings high reliability and wide extensibility.
% Object-oriented programming
% ( <matlab:doc('object-oriented-programming') OOP> ) is a manner to 
% develop codes by defining program
% modules that possess
%
% *Data (in the form of properties)* and *code(in the form of methods)*
%
% as classes. Through creation, combination and interaction of 
%
% *Instance objects*
%
% of such classes, large-scaled programs are constructed.
%
% OOP is available also with MATLAB.
% 
% The OOP function of MATLAB has been enhanced through several version ups.
% Now, extending the <matlab:doc('matlab.System') System object(TM)> 
% base class, one can easily realize 
%
% * Stream processing, 
% * Code generation, and
% * Definition of Simulink blocks

%%
% [ <part3.html Top> ]

%% Definition of System object Class
% As an example, define a subclass of System object that 
% converts a grayscale image to RGB color image.
%
% From the HOME tag, choose the following item.
% 
% # "New"
% # -> "System object >"
% # -> "Basic"
%
% Then, a template code will appear on the editor.

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
% Edit the name of the class just after 
% the <matlab:doc('classdef') CLASSDEF> keyword from Untitled to 
% 
% Rgb2GraySystem  
%
% at the first line.

%%
%   classdef Rgb2GraySystem < matlab.System
%     % RGB2GRAYSYSTEM RGB to Grayscale Converter
%     %
%   

%%
% Save the edited file as "Rgb2GraySystem.m".
%
% The string just after the CLASSDEF keyword denotes the name of the class.
% The file name should be identical to the class name.

%%
% The procedure is summarized as follows:
%
% # Create an instance object (call the constructor)
% # Execute the STEP method (call STEPIMPL method indirectly)

%%
%   >> u = 1;
%   >> obj = Rgb2GraySystem(); % Call the constructor
%   >> y = step(obj,u)         % Call the stepImpl method indirectly
%   
%   y =
%
%        1

%%
% At present, the class definition of Rgb2GraySystem contains
% the automatically-created template code.
%
% The STEPIMPL method is defined to pass the input u to the output.
%
%   function y = stepImpl(obj,u)
%      y = u;
%   end
%
% In order for Rgb2GraySystem class to satisfy the required function,
% one has to define PROPERTIES and METHODS appropriately.
%
% The followings show how to proceed the implementation of 
% Rgb2GraySystem class through *test-driven development (TDD)*. 

%%
% [ <part3.html Top> ]

%% Test-Driven Development (TDD)
% In order to improve the reliability of programs,
% it is recommended to enhance their test codes.
% 
% MATLAB provides a <matlab:doc('matlab.unittest') UNITTEST> framework, 
% for testing program units automatically.
%
% The UNITTEST framework is an indispensable tool for TDD, which 
% gives a top priority to unit test codes instead of program unit codes.
%
% As a result, one can develop program modules that has few bugs and
% is robust to change.
% 
% In general, TDD repeats the following steps:
% 
% * Implement a test method
% * -> Verify fail of the test method
% * -> Implement a target class
% * -> Verify success of the test method
% 
% As a result, both of the test class and target class are 
% enhanced.

%%
% Implement Rgb2GraySystem class by following the steps below.
% 
% # Define a test class, Rgb2GraySystemTestCase
% # Implement testSize method in the Rgb2GraySystemTestCase class
% # Verify fail of the testSize method for the target Rgb2GraySystem class
% # Implement the STEPIMPL method of the target Rgb2GraySystem class
% # Verify success of the testSize method for the target Rgb2GraySystem class

%% Definition of TestCase Class
% Now, define the test case class named "Rgb2GraySystemTestCase."
%
% From HOME tag, choose the following item.
% 
% # "New"
% # -> "Classes"
%
% Then, a template code will appear on the editor.
% 
%   classdef Untitled
%   %UNTITLED Summary of this class goes here
%   %  Detailed explanation goes here
%      properties
%      end
%      methods
%      end
%   end

%%
% By extending the
% <matlab:doc('matlab.unittest.TestCase') matlab.unittest.TestCase> 
% class, one can define the Rgb2GraySystemTestCase class.
%
% That is, edit the first line containing the CLASSDEF keyword as
%
%   classdef Rgb2GraySystemTestCase < matlab.unittest.TestCase
%   %RGB2GRAYSYSTEMTESTCASER Test Case for Rgb2GraySystem
%
% In addition, prepare a <matlab:doc('methods') METHODS> 
% section that has "Test" attribution.
%
%
%   methods (Test)
%   end

%%
% At this point, the whole code will be as follows:
%
%   classdef Rgb2GraySystemTestCase < matlab.unittest.TestCase
%       %RGB2GRAYSYSTEMTESTCASE Test Case for Rgb2GraySystem
%       properties
%       end
%       methods (Test)
%       end
%   end
%
% Save the edited class definition to file "Rgb2GraySystemTestCase.m."

%%
% [ <part3.html Top> ]

%% Addition of Test Method
% Next, add another test method to the test class "Rgb2GraySystemTestCase."
% 
% Insert the following test method into the methods section with 
% Test attribution, i.e., methods (Test),  
% in the Rgb2GraySystemTestCase class.
%
%
%   function testSize(testCase)
%      % Preparation
%      u = zeros(1,2,3);   % Zero array of size 1x2x3
%      % Expectation
%      szExpctd = [ 1 2 ]; % Size of 2-D array
%      % Instantiation of the target
%      obj = Rgb2GraySystem();
%      % Actual value
%      y = step(obj,u);
%      % Verification of the size
%      testCase.verifySize(y,szExpctd);
%   end
%
% Note that all the methods in the test method section are automated
% to be tested.
%
% Here, the <matlab:doc('matlab.unittest.qualifications.Verifiable.verifySize')
% VERIFYSIZE> method verifies the size of a given variable.
%
% The <matlab:doc('zeros') ZEROS> function creates a zero array of 
% indicated size.

%%
% Call the <matlab:doc('matlab.unittest.TestCase.run') RUN> method 
% on the command window for executing the unit tests.
%
%   >> result = run(Rgb2GraySystemTestCase);
%
% At present, Rgb2GraySystem is not appropriately implemented, 
% the test results in fail.

%% Implementation of Target Class
% In order avoid the fail test, redefine the STEPIMPL method of the 
% Rgb2GraySystem class as follows.
% 
%   function y = stepImpl(obj,u)
%      y = zeros(size(u,1),size(u,2));
%   end
%
% Then, execute the test again.
%
%   >> result = run(Rgb2GraySystemTestCase);
%  
%   Running Rgb2GraySystemTestCase
%   .
%   Done Rgb2GraySystemTestCase
%   __________

%%
% The result changes from fail to success.

%% Enhancement of TestCase and Target Classes
% Similarly, keep enhancing the test case and target class by 
% repeating the following steps.
%
% # Implement a test method to the test case class
% # Verify fail of the test method
% # Implement a target method in the target class
% # Verify success of the test method

%%
% Enhance the Rgb2GraySystem class to satisfy the following 
% test case.
%
%   classdef Rgb2GraySystemTestCase < matlab.unittest.TestCase
%       %RGB2GRAYSYSTEMTESTCASE Test Case for Rgb2GraySystem
%       properties
%       end
%       methods (Test)
%           function testSize(testCase)
%               % Preparation
%               u = zeros(1,2,3);   % Zero array of size 1x2x3
%               % Expectation
%               szExpctd = [ 1 2 ]; % Size of 2-D array
%               % Instantiation of the target
%               obj = Rgb2GraySystem();
%               % Actual value
%               y = step(obj,u);
%               % Verification of the size
%               testCase.verifySize(y,szExpctd);
%           end
%           function testValues(testCase)
%               % Preparation
%               u = rand(4,6,3);        % 3-D random array
%               % Expectation
%               arrayExpctd = rgb2gray(u); % Expectation of grayscale
%               % Instantiation of the target
%               obj = Rgb2GraySystem();
%               % Actual value
%               arrayActual = step(obj,u);
%               % Verify the contents of the array
%               testCase.verifyEqual(arrayActual,arrayExpctd);
%           end
%       end
%   end
%
% Here, the<matlab:doc('matlab.unittest.qualifications.Verifiable.verifyEqual')
% VERIFYEQUAL> function verifies if the actual value is identical to 
% the expected one.
% 
% The <matlab:doc('rand') RAND> function generates real random values 
% from uniform distribution with the range from 0 to 1.

result = run(Rgb2GraySystemTestCase);

%%
% If the Rgb2GraySystem class is appropriately implemented,
% the test would result in success.

%%
% [ <part3.html Top> ]

%% Class Properties
% Any class can possesses properties in addition to methods.
%
% Properties can be defined in the 
% <matlab:doc('properties') PROPERTIES> section by a list of 
% property names.
%
% For example, a System object class named "GradFiltSystem" with 
% property "Kernel" is defined as follows.
%
%   classdef GradFiltSystem < matlab.System
%       properties
%          Kernel % Property 
%       end
%       properties (DiscreteState)
%       end
%       properties (Access = private)
%       end
%       methods (Access = protected)
%           % Setup (evaluated just before the first call of STEP)
%           function setupImpl(obj,srcImg)
%           end
%           % Step
%           function resImg = stepImpl(obj,srcImg)
%              resImg = srcImg;
%           end
%           % Reset
%           function resetImpl(obj)
%           end
%        end
%    end

%% 
% Properties can be initialized by giving their initial values.
%
% Let us implement a test case class that expects that the target class
% has a property named "Kernel" whose initial value is given as follows.
%
%   Kernel = [  1  1  1 ; 
%               0  0  0 ;
%              -1 -1 -1 ];
%
% GradFiltSystemTestCase may be defined as follows.
%
%   classdef GradFiltSystemTestCase < matlab.unittest.TestCase
%       %GRADFILTSYSTEMTESTCASE Test Case for GradFiltSystem
%       properties
%       end
%       methods (Test)
%           function testDefaultKernel(testCase)
%               % Expectation
%               kernelExpctd = [  1  1  1 ;
%                                 0  0  0 ;
%                               -1 -1 -1 ];
%               % Instantiation of the target class
%               obj = GradFiltSystem();
%               % Get property Kernel
%               kernelActual = get(obj,'Kernel');
%               % Verify property Kernel
%               testCase.verifyEqual(kernelActual,kernelExpctd)
%           end
%       end
%   end

%%
% Edit the Kernel property of the GradFiltSystem class 
% so that the above test case passes.
%
%   properties
%       Kernel = [  1  1  1 ; % Initialized property
%                   0  0  0 ;
%                  -1 -1 -1 ];
%   end

%%
% Note that one can access a property from a method 
% by using symbol '.' just after the first argument name 
% (obj in the following case) followed by the property name as 
%
%   function y = stepImpl(obj,u)
%      y = conv2(obj.Kernel,u); 
%   end

%%
% [ <part3.html Top> ]

%% Constructor
% The value of property Kernel can be changed 
% at the instantiation of the GradFiltSystem class.
% Let us add the following test method to the GradFiltSystemTestCase class.
%
%   methods (Test)
%      ... 
%      function testSobelKernel(testCase)
%         % Expectation
%         kernelExpctd = [  1  2  1 ;
%                           0  0  0 ;
%                          -1 -2 -1 ];
%         % Instantiation of the target class
%         obj = GradFiltSystem('Kernel',kernelExpctd);
%         % Get property Kernel
%         kernelActual = get(obj,'Kernel');
%         % Verify property Kernel
%         testCase.verifyEqual(kernelActual,kernelExpctd)
%      end     
%      ... 
%   end

%%
% Define a constructor so that the above test case passes.
%
% Constructor can be defined as a method whose name is identical to 
% the class name in the public METHODS section without
% any attribution.
%
%   methods
%      % Constructor
%      function obj = GradFiltSystem(varargin)
%         setProperties(obj,nargin,varargin{:})
%      end
%   end
%   methods (Access = protected)
%      ...
%   end

%%
% Note that <matlab:doc('varargin') VARARGIN> accept
% variable length input arguments and the 
% <matlab:doc('matlab.System.setProperties') SETPROPERTIES> methods
% enable us to set properties by the combination of arguments in 
% the form 
%
% _'Property_name1'_, _Property_value1_,_'Property_name2'_, _Property_value2_,...

%%
% [ <part3.html Top> ]

%% Exercises
%
% *Exercise 3-1. HSV2RGB Class*
% 
% Implement a class named "Hsv2RgbSystem" so that the following 
% test case is satisfied.

%   classdef Hsv2RgbSystemTestCase < matlab.unittest.TestCase
%       %HSV2RGBSYSTEMTESTCASE Test Case for Hsv2RgbSystem
%       properties
%       end
%       methods (Test)
%           function testSize(testCase)
%               % Preparation
%               h = zeros(1,2);
%               s = zeros(1,2);
%               v = zeros(1,2);
%               % Expectation
%               szRExpctd = [ 1 2 ];
%               szGExpctd = [ 1 2 ];
%               szBExpctd = [ 1 2 ];
%               % Instantiation of the target
%               obj = Hsv2RgbSystem();
%               % Actual values
%               [r,g,b] = step(obj,h,s,v);
%               % Verify the sizes
%               testCase.verifySize(r,szRExpctd);
%               testCase.verifySize(g,szGExpctd);
%               testCase.verifySize(b,szBExpctd);
%           end
%           function testValues(testCase)
%               % Preparation
%               h = rand(4,6);
%               s = rand(4,6);
%               v = rand(4,6);
%               hsv = cat(3,h,s,v); % Concatenation to 3-D array
%               % Expectation
%               rgbExpctd = hsv2rgb(hsv); 
%               % Instantiation of the target
%               obj = Hsv2RgbSystem();
%               % Actual values
%               [rActual,gActual,bActual] = step(obj,h,s,v);
%               % Verify the contents of the arrays
%               testCase.verifyEqual(rActual,rgbExpctd(:,:,1));
%               testCase.verifyEqual(gActual,rgbExpctd(:,:,2));
%               testCase.verifyEqual(bActual,rgbExpctd(:,:,3));
%           end
%       end
%   end
%
% Here, the <matlab:doc('cat') CAT> function concatenates 
% multiple arrays in the indicated dimension.

result = run(Hsv2RgbSystemTestCase);

%%
% If the Hsv2RgbSystem class is appropriately implemented,
% the test would result in success.

%%
% *Exercise3-2. Gradient Filter Class*
%
% Implement a class named "GradFiltSystem" so that the following
% test case passes.
%
%   classdef GradFiltSystemTestCase < matlab.unittest.TestCase
%       %GRADFILTSYSTEMTESTCASE Test Case for GradFiltSystem
%       properties
%       end
%       methods (Test)
%           function testDefaultKernel(testCase)
%               % Expectation
%               kernelExpctd = [  1  1  1 ;
%                                 0  0  0 ;
%                                -1 -1 -1 ];
%               % Instantiation of the target
%               obj = GradFiltSystem();
%               % Get property Kernel
%               kernelActual = get(obj,'Kernel');
%               % Verify property Kernel
%               testCase.verifyEqual(kernelActual,kernelExpctd)
%           end
%           function testSobelKernel(testCase)
%               % Expectation
%               kernelExpctd = [  1  2  1 ;
%                                 0  0  0 ;
%                                -1 -2 -1 ];
%               % Instantiation of the target
%               obj = GradFiltSystem('Kernel',kernelExpctd);
%               % Get property Kernel
%               kernelActual = get(obj,'Kernel');
%               % Verify property Kernel
%               testCase.verifyEqual(kernelActual,kernelExpctd)
%           end        
%           function testStepWithPrewittKernel(testCase)
%               % Preparation
%               H = [  1  1  1 ;
%                      0  0  0 ;
%                     -1 -1 -1 ];
%               % Preparation for Expectation
%               I  = imread('cameraman.tif');
%               X  = im2double(I);
%               Yv = conv2(H  ,X);        % Vertical differential
%               Yv = Yv(2:end-1,2:end-1); % Clipping
%               Yh = conv2(H.',X);        % Horizontal differential
%               Yh = Yh(2:end-1,2:end-1); % Clipping
%               magExpctd = sqrt(Yv.^2+Yh.^2); % Expectation of magnitude
%               angExpctd = atan2(Yv,Yh);      % Expectation of direction
%               % Instantiation of the target
%               obj = GradFiltSystem();
%               % Actual values
%               [magActual,angActual] = step(obj,X);
%               % Verify the results
%               testCase.verifyEqual(magActual,magExpctd,'AbsTol',1e-6)
%               testCase.verifyEqual(angActual,angExpctd,'AbsTol',1e-6)
%           end        
%       end
%   end

result = run(GradFiltSystemTestCase);

%%
% If the GradFiltSystem class is appropriately implemented,
% the test would result in success.

%%
% (Example Answer)

hrs = Hsv2RgbSystem();        
gfs = GradFiltSystem();

I = imread('cameraman.tif');     % Read an image
[mag,ang] = step(gfs,I);         % Gradient filtering
ang = (ang+pi)/(2*pi);           % Normalization of the direction
mag = min(mag,1);                % Saturation process of the magnitude
[R,G,B] = step(hrs,ang,mag,mag); % Convert to pseudo color space
J = cat(3,R,G,B);                % Concatenation to RGB array
imshow(J)                        % Image display

%%
% <html>
% <hr>
% </html>
%%
% <part2.html Part2> |
% <index.html Contents> |
% <part3.html Top> |
% <part4.html Part4>
