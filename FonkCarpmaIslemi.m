function [resultImage] = FonkCarpmaIslemi(resim1, resim2)
    %Her iki resmin boyutlarını al
    [h1, w1, ~] = size(resim1);
    [h2, w2, ~] = size(resim2);

    % İki resmin maksimum boyutunu al
    maxH = max(h1, h2);
    maxW = max(w1, w2);

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

    % Her iki resmi çarp
    %* operatörü matris çarpımını ifade ederken, .* eleman bazlı (element-wise) (her bir)çarpımı ifade eder. 
    resultImage = uint8(double(resim1) .* double(resim2));
end
