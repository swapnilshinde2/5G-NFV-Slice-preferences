clc;
clear;
close all;
%load('MMPA_Data', 'delayUP_MMPA','delayCP_MMPA','LayerCP_MMPA','Adata_MMPA', 'CoSt_MMPA')
%load('MPA_Data', 'delayUP_MPA','delayCP_MPA','LayerCP_MPA','Adata_MPA', 'CoSt_MPA')
%load('GA_Data', 'delayUP_GA','delayCP_GA','LayerCP_GA','Adata_GA', 'CoSt_GA', 'DFrate', 'maxdup','maxdcp','Cp', 'Z')
load('ESA_Data_new', 'delayUP_ESA','delayCP_ESA','LayerCP_ESA','Adata_ESA', 'CoSt_ESA')
load('MMPA_Data_new', 'delayUP_MMPA','delayCP_MMPA','LayerCP_MMPA','Adata_MMPA', 'CoSt_MMPA')
load('MPA_Data_new', 'delayUP_MPA','delayCP_MPA','LayerCP_MPA','Adata_MPA', 'CoSt_MPA')
load('GA_Data_new', 'delayUP_GA','delayCP_GA','LayerCP_GA','Adata_GA', 'CoSt_GA', 'DFrate', 'maxdup','maxdcp','Cp', 'Z', 'S', 'La')
delayUP_ESA=delayUP_ESA*10^(3);
delayCP_ESA=delayCP_ESA*10^(3);
LayerCP_ESA=LayerCP_ESA*10^(-12);
Cp=[Cp; Cp; Cp; Cp; Cp; Cp; Cp]
z=1:1:Z;

figure
p1=semilogx(DFrate(1,z), CoSt_MPA(1,z), 'b-^',DFrate(1,z), CoSt_MMPA(1,z),'g-o',DFrate(1,z), CoSt_GA(1,z),'m-d',DFrate(1,z), CoSt_ESA(1,z)*(10^(-12)),'c-s')
xlabel('Data Rate [Gb/sec]'), ylabel('Cost [TB] '),
xticks([200 500 1000 1200 1500 1800 2000])
xticklabels({'0.2','0.5','1','1.2','1.5','1.8','2'})
grid on
legend('MPA','MMPA','GA','ESA' )


figure
%subplot(2,2,1);
p2=semilogx(DFrate(1,z), delayUP_MPA(1,z), 'b-^',DFrate(1,z), delayUP_MMPA(1,z), 'g-o',DFrate(1,z), delayUP_GA(1,z), 'm-d',DFrate(1,z), delayUP_ESA(1,z), 'c-s',DFrate(1,z), maxdup(1,z,1),'r-p')
xlabel('Data Rate [Gb/sec]'), ylabel('Latency [msec]'),
xticks([200 500 1000 1200 1500 1800 2000])
xticklabels({'0.2','0.5','1','1.2','1.5','1.8','2'})
grid on
xlim([0 2000])
%ylim([0 10])
legend('MPA' , 'MMPA','GA','ESA','Required Latency')


figure
p2=semilogx(DFrate(1,z), delayUP_MPA(2,z), 'b-^',DFrate(1,z), delayUP_MMPA(2,z), 'g-o',DFrate(1,z), delayUP_GA(2,z), 'm-d',DFrate(1,z), delayUP_ESA(2,z), 'c-s',DFrate(1,z), maxdup(1,z,2),'r-p')
xlabel('Data Rate [Gb/sec]'), ylabel('Latency [msec]'),
xticks([200 500 1000 1200 1500 1800 2000])
xticklabels({'0.2','0.5','1','1.2','1.5','1.8','2'})
grid on
xlim([0 2000])
%ylim([0 70])
legend('MPA' , 'MMPA','GA','ESA','Required Latency')









figure
subplot(2,3,1);
p11=semilogx(DFrate(1,z),LayerCP_MPA(1,z), 'b-^', DFrate(1,z),LayerCP_MMPA(1,z), 'g-o',DFrate(1,z),LayerCP_GA(1,z), 'm-d',DFrate(1,z),LayerCP_ESA(1,z), 'c-s',DFrate(1,z), Cp(z,1), 'r-p')
xlabel('Data Rate [Gb/sec]'), ylabel('L1 [FLOPS], $\times 10^{15}$','Interpreter','latex'), 
xticks([200 500 1000 1500 2000])
xticklabels({'0.2','0.5','1','1.5','2'})
grid on

