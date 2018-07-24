nachos = single(imread('SampleNachos.png'))/255.0;
yMat = single([.3 .587 .114]);

nachosY = yMat * reshape(permute(nachos, [3 1 2]), 3, []);
nachosY = permute(reshape(nachosY, 8, size(nachos, 1) / 8, size(nachos, 2)), [1 3 2]);
nachosY = reshape(nachosY, 64, size(nachos, 1) / 8, size(nachos, 2) / 8);

timeVec = pi * (1:2:15) / 16;
dctVecs = cos(timeVec'*(0:7));
dctVecs = single(dctVecs ./ sqrt(dot(dctVecs, dctVecs)));

dctMat = single(zeros(64));
for y = 1:8
    for x = 1:8
        dctCoeff = dctVecs(:, x) * dctVecs(:, y)';
        dctMat((y-1)*8 + x, :) = dctCoeff(:);
    end
end

for by = 1 : size(nachosY, 3)
    for bx = 1 : size(nachosY, 2)
       nachosY(:, bx, by) = dctMat * squeeze(nachosY(:, bx, by));
    end
end

nachosY = permute(nachosY, [2 3 1]);
scaleFactor = 1.0 / (2 * max(max(max(abs(nachosY(:, :, 2:end))))));

for f = 1:size(nachosY, 3)
    if f == 1
        nachosY(:, :, f) = nachosY(:, :, f) - min(min(nachosY(:, :, f)));
        nachosY(:, :, f) = nachosY(:, :, f) ./ max(max(nachosY(:, :, f)));
    else
        nachosY(:, :, f) = 0.5 + ...
            nachosY(:, :, f) * scaleFactor;
    end
end

nachosY = reshape(nachosY, size(nachosY, 1), size(nachosY, 2), 8, 8);
nachosY = reshape(permute(nachosY, [2 4 1 3]), size(nachos, 1), size(nachos, 2));

imwrite(nachosY, 'NachosDCT.png');