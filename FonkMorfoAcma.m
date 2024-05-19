function [E] = FonkMorfoAcma(img)
D=FonkMorfoAsinma(img);
E=FonkMorfoGenisleme(D);



%{
a = im2bw(img);
B = [0 1 0; 1,1,1; 0,1,0];

% Genişleme işlemi
C = padarray(a, [1, 1]); % Sınır işlemi için kenarları ekleyin
D = false(size(a));
for i = 1:size(C, 1)-2
    for j = 1:size(C, 2)-2
        D(i, j) = sum(sum(B & C(i:i+2, j:j+2)));
    end
end

% Erozyon işlemi
E = false(size(D));
for m = 1:size(D, 1)-2
    for n = 1:size(D, 2)-2
        if D(m+1, n+1) == 5 % Tüm yapıyı içeren piksel
            E(m:m+2, n:n+2) = 1;
        end
    end
end
X = E;
%}



end