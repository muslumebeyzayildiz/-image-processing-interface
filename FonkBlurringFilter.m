function [output] = FonkBlurringFilter(img,windowHalfWidth)
img = uint8(img);
[rows, columns] = size(img);
output = img; % Çıktıyı, giriş görüntüsü ile aynı boyutta başlatın.
h = 2 * windowHalfWidth + 1;
fprintf('Filter is %d rows by %d columns.\n', h, h);
for col = 1 : columns
    for row = 1 : rows
        %Pikselin etrafındaki pencereyi seçmek için satır ve sütun aralıklarını belirleyin.
        rowStart = max(1, row - windowHalfWidth);
        %Eğer pikselin bulunduğu satır, pencerenin yarı genişliğinden daha küçükse, pencerenin başlangıcı görüntünün en üst satırına (1. satır) ayarlanır. 
        %Aksi takdirde, pencerenin başlangıcı, pikselin bulunduğu satırdan pencerenin yarı genişliği kadar yukarıya ayarlanır.
        rowEnd = min(rows, row + windowHalfWidth);
        %Eğer pikselin bulunduğu satır, görüntünün toplam satır sayısından daha büyükse, pencerenin bitişi görüntünün en alt satırına ayarlanır. Aksi takdirde, pencerenin bitişi, pikselin bulunduğu satırdan pencerenin yarı genişliği kadar aşağıya ayarlanır.
        colStart = max(1, col - windowHalfWidth);
        colEnd = min(columns, col + windowHalfWidth);
        
        window = img(rowStart:rowEnd, colStart:colEnd);
        % Pencere içindeki piksellerin ortalamasını hesaplayın ve çıktıya atayın.
        output(row, col) = mean(window(:));
    end
end
output = uint8(output);
end

%{
for col = h : columns-h
	for row = h : rows-h
		value = img(row : (h+row-1), col : (h+col-1));
		output(row, col) = mean(value(:));
	end
end
%}

%{
   function temizlenmisGoruntu = FonkBlurringFilter(img)
    goruntu = imnoise(img, 'Gaussian', 0.04, 0.003);
    I = double (goruntu);
    sigma = 3; %Standard sarpma
    sz=3; %Box boyutu
    [x,y]=meshgrid(-sz:sz,-sz:sz);
    M = size(x,1)-1;
    N = size(y,1)-1;

    gaussian kernel oluştur
    Exp_comp=-(x.^2+y.^2)/(2*sigma^2);
    Kernel=exp(Exp_comp)/(2*pi*sigma^2);

    Output=zeros(size(I));
    I = padarray (I, [sz sz]);

     konvolüsyon işlemi
    for i=1:size (I,1)-M
        for j=1:size(I,2)-N
            Temp= I(i:i+M,j:j+M).*Kernel;
            Output(i,j)=sum(Temp(:));
        end
   end
    temizlenmisGoruntu=uint8(Output);
end

%}