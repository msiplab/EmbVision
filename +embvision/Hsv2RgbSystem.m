classdef Hsv2RgbSystem < matlab.System & ...
        matlab.system.mixin.CustomIcon %#codegen
    %HSV2RGBSYSTEM HSV -> RGB 変換
    %   HSVからRGBへの変換を実行
    properties (Access = private)
        imgIn
    end
    
    methods
        
        function obj = Hsv2RgbSystem(varargin)
            % コンストラクタ
            setProperties(obj,nargin,varargin{:});
        end
        
    end
    
    methods (Access = protected)
        
        function setupImpl(obj,imgH,~,~)
            obj.imgIn = zeros(size(imgH,1),size(imgH,2),3);
        end
        
        function [imgR,imgG,imgB] = stepImpl(obj,imgH,imgS,imgV)
            % STEP ステップ関数
            %   
            %    [imgR,imgG,imgB] = step(obj,imgH,imgS,imgV)
            %
            %  入力
            %    imgH : H画像
            %    imgS : H画像
            %    imgV : H画像
            %
            %  出力
            %    imgR : R画像
            %    imgG : G画像
            %    imgB : B画像
            %
            
            % 実数型への変換
            imgH = im2single(imgH); 
            imgS = im2single(imgS); 
            imgV = im2single(imgV); 
            obj.imgIn(:,:,1) = imgH;
            obj.imgIn(:,:,2) = imgS;
            obj.imgIn(:,:,3) = imgV;
            
            % RGB->Gray変換
            imgOut = hsv2rgb(obj.imgIn);
            imgR = imgOut(:,:,1);
            imgG = imgOut(:,:,2);
            imgB = imgOut(:,:,3);
        end
        
        function N = getNumInputsImpl(~)
            % 入力端子数
            N = 3; 
        end
        
        function [n1,n2,n3] = getInputNamesImpl(~)
            % 入力端子名
            n1 = 'H';
            n2 = 'S';
            n3 = 'V';
        end                
        
        function N = getNumOutputsImpl(~)
            % 出力端子数
            N = 3; 
        end
        
        function [n1,n2,n3] = getOutputNamesImpl(~)
            % 出力端子名
            n1 = 'R';
            n2 = 'G';
            n3 = 'B';
        end                        
        
        function icon = getIconImpl(~)
            % ブロック名
            icon = 'HSV2RGB';
        end        
        
    end
    
end