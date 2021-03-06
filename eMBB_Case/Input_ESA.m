function [F,Fup, Fcp, S, La, P, u, U,Actf,U_t,L_s,r_s,L_c,maxdup,maxdcp,K,Cp,Ol,t0,dels,Dtup,Dtcp,deltup,eta1,eta, ipdr, DFrate] =Input_ESA(z)

DFrate=[200*10^(6) 500*10^(6) 1000*10^(6) 1200*10^(6) 1500*10^(6) 1800*10^(6) 2000*10^(6)];
%DFrate=[1200*10^(6) 1500*10^(6) 1800*10^(6) 2000*10^(6)];
Fup=3;
Fcp=3;
F=Fup+Fcp;
S=3;
La=6;

ipdr=DFrate(1,z);

P1 =  [0.7 0.2 0.1 0 0 0;
    0.2 0.3 0.5 0 0 0;
    0 0.1 0.6 0.3 0 0;
    0 0 0.1 0.5 0.4 0;
    0 0 0.3 0.2 0.5 0;
    0 0 0 0 0 1];
P1(:,:,2)= [0.5 0.3 0.2 0 0 0;
    0 0.3 0.2 0.5 0 0;
    0 0 0.2 0.5 0.3 0;
    0 0 0 0.4 0.6 0;
    0 0 0 0.6 0.4 0;
    0 0 0 0 0 1];

P = cat(3,P1,[0.5 0.4 0.1 0 0 0;
    0 0 0.2 0.5 0.3 0;
    0 0 0.2 0.3 0.5 0;
    0 0 0 0.3 0.7 0;
    0 0 0 0 0.6 0.4;
    0 0 0 0 0 1]);


u1 = [1 1 1 0 0 0]';
u1(:,:,2) = [1 1 1 0 0 0]';
u = cat(3,u1,[1 1 1 0 0 0]');

Num_NF1=[3 1 1 3 2 3]';
Num_NF1(:,:,2) = [2 2 1 3 2 3]';
Num_NF = cat(3,Num_NF1,[3 1 1 3 2 3]');

U=[1000 2000 1000000];
Actf=[0.2 0.3 0.1];
U_t1 = [round(U(1,1)*Actf(1,1))];
U_t1(:, :, 2) = [round(U(1,2)*Actf(1,2))];
U_t = cat(3,U_t1,[round(U(1,3)*Actf(1,3))]);

L_s1 = [250*8];
L_s1(:, :, 2) = [1000*8];
L_s = cat(3,L_s1,[100*8]);

r_s1 = [(100)*10^(6)*(1/L_s(1,1,1))];
r_s1(:, :, 2) = [(DFrate(1,z))*(1/L_s(1,1,2))];
r_s = cat(3,r_s1,[(500)*10^(3)*(1/L_s(1,1,3))]);

L_c1 = [1000*8];
L_c1(:, :, 2) = [1000*8];
L_c = cat(3,L_c1,[1000*8]);

maxdup1 = 0.5*[10*10^(-3) 10*10^(-3) 10*10^(-3) 10*10^(-3) 10*10^(-3) 10*10^(-3) 10*10^(-3) 10*10^(-3) 10*10^(-3)];
maxdup1(:, :, 2) = [50*10^(-3) 50*10^(-3) 50*10^(-3) 50*10^(-3) 50*10^(-3) 50*10^(-3) 50*10^(-3) 50*10^(-3) 50*10^(-3)];
maxdup = cat(3,maxdup1,[1 1 1 1 1 1 1 1 1]);

maxdcp1 = [100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3)];
maxdcp1(:, :, 2) = [100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3)];
maxdcp = cat(3,maxdcp1,[100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3) 100*10^(-3)]);


K=[0.5*10^(-3) 1.5*10^(-3) 4.5*10^(-3) 16*10^(-3) 36*10^(-3) 76*10^(-3)];

K_a=(1/3);
Cp=(10^3)*3*0.25*[3*10^12 5*10^12 5*10^12 12*10^12 18*10^12 20*10^12];


Ol=K_a*Cp;
t0=0.15*10^(-14);


dels1 = [0];
dels1(:,:,2) = [0];
dels = cat(3,dels1,[0]);

Dtup=zeros(1,Fup);
Dtcp=zeros(1,Fcp);
deltup=zeros(1,S);
deltcp=zeros(1,S);
%objsumbest=Inf;



eta11 = zeros(F,1,S);

for s = 1:S
    for f = 1:F
        eta11(f,1,s) = U_t(1,1,s)*(u(f,1,s)*r_s(1,1,s)*L_s(1,1,s)+(1-u(f,1,s))*L_c(1,1,s));
    end
end
eta11;


eta1 = zeros(F,1,S);
for s = 1:S
    for f = 1:F
        eta1(f,1,s) = eta11(f,1,s)*Num_NF(f,1,s);
    end
end
eta1;

eta = zeros(F,La,S);

for s = 1:S
    for l=1:La
        for f = 1:F
            
            eta(f,l,s) = eta1(f,1,s)*(1/P(f,l,s));
        end
    end
end
eta;

end