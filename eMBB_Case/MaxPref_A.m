
function [A]= MaxPref_A(F,La,S,P)
for s=1:S
    for l=1:La
        for f=1:F
            if P(f,l,s)==max(P(f,:,s),[],2)
            A(f,l,s)=1;
            else
                A(f,l,s)=0;
            end
            
        end
    end
end
A;
end