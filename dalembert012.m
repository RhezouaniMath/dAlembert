function [CX, SX, CY, SY]=dalembert012(tstop, Ctreshold, Cstart)
%Two games are played: 
%red/black (X) and low/high (Y).
%Cstart is start capital. 
%Each game has start capital Cstart.
%Player always stops at/before time tstop.
%Player always stops when cap. falls below Ctreshold.

[X,Y] = simultaneous(tstop); 
%the two games are simulated

CX = zeros(1+tstop,1);
%declaration and initialization of vector CX
%vector of capital in game X

SX = zeros(1+tstop,1);       
%declaration and initialization of vector SX
%vector of stakes in game X

CY = zeros(1+tstop,1);
%declaration and initialization of vector CY
%vector of capital in game Y

SY = zeros(1+tstop,1);
%declaration and initialization of vector SY
%vector of stakes in game Y

CX(1) = Cstart;
%at beginning, capital game X = start capital

CY(1) = Cstart;
%at beginning, capital game Y = start capital

SX(1) = 1;
%first stake equals one unit in game X

SY(1) = 1;
%first stake equals one unit in game Y

for i=1:tstop
    %Game X
    if X(i) == 2 %Winning outcome in round i
		CX(i+1) = CX(i) + SX(i);
        %new capital = capital + stake
		if SX(i)>1
			SX(i+1) = SX(i) - 1;
            %if stake>1, next stake = stake - 1
		else
			SX(i+1) = SX(i);
            %if stake<=1, next stake = stake
		end
    else %Losing outcome in round i
		CX(i+1) = CX(i) - SX(i); 
        %new capital = capital - stake
		if CX(i+1) <Ctreshold    
			SX(i+1) = 0;         
            %if new capital below level Ctreshold
            %the player stops (so next stake = 0)
        else                     
			SX(i+1) = SX(i) + 1; 
            %if new capital => Ctreshold
            %new stake = stake + 1
        end
    end
    
    %Game Y
    %Game Y is treated in the same way as X
	if Y(i) == 2                 
		CY(i+1) = CY(i) + SY(i); 
		if SY(i)>1
			SY(i+1) = SY(i) - 1;
		else
			SY(i+1) = SY(i);
		end
	else
		CY(i+1) = CY(i) - SY(i);
		if CY(i+1) <Ctreshold
			SY(i+1) = 0;
		else
			SY(i+1) = SY(i) + 1;
		end
	end
end