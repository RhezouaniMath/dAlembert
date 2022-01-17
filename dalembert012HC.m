function [CX, SX, CY, SY]=dalembert012HC(tstop, Ctreshold, Cstart)
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

CX(1) = 2*Cstart; %THIS HAS BEEN CHANGED, IN SUB UNITS
%at beginning, capital game X = start capital

CY(1) = 2*Cstart; %THIS HAS BEEN CHANGED, IN SUB UNITS
%at beginning, capital game Y = start capital

SX(1) = 2; %THIS HAS BEEN CHANGED, IN SUB UNITS
%first stake equals one unit in game X

SY(1) = 2; %THIS HAS BEEN CHANGED, IN SUB UNITS
%first stake equals one unit in game Y

for i=1:tstop
    %Game X
    if X(i) == 2 %Winning outcome in round i
		CX(i+1) = CX(i) + SX(i);
        %new capital = capital + stake
		if SX(i)>2 %THIS HAS BEEN CHANGED, IN SUB UNITS
			SX(i+1) = SX(i) - 2; %THIS HAS BEEN CHANGED, IN SUB UNITS
            %if stake>2, next stake = stake - 2 THIS HAS BEEN CHANGED, IN S
        else
			SX(i+1) = SX(i);
            %if stake<=2, next stake = stake %THIS HAS BEEN CHANGED, IN SUB
        end
    %THIS PART HAS BEEN ADDED/CHANGED
    elseif X(i) == 1 %Loss due to non-zero outcome in round i
        CX(i+1) = CX(i) - SX(i); 
        %new capital = capital - stake
        if CX(i+1) <2*Ctreshold    
            SX(i+1) = 0;         
            %if new capital below level 2*Ctreshold
            %the player stops (so next stake = 0)
        else                     
            SX(i+1) = SX(i) + 2; 
            %if new capital => 2*Ctreshold
            %new stake = stake + 2
        end
    else %Loss due to zero outcome in round i
        CX(i+1) = CX(i) - (SX(i))/2; 
        %new capital = capital - stake/2
        if CX(i+1) <2*Ctreshold    
            SX(i+1) = 0;         
            %if new capital below level 2*Ctreshold
            %the player stops (so next stake = 0)
        else                     
            SX(i+1) = SX(i) + 2; 
            %if new capital => 2*Ctreshold
            %new stake = stake + 2
        end
    end
    %END OF 'THIS PART HAS BEEN ADDED/CHANGED'
    
    %Game Y
    %Game Y is treated in the same way as X
    %THE SAME CHANGED HAVE BEEN APPLIED TO THE Y-PART OF THIS CODE
    if Y(i) == 2
		CY(i+1) = CY(i) + SY(i);
        if SY(i)>2 
			SY(i+1) = SY(i) - 2; 
        else
			SY(i+1) = SY(i);
        end
    elseif Y(i) == 1
        CY(i+1) = CY(i) - SY(i); 
        if CY(i+1) <2*Ctreshold    
			SY(i+1) = 0;         
        else                     
			SY(i+1) = SY(i) + 2; 
        end
    else
		CY(i+1) = CY(i) - (SY(i))/2; 
        if CY(i+1) <2*Ctreshold    
			SY(i+1) = 0;         
        else                     
			SY(i+1) = SY(i) + 2;
        end
    end
end