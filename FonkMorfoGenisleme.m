function [D] = FonkMorfoGenisleme(img)
a=im2bw(img);
B=[0 1 0;1,1,1;0,1,0];
C=padarray(a,[0 3]);

D=false(size(a));
for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        D(i,j)=sum(sum(B&C(i:i+2,j:j+2)));
    end
end

