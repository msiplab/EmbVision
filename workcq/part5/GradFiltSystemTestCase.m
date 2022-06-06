classdef GradFiltSystemTestCase < matlab.unittest.TestCase
    %GRADFILTSYSTEMTESTCASE GradFiltSystem のテストケース
    properties
    end
    methods (Test)
        function testDefaultKernel(testCase)
            % 期待値
            kernelExpctd = [  1  1  1 ;
                              0  0  0 ;
                             -1 -1 -1 ];
            % ターゲットクラスのインスタンス化
            obj = GradFiltSystem();
            % プロパティー Kernel の取得
            kernelActual = get(obj,'Kernel');
            % プロパティー Kernel の検証
            testCase.verifyEqual(kernelActual,kernelExpctd)
        end
        function testSobelKernel(testCase)
            % 期待値
            kernelExpctd = [  1  2  1 ;
                              0  0  0 ;
                             -1 -2 -1 ];
            % ターゲットクラスのインスタンス化
            obj = GradFiltSystem('Kernel',kernelExpctd);
            % プロパティー Kernel の取得
            kernelActual = get(obj,'Kernel');
            % プロパティー Kernel の検証
            testCase.verifyEqual(kernelActual,kernelExpctd)
        end        
        function testStepWithPrewittKernel(testCase)
            % 準備
            H = [  1  1  1 ;
                   0  0  0 ;
                  -1 -1 -1 ];
            % 期待値の準備
            I  = imread('cameraman.tif');
            X  = im2double(I);
            Yv = conv2(H  ,X);        % 垂直勾配の計算
            Yv = Yv(2:end-1,2:end-1); % 処理画像のクリッピング
            Yh = conv2(H.',X);        % 水平勾配の計算　
            Yh = Yh(2:end-1,2:end-1); % 処理画像のクリッピング
            magExpctd = sqrt(Yv.^2+Yh.^2); % 勾配の大きさの期待値
            angExpctd = atan2(Yv,Yh);     % 勾配の偏角のの期待値
            % ターゲットクラスのインスタンス化
            obj = GradFiltSystem();
            % 処理結果
            [magActual,angActual] = obj.step(X);
            % 処理結果の検証
            testCase.verifyEqual(magActual,magExpctd,'AbsTol',1e-6)
            testCase.verifyEqual(angActual,angExpctd,'AbsTol',1e-6)
        end        
    end
end
