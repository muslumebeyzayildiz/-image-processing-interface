function [parlakResim] = FonkParlaklikArtirma(original_img)
% Kullanıcıdan parlaklık artırma faktörünü al
    prompt = 'Parlaklık artırma faktörünü girin:';
    dlgtitle = 'Parlaklık Artırma';
    defaultInput = '50'; % Varsayılan değer
    faktorStr = inputdlg(prompt, dlgtitle, [1 50], {defaultInput});

    % Kullanıcı tarafından girilen değeri double'a çevir
    faktor = str2double(faktorStr{1});

    % Hata kontrolü: Geçersiz faktör girişi
    if isnan(faktor)
        errordlg('Geçersiz parlaklık artırma faktörü. Lütfen bir sayı girin.', 'Hata', 'modal');
        return;
    end

    % Her pikselin parlaklık değerini artır
    parlakResim = original_img + faktor;

    % Parlaklık değerini 255 ile sınırla
    parlakResim = min(parlakResim, 255);

end