function [zoomedImage] = FonkYakinlastirUzak(originalImage, scaleFactor)
   % Görüntü boyutlarını al
    [m, n, ~] = size(originalImage);

    % Yeni boyutları hesapla
    new_m = round(m * scaleFactor);
    new_n = round(n * scaleFactor);

    % Yeni görüntüyü oluştur
    zoomedImage = uint8(zeros(new_m, new_n, 3));

    % Zooming/Uzaklastirma işlemi
    for i = 1:new_m  % Yeni (büyütülmüş veya küçültülmüş) görüntünün satırlarını dolaşmak için
        for j = 1:new_n 
            %Yeni görüntünün her bir pikselinin orijinal görüntüdeki hangi 
            % pikseline karşılık geldiğini belirlemek için scaleFactor ile bölme işlemi yapılarak satır ve sütun indeksleri bulunur.
            originalRow = round(i / scaleFactor);
            originalCol = round(j / scaleFactor);

            % Koordinat sınırlarını kontrol et
            % Bulunan orijinal satır ve sütun indeksleri, orijinal görüntünün boyutları içinde kalacak şekilde sınırlanır.
            originalRow = max(1, min(m, originalRow));
            originalCol = max(1, min(n, originalCol));

            % Yeni görüntüyü oluştur
            %Yeni görüntü üzerindeki her bir piksele, orijinal görüntüdeki uygun piksel değeri atanır. originalImage(originalRow, originalCol, :) ifadesi, orijinal görüntüdeki belirli bir pikselin renk değerlerini içerir
            zoomedImage(i, j, :) = originalImage(originalRow, originalCol, :);
        end
    end
end



