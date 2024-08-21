clc
clear all 
close all
tic
basekv=12.66 ;% 11 kv
basemva = 100;
base_impedance=(basekv)^2/basemva;%base impedance=(basekv)^2/basemva

accuracy = 0.001;
maxiter = 1000;



%Totalgeneration_islandA=DG1+DG2+DG3+DG4;
spriority_array=[4%	28%	37%	29%	46%	44%	20	30	15	69	11	17	26	14	34	24	27	35	13	31	19	30	38	54	29	39	21	49%	47%	38%	49%	47%	12%	9%	70%	12%	2%	39%	62%	47%	13%	26%	32%	59%	11%	40%	45%	26%	13%	30%	34	8	21	16	17	31	17	20	23	18	38	19	31	24	11	7	44	22	18
]/100;
[mn,l]=size(spriority_array);
voltages=[];
lowlimit=zeros(1,40);
VSM=[];
busload=[0.0404	0.075	0.03	0.028	0.145	0.145	0.008	0.008	0	0.0455	0.06	0.06	0	0.001	0.114	0.005	0	0.028	0	0.014	0.014	0.0405	0.0036	0.0043	0.0264	0.024	0	0	0	0.1	0	1.244	0.032	0	0.227	0.059	0.018	0.018	0.028	0.028
];
 for ik=1:l
lowlimit(1,ik)=(busload(1,ik).*spriority_array(1,ik));
 end
 
 %        Bus Bus  Voltage Angle   ---Load----          -------Generator----- Static Mvar
%        No  code Mag.    Degree  MW    Mvar           MW  Mvar Qmin Qmax    +Qc/-Ql
busdata=[
%1	1	1	0	0	0	        0	0	0	0  0
%2	0	1	0	0	0	        0	0	0	0  0
%3	0	1	0	0	0	        0   0	0	0 0
%4	0	1	0	0	0	        0	0	0	0 0
%5	0	1	0	0	0	        0	0	0	0 0
%6	0	1	0	0.0026	0.0022	0	0	0	0 0
1	0	1	0	0.0404	0.03	0	0	0	0 0
2	0	1	0	0.075	0.054	0	0	0	0 0
3	0	1	0	0.03	0.022	0	0	0	0 0
4	0	1	0	0.028	0.019	0	0	0	0 0
5	2	1	0	0.145	0.104	.259	0	0	0 0 %.259
6	0	1	0	0.145	0.104	0	0	0	0 0
7	0	1	0	0.008	0.0055	0	0	0	0 0
8	0	1	0	0.008	0.0055	0	0	0	0 0
9	0	1	0	0	0	        0	0	0	0 0
10	0	1	0	0.0455	0.03	0	0	0	0 0
11	0	1	0	0.06	0.035	0	0	0	0 0
12	1	1	0	0.06	0.035	.5510 0	0	0 0 %.551
13	0	1	0	0	0	        0	0	0	0 0
14	0	1	0	0.001	0.0006	0	0	0	0 0
15	0	1	0	0.114	0.081	0	0	0	0 0
16	0	1	0	0.005	0.0035	0	0	0	0 0
17	0	1	0	0	0	        0	0	0	0  0
18	0	1	0	0.028	0.02	0	0	0	0 0
19	0	1	0	0	0	        0	0	0	0 0
20	0	1	0	0.014	0.01	0	0	0	0 0
21	0	1	0	0.014	0.01	0	0	0	0 0
%28	0	1	0	0.026	0.0186	0	0	0	0 0
%29	0	1	0	0.026	0.0186	0	0	0	0 0
%30	0	1	0	0	0	        0	0	0	0 0
%31	0	1	0	0	0	        0	0	0	0 0
%32	0	1	0	0	0	        0	0	0	0 0
%33	0	1	0	0.014	0.01	0	0	0	0 0
%34	0	1	0	0.0195	0.014	0	0	0	0 0
%35	0	1	0	0.006	0.004	0	0	0	0 0
%36	0	1	0	0.026	0.01855	0	0	0	0 0
%37	0	1	0	0.026	0.01855	0	0	0	0 0
%38	0	1	0	0	0	        0	0	0	0 0
%39	0	1	0	0.024	0.017	0	0	0	0 0
%40	0	1	0	0.024	0.017	0	0	0	0 0
%41	0	1	0	0.0012	0.001	0	0	0	0 0
%42	0	1	0	0	0	        0	0	0	0 0
%43	0	1	0	0.006	0.0043	0	0	0	0 0
%44	0	1	0	0	0	        0	0	0	0 0
%45	0	1	0	0.0392	0.0263	0	0	0	0 0
%46	0	1	0	0.0392	0.0263	0	0	0	0 0
%47	0	1	0	0	0	        0	0	0	0 0
%48	0	1	0	0.079	0.0564	0	0	0	0 0
%49	0	1	0	0.3847	0.2745	0	0	0	0 0
%50	0	1	0	0.3847	0.2745	0	0	0	0 0
22	0	1	0	0.0405	0.0283	0	0	0	0 0
23	0	1	0	0.0036	0.0027	0	0	0	0 0
24	0	1	0	0.00435	0.0035	0	0	0	0 0
25	0	1	0	0.0264	0.019	0	0	0	0 0
26	0	1	0	0.024	0.0172	0	0	0	0 0
27	0	1	0	0	0	        0	0	0	0 0
28	0	1	0	0	0	        0	0	0	0 0
29	0	1	0	0	0	        0	0	0	0 0
30	0	1	0	0.1	0.072	    0	0	0	0 0
31	0	1	0	0	0	        0	0	0	0 0
32	2	1	0	1.244	0.888	.937	0	0	0 0 %.937
33	0	1	0	0.032	0.023	0	0	0	0 0
34	0	1	0	0	       0	0	0	0	0 0
35	0	1	0	0.227	0.162	0	0	0	0 0
36	0	1	0	0.059	0.042	0	0	0	0 0
37	0	1	0	0.018	0.013	0	0	0	0 0
38	0	1	0	0.018	0.013	0	0	0	0 0
39	0	1	0	0.028	0.02	0	0	0	0 0
40	0	1	0	0.028	0.02	0	0	0	0 0];

