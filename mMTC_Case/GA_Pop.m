function[Popdata]= GA_Pop(P,F,S,La,NUM_PP)

B1=zeros(F,La);
B1(:,:,2)=zeros(F,La);
B = cat(3,B1,zeros(F,La));
B=zeros(F,La,S);

for num=1:NUM_PP
for s=1:S
    for f=1:F
        r = randi([1 La]);
        while P(f,r,s)==0
            r = randi([1 La]);
        end
        B(f,r,s) = 1;
    end
end
%B(:,La,:) = [];
Popdata{num} = B;
end
end


