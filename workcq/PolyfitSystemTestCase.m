classdef PolyfitSystemTestCase < matlab.unittest.TestCase

    methods(TestClassSetup)
        % Shared setup for the entire test class
    end

    methods(TestMethodSetup)
        % Setup for each test
    end

    methods(Test)
        % Test methods
        function testSize(testCase)
               % 準備
               x = [1 2 3]; % 説明変数
               y = x.^2;    % 目的変数
               deg = 2;  % 次数
               % 期待値
               szExpctd = [ 1 deg+1 ];
               % ターゲットのインスタンス化
               obj = PolyfitSystem('Deg',deg);
               % 実行結果
               p = step(obj,x,y);
               % サイズの検証
               testCase.verifySize(p,szExpctd);
        end
        function testValues(testCase)
            % 準備
            x = rand(5,1); % 説明変数
            y = x.^2;    % 目的変数
            deg = 3;  % 次数
            % 期待値
            vaExpctd = polyfit(x,y,deg);
            % ターゲットのインスタンス化
            obj = PolyfitSystem('Deg',deg);
            % 実行結果
            vaActual = step(obj,x,y);
            % 配列の値の検証
            testCase.verifyEqual(vaActual,vaExpctd);
        end
        function testDefaultKernel(testCase)
            % 期待値　
            degExpctd = 3;
            % ターゲットクラスのインスタンス化
            obj = PolyfitSystem();
            % プロパティー Kernel の取得
            degActual = get(obj,'Deg');
            % プロパティー Kernel の検証
            testCase.verifyEqual(degActual,degExpctd)
        end
        function testSobelDeg(testCase)
            % 期待値
            degExpctd = 3;
            % ターゲットクラスのインスタンス化
            obj = PolyfitSystem('Deg',degExpctd);
            % プロパティー Deg の取得
            degActual = get(obj,'Deg');
            % プロパティー Deg の検証
            testCase.verifyEqual(degActual,degExpctd)
        end
    end

end