

%------------------------------------------------------------------------
function [c, ceq] = mycon2(A,eta1, Ol, maxdup, maxdcp, K,F,La,S,Fup,Fcp,t0)






Aaa=A;
%Aaa=reshape(Aaa,[F,La-1,S]);
Aaa=reshape(Aaa,[F,La,S]);
Aaa;
% for s=1:S
%     for f=1:F
%         
%         Aaa(f,La,s)=1-(Aaa(f,1,s)+Aaa(f,2,s)+Aaa(f,3,s)+Aaa(f,4,s)+Aaa(f,5,s));
%     end
% end
A=Aaa;

eta1= reshape(eta1,[F,La,S]);


ceq=[];


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
            sumup1;
            
            
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
    c(s)=sumup3-maxdup(1,1,s);
    c(s);
    sumup3=sumup3-K(deltup(1,1,s))+K(deltcp(1,1,s));
    delayCP_s(s,1)=sumup3;
    c(s+S)=sumup3-maxdcp(1,1,s);
    c(s+S);
    sumup2=0;
end
%c=10-X2;

%--------------------------Constraint 1d)-------------------------------
    c=c';
A=[A(:,1,1); A(:,2,1); A(:,3,1); A(:,4,1); A(:,5,1); A(:,6,1); A(:,1,2); A(:,2,2); A(:,3,2); A(:,4,2); A(:,5,2); A(:,6,2); A(:,1,3); A(:,2,3); A(:,3,3); A(:,4,3) ; A(:,5,3) ; A(:,6,3)]';
eta1=eta1(:);