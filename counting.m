function [count, countcum] = counting(x,y)

%x must be a column vector.
%y must be a number.
%count is the number of times that y appears in the components of x.
%countcum is the number of components that are less or equal to y.

l=length(x);
%Length/dimension of vector x.

count=0;
%Counting starts with 0.

countcum=0;
%Counting start with 0.

%Loop for counting the number of times that y appears in x.
for i=1:l
    if x(i,1) == y
        count = count + 1;
        %Count when component of x equals y.
    else
        count = count;
        %Do NOT count component of x does NOT equal y.
    end
end

%Loop for counting the number of components that are less or equal to y
for i=1:l
    if x(i,1) <= y
        countcum = countcum + 1;
        %Count when component of x is less or equal to y.
    else
        countcum = countcum;
        %Do NOT count when component of x is larger than y.
    end
end