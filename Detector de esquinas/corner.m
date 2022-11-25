% Limpiamos las variables
clear all; clc;
% Leemos la imagen
I = imread('figuras.jpg');
[Filas, Columnas, P] = size(I);
% Convertimos la imagen a escala de grises
I = rgb2gray(I);
% Creamos los arreglos de ceros
U = zeros(size(I));
S = zeros(size(I));
% Matriz de coeficientes para el filtro pre suavizador
h = ones(3,3)/9;
Id = double(I);
If = imfilter(Id, h);
% Matrices de coeficientes
Hx = [-0.5 0 0.5];
Hy = [-0.5; 0; 0.5];
Ix = imfilter(If, Hx);
Iy = imfilter(If, Hy);

HE11 = Ix.*Ix;
HE22 = Iy.*Iy;
HE12 = Ix.*Iy;
% Se crea matriz de filtros de gauss
Hg = [0 1 2 1 0; 1 3 5 3 1; 2 5 9 5 2; 1 3 5 3 1; 0 1 2 1 0];
Hg = Hg*(1/57);
A = imfilter(HE11, Hg);
B = imfilter(HE22, Hg);
C = imfilter(HE12, Hg);
ALFA = 0.1;
Rp = A+B;
Rp1 = Rp.*Rp;
% Valor de la esquina
Q = ((A.*B)-(C.*C))-(ALFA*Rp1);
Th = 1000;
U = Q>Th;
pixel=10;
% Barrido
for r=1:Filas
    for c=1:Columnas
%         Se definen limites
        if (U(r,c))
          I1 = [r-pixel 1];
          I2 = [r+pixel Filas];
          I3 = [c-pixel 1];
          I4 = [c+pixel Columnas];
          datxi = max(I1);
          datxs = min(I2);
          datyi = max(I3);
          datys = min(I4);
          Bloc = Q(datxi:1:datxs,datyi:1:datys);
          MaxB=max(max(Bloc));
          if Q(r,c) == MaxB
              S(r,c)=1;
          end
        end
    end
end
% Impresion de resultados
figure
imshow(I);
hold on;

for r=1:Filas
    for c=1:Columnas
        if (S(r,c))
            plot(c,r,'+');
        end
    end
end
