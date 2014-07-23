function sim=calImageSimilarity(P, I)
% this function is calculating the similarity between a pixel and a image
% P is either a 3*1 vector (for color image) or a value (for gray-scale
% image)
% the value is smaller the better.

AVG=calImageAverage(I);

if (size(AVG,1)==3) % color image
    sim=sqrt((P-AVG).^2);
    sim=sum(sim);
elseif (size(AVG,1)==1) % gray-scale image
    sim=sqrt((P-AVG).^2);
end

end