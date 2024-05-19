function [E] = FonkMorfoKapama(img)
D=FonkMorfoGenisleme(img);
E=FonkMorfoAsinma(D);

%{
a=im2bw(img);
B=[0 1 0;1,1,1;0,1,0];

%aşınma erozyon
C = padarray(a, [1, 1]);%C=padarray(a,[0 1],1); % Sınır işlemi için kenarları ekleyin
D=false(size(a));
for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        L=C(i:i+2,j:j+2);
        K=find(B==1);
        if(L(K)==1)
            D(i,j)=1;
        end
    end

%genişleme dilation
E = padarray(D, [1, 1], 0); % Sınır işlemi için kenarları ekleyin
    F = false(size(a));
    for m = 1:size(E, 1)-2
        for n = 1:size(E, 2)-2
            F(m, j) = sum(sum(B & E(m:m+2, n:n+2)));
        end
    end
    X = F;
%}

end