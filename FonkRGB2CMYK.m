function [cmyk_img] = FonkRGB2CMYK(rgb_img)
    % RGB görüntüyü double türüne dönüştür
    rgb_img = double(rgb_img);

    % Normalizasyon (0-1 aralığında)
    rgb_img = rgb_img / 255;

    % RGB renk uzayından CMY renk uzayına dönüşüm
    c = 1 - rgb_img(:, :, 1);
    m = 1 - rgb_img(:, :, 2);
    y = 1 - rgb_img(:, :, 3);

    % K (Key/Black) bileşenini hesapla
    k = min(min(c, m), y);

    % CMYK görüntüyü oluşturma     cmyk_img = cat(3, c, m, y, k);
    % Her bir bileşeni ayrı ayrı göstermek için subplot kullan
    
end