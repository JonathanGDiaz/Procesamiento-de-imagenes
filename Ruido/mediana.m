% Limpiamos los valores
clear all; clc;
% Leemos la imagen 
I = imread('arco2.jpg');
% Convertimos la imagen a Icala de grises y obtenemos dimensiones
I = rgb2gray(I);
[Filas, Columnas, P] = size(I);
% Mandamos a llamar la función para el añadido de ruido
Dr = ruidoSP(I, 20000);
% Empezamos con el filtro de mediana
B = Dr;
for i=2:Filas-1
    for j=2:Columnas-1
        mat=[B(i-1,j-1), B(i-1,j), B(i-1,j+1), B(i,j-1), B(i,j), B(i,j+1), B(i+1,j-1), B(i+1,j), B(i+1,j+1)];
% Empezamos con el metodo burbuja
        for x=1:8
          for val=1:8
            if mat(val) > mat(val+1)
              temp = mat(val);
              mat(val) = mat(val+1);
              mat(val+1) = temp;
            end
         end
        end        
        B(i,j)=mat(5);
    end
end
% Area de impresion
figure;
imshow(I)
title('Imagen original')
figure;
imshow(Dr)
title('Imagen con filtro sal y pimienta')
figure;
imshow(B)
title('Imagen con filtro mediana')
