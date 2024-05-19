function binaryImage = amele_Graythresh(image)

    % Görüntüyü gri tonlamalıya dönüştür
    grayImage = rgb2gray(image);
    
    % Görüntünün boyutlarını al
    [M, N] = size(grayImage);
    
    % Görüntünün tüm piksel değerlerini bir vektöre dönüştür
    pixelValues = reshape(grayImage, M * N, 1);
    
    % Her bir piksel değeri için tekrar sayılarını hesapla
    uniqueValues = unique(pixelValues);
    counts = zeros(size(uniqueValues));
    for i = 1:length(uniqueValues)
        counts(i) = sum(pixelValues == uniqueValues(i));
    end
    
    % En çok tekrar eden piksel değerini bul
    [~, maxIndex] = max(counts);
    modeValue = uniqueValues(maxIndex);
    
    % Eşik değeri belirleme
    threshold = modeValue;
    
    % Eşik değerine göre görüntüyü işleme
    binaryImage = zeros(M, N);
    for i = 1:M
        for j = 1:N
            if grayImage(i, j) < threshold
                binaryImage(i, j) = 0;
            else
                binaryImage(i, j) = 255;
            end
        end
    end
end