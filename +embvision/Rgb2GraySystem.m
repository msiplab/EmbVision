classdef Rgb2GraySystem < matlab.System & ...
        matlab.system.mixin.CustomIcon %#codegen
    %RGB2GRAYSYSTEM RGB -> GRAY 変換
    %   RGBからグレースケールへの変換を実行
    properties
    end
    
    methods
        
        function obj = Rgb2GraySystem(varargin)
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
            %    imgIn : RGB画像
            %
            %  出力
            %    imgOut: Gray画像
            %
            
            % RGB->Gray変換
            imgOut = rgb2gray(imgIn);
        end
        
        function N = getNumInputsImpl(~)
            % 入力端子数
            N = 1; 
        end
        
        function n1 = getInputNamesImpl(~)
            % 入力端子名
            n1 = 'RGB';
        end                
        
        function N = getNumOutputsImpl(~)
            % 出力端子数
            N = 1; 
        end
        
        function n1 = getOutputNamesImpl(~)
            % 出力端子名
            n1 = 'GRAY';
        end                        
        
        function icon = getIconImpl(~)
            % ブロック名
            icon = 'RGB2GRAY';
        end        
        
    end
    
end