linedata=[
%1	2	0.000311954	0.00074869	0	1
%2	3	0.000311954	0.00074869	0	1
%3	4	0.000935862	0.002246069	0	1
%4	5	0.015660095	0.0183429	0	1
%5	6	0.228350387	0.116296481	0	1
%6	7	0.2377714	0.121100574	0	1
1	2	0.057524332	0.029323684	0	1
2	3	0.030758672	0.015660095	0	1
3	4	0.510980784	0.168891939	0	1
4	5	0.116795608	0.038619915	0	1
5	6	0.443848266	0.146680809	0	1
6	7	0.642625406	0.212128775	0	1
7	8	0.65136012	0.215248315	0	1
8	9	0.660094834	0.218118293	0	1
9	10	0.122660344	0.04055403	0	1
10	11	0.233591215	0.07723983	0	1
11	12	0.002932368	0.000998253	0	1
12	13	0.204392313	0.067569254	0	1
13	14	0.131395059	0.043049663	0	1
14	15	0.213127028	0.070439231	0	1
15	16	0.008734714	0.002869978	0	1
16	17	0.099263788	0.032817569	0	1
17	18	0.216059396	0.071437484	0	1
18	19	0.467182431	0.15441727	0	1
19	20	0.192725231	0.063701023	0	1
20	21	0.108060893	0.035687547	0	1
%3	28	0.002745196	0.006738208	0	1
%28	29	0.039930122	0.097641627	0	1
%29	30	0.248190666	0.082043923	0	1
%30	31	0.043798353	0.014474669	0	1
%31	32	0.218991764	0.072373347	0	1
%32	33	0.523458947	0.175692538	0	1
%33	34	1.065635139	0.352258548	0	1
%34	35	0.919640629	0.304030447	0	1
%3	36	0.002745196	0.006738208	0	1
%36	37	0.039930122	0.097641627	0	1
%37	38	0.065697529	0.076740704	0	1
%38	39	0.018966808	0.02214874	0	1
%39	40	0.001123035	0.001310207	0	1
%40	41	0.454392313	0.530883454	0	1
%41	42	0.19341153	0.226041927	0	1
%42	43	0.025580235	0.02982281	0	1
%43	44	0.005739955	0.007237335	0	1
%44	45	0.067943599	0.08566259	0	1
%45	46	0.000561517	0.00074869	0	1
%4	47	0.002121288	0.005240829	0	1
%47	48	0.053094584	0.12996007	0	1
%48	49	0.180808585	0.442413277	0	1
%49	50	0.051285251	0.125467931	0	1
2	22	0.057898677	0.029510856	0	1
22	23	0.207075119	0.069503369	0	1
3	24	0.10856002	0.055278263	0	1
24	25	0.126653357	0.064512104	0	1
25	26	0.177314699	0.090279511	0	1
26	27	0.175505366	0.089406039	0	1
27	28	0.992013976	0.332979785	0	1
28	29	0.488956826	0.164087846	0	1
29	30	0.189792862	0.062765161	0	1
30	31	0.240890941	0.073122036	0	1
31	32	0.316633392	0.16128026	0	1
32	33	0.060768655	0.030945845	0	1
33	34	0.090466683	0.046044422	0	1
34	35	0.443286748	0.225792363	0	1
35	36	0.649488395	0.330796107	0	1
5	37	0.125530322	0.038120789	0	1
37	38	0.002932368	0.000873471	0	1
6	39	0.461317694	0.152483154	0	1
39	40	0.002932368	0.000998253	0	1
];
Njhgg=50;
Max_itersma=1000;
dim=40;

