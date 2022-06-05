classdef PolyvalSystemTestCase < matlab.unittest.TestCase
% POLYVALSYSTEMTESTCASE PolyvalSystem のテストケース
    methods(TestClassSetup)
        % Shared setup for the entire test class
    end

    methods(TestMethodSetup)
        % Setup for each test
    end

    methods(Test)
        % Test methods
        function testSuper(testCase)
            % 準備
            P = [1 0];    % 多項式
            Gray = zeros(256,256);  % 画像
            
            % 期待値の設定
            superExpctd = 256.*eye(256);
            % ターゲットのインスタンス化
            obj = PolyvalSystem();
            % 実行結果（実現値の取得）
            superActual = obj.step(P,Gray);
            % 配列の値の検証
            testCase.verifyEqual(superActual,superExpctd);
        end

        %function unimplementedTest(testCase)
        %    testCase.verifyFail("Unimplemented test");
        %end
    end

end