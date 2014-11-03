classdef Hsv2RgbSystem < matlab.System & ...
        matlab.system.mixin.CustomIcon %#codegen
    %HSV2RGBSYSTEM HSV -> RGB 変換
    %   HSVからRGBへの変換を実行
    properties
    end
    
    methods
        
        function obj = Hsv2RgbSystem(varargin)
            % コンストラクタ
            setProperties(obj,nargin,varargin{:});
        end
        
    end
    
    methods (Access = protected)
        
        function imgOut = stepImpl(~,imgIn)
            % STEP ステップ関数
            %   
            %    imgOut = step(obj,imgIn)
            %
            %  入力
            %    imgIn : HSV画像
            %
            %  出力
            %    imgOut: RGB画像
            %
            
            % 実数型への変換
            imgIn = im2single(imgIn);
            
            % RGB->Gray変換
            imgOut = hsv2rgb(imgIn);
        end
        
        function N = getNumInputsImpl(~)
            % 入力端子数
            N = 1; 
        end
        
        function n1 = getInputNamesImpl(~)
            % 入力端子名
            n1 = 'HSV';
        end                
        
        function N = getNumOutputsImpl(~)
            % 出力端子数
            N = 1; 
        end
        
        function n1 = getOutputNamesImpl(~)
            % 出力端子名
            n1 = 'RGB';
        end                        
        
        function icon = getIconImpl(~)
            % ブロック名
            icon = 'HSV2RGB';
        end        
        
    end
    
end

