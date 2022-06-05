classdef PolyfitSystemTestCase < matlab.unittest.TestCase

    methods(TestClassSetup)
        % Shared setup for the entire test class
    end

    methods(TestMethodSetup)
        % Setup for each test
    end

    methods(Test)

        % Test methods
        function testDefaultDegree(testCase)
            % 期待値　
            degExpctd = 3;
            % ターゲットクラスのインスタンス化
            obj = PolyfitSystem();
            % プロパティ Degree の取得
            degActual = obj.Degree;
            % プロパティ Degree の検証
            testCase.verifyEqual(degActual,degExpctd)
        end

        function testCoefs(testCase)
            % 準備
            x = rand(5,1); % 説明変数
            y = x.^2;    % 目的変数
            deg = 3;  % 次数
            % 期待値
            coefsExpctd = polyfit(x,y,deg);
            % ターゲットのインスタンス化
            obj = PolyfitSystem();
            % 実行結果
            coefsActual = obj.step(x,y);
            % 配列の値の検証
            testCase.verifyEqual(coefsActual,coefsExpctd);
        end

        function testSetDegree(testCase)
            % 期待値
            degExpctd = 2;
            % ターゲットクラスのインスタンス化
            obj = PolyfitSystem('Degree',degExpctd);
            % プロパティー Degree の取得
            degActual = obj.Degree;
            % プロパティー Degree の検証
            testCase.verifyEqual(degActual,degExpctd)
        end
     
        function testSize(testCase)
            % 準備
            x = [1 2 3]; % 説明変数
            y = x.^2;    % 目的変数
            deg = 2;  % 次数
            % 期待値
            szExpctd = [ 1 deg+1 ];
            % ターゲットのインスタンス化
            obj = PolyfitSystem('Degree',deg);
            % 実行結果
            coefs = obj.step(x,y);
            % サイズの検証
            testCase.verifySize(coefs,szExpctd);
        end
    end

end