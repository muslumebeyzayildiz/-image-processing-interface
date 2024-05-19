function [yuv_img] = FonkRGB2YUV(rgb_img)
 % RGB görüntüyü double türüne dönüştür
    rgb_img = double(rgb_img);

    % RGB renk uzayından YUV renk uzayına dönüşüm
    y = 0.299 * rgb_img(:, :, 1) + 0.587 * rgb_img(:, :, 2) + 0.114 * rgb_img(:, :, 3);
    u = -0.147 * rgb_img(:, :, 1) - 0.289 * rgb_img(:, :, 2) + 0.436 * rgb_img(:, :, 3);
    v = 0.615 * rgb_img(:, :, 1) - 0.515 * rgb_img(:, :, 2) - 0.100 * rgb_img(:, :, 3);

    % YUV görüntüyü oluşturma
    yuv_img = cat(3, y, u, v);
end