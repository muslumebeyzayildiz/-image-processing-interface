function [resultImage] = FonkToplamaIslemi(resim1, resim2)
    %Her iki resmin boyutlarını al
    [h1, w1, ~] = size(resim1);
    [h2, w2, ~] = size(resim2);
    
    % İki resmin maksimum boyutunu al
    maxH = max(h1, h2);
    maxW = max(w1, w2);

    % Her iki resmi de aynı boyuta getir PADDARY HAZIR FONKUYLA DA YAPILABİLİRDİ
    %resim1 = padarray(resim1, [maxH-h1, maxW-w1], 0, 'post');
    %resim2 = padarray(resim2, [maxH-h2, maxW-w2], 0, 'post');
    
    %padarray SİZ İÇİN
    % Her iki resmi de aynı boyuta getir
    eklenecekSatir1 = maxH - h1;
    eklenecekSutun1 = maxW - w1;
    eklenecekSatir2 = maxH - h2;
    eklenecekSutun2 = maxW - w2;

    % İlk resmi eşitle
    resim1 = [resim1; zeros(eklenecekSatir1, w1, 3)]; % Sıfırlarla doldurulan satırlar eklenir
    resim1 = [resim1, zeros(maxH, eklenecekSutun1, 3)]; % Sıfırlarla doldurulan sütunlar eklenir
    
    % İkinci resmi eşitle
    resim2 = [resim2; zeros(eklenecekSatir2, w2, 3)]; % Sıfırlarla doldurulan satırlar eklenir
    resim2 = [resim2, zeros(maxH, eklenecekSutun2, 3)]; % Sıfırlarla doldurulan sütunlar eklenir

    % Her iki resmi topla
    resultImage = uint8(double(resim1) + double(resim2));
end

