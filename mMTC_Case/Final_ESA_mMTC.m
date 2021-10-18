
clc;
clear all;
close all
format long
CoSt_ESA=zeros(1,7);
delayUP_ESA=zeros(3,7);
delayCP_ESA=zeros(3,7);
LayerCP_ESA=zeros(6,7);
Adata_ESA = cell(1,7);
count_A=0;
tic
%%=======================Input Start=============================

%DFrate=[200*10^(6) 500*10^(6) 1000*10^(6) 1200*10^(6) 1500*10^(6) 1800*10^(6) 2000*10^(6)];
%DFrate=[1800*10^(6) 2000*10^(6)];
Z=7;
for z=1:Z
    z
      [F,Fup, Fcp, S, La, P, u, U,Actf,U_t,L_s,r_s,L_c,maxdup,maxdcp,K,Cp,Ol,t0,dels,Dtup,Dtcp,deltup,eta1,eta, ipdr, DLatency]  =Input_ESA(z);
    
    DFrate(1,z)=ipdr;
    Dtup=zeros(1,Fup);
    Dtcp=zeros(1,Fcp);
    deltup=zeros(1,S);
    deltcp=zeros(1,S);
    %objsumbest=Inf;
    objsumbest  = Inf;
    
    %=============================INPUT END====================================
    
    
    
    
    
    for s=1:S
        for f=1:F
            for l=1:La
                if P(f,l,s)>0
                    A(f,l,s)=1;
                    
                else
                    A(f,l,s)=0;
                end
            end
        end
    end
    B=A;
    
    M1=[1];
    M2=[1 0; 0 1];
    M3=[1 0 0; 0 1 0; 0 0 1];
    M4=[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1];
    
    
    
    for j=1:1
        f=6;
        k = find(B(f,:,3));
        A(f,[k],3)= M1(j,:);
        
        
        for j=1:2
            f=5;
            k = find(B(f,:,3));
            A(f,[k],3)= M2(j,:);
            
            for j=1:2
                f=4;
                k = find(B(f,:,3));
                A(f,[k],3)= M2(j,:);
                
                for j=1:3
                    f=3;
                    k = find(B(f,:,3));
                    A(f,[k],3)= M3(j,:);
                    
                    for j=1:3
                        f=2;
                        k = find(B(f,:,3));
                        A(f,[k],3)= M3(j,:);
                        
                        for j=1:3
                            f=1;
                            k = find(B(f,:,3));
                            A(f,[k],3)= M3(j,:);
                  
                            for j=1:1
                                f=6;
                                k = find(B(f,:,2));
                                A(f,[k],2)= M1(j,:);
                                
                                
                                
                                for j=1:2
                                    f=5;
                                    k = find(B(f,:,2));
                                    A(f,[k],2)= M2(j,:);
                                    
                                    for j=1:2
                                        f=4;
                                        k = find(B(f,:,2));
                                        A(f,[k],2)= M2(j,:);
                                        
                                        for j=1:3
                                            f=3;
                                            k = find(B(f,:,2));
                                            A(f,[k],2)= M3(j,:);
                                            
                                            for j=1:3
                                                f=2;
                                                k = find(B(f,:,2));
                                                A(f,[k],2)= M3(j,:);
                                                
                                                for j=1:3
                                                    f=1;
                                                    k = find(B(f,:,2));
                                                    A(f,[k],2)= M3(j,:);
                                               
                                                    for j=1:1
                                                        f=6;
                                                        k = find(B(f,:,1));
                                                        A(f,[k],1)= M1(j,:);
                                                        
                                                        
                                                        for j=1:3
                                                            f=5;
                                                            k = find(B(f,:,1));
                                                            A(f,[k],1)= M3(j,:);
                                                            
                                                            
                                                            for j=1:3
                                                                f=4;
                                                                k = find(B(f,:,1));
                                                                A(f,[k],1)= M3(j,:);
                                                                
                                                                
                                                                for j=1:3
                                                                    f=3;
                                                                    k = find(B(f,:,1));
                                                                    A(f,[k],1)= M3(j,:);
                                                                    
                                                                    
                                                                    for j=1:3
                                                                        f=2;
                                                                        k = find(B(f,:,1));
                                                                        A(f,[k],1)= M3(j,:);
                                                                        
                                                                        for j=1:3
                                                                            f=1;
                                                                            k = find(B(f,:,1));
                                                                            A(f,[k],1)= M3(j,:);
                                                                            
                                                                            
                                                                            A;
                                                                            Aaa=A;
                                                                            for s=1:S
                                                                                for f=1:F
                                                                                    
                                                                                    Aaa(f,La,s)=1-(Aaa(f,1,s)+Aaa(f,2,s)+Aaa(f,3,s)+Aaa(f,4,s));
                                                                                end
                                                                            end
                                                                            A=Aaa;
                                                                            count_A=count_A+1;
                                                                            if mod(count_A,10000) ==0
                                                                                count_A;
                                                                            end
                                                                            
                                                                            [objsum]= objective(F,La,S,A,eta);
                                                                            [ceq,c,LayerCP_l,delayUP_s, delayCP_s]= Constraints(F,Fup,Fcp,La,S,A,eta,eta1,Ol,K,t0,maxdup,maxdcp);
                                                                            
                                                                            if objsum <objsumbest
                                                                                if c<=0
                                                                                    
                                                                                    
                                                                                    objsumbest = objsum;
                                                                                    CoSt(1,z)=objsumbest;
                                                                                    
                                                                                    Abest=A;
                                                                                    Adata_ESA(1,z) = {A};
                                                                                    [objsum]= objective(F,La,S,A,eta);
                                                                                    
                                                                                    [ceq,c,LayerCP_l,delayUP_s, delayCP_s]= Constraints(F,Fup,Fcp,La,S,A,eta,eta1,Ol,K,t0,maxdup,maxdcp);
                                                                                    delayUP_ESA(:,z)=delayUP_s;
                                                                                    delayCP_ESA(:,z)=delayCP_s;
                                                                                    LayerCP_ESA(:,z)=LayerCP_l;
                                                                                    CoSt_ESA(1,z)=objsum;
                                                                                else
                                                                                    
                                                                                    % fprintf('\n Does Not Follow Constraints with Cost Function Value: %d',objsum);
                                                                                    
                                                                                    
                                                                                end
                                                                            end
                                                                            
                                                                        end
                                                                    end
                                                                    
                                                                end
                                                            end
                                                            
                                                            
                                                            
                                                        end
                                                    end
                                                end
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end
 fprintf('\n End');
save('ESA_Data_new_mMTC')