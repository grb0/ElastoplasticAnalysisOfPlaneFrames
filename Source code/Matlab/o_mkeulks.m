
function [mkeulks] = o_mkeulks(i)
%% SECTION TITLE
% DESCRIPTIVE TEXT


    % Ova funkcija formira matricu krutosti elementa u lokalnom koordinatnom sistemu.

    % Definisanje globalnih varijabli
    
    global kc pe kmipp zglob
    
    
    % Va�enje �vorova elementa i
    
    c1 = pe(i, 1);   % Prvi �vor elementa i
    c2 = pe(i, 2);   % Drugi �vor elementa i
    %% SECTION TITLE
    % DESCRIPTIVE TEXT
    
    % Va�enje koordinata X i Y �vora 1 i 2 elementa i
    
    x1 = kc(c1, 1); y1 = kc(c1, 2);   % Koordinate X i Y �vora 1
    x2 = kc(c2, 1); y2 = kc(c2, 2);   % Koordinate X i Y �vora 2
    %% SECTION TITLE
    % DESCRIPTIVE TEXT
    
    L = sqrt((x2-x1)^2 + (y2-y1)^2);   % Prora�un du�ine elementa i
    %% SECTION TITLE
    % DESCRIPTIVE TEXT
    
    % Va�enje karakteristika materijala i popre�nog presjeka
    
    E = kmipp(i, 1);   % Modul elasti�nosti elementa i
    A = kmipp(i, 2);   % Povr�ina popre�nog presjeka elementa i
    I = kmipp(i, 3);   % Moment inercije popre�nog presjeka elementa i
    
    EI = E * I;        % Krutost na savijanje
    %% SECTION TITLE
    % DESCRIPTIVE TEXT
    
    % Formiranje matrice krutosti elementa u lokalnog koordinatnom sistemu
    
    if zglob(i, 1) == 0 && zglob(i, 2) == 1
        mkeulks = ((3*EI)/L^3) * [ (A*L^2)/(3*I),  0,  0,  (-A*L^2)/(3*I),  0,   0;    
                                         0,        1,  0,         0,       -1,   L;
                                         0,        0,  0,         0,        0,   0;
                                  (-A*L^2)/(3*I),  0,  0,   (A*L^2)/(3*I),  0,   0;           
                                         0,       -1,  0,         0,        1,  -L;
                                         0         L,  0,         0,       -L,  L^2];
    elseif zglob(i, 1) == 1 && zglob(i,2) == 0
        mkeulks = ((3*EI)/L^3) * [ (A*L^2)/(3*I),   0,   0,  (-A*L^2)/(3*I),   0,  0;    
                                         0,         1,   L,         0,        -1,  0;
                                         0,         L,  L^2,        0,        -L,  0;
                                  (-A*L^2)/(3*I),   0,   0,   (A*L^2)/(3*I),   0,  0;           
                                         0,        -1,  -L,         0,         1,  0;
                                         0          0,   0,         0,         0,  0];
    elseif zglob(i, 1) == 0 && zglob(i, 2) == 0
        mkeulks = ((3*EI)/L^3) * [ (A*L^2)/(3*I),  0,  0,  (-A*L^2)/(3*I),  0,  0;    
                                         0,        0,  0,         0,        0,  0;
                                         0,        0,  0,         0,        0,  0;
                                  (-A*L^2)/(3*I),  0,  0,  (A*L^2)/(3*I),   0,  0;           
                                         0,        0,  0,         0,        0,  0;
                                         0         0,  0,         0,        0,  0];
    else
        mkeulks = ((12*EI)/L^3) * [ (A*L^2)/(12*I),  0,     0,  (-A*L^2)/(12*I),  0,     0;    
                                           0,        1,    L/2,         0,       -1,    L/2;
                                           0,       L/2,  L^2/3,        0,      -L/2,  L^2/6;
                                   (-A*L^2)/(12*I),  0,     0,   (A*L^2)/(12*I),  0,     0;           
                                           0,       -1,   -L/2,         0,        1,   -L/2;
                                           0        L/2,  L^2/6,        0,      -L/2,  L^2/3];
    end
    %% SECTION TITLE
    % DESCRIPTIVE TEXT
    
end

