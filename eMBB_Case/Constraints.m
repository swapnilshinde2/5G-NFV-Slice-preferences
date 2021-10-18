
function [ceq,c,LayerCP_l,delayUP_s, delayCP_s]= Constraints(F,Fup,Fcp,La,S,A,eta,eta1,Ol,K,t0,maxdup,maxdcp)
%-------------COnstraint (1b)---------------------------------------------
ceq=zeros(F,1,S);
for s = 1:S
    for f=1:F
        sum=0;
        for l=1:La
            sum = sum + A(f,l,s);
        end
        ceq(f,1,s)=1-sum;
    end
end

ceq;

%--------------Constraint (1a)-------------------------------------------
X=zeros(1,La);
for l = 1:La
    sum1=0;
    for s=1:S
        for f=1:F
            sum1 = sum1 + A(f,l,s)*eta1(f,1,s);
        end
    end
    sum1=(10^3)*sum1;
    LayerCP_l(l,1)=sum1;
    X(l)=sum1-3*Ol(1,l);
    c(l)=sum1-3*Ol(1,l);
end


%-----------Constraint (1c & 1d)---------------------------------------------
sumup1=0;
sumup2=0;
sumup3=0;
X2=zeros(1,1,S);
for s = 1:S
    sumup3=0;
    for f=1:F
        for f1=1:Fup
            [~, dmax] = max (A (f1, :,s));
            Dtup(1,f1)=dmax;
            dmax=0;
        end
        for f2=Fup+1:F
            [~, dmax] = max (A (f2, :,s));
            Dtcp(1,f2)=dmax;
            dmax=0;
        end

        for l=1:La
            
            for v=1:S
                for p=1:F
                    
                    sumup1=sumup1+A(p,l,v)*eta1(p,1,v);
                    
                end
            end
            Olmax=Ol(1,l);
            sumup1=(10^3)*sumup1;
            
            
            if (sumup1 >= 0) && (sumup1 <= Olmax)
                g = 1;
                %elseif 3*Olmax >= sumup1 && sumup1 > Olmax
                % g = (0.5/Olmax)*(3*Olmax-sumup1);
                
            else
                %g=0;
                %g=exp(-0.25*(sumup1/Olmax)^2);
                g=1*((Olmax/sumup1)^2);
                
            end
            
            
            %dec = expfunction(sumup1,Olmax);
            % [g] = expfunction(sumup1, Olmax);
            sumup2 = sumup2 + (A(f,l,s)*eta1(f,1,s)*(1/g));
            sumup1=0;
        end
    end
    sumup2;
    % t0=(1/sumup2)*10^(-3);
    deltup(1,1,s) = max(Dtup,[],'all');
    deltcp(1,1,s) = max(Dtcp,[],'all');
    sumup3=sumup3+sumup2*(t0)+K(deltup(1,1,s));
    X2(1,1,s)=sumup3;
    delayUP_s(s,1)=sumup3;
    c(s+La)=sumup3-maxdup(1,1,s);
    c(s+La);
    sumup3=sumup3-K(deltup(1,1,s))+K(deltcp(1,1,s));
    delayCP_s(s,1)=sumup3;
    c(s+La+S)=sumup3-maxdcp(1,1,s);
    c(s+La+S);
    sumup2=0;
end
%c=10-X2;

%--------------------------Constraint 1d)-------------------------------
    c=c';
end
