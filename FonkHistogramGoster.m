function [histogram] = FonkHistogramGoster(image)
  image=FonkRenkli2gri(image);
  [m, n] = size(image);
  % Histogramı hesaplamak için 256 tane 0 değeri içeren bir dizi oluştur
  histogram = zeros(256, 1);

  % Görüntü üzerinde dolaşarak histogramı hesapla
    for i = 1:m
        for j = 1:n
            % Görüntü piksel değerini al
            piksel = image(i, j);

            % Histograma ilgili piksel değerinin bir artışını kaydet
            histogram(piksel + 1) = histogram(piksel + 1) + 1;
        end
    end
end