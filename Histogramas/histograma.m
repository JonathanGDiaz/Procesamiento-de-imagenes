% Limpiar valores
clear all; clc;
% Imagen normal
A = imread("Pablo.png");
%Escala de grises
subplot(2,3,1)
I = rgbGray(A);
imshow(I);
title('Escala grises')
% -------------------------------------------------------------
% Guardado de imagenes
E = I;
C = I;
[M N P]=size(I);
% -------------------------------------------------------------
% Histograma simple
pixmax = 256;
tam = zeros(pixmax,1);
for x=1:M
  for y=1:N
    xy=I(x,y);
    for val=1:pixmax
      if xy==val
        tam(val)=tam(val)+1;
      end
    end
  end
end
subplot(2,3,4)
plot(tam)
title('Histograma simple')
% -------------------------------------------------------------
% Histograma acumulado
VI = [1:256];
Vo=0;
for ru=1:256
  H(ru)=Vo+tam(ru);
  Vo=H(ru);
end
subplot(2,3,5)
plot(H)
title('Histograma Acumulado')
% -------------------------------------------------------------
% Histograma lineal
% for rx=1:M
%   for ry=1:N
%     eq=I(rx,ry);
%     if eq==val
%       VI(rx,ry)=tam(eq+1)*(255/M*N);
%       E(rx, ry) = VI(rx, ry) +1;
%     end
%   end
% end
% -------------------------------------------------------------
% Histograma lineal 2.0
total = (M*N);
escalado = zeros(pixmax,1);
for i=1:256
  freq(i) = tam(i) / total;
end
for i=2:256
  freq(i) = freq(i) + freq(i - 1);
  escalado(i) = round(255 * freq(i));
end
for rx=1:M
  for ry=1:N
    temp = I(rx, ry) + 1;
    E(rx, ry, 1) = escalado(temp);
    E(rx, ry, 2) = escalado(temp);
    E(rx, ry, 3) = escalado(temp);
  end
end
hl = zeros(pixmax,1);
for cx=1:M
  for cy=1:N
    temp = E(cx, cy) + 1;
    hl(temp) = hl(temp) + 1;
  end
end
Vo=0;
for ru=1:256
  N(ru)=Vo+hl(ru);
  Vo=N(ru);
end
subplot(2,3,6)
plot(hl)
title('Histograma lineal')
subplot(2,3,2)
plot(N)
title('Histograma lineal acumulado')
% -------------------------------------------------------------
subplot(2,3,3)
imshow(E)
title('Imagen ecualizada')
