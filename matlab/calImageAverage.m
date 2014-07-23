function AVG=calImageAverage(I)
% this function can calculate average of a image (color images)

if (size(I, 3)==3) % color image
    AVG=zeros(3,1);
    AVG(1)=mean(mean(I(:,:,1)));
    AVG(2)=mean(mean(I(:,:,2)));
    AVG(3)=mean(mean(I(:,:,3)));
elseif (size(I,3)==1) % grayscale image
    AVG=mean(mean(I));
end

end