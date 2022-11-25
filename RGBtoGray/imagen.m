% Limpiar valores
clc; clear all;
% Imagen normal
subplot(2,2,1)
A = imread("wallp.png");
[M N P]=size(A)
imshow(A);
title ('RGB')
% Imagen a escala de grises
subplot(2,2,2)
I = imread("wallp.png");
for i=1:M
  for j=1:N
    x=(I(i,j)*0.299+I(i,j)*0.587+I(i,j)*0.114);
    I(i,j,1)=x;
    I(i,j,2)=x;
    I(i,j,3)=x;
  end
end
imshow(I);
title ('Escala de grises')
% Imagen inversa
subplot(2,2,3)
NT = 255 - I;
imshow(NT);
title ('Inversa')
%Imagen en binarizacion
subplot(2,2,4)
for i=1:M
  for j=1:N
    if I(i,j)<128
      I(i,j,1) = 0;
      I(i,j,2) = 0;
      I(i,j,3) = 0;
    elseif I(i,j)>=128
      I(i,j,1) = 255;
      I(i,j,2) = 255;
      I(i,j,3) = 255;
    end
  end
end
imshow(I);
title ('Binarización')
