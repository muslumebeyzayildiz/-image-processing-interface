function [D] = FonkMorfoAsinma(img)
a=im2bw(img);
B=[0 1 0;1,1,1;0,1,0];
C=padarray(a,[0 1],1);
D=false(size(a));
for i=1:size(C,1)-2
    for j=1:size(C,2)-2
        L=C(i:i+2,j:j+2);
        K=find(B==1);
        if(L(K)==1)
            D(i,j)=1;
        end
    end
end
