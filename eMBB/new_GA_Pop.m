
 nPop0=A_MMP(F,La,S,K,maxdup,maxdcp,Ol,P, Fup, eta1);
for s=1:S
    for f=1:F
        for l=1:La
            if P(f,l,s)>0
                BM(f,l,s)=1;
            else
                BM(f,l,s)=0;
            end
            ppn=nPop0(f,:,s);
            ppn2=BM(f,:,s);
            ppn2=ppn2(ppn2~=0);
            A_n=zeros(1,size(ppn,2))
            ppn3=randi([0 1],1, size(ppn2,2));
            A_n(f,:,s)=[(ppn3.*ppn2) zeros(1,(size(ppn,2)-size(ppn2,2)))];
            nup(f,:,s)=(ppn+(A_n));
            
        end
    end
end
nup


% A=[1 0 0 1 1 0];
% B=[1 1 1 1];
% C=randi([0 1],1, size(B,2));
% A_n=[(C.*B) zeros(1,(size(A,2)-size(B,2)))];
% 
% A=(A+(A_n));
% 
% for i=1:size(A,2)
% if A(1,i)>1
%     A(1,i)=1;
% end
% end
% A
