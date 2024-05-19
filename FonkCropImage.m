function [croppedImage] = FonkCropImage(originalImage, startX, startY, endX, endY)
 % Görüntü boyutlarını al
    [rows, cols, ~] = size(originalImage);

    % Koordinat sınırlarını kontrol et
    %max fonksiyonu, iki değer arasında maksimum değeri döndürür. 
    % Burada, başlangıç koordinatları 1'den küçükse, onları 1 olarak ayarlar.
    startX = max(1, startX);
    startY = max(1, startY);

    % min fonksiyonu, iki değer arasında minimum değeri döndürür.
    % Burada, bitiş koordinatları, sütun sayısı cols'den büyükse, onları cols olarak, 
    % satır sayısı rows'dan büyükse, onları rows olarak ayarlar. 
    % Bu işlem, görüntü sınırları içinde kalmayı sağlar.
    endX = min(cols, endX);
    endY = min(rows, endY);


    % : MATLAB'da "tümü" veya "aralığı" ifade eden bir operatördür. B

    % startY:endY: Yükseklik (satır) boyunca seçilen alt matrisin satırları, startY ile endY arasındaki satırları içerir.
    %ifadesi, startY indeksinden başlayarak endY indeksine kadar olan satırları seçer.

    % startX:endX: Genişlik (sütun) boyunca seçilen alt matrisin sütunları, startX ile endX arasındaki sütunları içerir.
    %ifadesi, startX indeksinden başlayarak endX indeksine kadar olan sütunları seçer.
    % : ifadesi, üçüncü boyuttaki (renk kanalları) tüm elemanları seçer.
    
    croppedImage = originalImage(startY:endY, startX:endX, :);


end
