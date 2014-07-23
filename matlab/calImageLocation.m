function dxy=calImageLocation(I, P)
% this function is to find a closest pixel in I for P
% P is either a 3*1 vector (color image) or a number (grayscale)
% P and I should in same nature

dxy=zeros(2,1);

if (size(I,3)==3) % color image
    minimal=I;
    minimal(:,:,1)=sqrt(double(minimal(:,:,1)-P(1)).^2);
    minimal(:,:,2)=sqrt(double(minimal(:,:,2)-P(2)).^2);
    minimal(:,:,3)=sqrt(double(minimal(:,:,1)-P(3)).^2);
    
    minimal=rgb2gray(uint8(minimal));
    
    [~, dxy(2)]=min(min(minimal));
    [~, dxy(1)]=min(minimal(:, dxy(2)));
elseif (size(I,3)==1) % grayscale image
    minimal=sqrt(double(I-P).^2);
    
    [~, dxy(2)]=min(min(minimal));
    [~, dxy(1)]=min(minimal(:, dxy(2)));
end

end