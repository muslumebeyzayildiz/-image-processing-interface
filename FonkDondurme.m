function [donmus_img] = FonkDondurme(image,aci)
    image=im2double(image);
    aci=deg2rad(aci);
    donmus_img=zeros(size(image));
    donusum=[cos(aci) sin(aci);-sin(aci) cos(aci)];
    indis=1;
    for i=1:size(image,1) %satir sayısını artırıyoruz
        for j=1:size(image,2)
            nokta(:,indis)=[i;j];
            nokta(:,indis)=round(donusum*nokta(:,indis));
            indis=indis+1;
        end
    end
    if min(nokta(1,:))<1
        nokta(1,:)=nokta(1,:)+(min(nokta(1,:))*-1+1);
    end
    if min(nokta(2,:))<1
        nokta(2,:)=nokta(2,:)+(min(nokta(2,:))*-1+1);
    end
    indis=1;
    
    for i=1:size(image,1) %satir sayısını artırıyoruz
        for j=1:size(image,2)
            donmus_img(nokta(1,indis),nokta(2,indis),:)=image(i,j,:);
            indis=indis+1;
        end
    end
end