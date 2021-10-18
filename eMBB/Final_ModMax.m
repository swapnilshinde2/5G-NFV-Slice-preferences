clc;
clear all;
close all
format long
CoSt_MMPA=zeros(1,7);
delayUP_MMPA=zeros(3,7);
delayCP_MMPA=zeros(3,7);
LayerCP_MMPA=zeros(6,7);
Adata_MMPA = cell(1,7);

tic
%%=======================Input Start=============================

%DFrate=[200*10^(6) 500*10^(6) 1000*10^(6) 1200*10^(6) 1500*10^(6) 1800*10^(6) 2000*10^(6)];
%DFrate=[1800*10^(6) 2000*10^(6)];
Z=7;
for z=1:Z
    [F,Fup, Fcp, S, La, P, u, U,Actf,U_t,L_s,r_s,L_c,maxdup,maxdcp,K,Cp,Ol,t0,dels,Dtup,Dtcp,deltup,eta1,eta, idpr,DFrate]  =Input_eMBB_Case(z);
    
    DFrate(1,z)=idpr;
    Dtup=zeros(1,Fup);
    Dtcp=zeros(1,Fcp);
    deltup=zeros(1,S);
    deltcp=zeros(1,S);
    %objsumbest=Inf;
    
    
    
    
    A=A_MMP(F,La,S,K,maxdup,maxdcp,Ol,P, Fup, eta1);
    A;
    
    % Ol= 0.35*[5.5*10^11 6*10^11 6*10^11 10*10^11 10*10^12];
    
    Adata_MMPA{z} = A;
    
    objsumbest=Inf;
    
    %----------OBJ Function-------------------------------------------------
    
    [objsum]= objective(F,La,S,A,eta);
    
    [ceq,c,LayerCP_l,delayUP_s, delayCP_s]= Constraints(F,Fup,Fcp,La,S,A,eta,eta1,Ol,K,t0,maxdup,maxdcp);
    
    delayUP_MMPA(:,z)=delayUP_s;
    delayCP_MMPA(:,z)=delayCP_s;
    LayerCP_MMPA(:,z)=LayerCP_l;
    CoSt_MMPA(1,z)=objsum;
    
    
    if c<=0
        if ceq==0
            
            fprintf( ' \n Does Follow Constraints for %d MB with Cost Function Value: %d',DFrate(1,z)*10^(-6), objsum)
        else
            fprintf('\n Does Not Follow Constraints for %d MB with Cost Function Value: %d',DFrate(1,z)*10^(-6), objsum);
        end
    else
        fprintf('\n Does Not Follow Constraints for %d MB with Cost Function Value: %d',DFrate(1,z)*10^(-6), objsum);
    end
    
    
    
    
end

toc
DFrate=10^(-6)*DFrate;
CoSt_MMPA=10^(-12)*CoSt_MMPA;


delayUP_MMPA=delayUP_MMPA*10^(3);
maxdup=maxdup*10^(3);
delayCP_MMPA=delayCP_MMPA*10^(3);
maxdcp=maxdcp*10^(3);
LayerCP_MMPA=LayerCP_MMPA*10^(-12);
Cp=Cp*10^(-12);



% figure
% title("eMBB Slice")
% 
% %-------------Plot A------------------------------------------------------
% for ttt=1:3
%     figure
%     for z=1:Z
%         B= cell2mat(Adata_MMPA(1,z));
% 
%         A11(:,:,1)=[1 0 0 0 0 0; B(:,:,1)];
%         A11(:,:,2)=[1 0 0 0 0 0; B(:,:,2)];
%         A11(:,:,3)=[1 0 0 0 0 0; B(:,:,3)];
%         A=A11;
%         data =[
%             1 1 1 1 1 1 1 1 1 1 1 1 1 1
%             1 1 1 1 1 1 1 1 1 1 1 1 1 1
%             1 1 1 1 1 1 1 1 1 1 1 1 1 1
%             1 1 1 1 1 1 1 1 1 1 1 1 1 1
%             1 1 1 1 1 1 1 1 1 1 1 1 1 1
%             1 1 1 1 1 1 1 1 1 1 1 1 1 1];
% 
% 
%         data_class ={  A(14,1,ttt) A(13,1,ttt) A(12,1,ttt) A(11,1,ttt) A(10,1,ttt) A(9,1,ttt) A(8,1,ttt) A(7,1,ttt) A(6,1,ttt) A(5,1,ttt) A(4,1,ttt) A(3,1,ttt) A(2,1,ttt) A(1,1,ttt)
%             A(14,2,ttt) A(13,2,ttt) A(12,2,ttt) A(11,2,ttt) A(10,2,ttt) A(9,2,ttt) A(8,2,ttt) A(7,2,ttt) A(6,2,ttt) A(5,2,ttt) A(4,2,ttt) A(3,2,ttt) A(2,2,ttt) A(1,2,ttt)
%             A(14,3,ttt) A(13,3,ttt) A(12,3,ttt) A(11,3,ttt) A(10,3,ttt) A(9,3,ttt) A(8,3,ttt) A(7,3,ttt) A(6,3,ttt) A(5,3,ttt) A(4,3,ttt) A(3,3,ttt) A(2,3,ttt) A(1,3,ttt)
%             A(14,4,ttt) A(13,4,ttt) A(12,4,ttt) A(11,4,ttt) A(10,4,ttt) A(9,4,ttt) A(8,4,ttt) A(7,4,ttt) A(6,4,ttt) A(5,4,ttt) A(4,4,ttt) A(3,4,ttt) A(2,4,ttt) A(1,4,ttt)
%             A(14,5,ttt) A(13,5,ttt) A(12,5,ttt) A(11,5,ttt) A(10,5,ttt) A(9,5,ttt) A(8,5,ttt) A(7,5,ttt) A(6,5,ttt) A(5,5,ttt) A(4,5,ttt) A(3,5,ttt) A(2,5,ttt) A(1,5,ttt)
%             A(14,6,ttt) A(13,6,ttt) A(12,6,ttt) A(11,6,ttt) A(10,6,ttt) A(9,6,ttt) A(8,6,ttt) A(7,6,ttt) A(6,6,ttt) A(5,6,ttt) A(4,6,ttt) A(3,6,ttt) A(2,6,ttt) A(1,6,ttt)
%             };
% 
% 
% 
%         DT=DFrate;
% 
%         data(end+1,:)=NaN;
%         %figure;
%         subplot(1,Z,z)
%         b={bar3([1 2],data([1 end],:),'stacked')};
%         hold on
%         for k=2:(size(data,1)-1)
%             b{k}=bar3([k-1 k],data([end k],:),'stacked');
%         end
%         for k=1:(size(data,1)-1)
%             for k2=1:size(data,2)
%                 switch data_class{k,k2}
% 
%                     case 0
%                         set(b{k}(k2),'FaceColor','w')
%                         %set(b{k}(k2),'EdgeColor', 'k','LineWidth', 2);
%                     case 1
% 
%                         set(b{k}(k2),'FaceColor','m')
%                         set(b{k}(k2),'EdgeColor', 'k','LineWidth', 2);
%                 end
% 
% 
%             end
% 
%             set ( gca, 'ydir', 'reverse' )
% 
%         end
% 
% 
%     end
% 

%end
save('MMPA_Data_new')