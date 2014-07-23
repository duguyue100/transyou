function DB_SIM=calDBAllSimilarity(I, DB_AVG, LIMITS)
% LIMITS: maximum times a image can be used.

DB_SIM=cell(size(I,1), size(I,2));
C=zeros(length(DB_AVG), 1);

for i=1:size(I,1)
    for j=1:size(I,2)
        P=zeros(size(I,3),1);
        for k=1:size(I,3)
            P(k)=I(i,j,k);
        end
        DB_SIM{i,j}=calDBSimilarity(P, DB_AVG);
        C(DB_SIM{i,j})=C(DB_SIM{i,j})+1;
        
        if (C(DB_SIM{i,j})>LIMITS)
            C=[C(1:DB_SIM{i,j}-1);
               C(DB_SIM{i,j}+1:end)];
            DB_AVG=[DB_AVG(:, 1:DB_SIM{i,j}-1), DB_AVG(:, DB_SIM{i,j}+1:end)];
        end
    end
end

end