bestPositions=zeros(1,dim);
Destination_fitness=inf;
AlliFitness = inf*ones(Njhgg,1);
weight = ones(Njhgg,dim);


Convergence_curve=zeros(1,Max_itersma);
itsma=1; 
 
zparameter=0.03; 
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

dgofi=load('rand69.mat');
 Xpop =cell2mat(struct2cell(dgofi));  
 
% Main loop
while  itsma <= Max_itersma
     
 for ikodh=1:Njhgg
     for jmm=1:dim
   
if Xpop(ikodh,jmm)<lowlimit(1,jmm) || Xpop(ikodh,jmm)>(busload(1,jmm))
     liklo=rand_islandD;
      Xpop(ikodh,jmm)=liklo(1,jmm); 
         
                        
                Xpop(ikodh,jmm)=liklo(1,jmm); 
          else Xpop(ikodh,jmm)=Xpop(ikodh,jmm);
end
     end
 end
    
 for ikodh=1:50
    busdata(:,5)=Xpop(ikodh,:);
lfybusold;
lfnewton6;
lineflow2;
if min(Vm)<0.9 ||  max(Vm)>1.1
 AlliFitness(ikodh,:)=1000;
else if VSM_sys<0.67 ||  VSM_sys>1
   AlliFitness(ikodh,:)=1000;
  else if remainingload+(real(SLT))>1.747 
                AlliFitness(ikodh,:)=1000;
 else AlliFitness(ikodh,:)=(-(VSM_sys+remainingload));
 end
end
    end 
    end
    
    [SmellOrder,SmellIndex] = sort(AlliFitness); 
    worstFitness = SmellOrder(Njhgg);
    bestFitness = SmellOrder(1);

    Sup=bestFitness-worstFitness+eps; 

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
            Xpop(ikodh,:) =rand_islandD;
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
fprintf('cSMA|%5.0f -----> %9.16f\n',itsma,Destination_fitness)

end

display(['The best location of SMA is: ', num2str(bestPositions)]);
display(['The best fitness of SMA is: ', num2str(Destination_fitness)])
busdata(:,5)=bestPositions;
lfybusold;
lfnewton6;
busout
remainingload
VSM_sys
fitnessss=Destination_fitness
likjjjj=[fitnessss;remainingload;VSM_sys]
toc