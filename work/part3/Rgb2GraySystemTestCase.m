classdef Rgb2GraySystemTestCase < matlab.unittest.TestCase
    %RGB2GRAYSYSTEMTESTCASE Rgb2GraySystem のテストケース
    properties
    end
    methods (Test)
        function testSize(testCase)
            % 準備
            u = zeros(1,2,3);   % 1行2列3成分の三次元配列
            % 期待値
            szExpctd = [ 1 2 ]; % 1行2列の二次元配列
            % ターゲットのインスタンス化
            obj = Rgb2GraySystem();
            % 実行結果
            y = step(obj,u);
            % サイズの検証
            testCase.verifySize(y,szExpctd);
        end
        function testValues(testCase)
            % 準備
            u = rand(4,6,3);           % 三次元ランダム配列
            % 期待値
            arrayExpctd = rgb2gray(u); % グレースケールの期待値
            % ターゲットのインスタンス化
            obj = Rgb2GraySystem();
            % 実行結果
            arrayActual = step(obj,u);
            % 配列の値の検証
            testCase.verifyEqual(arrayActual,arrayExpctd);
        end
    end
end

