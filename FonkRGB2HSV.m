function [hsv_img] = FonkRGB2HSV(rgb_img)
% RGB görüntüyü double türüne dönüştür
    rgb_img = double(rgb_img);

    % Normalizasyon (0-1 aralığında)
    rgb_img = rgb_img / 255;

    % RGB renk uzayından HSV renk uzayına dönüşüm
    r = rgb_img(:, :, 1);
    g = rgb_img(:, :, 2);
    b = rgb_img(:, :, 3);

    c_max = max(max(r, g), b);
    c_min = min(min(r, g), b);
    delta = c_max - c_min;

    % Hue (ton) hesaplama
    h = zeros(size(r));
    h(delta == 0) = 0;
    h(c_max == r & delta ~= 0) = 60 * mod((g(c_max == r & delta ~= 0) - b(c_max == r & delta ~= 0)) ./ delta(c_max == r & delta ~= 0), 6);
    h(c_max == g & delta ~= 0) = 60 * ((b(c_max == g & delta ~= 0) - r(c_max == g & delta ~= 0)) ./ delta(c_max == g & delta ~= 0) + 2);
    h(c_max == b & delta ~= 0) = 60 * ((r(c_max == b & delta ~= 0) - g(c_max == b & delta ~= 0)) ./ delta(c_max == b & delta ~= 0) + 4);

    % Saturation (doygunluk) hesaplama
    s = zeros(size(r));
    s(c_max ~= 0) = delta(c_max ~= 0) ./ c_max(c_max ~= 0);

    % Value (değer) hesaplama
    v = c_max;

    % HSV görüntüyü oluşturma
    hsv_img = cat(3, h, s, v);
end