function [L] = o_L(i)

    % Ova funkcija ra�una du�inu elementa i
    
    % Definisanje globalnih varijabli
    
    global kc pe 
    
    % Va�enje �vorova elementa i
    
    c1 = pe(i, 1);   % Prvi �vor elementa i
    c2 = pe(i, 2);   % Prvi �vor elementa 2
    
    % Va�enje koordinata X i Y �vora 1 i 2
    
    x1 = kc(c1, 1); y1 = kc(c1, 2);    % Koordinate X i Y �vora 1
    x2 = kc(c2, 1); y2 = kc(c2, 2);    % Koordinate X i Y �vora 2

    L = sqrt((x2-x1)^2 + (y2-y1)^2);   % Prora�un du�ine elementa i
    
end

