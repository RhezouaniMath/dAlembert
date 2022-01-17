function v = initialdistribution(m,n,startC,startS)
% m = maximal capital + 1
% n = maximal stake + 1
%indices start by one
%so index 1 stands for capital/stake 0,
%   index 2 stands for capital/stake 1,
%and so on.
%startC = start capital,
%startS = start stake.
v=zeros(m,n);
for i=1:m
    for j=1:n
        c=i-1;
        %capital = capital index - 1
        s=j-1;
        %stake = stake index -1
        if c==startC
            if s==startS
                v(i,j)=1;
                %W.p. 1 we start in (StartC, StartS)
            end
        end
    end
end