function [imgBinary] = FonkBinary(rgbImage)
            grayImage = FonkRenkli2gri(rgbImage);

            % Eşik değerini belir
            %       le (örneğin, 128)
            threshold = 128;

            % Eşikleme işlemi. Her pikselin gri tonlamalı değeri, belirlenen bir eşik değeri (threshold) ile karşılaştırılır.
            % Eğer piksel değeri eşik değerinden büyük veya eşitse, binaryImgTrueFalse'deki karşılık gelen piksel değeri 1 (true) olur; aksi halde 0 (false) olur.
            binaryImgTrueFalse = grayImage >= threshold;

            % Binary olark Dönüşmüş resmi (binaryImgTrueFalse) imgBinary'de tutma
            % binary olarak dönüştürülmüş 'ı app.imgBinary adlı değişkende saklar.
            % binaryImage'daki 1 ve 0 değerleri, uint8 veri tipini kullanarak 255 (beyaz) ve 0 (siyah) olarak dönüştürülür.
            % Böylece, binary görüntü 0 ve 255 değerlerini kullanarak siyah ve beyaz renklerle temsil edilmiş olur.
           imgBinary = uint8(binaryImgTrueFalse * 255);
end

