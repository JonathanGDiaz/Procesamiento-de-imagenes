% Limpiamos los valores
clear all; clc;
% Leemos la imagen y sus valores
I = imread('lena.jpg');
[Filas, Columnas, P] = size(I);
% Pasamos la imagen a escala de grises y a double
I = rgb2gray(I);
D = double(I);
% Creamos valores matrices rellenas de ceros
Gx = zeros(size(D));
Gy = zeros(size(D));
% Empezamos con el barrido de la imagen para la mascara
for r=2:Filas-1
    for c=2:Columnas-1
        Gx(r,c)=((D(r,c)*0)+(D(r+1,c)*2)+(D(r+1,c-1)*1)+(D(r,c-1)*0)+(D(r-1,c-1)*-1)+(D(r-1,c)*-2)+(D(r-1,c+1)*-1)+(D(r,c+1)*0)+(D(r+1,c+1)*1));
        Gy(r,c)=((D(r,c)*0)+(D(r+1,c)*0)+(D(r+1,c-1)*1)+(D(r,c-1)*2)+(D(r-1,c-1)*1)+(D(r-1,c)*0)+(D(r-1,c+1)*-1)+(D(r,c+1)*-2)+(D(r+1,c+1)*-1));
    end
end
% Se calcula el valor de la gradiente
GradienteResultado = sqrt((Gx.^2) + (Gy.^2));
% Se obtiene el valor maximo de la gradiente
Vmax = max(max(GradienteResultado));
% Normalizamos el gradiente a 255 valores
GradienteNormalizada = (GradienteResultado/Vmax)*255;
% Regresamos a valores de uint8 la imagen
Gradiente = uint8(GradienteNormalizada);
GradienteR = uint8(GradienteResultado);
% Se binariza la imagen al umbral 100
B = GradienteNormalizada > 100;
% Se obtienen los valores minimos de la imagen
VminGx = min(min(Gx));
VminGy = min(min(Gy));
% Se evitan negativos
gradofx = Gx-VminGx;
gradofy = Gy-VminGy;
% Obtenemos maximos del filtrado
VmaxGx = max(max(gradofx));
VmaxGy = max(max(gradofy));
% Operaciones locas
GxN = (gradofx/VmaxGx)*255;
GyN = (gradofy/VmaxGy)*255;
% Las cambiamos a uint8
IxN = uint8(GxN);
IyN = uint8(GyN);
% Impresion de datos
% figure;
% imshow(IxN)
% subplot(1,3,2);
% figure;
% imshow(IyN);
% subplot(1,3,3);
figure;
imshow(Gradiente);
figure;
imshow(GradienteR);
figure;
imshow(I);