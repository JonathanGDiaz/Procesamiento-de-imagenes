function Resultado = bordesSM1(I,umbral)
% Definimos la mascara del 
mascara = single([1 2 1; 0 0 0; -1 -2 -1]);

% Detect Edge
H = conv2(single(I),mascara, 'same');
V = conv2(single(I),mascara','same');
E = sqrt(H.*H + V.*V);
Resultado = uint8((E > umbral) * 255);

end

