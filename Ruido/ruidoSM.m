function Dr = ruidoSM(I)
Intensidad = 5000;
[Filas, Columnas, P] = size(I);
Dr = I;
% Empezamos con el filtro de ruido sal y pimienta
% Puntos blancos
for v=1:Intensidad
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
    rRandom = randi([-1 1]);
    cRandom = randi([-1 1]);
    Dr(x+rRandom,y+cRandom) = 255;
  end
end
% Puntos negros
for v=1:Intensidad
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
    rRandom = randi([-1 1]);
    cRandom = randi([-1 1]);
    Dr(x+rRandom,y+cRandom) = 0;
  end
end

% Im = uint8(Dr);
Im = Dr;

end

