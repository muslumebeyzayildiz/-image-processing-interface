function [rotatedImage] = FonkRotateImage(originalImage, angle)
     % Görüntüyü döndürme işlemi için boyutları al
    [rows, cols, ~] = size(originalImage);

    % deg2rad fonksiyonu ile açı dereceden radyana çevrilir. 
    % MATLAB trigonometrik fonksiyonları radyan cinsinden çalıştığı için bu dönüşüm gerekli
    angle = deg2rad(angle);

    % Döndürülmüş görüntü için boş bir matris oluştur
    %uint8 matris, 8 bitlik unsigned integer (kesirli olmayan tamsayı) veri tipini temsil eder ve her bir pikselin renk değerlerini depolamak için kullanılır. Bu matris, piksel değerlerini 0 ile 255 arasında tutar.
    %Matlab'da, resimler genellikle uint8 veri tipinde depolanır 

    rotatedImage = uint8(zeros(rows, cols, 3));

    % Orta noktayı bul
    center_x = floor(cols / 2);
    center_y = floor(rows / 2);

    % Her pikseli döndür
    for i = 1:rows
        for j = 1:cols
            % Döndürülmüş koordinatları hesapla
            x = (i - center_y) * cos(angle) - (j - center_x) * sin(angle) + center_y;
            y = (i - center_y) * sin(angle) + (j - center_x) * cos(angle) + center_x;

            % öndürülen koordinatların sınırlarının kontrol edildiği ve 
            % eğer bu sınırlar içindeyse piksel değerlerinin kopyalandığı kısım
            if x >= 1 && x <= rows && y >= 1 && y <= cols
                % Piksel değerlerini kopyala
                %round(x) ve round(y), x ve y değerlerini en yakın tam sayıya yuvarlar. Çünkü piksel indisleri tam sayı olmalıdır.
                rotatedImage(i, j, :) = originalImage(round(x), round(y), :);
            end
        end
    end
end