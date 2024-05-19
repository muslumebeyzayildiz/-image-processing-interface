function [grayImage] = FonkRenkli2gri(rgbImage)
% Gri tonlamalı görüntüyü elde et
[m, n, ~] = size(rgbImage);  % Görüntü boyutlarını al
grayImage = zeros(m, n);     % Gri tonlamalı görüntü için boş (SİYAH) matris oluştur

% Her pikselin RGB değerlerini kullanarak gri tonlamalı değeri hesapla
for i = 1:m % satırı (yüksekliği)  temsil eden m boyunca çalışır.
    % döngü her çalıştığında 1'den m'e kadar olan değerleri alır.
    for j = 1:n % döngüsü,sütunu (genişliği) temsil eden n boyunca çalışır.
        red = rgbImage(i, j, 1);
        green = rgbImage(i, j, 2);
        blue = rgbImage(i, j, 3);

        % Gri tonlamalı değeri hesapla
        % Bu yöntem, renkli bir görüntüyü gri tonlamalıya dönüştürürken, her renk bileşenine farklı ağırlıklar verir.
        % Bu ağırlıklar, renklerin insan gözü tarafından algılanan parlaklık seviyelerini temsil eder.
        % Bu katsayılar, tipik olarak kullanılan bir dönüşüm formülü olan "luminosity method" için önerilen değerlerdir.

        grayValue = 0.299 * red + 0.587 * green + 0.114 * blue;

        % Gri tonlamalı görüntü matrisine ata
        % i satır ve j sütun
        grayImage(i, j) = grayValue;
    end
end
end

