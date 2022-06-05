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
               obj = PolyfitSystem('Degree',deg);
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
            obj = PolyfitSystem('Degree',deg);
            % 実行結果
            vaActual = obj.step(x,y);
            % 配列の値の検証
            testCase.verifyEqual(vaActual,vaExpctd);
        end
        function testDefaultDegree(testCase)
            % 期待値　
            degExpctd = 3;
            % ターゲットクラスのインスタンス化
            obj = PolyfitSystem();
            % プロパティー Kernel の取得
            degActual = obj.Degree;
            % プロパティー Kernel の検証
            testCase.verifyEqual(degActual,degExpctd)
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
    
    end

end