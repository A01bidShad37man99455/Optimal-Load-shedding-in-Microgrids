function[jar]=rand_islandD(busload45,spriority_array45)



 busload45=[0.0404	0.075	0.03	0.028	0.145	0.145	0.008	0.008	0	0.0455	0.06	0.06	0	0.001	0.114	0.005	0	0.028	0	0.014	0.014	0.0405	0.0036	0.0043	0.0264	0.024	0	0	0	0.1	0	1.244	0.032	0	0.227	0.059	0.018	0.018	0.028	0.028
]';
spriority_array45=[ %4
    %28
    %37
    %29
    %46
    %44
    20
    30
    15
    69
    11
     17
    26
    14
    34
    24
    27
    35
    13
    31
    19
    30
    38
    54
    29
    39
    21
    %49
    %47
    %38
    %49
    %47
    %12
     %9
    %70
    %12
    % 2
    %39
    %62
    %47
    %13
    %26
    %32
    %59
    %11
    %40
    %45
    %26
    %13
   % 30
    34
     8
    21
    16
    17
    31
    17
    20
    23
    18
    38
    19
    31
    24
    11
     7
    44
    22
    18
]'/100;

[mn,l]=size(spriority_array45);


 for ik=1:l
spriority_limit(1,ik)=(busload45(ik,1).*(spriority_array45(1,ik)));
 end
 jar =zeros(1,40);

 
 for jl=1:l
jar(:,jl)=((busload45(jl,1)-spriority_limit(1,jl)).*rand+spriority_limit(1,jl));

 end
 

end
  


