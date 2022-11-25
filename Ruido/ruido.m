% Limpiamos los valores
clear all; clc;
% Leemos la imagen 
I = imread('arco.jpg');
% Convertimos la imagen a escala de grises y obtenemos dimensiones
I = rgb2gray(I);
[Filas, Columnas, P] = size(I);
% Guardamos la imagen como double
D = double(I);
Dr = D;
% Empezamos con el filtro de ruido sal y pimienta
% Puntos blancos
for v=1:5000
  x=round(rand*Filas);
  y=round(rand*Columnas);
  if (x==0) || (x==1) || (x==2)
    x=3;
  end
  if (y==0) || (y==1) || (y==2)
    y=3;
  end
  if (x==Filas) || (x==Filas-1) || (x==Filas-2)
    x=Filas-3;
  end
  if (y==Filas) || (y==Filas-1) || (y==Filas-2)
    y=Columnas-3;
  end
  for i=1:4
    rRandom = randi([-2 2]);
    cRandom = randi([-2 2]);
    Dr(x+rRandom,y+cRandom) = 255;
  end
end
% Puntos negros
for v=1:5000
  x=round(rand*Filas);
  y=round(rand*Columnas);
  if (x==0) || (x==1) || (x==2)
    x=3;
  end
  if (y==0) || (y==1)|| (y==2)
    y=3;
  end
  if (x==Filas) || (x==Filas-1) || (x==Filas-2)
    x=Filas-3;
  end
  if (y==Filas) || (y==Filas-1) || (y==Filas-2)
    y=Columnas-3;
  end
  for i=1:4
    rRandom = randi([-2 2]);
    cRandom = randi([-2 2]);
    Dr(x+rRandom,y+cRandom) = 0;
  end
end

Dr = uint8(Dr);

% Area de impresion
figure;
imshow(I)
title('Imagen original')
figure;
imshow(Dr)
title('Imagen con filtro sal y pimienta')
