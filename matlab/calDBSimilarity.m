function DB_idx=calDBSimilarity(P, DB_AVG)
% given P as a pixel, DB_AVG as a list of average in database
% find the most similar image to P

sim=sum(sqrt((DB_AVG-repmat(P,1,size(DB_AVG, 2))).^2));
[~, DB_idx]=min(sim);

end