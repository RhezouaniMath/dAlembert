function P = PsimHC(h)
n = 99*19*99*19;
P = sparse(n, n);
P = reshape(ndSparse(P),[99,19,99,19,99,19,99,19]);
for i=1:99
    for j=1:19
        for k=1:99
            for l=1:19
                cX = i-1;
                sX = j-1;
                cY = k-1;
                sY = l-1;
                sXwin = max(sX-2,2);
                sYwin = max(sY-2,2);
                sXloss= min(sX+2,18);
                sYloss= min(sY+2,18);
                cXwin = max(cX+sX,98);
                cYwin = max(cY+sY,98);
                cXloss= min(cX-sX,0);
                cYloss= min(cY-sY,0);
                if h==1   %zero outcome treated as regular loss             
                    P(i,j,k,l,cXwin+1,sXwin+1,cYwin+1,sYwin+1) = 9/37; %++
                    if cX-sX<32
                       P(i,j,k,l,cXloss+1,1,cYwin+1,sYwin+1)= 9/37; %-+
                       if cY-sY<32
                           P(i,j,k,l,cXloss+1,1,cYloss+1,1) = 10/37; %--
                           P(i,j,k,l,cXwin+1,sXwin+1,cYloss+1,1) = 9/37;%+-
                       else
                           P(i,j,k,l,cXloss+1,1,cYloss+1,sYloss+1)=10/37; %--
                           P(i,j,k,l,cXwin+1,sXwin+1,cYloss+1,sYloss+1)=9/37; %+-
                       end
                    else
                        if cY-sY<32
                           P(i,j,k,l,cXloss+1,sXloss+1,cYloss+1,1) = 10/37; %--
                           P(i,j,k,l,cXwin+1,sXwin+1,cYloss+1,1) = 9/37; %+-
                        else
                           P(i,j,k,l,cXloss+1,sXloss+1,cYloss+1,sYloss+1)=10/37; %--
                           P(i,j,k,l,cXwin+1,sXwin+1,cYloss+1,sYloss+1)=9/37; %+-
                        end
                    end
                else %h=2, Holland Casino policy
                    cZ=min(cX-ceil(sX/h),0);
                    P(i,j,k,l,cXwin+1,sXwin+1,cYwin+1,sYwin+1) = 9/37; %++
                    if cX-sX<32
                       P(i,j,k,l,cXloss+1,1,cYwin+1,sYwin+1)= 9/37; %-+
                       if cY-sY<32
                           P(i,j,k,l,cXloss+1,1,cYloss+1,1) = 9/37; %--
                           P(i,j,k,l,cXwin+1,sXwin+1,cYloss+1,1) = 9/37;%+-
                       else
                           P(i,j,k,l,cXloss+1,1,cYloss+1,sYloss+1)=9/37; %--
                           P(i,j,k,l,cXwin+1,sXwin+1,cYloss+1,sYloss+1)=9/37; %+-
                       end
                    else
                        if cY-sY<32
                           P(i,j,k,l,cXloss+1,sXloss+1,cYloss+1,1) = 9/37; %--
                           P(i,j,k,l,cXwin+1,sXwin+1,cYloss+1,1) = 9/37; %+-
                        else
                           P(i,j,k,l,cXloss+1,sXloss+1,cYloss+1,sYloss+1)=9/37; %--
                           P(i,j,k,l,cXwin+1,sXwin+1,cYloss+1,sYloss+1)=9/37; %+-
                        end
                    end
                    if cX-sX/h<32
                        if cY-sY/h<32
                            P(i,j,k,l,cZ+1,1,cZ+1,1)=1/37; %zz
                        else
                            P(i,j,k,l,cZ+1,1,cZ+1,sYloss+1)=1/37; %zz
                        end
                    else
                        if cY-sY/h<32
                            P(i,j,k,l,cZ+1,sXloss+1,cZ+1,1)=1/37; %zz
                        else
                            P(i,j,k,l,cZ+1,sXloss+1,cZ+1,sYloss+1)=1/37; %zz
                        end
                    end
                end
            end
        end
    end
end