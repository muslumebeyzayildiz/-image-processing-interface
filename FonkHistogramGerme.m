function [stretched_image] = FonkHistogramGerme(image, a, b)
    % Giriş görüntüsünün boyutlarını al
    image=FonkRenkli2gri(image);
    [rows, cols] = size(image);
    
    % Giriş aralığının minimum ve maksimum değerlerini bul
    c = min(double(image(:)));
    d = max(double(image(:)));
    
    % Histogram germe işlemi formülü
    stretched_image = (double(image) - c) * ((b - a) / (d - c)) + a;
    
    % Veri tipini uint8 olarak dönüştür
    stretched_image = uint8(stretched_image);
end