subplot(2,3,2);
p11=semilogx(DFrate(1,z),LayerCP_MPA(2,z), 'b-^', DFrate(1,z),LayerCP_MMPA(2,z), 'g-o',DFrate(1,z),LayerCP_GA(2,z), 'm-d',DFrate(1,z),LayerCP_ESA(1,z), 'c-s',DFrate(1,z), Cp(z,2), 'r-p')
xlabel('Data Rate [Gb/sec]'), ylabel('L2a [FLOPS] $\times 10^{15}$','Interpreter','latex'), 
xticks([200 500 1000 1500 2000])
xticklabels({'0.2','0.5','1','1.5','2'})
grid on
subplot(2,3,3);
p11=semilogx(DFrate(1,z),LayerCP_MPA(3,z), 'b-^', DFrate(1,z),LayerCP_MMPA(3,z), 'g-o',DFrate(1,z),LayerCP_GA(3,z), 'm-d',DFrate(1,z),LayerCP_ESA(1,z), 'c-s',DFrate(1,z), Cp(z,3), 'r-p')
xlabel('Data Rate [Gb/sec]'), ylabel('L2b [FLOPS] $\times 10^{15}$','Interpreter','latex'), 
xticks([200 500 1000 1500 2000])
xticklabels({'0.2','0.5','1','1.5','2'})
grid on


subplot(2,3,4);
p11=semilogx(DFrate(1,z),LayerCP_MPA(4,z), 'b-^', DFrate(1,z),LayerCP_MMPA(4,z), 'g-o',DFrate(1,z),LayerCP_GA(4,z), 'm-d',DFrate(1,z),LayerCP_ESA(1,z), 'c-s',DFrate(1,z), Cp(z,4), 'r-p')
xlabel('Data Rate [Gb/sec]'), ylabel('L3 [FLOPS] $\times 10^{15}$','Interpreter','latex'), 
xticks([200 500 1000 1500 2000])
xticklabels({'0.2','0.5','1','1.5','2'})
grid on

subplot(2,3,5);
p11=semilogx(DFrate(1,z),LayerCP_MPA(5,z), 'b-^', DFrate(1,z),LayerCP_MMPA(5,z), 'g-o',DFrate(1,z),LayerCP_GA(5,z), 'm-d',DFrate(1,z),LayerCP_ESA(1,z), 'c-s',DFrate(1,z), Cp(z,5), 'r-p')
xlabel('Data Rate [Gb/sec]'), ylabel('L4 [FLOPS] $\times 10^{15}$','Interpreter','latex'), 
xticks([200 500 1000 1500 2000])
xticklabels({'0.2','0.5','1','1.5','2'})
grid on

subplot(2,3,6);
p11=semilogx(DFrate(1,z),LayerCP_MPA(6,z), 'b-^', DFrate(1,z),LayerCP_MMPA(6,z), 'g-o',DFrate(1,z),LayerCP_GA(6,z), 'm-d',DFrate(1,z),LayerCP_ESA(1,z), 'c-s',DFrate(1,z), Cp(z,6), 'r-p')
xlabel('Data Rate [Gb/sec]'), ylabel('L5 [FLOPS] $\times 10^{15}$','Interpreter','latex'), 
xticks([200 500 1000 1500 2000])
xticklabels({'0.2','0.5','1','1.5','2'})
grid on
%legend('L3(MPA)', 'L3(MMPA)', 'L3(GA)', 'L3(ESA)', 'Max. LCap')


legend('MPA', 'MMPA',  'GA', 'ESA',  'Max. Comp. Capacity')
legend('Location','south')







