function D = countingdifferences(X1,X2)

%Function for counting the number of different components between two
%vectors of equal dimension.

D=0;
%Counting starts with 0.

N=length(X1);
%Dimension of the vectors.

for i=1:N
    if X1(i,1)==X2(i,1)
        D=D;
        %We do not count a difference when there is no difference.
    else
        D=D+1;
        %We do count a difference when there is a difference.
    end
end