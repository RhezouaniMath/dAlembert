function P = Pmatrix(m,n)
% m = maximal capital + 1
% n = maximal stake + 1
%indices start by one
%so index 1 stands for capital/stake 0,
%   index 2 stands for capital/stake 1,
%and so on.
P=zeros(m,n,m,n);
for i=1:m
    for j=1:n
        c=i-1;
        %capital = capital index - 1
        s=j-1;
        %stake = stake index -1
        if s==0
            P(i,j,i,j)=1;
            %zero stake means that nothing changes
        else
            %when stake is not zero,
            %so when you are still playing,
            %cpositive = new capital after winning
            %ipositive = new capital index after winning
            %cnegative = new capital after losing
            %inegative = new capital index after losing
            %spositive = new stake after winning
            %jpositive = new stake index after winning
            %snegative = new stake after losing
            %jnegative = new stake index after losing
            cpositive = c+s;
            cpositive = min(cpositive, m-1);
            spositive = s-1;
            spositive = max(spositive, 1);
            ipositive = cpositive + 1;
            jpositive = spositive + 1;
            P(i,j,ipositive, jpositive)=18/37; 
            %probability that you win is 18/37
            cnegative = c-s;
            cnegative = max(cnegative, 0);
            if cnegative < 16
                snegative = 0;
                %stop playing when new capital falls 
                %below treshold of 16,
                %that is, choose zero as new stake.
            else
                snegative = s+1;
                snegative = min(snegative, n-1);
                %when you lose and you still have
                %capital of at least 16 (our treshold),
                %increase stake with 1
            end
            inegative = cnegative + 1;
            jnegative = snegative + 1;
            P(i,j,inegative, jnegative)=19/37;
            %probability that you lose is 19/37
        end
    end
end