figure
title("ESA Function Placement")
f.Position = [100 100 540 400];
%-------------Plot A------------------------------------------------------
for ttt=1:3
    figure
    for z=1:Z
           B_new= cell2mat(Adata_ESA(1,z));
        
        
        Num_NF1=[3 1 1 3 2 3]';
        Num_NF1(:,:,2) = [2 2 1 3 2 3]';
        Num_NF = cat(3,Num_NF1,[3 1 1 3 2 3]');
        Adata_ESA_new = cell(S,6);
        
        for s=1:S
            for f=1:6
                dim=Num_NF(f,:,s);
                Adata_ESA_new{s,f}=B_new(f,:,s).*ones(dim, La);
            end
            
        end
        
        for s=1:S
            A_new_ESA_l=[cell2mat(Adata_ESA_new(s,1))];
            for f=2:6
                A_new_ESA_l=[[A_new_ESA_l]; [cell2mat(Adata_ESA_new(s,f))]];
                
            end
            A_new_ESA_tt(:,:,s)=A_new_ESA_l;
        end
        B=A_new_ESA_tt;
        A11(:,:,1)=[1 0 0 0 0 0; B(:,:,1)];
        A11(:,:,2)=[1 0 0 0 0 0; B(:,:,2)];
        A11(:,:,3)=[1 0 0 0 0 0; B(:,:,3)];
        A=A11;
        data =[
            1 1 1 1 1 1 1 1 1 1 1 1 1 1
            1 1 1 1 1 1 1 1 1 1 1 1 1 1
            1 1 1 1 1 1 1 1 1 1 1 1 1 1
            1 1 1 1 1 1 1 1 1 1 1 1 1 1
            1 1 1 1 1 1 1 1 1 1 1 1 1 1
            1 1 1 1 1 1 1 1 1 1 1 1 1 1];
        
        
        data_class ={  A(14,1,ttt) A(13,1,ttt) A(12,1,ttt) A(11,1,ttt) A(10,1,ttt) A(9,1,ttt) A(8,1,ttt) A(7,1,ttt) A(6,1,ttt) A(5,1,ttt) A(4,1,ttt) A(3,1,ttt) A(2,1,ttt) A(1,1,ttt)
            A(14,2,ttt) A(13,2,ttt) A(12,2,ttt) A(11,2,ttt) A(10,2,ttt) A(9,2,ttt) A(8,2,ttt) A(7,2,ttt) A(6,2,ttt) A(5,2,ttt) A(4,2,ttt) A(3,2,ttt) A(2,2,ttt) A(1,2,ttt)
            A(14,3,ttt) A(13,3,ttt) A(12,3,ttt) A(11,3,ttt) A(10,3,ttt) A(9,3,ttt) A(8,3,ttt) A(7,3,ttt) A(6,3,ttt) A(5,3,ttt) A(4,3,ttt) A(3,3,ttt) A(2,3,ttt) A(1,3,ttt)
            A(14,4,ttt) A(13,4,ttt) A(12,4,ttt) A(11,4,ttt) A(10,4,ttt) A(9,4,ttt) A(8,4,ttt) A(7,4,ttt) A(6,4,ttt) A(5,4,ttt) A(4,4,ttt) A(3,4,ttt) A(2,4,ttt) A(1,4,ttt)
            A(14,5,ttt) A(13,5,ttt) A(12,5,ttt) A(11,5,ttt) A(10,5,ttt) A(9,5,ttt) A(8,5,ttt) A(7,5,ttt) A(6,5,ttt) A(5,5,ttt) A(4,5,ttt) A(3,5,ttt) A(2,5,ttt) A(1,5,ttt)
            A(14,6,ttt) A(13,6,ttt) A(12,6,ttt) A(11,6,ttt) A(10,6,ttt) A(9,6,ttt) A(8,6,ttt) A(7,6,ttt) A(6,6,ttt) A(5,6,ttt) A(4,6,ttt) A(3,6,ttt) A(2,6,ttt) A(1,6,ttt)
            };
        
        
        
        DT=DFrate;
        
        data(end+1,:)=NaN;
        %figure;
        subplot(1,Z,z)
        b={bar3([1 2],data([1 end],:),'stacked')};
        view(-70.5,10)
        hold on
        for k=2:(size(data,1)-1)
            b{k}=bar3([k-1 k],data([end k],:),'stacked');
        end
        for k=1:(size(data,1)-1)
            for k2=1:size(data,2)
                switch data_class{k,k2}
                    
                    case 0
                        set(b{k}(k2),'FaceColor','w')
                        %set(b{k}(k2),'EdgeColor', 'k','LineWidth', 2);
                    case 1
                        
                        set(b{k}(k2),'FaceColor','m')
                        set(b{k}(k2),'EdgeColor', 'k','LineWidth', 2);
                end
                
                
            end
            
            set ( gca, 'ydir', 'reverse' )
            
        end
        
        
    end
    
    
end



figure
title("GA Function Placement")


%-------------Plot A------------------------------------------------------
for ttt=1:3
    figure
    for z=1:Z
        B= cell2mat(Adata_GA(1,z));
        A11(:,:,1)=[1 0 0 0 0 0; B(:,:,1)];
        A11(:,:,2)=[1 0 0 0 0 0; B(:,:,2)];
        A11(:,:,3)=[1 0 0 0 0 0; B(:,:,3)];
        A=A11;
        data =[
            1 1 1 1 1 1 1 1 1 1 1 1 1 1
            1 1 1 1 1 1 1 1 1 1 1 1 1 1
            1 1 1 1 1 1 1 1 1 1 1 1 1 1
            1 1 1 1 1 1 1 1 1 1 1 1 1 1
            1 1 1 1 1 1 1 1 1 1 1 1 1 1
            1 1 1 1 1 1 1 1 1 1 1 1 1 1];
        
        
        data_class ={  A(14,1,ttt) A(13,1,ttt) A(12,1,ttt) A(11,1,ttt) A(10,1,ttt) A(9,1,ttt) A(8,1,ttt) A(7,1,ttt) A(6,1,ttt) A(5,1,ttt) A(4,1,ttt) A(3,1,ttt) A(2,1,ttt) A(1,1,ttt)
            A(14,2,ttt) A(13,2,ttt) A(12,2,ttt) A(11,2,ttt) A(10,2,ttt) A(9,2,ttt) A(8,2,ttt) A(7,2,ttt) A(6,2,ttt) A(5,2,ttt) A(4,2,ttt) A(3,2,ttt) A(2,2,ttt) A(1,2,ttt)
            A(14,3,ttt) A(13,3,ttt) A(12,3,ttt) A(11,3,ttt) A(10,3,ttt) A(9,3,ttt) A(8,3,ttt) A(7,3,ttt) A(6,3,ttt) A(5,3,ttt) A(4,3,ttt) A(3,3,ttt) A(2,3,ttt) A(1,3,ttt)
            A(14,4,ttt) A(13,4,ttt) A(12,4,ttt) A(11,4,ttt) A(10,4,ttt) A(9,4,ttt) A(8,4,ttt) A(7,4,ttt) A(6,4,ttt) A(5,4,ttt) A(4,4,ttt) A(3,4,ttt) A(2,4,ttt) A(1,4,ttt)
            A(14,5,ttt) A(13,5,ttt) A(12,5,ttt) A(11,5,ttt) A(10,5,ttt) A(9,5,ttt) A(8,5,ttt) A(7,5,ttt) A(6,5,ttt) A(5,5,ttt) A(4,5,ttt) A(3,5,ttt) A(2,5,ttt) A(1,5,ttt)
            A(14,6,ttt) A(13,6,ttt) A(12,6,ttt) A(11,6,ttt) A(10,6,ttt) A(9,6,ttt) A(8,6,ttt) A(7,6,ttt) A(6,6,ttt) A(5,6,ttt) A(4,6,ttt) A(3,6,ttt) A(2,6,ttt) A(1,6,ttt)
            };
        
        
        
        DT=DFrate;
        
        data(end+1,:)=NaN;
        %figure;
        subplot(1,Z,z)
        b={bar3([1 2],data([1 end],:),'stacked')};
        view(-70.5,10)
        hold on
        for k=2:(size(data,1)-1)
            b{k}=bar3([k-1 k],data([end k],:),'stacked');
        end
        for k=1:(size(data,1)-1)
            for k2=1:size(data,2)
                switch data_class{k,k2}
                    
                    case 0
                        set(b{k}(k2),'FaceColor','w')
                        %set(b{k}(k2),'EdgeColor', 'k','LineWidth', 2);
                    case 1
                        
                        set(b{k}(k2),'FaceColor','m')
                        set(b{k}(k2),'EdgeColor', 'k','LineWidth', 2);
                end
                
                
            end
            
            set ( gca, 'ydir', 'reverse' )
            
        end
        
        
    end
    
    
end





