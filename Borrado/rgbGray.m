function [I] = rgbGray(A)
  I = A;
  [M N P] = size(I)
  for i=1:M
    for j=1:N
      x=(I(i,j)*0.299+I(i,j)*0.587+I(i,j)*0.114);
      I(i,j,1)=x;
      I(i,j,2)=x;
      I(i,j,3)=x;
    end
  end
end
