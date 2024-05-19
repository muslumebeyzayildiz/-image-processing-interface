function [expanded_image] = FonkHistogramGenislet(image)
    image=FonkRenkli2gri(image);
    % Görüntüyü double türüne dönüştür
    image = double(image);
    [m,n]=size(image);
    expanded_image=image;
    % Görüntünün en küçük ve en büyük piksel değerlerini bul
    minp = min(min(image));
    maxp = max(max(image));

    % Histogram genişletme işlemi
    for i=1:m
        for j=1:n
            expanded_image(i,j)=((250/(maxp-minp)).*(image(i,j)-minp));
        end
    end
    expanded_image = uint8(expanded_image);
end
