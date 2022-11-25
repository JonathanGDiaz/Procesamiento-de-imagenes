function Im = medianaSM(I)
[Filas, Columnas, P] = size(I);
B = I;
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
Im = B;
end

