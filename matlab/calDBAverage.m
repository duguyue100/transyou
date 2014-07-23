function DB_AVG=calDBAverage(DB)
% this function is to find average for each image in DB

DB_len=size(DB);
DB_AVG=zeros(size(DB{1}, 3), DB_len(1));

for i=1:DB_len(1)
    DB_AVG(:,i)=calImageAverage(DB{i});
end

end