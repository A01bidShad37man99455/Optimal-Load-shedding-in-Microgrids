function[jar]=rand_islandAA(busload45,spriority_array45)


busload45=[0	0.1	0.09	0.12	0.06	0.06	0.2	0.2	0.06	0.06	0.045	0.06	0.06	0.12	0.06	0.06	0.06	0.09	0.09	0.09	0.09	0.09	0.09	0.42	0.42	0.06	0.06	0.06	0.12	0.2	0.15	0.21	0.06
]';

spriority_array45=[0	29	6	17	9	13	17	30	4	34	47	35	35	24	64	26	8	55	28	17	29	7	10	46	37	41	5	17	25	28	2	4	12
]/100;
[mn,l]=size(spriority_array45);

for ikc=1:l
spriority_limit(1,ikc)=(busload45(ikc,1).*(spriority_array45(1,ikc)));
 end

 for jl=1:l
jar(:,jl)=((busload45(jl,1)-spriority_limit(1,jl)).*rand+spriority_limit(1,jl));

 end

 end