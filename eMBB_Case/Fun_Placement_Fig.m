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
title("GA Function Placement")


%-------------Plot A------------------------------------------------------
for ttt=1:1
    figure
    for z=1:1
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
        %subplot(1,Z,z)
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
    
    yticks([1 2 3 4 5 6])
    yticklabels({'1',' 2a ','2b ','3',' 4' ,'5'})
    zticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14])
zticklabels({'UDM','PCF','NRF','NEF','NSSF','SMF','AUSF','AMF','UPF','PDCP','RLC','MAC','PHY','RF'})

end





