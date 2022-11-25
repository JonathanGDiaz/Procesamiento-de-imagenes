% borrado de variables y termianle
clear all; clc;
% Leemos la imagen
A = imread("miguel.jpg");
% Convertimos la imagen A a escala de grises 
I = rgb2gray(A);
[Filas, Columnas, P] = size(I);
% Pasamos a double la imagen
D = double(I);
Dr = D;
% ---------------------------------------------------------------------------
% Empezamos el filtro borroso
for r=2:Filas-1
  for c=2:Columnas-1
    Dr(r,c)=(1/9)*(D(r,c)+D(r+1,c)+D(r+1,c-1)+D(r,c-1)+D(r-1,c-1)+D(r-1,c)+D(r-1,c+1)+D(r,c+1)+D(r+1,c+1));
  end
end
Dr = uint8(Dr);
% ---------------------------------------------------------------------------
% Empezamos el filtro box lineal
Fr = D;
for r=3:Filas-2
  for c=3:Columnas-2
    Fr(r,c)=(1/9)*((D(r,c))+(D(r+1,c))+(D(r+1,c-1))+(D(r,c-1))+(D(r-1,c-1))+(D(r-1,c))+(D(r-1,c+1))+(D(r,c+1))+(D(r+1,c+1))+(D(r+2,c)*0)+(D(r+2,c-1)*0)+(D(r+2,c-2)*0)+(D(r+1,c-2)*0)+(D(r,c-2)*0)+(D(r-1,c-2)*0)+(D(r-2,c-2)*0)+(D(r-2,c-1)*0)+(D(r-2,c)*0)+(D(r-2,c+1)*0)+(D(r-2,c+2)*0)+(D(r-1,c+2)*0)+(D(r,c+2)*0)+(D(r+1,c+2)*0)+(D(r+2,c+2)*0)+(D(r+2,c+1)*0));
  end
end
Fr = uint8(Fr);
% ---------------------------------------------------------------------------
% Empezamos con el filtro Gauss
Gr = D;
for r=3:Filas-2
  for c=3:Columnas-2
    Gr(r,c)=(1/57)*((D(r,c)*9)+(D(r+1,c)*5)+(D(r+1,c-1)*3)+(D(r,c-1)*5)+(D(r-1,c-1)*3)+(D(r-1,c)*5)+(D(r-1,c+1)*3)+(D(r,c+1)*5)+(D(r+1,c+1)*3)+(D(r+2,c)*2)+(D(r+2,c-1)*1)+(D(r+2,c-2)*0)+(D(r+1,c-2)*1)+(D(r,c-2)*2)+(D(r-1,c-2)*1)+(D(r-2,c-2)*0)+(D(r-2,c-1)*1)+(D(r-2,c)*2)+(D(r-2,c+1)*1)+(D(r-2,c+2)*0)+(D(r-1,c+2)*1)+(D(r,c+2)*2)+(D(r+1,c+2)*1)+(D(r+2,c+2)*0)+(D(r+2,c+1)*1));
  end
end
Gr = uint8(Gr);
% ---------------------------------------------------------------------------
% Empezamos con el filtro Laplace
Lr = D;
for r=3:Filas-2
  for c=3:Columnas-2
    Lr(r,c)=(1/1)*((D(r,c)*16)+(D(r+1,c)*-2)+(D(r+1,c-1)*-1)+(D(r,c-1)*-2)+(D(r-1,c-1)*-1)+(D(r-1,c)*-2)+(D(r-1,c+1)*-1)+(D(r,c+1)*-2)+(D(r+1,c+1)*-1)+(D(r+2,c)*-1)+(D(r+2,c-1)*0)+(D(r+2,c-2)*0)+(D(r+1,c-2)*0)+(D(r,c-2)*-1)+(D(r-1,c-2)*0)+(D(r-2,c-2)*0)+(D(r-2,c-1)*0)+(D(r-2,c)*-1)+(D(r-2,c+1)*0)+(D(r-2,c+2)*0)+(D(r-1,c+2)*0)+(D(r,c+2)*-1)+(D(r+1,c+2)*0)+(D(r+2,c+2)*0)+(D(r+2,c+1)*0));
  end
end
Lr = uint8(Lr);
% ------------------------AREA DE IMPRESION----------------------------------
% Impresion de la imagen original
% subplot(2,2,1)
% figure;
% imshow(I)
% title('Imagen original')
% Impresion de la imagen con filtro borroso
% subplot(2,2,2)
figure;
imshow(Dr)
title('Imagen con filtro borroso')
% Impresion de la imagen con filtro Gauss
% subplot(2,2,3)
% figure;
% imshow(Fr)
% title('Imagen con filtro Box lineal')
% Impresion de la imagen con filtro Gauss
% subplot(2,2,4)
figure;
imshow(Gr)
title('Imagen con filtro Gauss')
% Impresion de la imagen con filtro Laplace
% subplot(2,2,4)
figure;
imshow(Lr)
title('Imagen con filtro Laplace')
