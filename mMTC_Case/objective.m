function [objsum]= objective(F,La,S,A,eta)
OBJ =zeros(F,La,S);
objsum=0;
for s = 1:S
    for f = 1:F
        for l=1:La
            if A(f,l,s)==1
                objsum = objsum+(eta(f,l,s)*A(f,l,s));
                
            end
        end
    end
end
objsum;

for s = 1:S
    for f = 1:F
        sumf=0;
        for l=1:La
            sumf=sumf+A(f,l,s);
        end
        if sumf> 0
            objsum=objsum;
        else
            objsum=Inf;
        end
    end
end
end