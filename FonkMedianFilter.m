function [temizlenmisGoruntu] = FonkMedianFilter(image, filterSize)
% Görüntü boyutlarını al
    [rows, cols, channels] = size(image);
    
    % Temizlenmiş görüntüyü oluştur
    temizlenmisGoruntu = zeros(rows, cols, channels);
    
    % Filtre boyutunun yarısını al
    halfSize = floor(filterSize / 2);
    
    % Her bir piksel için medyan filtre uygula
    for i = 1:rows
        for j = 1:cols
            % Pikselin etrafındaki bölgeyi al
            rowMin = max(1, i - halfSize);
            rowMax = min(rows, i + halfSize);
            colMin = max(1, j - halfSize);
            colMax = min(cols, j + halfSize);
            
            % Bölge içindeki piksellerin medyanını hesapla
            region = image(rowMin:rowMax, colMin:colMax, :);
            medianValue = median(region, [1 2]);
            
            % Temizlenmiş görüntüde pikseli güncelle
            temizlenmisGoruntu(i, j, :) = medianValue;
        end
    end
    
    % Verilen kanalları tamsayıya dönüştür
    temizlenmisGoruntu = uint8(temizlenmisGoruntu);
end
