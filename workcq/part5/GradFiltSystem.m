classdef GradFiltSystem < matlab.System
    properties
        Kernel = [ 
             1  1  1 ; % 初期化したプロパティ
             0  0  0 ;
            -1 -1 -1 ];
    end
    properties (DiscreteState)
    end
    properties (Access = private)
    end
    methods
        % コンストラクタ
        function obj = GradFiltSystem(varargin)
            setProperties(obj,nargin,varargin{:})
        end
    end
    methods (Access = protected)
        % セットアップ（最初のステップ直前に実行）
        function setupImpl(obj,srcImg)
        end
        % ステップ
        function [mag,ang] = stepImpl(obj,srcImg)
            X  = im2double(srcImg);
            Yv = conv2(obj.Kernel  ,X); % 垂直勾配の計算
            Yv = Yv(2:end-1,2:end-1);   % 処理画像のクリッピング
            Yh = conv2(obj.Kernel.',X); % 水平勾配の計算　
            Yh = Yh(2:end-1,2:end-1);   % 処理画像のクリッピング
            mag = sqrt(Yv.^2+Yh.^2);    % 勾配の大きさの期待値
            ang = atan2(Yv,Yh);         % 勾配の偏角のの期待値
        end
        % リセット
        function resetImpl(obj)
        end    
        % 入力ポート名
        function inputName = getInputNamesImpl(obj)
            inputName = 'Gray';
        end
        % 出力ポート名        
        function [outputName1,outputName2] = getOutputNamesImpl(obj)
            outputName1 = 'Mag.';
            outputName2 = 'Ang.';
        end
        % アイコン
        function icon = getIconImpl(obj)
           icon = sprintf('Grad. Filt.');
        end        
    end
end