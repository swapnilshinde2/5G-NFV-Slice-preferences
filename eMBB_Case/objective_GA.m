%%Objective Function


function objsum = objective_GA(A,eta, F, La, S)


Aaa=A  ;
%Aaa=reshape(Aaa,[F,La-1,S]);
Aaa=reshape(Aaa,[F,La,S]);
%     for s=1:S
%         for f=1:F
%            Aaa(f,La,s)=1-(Aaa(f,1,s)+Aaa(f,2,s)+Aaa(f,3,s)+Aaa(f,4,s));
%         end
%     end
A=Aaa;





% OBJ =zeros(F,La,S);
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
    
    A=[A(:,1,1); A(:,2,1); A(:,3,1); A(:,4,1); A(:,5,1); A(:,6,1); A(:,1,2); A(:,2,2); A(:,3,2); A(:,4,2); A(:,5,2); A(:,6,2); A(:,1,3); A(:,2,3); A(:,3,3); A(:,4,3) ; A(:,5,3) ; A(:,6,3)]';
end
    
    
    
    
    
    
    
    
    
