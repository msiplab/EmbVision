classdef GradFiltSystem < matlab.System & ...
        matlab.system.mixin.CustomIcon %#codegen
    %GRADFILTER 勾配フィルタ
    %   勾配フィルタリングを実行

    properties
        Kernel = [ 
            1 0 -1 ;
            1 0 -1 ;
            1 0 -1 ];
    end

    properties (Access = private, Nontunable, PositiveInteger)
        imgHeight
        imgWidth
    end
    
    methods
        
        function obj = GradFiltSystem(varargin)
            % コンストラクタ
            setProperties(obj,nargin,varargin{:});
        end
        
    end
    
    methods (Access = protected)

         function setupImpl(obj,imgIn)
             
             % SETUP 関数
             obj.imgHeight = size(imgIn,1);
             obj.imgWidth  = size(imgIn,2);
             
         end
        
        
        function [magOut, angOut] = stepImpl(obj,imgIn)
            % STEP ステップ関数
            %
            %    [magOut,angOut] = step(obj,imgIn)
            %
            %  入力
            %    imgIn : 画像
            %
            %  出力
            %    magOut: 勾配ノルム
            %    angOut: 勾配偏角
            %
            
            % 実数型への変換
            imgIn = im2single(imgIn);
            
            % X方向の一次差分フィルタ
            gradXfull = conv2(imgIn,obj.Kernel);
            gradX = gradXfull(2:obj.imgHeight+1,2:obj.imgWidth+1);
            
            % Y方向の一次差分フィルタ
            gradYfull = conv2(imgIn,obj.Kernel.');
            gradY = gradYfull(2:obj.imgHeight+1,2:obj.imgWidth+1);
            
            % 勾配の大きさ
            magOut = sqrt(gradX.^2+gradY.^2);
            
            % 勾配の偏角
            angOut = atan2(gradY,gradX);
        end
        
        function N = getNumInputsImpl(~)
            % 入力端子数
            N = 1;
        end
        
        function n1 = getInputNamesImpl(~)
            % 入力端子名
            n1 = 'GRAY';
        end
        
        function N = getNumOutputsImpl(~)
            % 出力端子数
            N = 2;
        end
        
        function [n1,n2] = getOutputNamesImpl(~)
            % 出力端子名
            n1 = 'MAG';
            n2 = 'ANG';
        end
        
        function icon = getIconImpl(~)
            % ブロック名
            icon = 'GRAD_FILT';
        end

    end
    
end