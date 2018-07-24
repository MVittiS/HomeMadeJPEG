nachos = single(imread('SampleNachos.png'));
yuvMat = single([.3 .587 .114; ...
                -.14713 -.28886 .436; ...
                .615 -.5145 -.1]);                
rgbMat = inv(yuvMat);

nachosYUV = yuvMat * reshape(permute(nachos, [3 1 2]), 3, []);
nachosYUV = permute(reshape(nachosYUV, 3, size(nachos, 1), size(nachos, 2)), [2 3 1]);

nachosY = nachosYUV;
nachosY(:, :, 2:3) = 0;
nachosY = rgbMat * reshape(permute(nachosY, [3 1 2]), 3, []);
nachosY = permute(reshape(nachosY, 3, size(nachos, 1), size(nachos, 2)), [2 3 1]);

nachosU = nachosYUV;
nachosU(:, :, 1) = 0.5;
nachosU(:, :, 2) = nachosU(:, :, 2) * 4; % We multiply for better color visualization
nachosU(:, :, 3) = 0;
nachosU = rgbMat * reshape(permute(nachosU, [3 1 2]), 3, []);
nachosU = permute(reshape(nachosU, 3, size(nachos, 1), size(nachos, 2)), [2 3 1]);

nachosV = nachosYUV;
nachosV(:, :, 1) = 0.5;
nachosV(:, :, 2) = 0;
nachosV(:, :, 2) = nachosV(:, :, 2) * 4;
nachosV = rgbMat * reshape(permute(nachosV, [3 1 2]), 3, []);
nachosV = permute(reshape(nachosV, 3, size(nachos, 1), size(nachos, 2)), [2 3 1]);


imwrite([nachos nachosY nachosU nachosV], "NachosYUV.png");