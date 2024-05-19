function [lab_img] = FonkRGB2LAB(rgb_img)
    % RGB görüntüyü double türüne dönüştür
    rgb_img = double(rgb_img);

    % Normalizasyon (0-1 aralığında)
    rgb_img = rgb_img / 255;

    % RGB renk uzayından XYZ renk uzayına dönüşüm
    xyz_img = rgb2xyz(rgb_img);

    % XYZ renk uzayından Lab renk uzayına dönüşüm
    lab_img = xyz2lab(xyz_img);
end