%%% OPERACIONES MORFOLÓGICAS

clc, clear, close all;

I = imread('celulas.jpg');
I = rgb2gray(I);

imshow(I)

% SE = strel(forma,parámetro)

se1 = strel('square',11); % Cuadrado 11x11
se2 = strel('line',10,45); % Línea de longitud 10 y ángulo de 45°
se3 = strel('disk',15); % Disco de radio 15
se4 = strel('ball',15,5); % Bola de radio 15 y alto 5

% Operaciones morfológicas

J1 = imdilate(I,se2); % Dilatación
J2 = imerode(I,se2); %Erosión
J3 = imopen(I,se3); %Apertura
J4 = imclose(I,se3); %Cierre

figure,
subplot(2,2,1), imshow(J1), title('Dilatación')
subplot(2,2,2), imshow(J2), title('Erosión')
subplot(2,2,3), imshow(J3), title('Apertura')
subplot(2,2,4), imshow(J4), title('Cierre')

BW = imbinarize(I,0.6); % Binariza una imagen
BW = BW==0; %Inviertan
BW = imfill(BW,'holes'); % Rellena los agujeros

figure, imshow(BW)

