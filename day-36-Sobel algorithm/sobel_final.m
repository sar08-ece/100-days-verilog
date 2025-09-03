% --------------------------
% 1️⃣ Read Gaussian output
% --------------------------
outFile = 'D:\modelsim_ae\examples\gaussian_out.hex';
fid = fopen(outFile, 'r');
if fid == -1
    error('❌ Could not open file: %s', outFile);
end
data = textscan(fid, '%s');
fclose(fid);

tokens = data{1};
validHex = tokens(~cellfun(@isempty, regexp(tokens, '^[0-9A-Fa-f]{1,2}$')));
pixels = uint8(hex2dec(validHex));

N = numel(pixels);

% Auto reshape
side = floor(sqrt(N));
gaussian_img = reshape(pixels(1:side*side), side, side);

% --------------------------
% 2️⃣ Read input image
% --------------------------
inFile = 'D:\modelsim_ae\examples\image.hex';
fid = fopen(inFile,'r');
if fid == -1
    error('❌ Could not open input file: %s', inFile);
end
data_in = textscan(fid,'%s');
fclose(fid);

tokens_in = data_in{1};
validHex_in = tokens_in(~cellfun(@isempty, regexp(tokens_in, '^[0-9A-Fa-f]{1,2}$')));
pixels_in = uint8(hex2dec(validHex_in));

% Input image is 256x256
input_img = reshape(pixels_in, 256, 256);

% --------------------------
% 3️⃣ Display both images
% --------------------------
figure;

subplot(2,1,1);
imshow(input_img);
title('Original Input Image');

subplot(2,1,2);
imshow(gaussian_img);
title(sprintf('Sobel Edge Output (%dx%d)', side, side));
