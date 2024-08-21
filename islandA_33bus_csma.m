clc
clear all 
close all
tic
basekv=12.66 ;% 11 kv
basemva = 100;
base_impedance=(basekv)^2/basemva;%base impedance=(basekv)^2/basemva
s=1/base_impedance;
accuracy = 0.001;
maxiter = 1000;
x=.001;


%Totalgeneration_islandA=DG1+DG2+DG3+DG4;
spriority_array=[0	29	6	17	9	13	17	30	4	34	47	35	35	24	64	26	8	55	28	17	29	7	10	46	37	41	5	17	25	28	2	4	12
]/100;
[mn,l]=size(spriority_array);
voltages=[];
lowlimit=zeros(1,33);
VSM=[];
busload=[0	0.1	0.09	0.12	0.06	0.06	0.2	0.2	0.06	0.06	0.045	0.06	0.06	0.12	0.06	0.06	0.06	0.09	0.09	0.09	0.09	0.09	0.09	0.42	0.42	0.06	0.06	0.06	0.12	0.2	0.15	0.21	0.06
];
 for ik=1:l
lowlimit(1,ik)=(busload(1,ik).*spriority_array(1,ik));
 end
busdata=[1   0    1    0      0   0      0    0    0   0    0
         2   0    1    0       100*x   60*x       0    0    0   0    0
         3   0    1   0        90*x    40*x      0    0    0    0       0
         4   1    1   0        120*x   80*x      .03    0    0    0       0
         5   0    1    0        60*x    30*x      0    0    0    0       0
         6   0    1    0        60*x    20*x      0    0    0    0       0
         7   2    1    0        200*x   100*x     0.8    0    0    0       0       
         8   0    1    0        200*x   100*x     0    0    0    0       0  
         9   0    1    0        60*x    20*x      0    0    0    0       0
         10   0    1    0        60*x    20*x      0    0    0    0       0
         11   0    1    0        45*x    30*x      0    0    0    0       0
         12   0    1    0        60*x    35*x      0    0    0    0       0
         13   0    1    0        60*x    35*x      0    0    0    0       0
         14   0    1    0        120*x   80*x      0    0    0    0       0
         15   0    1    0        60*x    10*x      0    0    0    0       0
         16   0    1    0        60*x    20*x      0    0    0    0       0
         17   0    1    0        60*x    20*x      0    0    0    0       0
         18   0    1    0        90*x    40*x      0    0    0    0       0
         19   0    1    0        90*x    40*x      0    0    0    0       0
         20   0    1    0        90*x    40*x      0    0    0    0       0 
         21   0    1    0        90*x    40*x      0    0    0    0       0
         22   0    1    0        90*x    40*x      0    0    0    0       0
         23   0    1    0        90*x    50*x      0    0    0    0       0
         24   0    1    0        420*x   200*x     0    0    0    0       0
         25   2    1    0        420*x   200*x     0.6   0    0    0       0
         26   0    1    0        60*x    25*x      0    0    0    0       0
         27   0    1    0        60*x    25*x      0    0    0    0       0
         28   0    1    0        60*x    20*x      0    0    0    0       0
         29   0    1    0        120*x   70*x      0    0    0    0       0
         30   2    1    0        200*x   600*x     0.4     0    0    0       0
         31   0    1    0        150*x   70*x      0    0    0    0       0  
         32   0    1    0        210*x   100*x     0    0    0    0       0
         33   0    1    0        60*x    40*x      0    0    0    0       0];


linedata=[1	2	0.0922*s 	0.047*s   0   1
2	3	0.493*s 	0.2511*s   0   1
3	4	0.366*s 	0.1864*s   0   1
4	5	0.3811*s 	0.1941*s   0   1
5	6	0.819*s 	0.707*s   0   1
6	7	0.1872*s 	0.6188*s   0   1
7	8	0.7114*s 	0.2351*s   0   1
8	9	1.03*s 	    0.74*s   0   1
9	10	1.044*s 	0.74*s   0   1
10	11	0.1966*s 	0.065*s   0   1
11	12	0.3744*s 	0.1238*s   0   1
12	13	1.468*s 	1.155*s   0   1
13	14	0.5416*s 	0.7129*s   0   1
14	15	0.591*s 	0.526*s   0   1
15	16	0.7463*s 	0.545*s   0   1
16	17	1.289*s 	1.721*s   0   1
17	18	0.732*s 	0.574*s   0   1
2	19	0.164*s 	0.1565*s   0   1
19	20	1.5042*s 	1.3554*s   0   1
20	21	0.4095*s 	0.4784*s   0   1
21	22	0.7089*s 	0.9373*s   0   1
3	23	0.4512*s 	0.3083*s   0   1
23	24	0.898*s 	0.7091*s   0   1
24	25	0.896*s 	0.7011*s   0   1
6	26	0.203*s 	0.1034*s   0   1
26	27	0.2842*s 	0.1447*s   0   1
27	28	1.059*s 	0.9337*s   0   1
28	29	0.8042*s 	0.7006*s   0   1
29	30	0.5075*s 	0.2585*s   0   1
30	31	0.9744*s 	0.963*s   0   1
31	32	0.3105*s 	0.3619*s   0   1
32	33	0.341*s 	0.5302*s   0   1];

