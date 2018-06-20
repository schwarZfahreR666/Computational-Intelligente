% init
p1=[8,-5;3,2];
p2=[-5,9;-3,-2];
p3=[-7,-8;5,3];
p_best1=p1(1,:);
p_best2=p2(1,:);
p_best3=p3(1,:);
g_p_best=p_best1;
f_best1=10000;
f_best2=10000;
f_best3=10000;
g_f_best=10000;
step=0;
% loop
for i=1:1:1000
    step=step+1;
    f1=adapt2(p1);
    f2=adapt2(p2);
    f3=adapt2(p3);
    if f1<f_best1
        f_best1=f1;
        p_best1=p1(1,:);
    end
    if f2<f_best2
        f_best2=f2;
        p_best2=p2(1,:);
    end
    if f3<f_best3
        f_best3=f3;
        p_best3=p3(1,:);
    end
    rang(1,1)=f_best1;
    rang(1,2)=f_best2;
    rang(1,3)=f_best3;
    [Srang,index]=sort(rang);
    if Srang(1,1)<g_f_best
        g_f_best=Srang(1,1);
        switch index(1,1)
            case 1
                g_p_best=p_best1;
            case 2
                g_p_best=p_best2;
            case 3
                g_p_best=p_best3;
        end
                
    end
    p_1=up(p1,p_best1,g_p_best);
    p_2=up(p2,p_best2,g_p_best);
    p_3=up(p3,p_best3,g_p_best);
    p1=p_1;
    p2=p_2;
    p3=p_3;
    aaa(step,1)=g_f_best;
end
t=1:step;
 plot(t,aaa,'r');
 disp('global best f*')
 disp(g_f_best)
 disp('global best position')
 disp(g_p_best)