classdef PolyvalColorSystemTestCase < matlab.unittest.TestCase
% POLYVALCOLORSYSTEMTESTCASE PolyvalColorSystem のテストケース
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
            RGB = zeros(256,256,3);  % 画像
            
            % 期待値の設定
            superExpctd = cat(3,0.*eye(256),200.*eye(256),200.*eye(256));
            % ターゲットのインスタンス化
            obj = PolyvalColorSystem();
            % 実行結果（実現値の取得）
            superActual = obj.step(P,RGB);
            % 配列の値の検証
            testCase.verifyEqual(superActual,superExpctd);
        end
        %function unimplementedTest(testCase)
        %    testCase.verifyFail("Unimplemented test");
        %end
    end

end