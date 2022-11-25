% Limpiamos las variables
clear all; clc;
% Leemos la imagen y la convertimos a escala de grises y double
imo = imread("celulas.jpg");
im = rgb2gray(imo);
imd = double(im);
% Obtenemos dimensiones
[f, c] = size(imd);
% nuevaI = zeros(f,c);
nuevaI = imd;
for i=1:f
    for j=1:c
        if imd(i,j)>=145
            nuevaI(i,j) = 0;
        else
            nuevaI(i,j) = 255;
        end
    end
end

imB = uint8(nuevaI);

B = [0 1 0;1 1 1;0 1 0];
E = imerode(imB, B);
E = imerode(E,B);
E = imerode(E,B);
E = imdilate(E,B);
E = imdilate(E,B);
E = imerode(E,B);
E = imfill(E, 'holes');
ib = imB;

[m, n] = size(ib);
ibd = double(ib);

e=2;
k=1;

for r=2:m-1
    for c=2:n-1
        if (ibd(r,c) == 1)
            if ((ibd(r-1,c) == 0)&&(ibd(r,c-1) == 0))
                ibd(r,c) = e;
                e=e+1;
            end
            if((ibd(r,c-1)>1)&&(ibd(r-1,c)<2))||((ibd(r,c-1)<2)&&(ibd(r-1,c)>1))
                if(ibd(r,c-1)>1)
                    ibd(r,c) = ibd(r,c-1);
                end
                if(ibd(r-1,c)>1)
                    ibd(r,c) = ibd(r-1,c);
                end
            end
            if((ibd(r,c-1)>1)&&(ibd(r-1,c)>1))
                ibd(r,c) = ibd(r-1,c);
                if((ibd(r,c-1))~=(ibd(r-1,c)))
                    ec1(k) = ibd(r-1,c);
                    ec2(k) = ibd(r,c-1);
                    k = k+1;
                end
            end
        end
    end
end
for ind=1:k-1
    if(ec1(ind)<=ec2(ind))
        for r=1:m
            for c=1:n
                if(ibd(r,c)==ec2(ind))
                    ibd(r,c) = ec1(ind);
                end
            end
        end
    end
    if(ec1(ind)>ec2(ind))
        for r=1:m
            for c=1:n
                if(ibd(r,c)==ec1(ind))
                    ibd(r,c) = ec2(ind);
                end
            end
        end
    end
end
w = unique(ibd);
t = length(w);

Ime = bwlabel(E,8);
for r=1:m
    for c=1:n
        for ix=2:t
            if(Ime(r,c)==w(ix))
                Ime(r,c) = ix-1;
            end
        end
    end
end

total_objetos = max(max(Ime));
for i=1:total_objetos
    array(i) = numel(find(Ime == i));
end

E = mat2gray(Ime);
Ime = bwlabel(E,8);
L = bwlabel(E,8);
idx = max(max(L));

for o=1:idx
    O = L==o;
    H = regionprops(double(O),'Centroid');
    Pt(o,1) = H.Centroid(1);
    Pt(o,2) = H.Centroid(2);
end

% Impresion de datos
figure, imshow(E),title(['Numero de elementos: ', num2str(total_objetos)]);
disp('El numero total de objetos en la imagen es: ')
disp(total_objetos)
hold on

for d=1:idx
    text(Pt(d,1),Pt(d,2),strcat('\color{magenta}',num2str(array(d))),"FontSize",10);
end

aux = 0;
for i=1:idx
    for j=1:idx-1
        if(array(j)>array(j+1))
            aux = array(j);
            array(j) = array(j+1);
            array(j+1) = aux;
        end
    end
    disp(array(j));
end

for d=1:idx
    arreglo1(d) = array(d);
    str = '-';
    [num2str(d) str num2str(arreglo1(d))]
end

for d=1:idx
    text(n+5,d*8, strcat('\color{red}A de', num2str(d), ' es: ', num2str(array(d))),"FontSize",10)
end
% figure, imshow(imB), title('Imagen binarizada');
