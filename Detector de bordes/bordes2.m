% Limpiamos los valores
clear all; clc;
% Leemos la imagen y sus valores
I = imread('lena.jpg');
[Filas, Columnas, P] = size(I);
% Pasamos la imagen a escala de grises y a double
I = rgb2gray(I);
D = double(I);
% Creamos valores matrices rellenas de ceros
G = zeros(size(D));
% Empezamos con el barrido de la imagen para la mascara
for r=2:Filas-1
    for c=2:Columnas-1
        Gx=((D(r,c)*0)+(D(r+1,c)*2)+(D(r+1,c-1)*1)+(D(r,c-1)*0)+(D(r-1,c-1)*-1)+(D(r-1,c)*-2)+(D(r-1,c+1)*-1)+(D(r,c+1)*0)+(D(r+1,c+1)*1));
        Gy=((D(r,c)*0)+(D(r+1,c)*0)+(D(r+1,c-1)*1)+(D(r,c-1)*2)+(D(r-1,c-1)*1)+(D(r-1,c)*0)+(D(r-1,c+1)*-1)+(D(r,c+1)*-2)+(D(r+1,c+1)*-1));
        Bin = sqrt(Gx.^2 + Gy.^2);
        if (Bin > 100)
            G(r,c) = 255;
        else
            G(r,c) = 0;
        end
    end
end
Gradiente = uint8(G);
figure;
imshow(Gradiente);