function CTT = sumfinalcapital(CTfinal, y, nrsummands, n)

%
% This MATLAB function can be used to record the summed capital for each 
% 'batch' of good evenings. The final (total) capitals of the first 
% nrsummands good evenings are added up and this summed capital is 
% recorded, then the final (total) capitals of the second nrsummands good 
% evenings are added up and this summed capital is recored, and so on, 
% until the summed capitals of n batches are recorded.
%
% Input / parameters:
% CTfinal    = large column vector of final (total) capitals 
%             (where each entry stands for one evening)
% y          = treshold for determining whether an evening is good or bad
% nrsummands = size of a 'batch'
% n          = number of 'batches'
%
% Output:
% CTT        = vector of summed capitals
%

CTT=zeros(n,1);
j=1;
for i=1:n
    t=0;
    while t<nrsummands
        if CTfinal(j,1) > y
            CTT(i,1)=CTT(i,1)+CTfinal(j,1);
            j=j+1;
            t=t+1;
            %If final capital is large enough, record evening
        else
            j=j+1;
            %Else, move on to next evening
        end
    end
end