Njhgg=50;
Max_itersma=1000;
dim=33;

bestPositions=zeros(1,dim);
Destination_fitness=inf;
AlliFitness = inf*ones(Njhgg,1);
weight = ones(Njhgg,dim);


Convergence_curve=zeros(1,Max_itersma);
itsma=1;  %Number of iterations
 
zparameter=0.03; % parameter
n=1000;
dx0=0;
if dx0==0
    dx0=0.8;
end
% Initialize
dx(1)=2.3*dx0^2*sin(pi*dx0);
% Simulate
for i=2:n
    dx(i,1)=2.3*dx(i-1)^2*sin(pi*dx(i-1));
end
%for lsl=1:50
dgofi=load('randdd.mat');
 Xpop =cell2mat(struct2cell(dgofi));

while  itsma <= Max_itersma
    
 
   for ikodh=1:Njhgg
     for jmm=1:dim
    
if Xpop(ikodh,jmm)<lowlimit(1,jmm) || Xpop(ikodh,jmm)>(busload(1,jmm))
     liklo=rand_islandAA;
      Xpop(ikodh,jmm)=liklo(1,jmm); 
         
                        
               
   else Xpop(ikodh,jmm)=Xpop(ikodh,jmm);
end
     end
 end      
    
 for ikodh=1:50
    busdata(:,5)=Xpop(ikodh,:);
lfybusold;
lfnewton11;
lineflow2;
if min(Vm)<0.9 ||  max(Vm)>1.1
 AlliFitness(ikodh,:)=1000;
else if VSM_sys<0.67 ||  VSM_sys>1
   AlliFitness(ikodh,:)=1000;
  else if remainingload+(real(SLT))>1.83 
                AlliFitness(ikodh,:)=1000;
 else AlliFitness(ikodh,:)=(-(VSM_sys+remainingload));
 end
end
    end 
    end
    
    [SmellOrder,SmellIndex] = sort(AlliFitness);  %Eq.(2.6)
    worstFitness = SmellOrder(Njhgg);
    bestFitness = SmellOrder(1);

    Sup=bestFitness-worstFitness+eps;  % plus eps to avoid denominator zero

    %calculate the fitness weight of each slime mold
    for ikodh=1:Njhgg
        for jmm=1:dim
            if ikodh<=(Njhgg/2)  %Eq.(2.5)
                weight(SmellIndex(ikodh),jmm) = 1+rand()*log10((bestFitness-SmellOrder(ikodh))/(Sup)+1);
            else
                weight(SmellIndex(ikodh),jmm) = 1-rand()*log10((bestFitness-SmellOrder(ikodh))/(Sup)+1);
            end
        end
    end
    
 
    if bestFitness < Destination_fitness
        bestPositions=Xpop(SmellIndex(1),:);
        Destination_fitness = bestFitness;
    end
    
   asma = atanh(-(itsma/Max_itersma)+1);   %Eq.(2.4)
    bsma = 1-itsma/Max_itersma;
  

    for ikodh=1:Njhgg
        if rand<zparameter     %Eq.(2.7)
            Xpop(ikodh,:) =rand_islandAA;
        else
            prty =tanh(abs(AlliFitness(ikodh)-Destination_fitness));  %Eq.(2.2)
            vb = abs(unifrnd(-asma,asma,1,dim));  %Eq.(2.3)
            vc = abs(unifrnd(-bsma,bsma,1,dim));
            for jmm=1:dim
                rsma = dx(itsma,1); %rand();
                Asma = randi([1,Njhgg]);  % two positions randomly selected from population
               Bsma = randi([1,Njhgg]);
                if rsma<prty    %Eq.(2.1)
                    Xpop(ikodh,jmm) = bestPositions(jmm)+ vb(jmm)*(weight(ikodh,jmm)*abs(Xpop(Asma,jmm)-Xpop(Bsma,jmm)));
                else 
                    Xpop(ikodh,jmm) = vc(jmm)*Xpop(ikodh,jmm);
                end
              
            end
        end
            
         
    end
 
    Convergence_curve(itsma)=Destination_fitness;
    itsma=itsma+1;
  % end
fprintf('CSMA|%5.0f -----> %9.16f\n',itsma,Destination_fitness)

end

display(['The best location of SMA is: ', num2str(bestPositions)]);
display(['The best fitness of SMA is: ', num2str(Destination_fitness)])
busdata(:,5)=bestPositions;
lfybusold;
lfnewton11;
busout
remainingload
VSM_sys
fitnessss=Destination_fitness
likjjjj=[fitnessss;remainingload;VSM_sys]
toc