classdef Rgb2GraySystem < matlab.System & ...
        matlab.system.mixin.CustomIcon %#codegen
    %RGB2GRAYSYSTEM RGB -> GRAY 変換
    %   RGBからグレースケールへの変換を実行
    properties (Access = private)
        imgIn
    end
    
    methods
        
        function obj = Rgb2GraySystem(varargin)
            % コンストラクタ
            setProperties(obj,nargin,varargin{:});
        end
        
    end
    
    methods (Access = protected)
        
        function setupImpl(obj,imgR,~,~)
            obj.imgIn = zeros(size(imgR,1),size(imgR,2),3);
        end
        
        function imgY = stepImpl(obj,imgR,imgG,imgB)
            % STEP ステップ関数
            %   
            %    imgY = step(obj,imgR,imgG,imgB)
            %
            %  入力
            %    imgR : R画像
            %    imgG : G画像
            %    imgB : B画像            
            %
            %  出力
            %    imgY : Gray画像
            %
            
            % RGB->Gray変換
            obj.imgIn(:,:,1) = im2single(imgR); 
            obj.imgIn(:,:,2) = im2single(imgG); 
            obj.imgIn(:,:,3) = im2single(imgB); 
            imgY = rgb2gray(obj.imgIn);
        end
        
        function N = getNumInputsImpl(~)
            % 入力端子数
            N = 3; 
        end
        
        function [n1,n2,n3] = getInputNamesImpl(~)
            % 入力端子名
            n1 = 'R';
            n2 = 'G';
            n3 = 'B';
        end                
        
        function N = getNumOutputsImpl(~)
            % 出力端子数
            N = 1; 
        end
        
        function n1 = getOutputNamesImpl(~)
            % 出力端子名
            n1 = 'Y';
        end                        
        
        function icon = getIconImpl(~)
            % ブロック名
            icon = 'RGB2GRAY';
        end        
        
    end
    
end