function D = Distr(k)

%k must be a row vector with 500 components, giving the 
%distribution of the possible capital/stake-pairs.
%k must be organised in such a way that the first block of 50 components
%stands for stake 0, the second block for stake 1 etcetera, and that the
%first component of a block stands for capital 0, the second component for
%capital 1 and so on.

D=zeros(1,50);
%Declaration and initialization of row vector with 50 components, each
%component for each possible value of our capital level.

for j=1:50 %This loop runs through all possible values of capital
    for i=1:10
        D(1,j)=D(1,j)+k(1, j+50*(i-1));
    end
end

%We end up with a row vector D giving the distribution of the 
%capital levels.
