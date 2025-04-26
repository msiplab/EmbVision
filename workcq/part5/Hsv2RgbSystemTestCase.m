classdef Hsv2RgbSystemTestCase < matlab.unittest.TestCase
    %HSV2RGBSYSTEMTESTCASE Hsv2RgbSystem のテストケース
    properties
    end
    methods (Test)
        function testSize(testCase)
            % 準備
            h = zeros(1,2);
            s = zeros(1,2);
            v = zeros(1,2);
            % 期待値
            szRExpctd = [ 1 2 ];
            szGExpctd = [ 1 2 ];
            szBExpctd = [ 1 2 ];
            % ターゲットのインスタンス化
            obj = Hsv2RgbSystem();
            % 実行結果
            [r,g,b] = obj.step(h,s,v);
            % サイズの検証
            testCase.verifySize(r,szRExpctd);
            testCase.verifySize(g,szGExpctd);
            testCase.verifySize(b,szBExpctd);
        end
        function testValues(testCase)
            % 準備
            h = rand(4,6);
            s = rand(4,6);
            v = rand(4,6);
            hsv = cat(3,h,s,v); % 三次元配列化
            % 期待値
            rgbExpctd = hsv2rgb(hsv); 
            % ターゲットのインスタンス化
            obj = Hsv2RgbSystem();
            % 実行結果
            [rActual,gActual,bActual] = obj.step(h,s,v);
            % 配列の値の検証
            testCase.verifyEqual(rActual,rgbExpctd(:,:,1));
            testCase.verifyEqual(gActual,rgbExpctd(:,:,2));
            testCase.verifyEqual(bActual,rgbExpctd(:,:,3));
        end
    end
end