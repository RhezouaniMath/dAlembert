function [hatX, hatY] = coupling(X,Y)

%This function constructs a coupling of the X- and Y-games.

N=length(Y);

M=binornd(1,36/37,N,1);
%Random vector for deciding when there is a zero in the coupled Y-game.

Z=binornd(1,1/2,N,1);
%Random vector for constructing new non-zero outcomes to replace old 
%zero outcomes in the original Y-game.

hatX=X;
%The coupled X-game is by construction equal the original X-game.

hatY=zeros(N,1);
%Declaration and initialisation of coupled Y-game.

for t=1:N
    if M(t,1)==0
        %Vector M tells us that there is a zero in the coupled Y-game.
        hatY(t,1)=0;
    else
        %Vector M tells us there is no zero in the coupled Y-game.
        if Y(t,1)==0
            %When there is a zero in the original Y-game,
            %replace that old zero by a non-zero outcome.
            hatY(t,1)=1+Z(t,1);
        else
            %When there is a non-zero outcome in the original Y-game,
            %retain that non-zero outcome in the coupled Y-game.
            hatY(t,1)=Y(t,1);
        end
    end
end