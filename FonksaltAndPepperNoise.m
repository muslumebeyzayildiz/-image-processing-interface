function [gurultuluGoruntu] = FonksaltAndPepperNoise(image, noiseLevel)
% Görüntü boyutlarını al
    [rows, cols, channels] = size(image);
    
    % Gürültü ekleme için rastgele piksel seç
    numPixels = floor(rows * cols * noiseLevel);
    noiseImage = image;
    for i = 1:numPixels
        x = randi(rows);
        y = randi(cols);
        % Kanalları dolaşarak rastgele seçilen pikselleri beyaz veya siyah yap
        for c = 1:channels
            if rand < 0.5
                noiseImage(x, y, c) = 0; % Siyah piksel (salt noise)
            else
                noiseImage(x, y, c) = 255; % Beyaz piksel (pepper noise)
            end
        end
    end
    
    % Gürültülü görüntüyü döndür
    gurultuluGoruntu = uint8(noiseImage);
end