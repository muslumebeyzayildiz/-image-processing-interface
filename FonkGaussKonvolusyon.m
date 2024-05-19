function output = FonkGaussKonvolusyon(image)
    % making a gaussian kernel
    I=FonkRenkli2gri(image);
    sigma=1; %Gauss filtresi içi Dağılımın standart sapması
    %çünkü çekirdeği yine de normalleştireceğiz, dolayısıyla yalnızca üstel kısım önemli olacak.

    kernel=zeros(5,5);%5x5 boyutunda bir çekirdek matrisi oluşturulur.
    % Çekirdeğin her bir elemanı, Gauss fonksiyonundan gelen değerlere dayanarak hesaplanır. 
    % Daha sonra, çekirdek normalleştirilir.
    W=0;%Bu değişken, çekirdeğin tüm elemanlarının toplamını tutacak
    for i=1:5
        for j=1:5
            sq_dist=(i-3)^2+(j-3)^2;
            %Her bir elemanın konumuna bağlı olarak, merkeze olan uzaklıkları hesaplanır. 
            % Çekirdek matrisinin ortasına odaklanmak için, her elemanın konumundan 3 çıkarılır ve bu konumun karesi alınır.
            kernel(i,j)=exp(-1*(sq_dist)/(2*sigma*sigma));
            %Gauss fonksiyonunun değeri hesaplanır ve çekirdek matrisine atanır. 
            % Gauss fonksiyonu, elemanın merkeze olan uzaklığına bağlı olarak bir ağırlık verir.
            W=W+kernel(i,j);%Çekirdeğin tüm elemanlarının toplamı hesaplanır. Bu, çekirdeği normalleştirmek için kullanılacaktır.
        end
    end
    kernel=kernel/W;%Çekirdek matrisi, toplam ağırlıklarının tersiyle bölünerek normalleştirilir. Bu, çekirdeğin toplam ağırlığının 1 olmasını sağlar
        
    [m,n]=size(I);
    output=zeros(m,n);
    Im=padarray(I,[2 2]);%Görüntünün kenarlarına bir kenarlık eklenerek (padarray kullanılarak) görüntü genişletilir. 
    %Bu, kenar piksellerin de filtreye dahil edilmesini sağlar.
    
    for i=1:m
        for j=1:n
            temp=Im(i:i+4, j:j+4);%Her bir pikselin etrafındaki 5x5 boyutundaki bölge geçici bir değişkene (temp) atanır.
            temp=double(temp);
            convolution=temp.*kernel;
            %Geçici bölge ile Gauss filtresi arasında nokta nokta çarpım yapılır. Bu, her bir piksel değerinin, çekirdek elemanları ile çarpılması demektir. 
            % Bu işlem, piksel değerlerinin filtre çekirdeği tarafından belirlenen ağırlıklarla çarpılmasını sağlar.
            output(i,j)=sum(convolution(:));
        end
    end
    output=uint8(output);
end
