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
            xmax = 4;
            x = 1:xmax; % 説明変数
            y = x.^2;   % 目的変数
            BW = zeros(xmax^2,xmax); % 座標を二値画像に変換 
            for idx = 1:length(x)
                BW(y(idx),x(idx)) = 1;
            end
            deg = 3;  % 次数
            % 期待値の設定
            coefsExpctd = polyfit(x,y,deg);
            % ターゲットのインスタンス化
            obj = PolyfitSystem();
            % 実行結果（実現値の取得）
            coefsActual = obj.step(BW);
            % 配列の値の検証
            testCase.verifyEqual(coefsActual,coefsExpctd,'AbsTol',1e-9);
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