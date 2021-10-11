
function [A]=A_MMP(F,La,S,K,maxdup,maxdcp,Ol,P, Fup, eta1)

for s=1:S
    for l=1:La
        
        if maxdup(1,1,s)<K(l)
            Lup(1,1,s)=l-1;
            break
        elseif l==La
            Lup(1,1,s)=l;
        end
        
    end
    Lup;
end


for s=1:S
    for l=1:La
        
        if maxdcp(1,1,s)<K(l)
            Lcp(1,1,s)=l-1;
            break
        elseif l==La
            Lcp(1,1,s)=l;
        end
        
    end
    Lcp;
end




A=zeros(F,La,S);

Ol2= 3*Ol;


for s=1:S
    for f=1:Fup
        for l=1:Lup(1,1,s)
            if Ol2(1,l)>=eta1(f,1,s)
                if P(f,l,s)==max(P(f,(l:Lup(1,1,s)),s)) && P(f,l,s)>0
                    
                    A(f,l,s)=1;
                    Ol2(1,l)= Ol2(1,l)-eta1(f,1,s);
                    
                    break
                end
                
                
                
                
                
            end
        end
    end
end


for s=1:S
    for f=Fup+1:F
        for l=1:Lcp(1,1,s)
            if Ol2(1,l)>=eta1(f,1,s)
                if P(f,l,s)==max(P(f,(l:Lcp(1,1,s)),s)) && P(f,l,s)>0
                    
                    A(f,l,s)=1;
                    Ol2(1,l)=Ol2(1,l)-eta1(f,1,s);
                    break
                end
                
                
                
            end
        end
    end
end



A  ;

end
