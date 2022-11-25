function Im = bordesSM(I)
[Filas, Columnas, P] = size(I);
% Pasamos la imagen a escala de grises y a double
D = double(I);Resultado
% Creamos valores matrRexssdsaices rellenas de ceros
Gx = zeros(size(D));
Gy = zeros(size(D));
% G = zeros(size(D));
% Empezamos con el barrido de la imagen para la mascara
for r=2:Filas-1
    for c=2:Columnas-1
        Gx(r,c)=((D(r,c)*0)+(D(r+1,c)*2)+(D(r+1,c-1)*1)+(D(r,c-1)*0)+(D(r-1,c-1)*-1)+(D(r-1,c)*-2)+(D(r-1,c+1)*-1)+(D(r,c+1)*0)+(D(r+1,c+1)*1));
        Gy(r,c)=((D(r,c)*0)+(D(r+1,c)*0)+(D(r+1,c-1)*1)+(D(r,c-1)*2)+(D(r-1,c-1)*1)+(D(r-1,c)*0)+(D(r-1,c+1)*-1)+(D(r,c+1)*-2)+(D(r+1,c+1)*-1));
%         Bin = sqrt((Gx.^2) + (Gy.^2));
%         if(Bin > 150)
%             G(r,c) = 255;
%         else
%             G(r,c) = 0;
%         end
    end
end
% Se calcula el valor de la gradiente
GradienteResultado = sqrt((Gx.^2) + (Gy.^2));
% Se obtiene el valor maximo de la gradiente
Vmax = max(max(GradienteResultado));
% Normalizamos el gradiente a 255 valores
GradienteNormalizada = (GradienteResultado/Vmax)*255;
Im = GradienteNormalizada;
end

