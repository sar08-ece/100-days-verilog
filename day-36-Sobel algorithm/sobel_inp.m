% Load built-in image
I = imread('cameraman.tif');   % 256x256 grayscale

% Convert to uint8
I = uint8(I);

% Save in your ModelSim project folder
outFile = 'D:\modelsim_ae\examples\image.hex';  

fid = fopen(outFile,'w');
if fid == -1
    error('❌ Could not open file. Check folder permissions: %s', outFile);
end

% Write pixel values to hex (00–FF)
for r = 1:256
    for c = 1:256
        fprintf(fid,'%02x\n', I(r,c));
    end
end
fclose(fid);

fprintf('✅ image.hex created successfully at: %s\n', outFile);
