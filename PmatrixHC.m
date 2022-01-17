function P = PmatrixHC(m,n)
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
            %cnegative = new capital after non-zero loss %HAS BEEN CHANGED
            %inegative = new capital index non-zero loss %HAS BEEN CHANGED
            %    czero = new capital after zero outcome %HAS BEEN ADDED
            %    izero = new capital index after zero outcome %HAS BEEN ADD
            %spositive = new stake after winning
            %jpositive = new stake index after winning
            %snegative = new stake after non-zero loss %HAS BEEN CHANGED
            %jnegative = new stake index after non-zero loss %HAS BEEN CHAN
            %    szero = new stake after zero outcome %HAS BEEN ADDED
            %    jzero = new stake index after zero outcome %HAS BEEN ADDED
            cpositive = c+s;
            cpositive = min(cpositive, m-1);
            spositive = s-2; %THIS HAS BEEN CHANGED.
            spositive = max(spositive, 2); %THIS HAS BEEN CHANGED.
            ipositive = cpositive + 1;
            jpositive = spositive + 1;
            P(i,j,ipositive, jpositive)=18/37; 
            %probability that you win is 18/37
            cnegative = c-s;
            cnegative = max(cnegative, 0);
            if cnegative < 32 %THIS HAS BEEN CHANGED
                snegative = 0;
                %stop playing when new capital falls 
                %below treshold of 16 (32 sub units), %THIS HAS BEEN ...
                %that is, choose zero as new stake.
            else
                snegative = s+2; %THIS HAS BEEN CHANGED
                snegative = min(snegative, n-1);
                %when you lose and you still have
                %capital of at least 16 (32 sub units) (our treshold),%THIS
                %increase stake with 1 (2 sub units) %THIS HAS BEEN CHANGED
            end
            inegative = cnegative + 1;
            jnegative = snegative + 1;
            P(i,j,inegative, jnegative)=18/37; %THIS HAS BEEN CHANGED
            %probability of non-zero loss is 18/37 %THIS HAS BEEN CHANGED
            
            %THIS HAS BEEN ADDED%
            czero = c-ceil(s/2);
            czero = max(czero, 0);
            if czero < 32
                szero = 0;
                %stop playing when new capital falls 
                %below treshold of 16 (32 sub units),
                %that is, choose zero as new stake.
            else
                szero = s+2;
                szero = min(szero, n-1);
                %when you lose and you still have
                %capital of at least 16 (32 sub units) (our treshold),
                %increase stake with 1 (2 sub units)
            end
            izero = czero + 1;
            jzero = szero + 1;
            P(i,j,izero, jzero)=1/37;
            %probability of zero outcome is 1/37
        end
    end
end