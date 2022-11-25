% Limpiamos todo
clear all; clc;
% Leemos la imagen y sus caracteristicas
Im = imread("arco2.jpg");
[Filas, Columnas, P] = size(Im);
% Creamos las matrices
H = zeros(Filas, Columnas);
S = zeros(Filas, Columnas);
I = zeros(Filas, Columnas);
Dim = double(Im);
% Empezamos con el barrido de la imagen para convertirla en HSI
for x=1:Filas
    for y=1:Columnas
        R = Dim(x,y,1);
        G = Dim(x,y,2);
        B = Dim(x,y,3);
        
        if((R == G) &&(R == B) && (G == B))
            H(x,y) = 0;
            S(x,y) = 0;
        else
%         Operacion para H
        numeradorH = ((R - G) + (R - B))/2;
        denominadorH = sqrt(power((R - G),2) + ((R - B) * (G - B)));
        H(x,y) = acosd(numeradorH/denominadorH);
        if (H(x,y) > 180)
            H(x,y) = 360 - H(x,y);
        end
%         Operacion para S
        numeradorS = 3 * min([R, G, B]);
        denominadorS = R + G + B;
        S(x,y) = 1 - (numeradorS/denominadorS);
        end

%         Operacion para I
        I(x,y) = (R + G + B)/(3);        
    end
end
% Nueva imagen
HSIim = zeros(Filas, Columnas, P);
HSIim(:,:,1) = H;
HSIim(:,:,2) = S;
HSIim(:,:,3) = I;

% Cambio de color
% RGBmaxmin = [40, 60, 0; 40, 75, 0];
Maximo = 75;
Minimo = 40;
for x=1:Filas
    for y=1:Columnas
        if ((H(x,y) > Minimo) && (H(x,y) < Maximo))
              H(x,y) = 350;
        end
    end
end

% De regreso a RGB
RGBim = zeros(Filas, Columnas, P);
for x=1:Filas
    for y=1:Columnas
%         Primer caso
        if ((0 <= H(x,y)) && (H(x,y) < 120))
%             Para el valor B
            B = I(x,y) * (1-S(x,y));
%             Para el valor R
            numeradorR = S(x,y) * cosd(H(x,y));
            denominadorR = cosd(60 - H(x,y));
            R = I(x,y) * (1 + (numeradorR/denominadorR));
%             Para el valor G
            G = (3 * I(x,y)) - R - B;
%             Asignacion de valores
            RGBim(x,y,1) = round(R);
            RGBim(x,y,2) = round(G);
            RGBim(x,y,3) = round(B);
        end

%         Segundo caso
        if ((120 <= H(x,y)) && (H(x,y) < 240))
%             Para el valor R
            R = I(x,y) * (1-S(x,y));
%             Para el valor G
            numeradorR = S(x,y) * cosd(H(x,y) - 120);
            denominadorR = cosd(180 - H(x,y));
            G = I(x,y) * (1 + (numeradorR/denominadorR));
%             Para el valor B
            B = (3 * I(x,y)) - R - G;
%             Asignacion de valores
            RGBim(x,y,1) = round(R);
            RGBim(x,y,2) = round(G);
            RGBim(x,y,3) = round(B);
        end

%         Tercer caso
        if ((240 <= H(x,y)) && (H(x,y) < 360))
%             Para el valor G
            G = I(x,y) * (1-S(x,y));
%             Para el valor B
            numeradorR = S(x,y) * cosd(H(x,y) - 240);
            denominadorR = cosd(300 - H(x,y));
            B = I(x,y) * (1 + (numeradorR/denominadorR));
%             Para el valor R
            R = (3 * I(x,y)) - G - B;
%             Asignacion de valores
            RGBim(x,y,1) = round(R);
            RGBim(x,y,2) = round(G);
            RGBim(x,y,3) = round(B);
        end
    end
end

figure;
subplot(1,2,1)
imshow(Im) 
title('Original');
% subplot(1,3,2)
% imshow(HSIim)
% title('HSI');
subplot(1,2,2)
imshow(uint8(RGBim))
title('De regreso');
