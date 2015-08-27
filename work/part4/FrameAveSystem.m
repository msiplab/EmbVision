classdef FrameAveSystem < matlab.System
    properties
        preFrame % 前フレーム
    end
    properties (DiscreteState)
        Count    % フレームカウント
    end
    properties (Access = private)
    end
    methods (Access = protected)
        % セットアップ（最初のステップ直前に実行）
        function setupImpl(obj,srcFrame)
            % 前フレームの初期化
            obj.preFrame = srcFrame;
            % フレームカウントの初期化
            obj.Count = 0;
        end
        % ステップ
        function resFrame = stepImpl(obj,srcFrame)
            % フレーム平均処理 
            resFrame = (obj.preFrame + srcFrame)/2;
            % 前フレームの更新←現フレーム
            obj.preFrame = srcFrame;
            % フレームカウントのインクリメント
            obj.Count = obj.Count+1;
        end
        % リセット
        function resetImpl(obj)
            % フレームカウントのリセット
            obj.Count = 0;
        end
    end
end