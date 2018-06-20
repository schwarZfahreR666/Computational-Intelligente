C1=-5+10*rand(1,4);
C2=-5+10*rand(1,4);
C3=-5+10*rand(1,4);
C4=-5+10*rand(1,4);
C5=-5+10*rand(1,4);
New=zeros(5,4);
Tem=zeros(1,4);
rang=zeros(1,5);
j_rate=0.88;
b_rate=0.1;
lab=0;
best=-10000;
f_best=-10000;
step=0;
equ=0;

while(step<100000)
    lab=0;
    step=step+1
    New(1,:)=C1;
    New(2,:)=C2;
    New(3,:)=C3;
    New(4,:)=C4;
    New(5,:)=C5;
    A1=ADAPT(C1);
    A2=ADAPT(C2);
    A3=ADAPT(C3);
    A4=ADAPT(C4);
    A5=ADAPT(C5);
    rang(1,1)=A1;
    rang(1,2)=A2;
    rang(1,3)=A3;
    rang(1,4)=A4;
    rang(1,5)=A5;
    [Srang,index]=sort(rang);
    if Srang(1,5)>best
    best=Srang(1,5);
    best_n=index(1,5);
    best_c=New(best_n,:);
    end
    if f_best>=Srang(1,5)&&best>Srang(1,5)
        equ=equ+1;
    end
    
    sum=A1+A2+A3+A4+A5;
    A1=A1/sum;
    A2=A2/sum;
    A3=A3/sum;
    A4=A4/sum;
    A5=A5/sum;
    for n=1:1:5
        rm=rand();
        if rm<A1
          New(n,:)=C1;  
        end
        if rm>=A1&&rm<A1+A2
            New(n,:)=C2;
            
        end
        if rm>=A1+A2&&rm<A1+A2+A3
            New(n,:)=C3;
            
        end
        if rm>=A1+A2+A3&&rm<A1+A2+A3+A4
            New(n,:)=C4;
            
        end
        if rm>=A1+A2+A3+A4
            New(n,:)=C5;
            
        end
    
    end
    if equ>=10&&best>Srang(1,5)
        equ=0;
        a=1+3*rand();
        a=floor(a);
        New(a,:)=-5+10*rand(1,4);
    end
    %disp('1')
    %disp(New)
    for m=1:1:5             %jiaopei
       j_rm=rand();
       if j_rm<j_rate&&lab==0
           
           c=m;
           lab=1;
           continue;
           
       end
       if j_rm<j_rate&&lab==1
          
           a=1+3*rand();
           a=floor(a);
           t=New(c,a);
           New(c,a)=New(m,a);
           New(m,a)=t;
           lab=0;
       end
    end
    %disp('2')
    %disp(New)
    for n=1:1:5           %bianyi
       b_rm=rand();
       if b_rm<b_rate
           a=1+3*rand();
           a=floor(a);
           b=-5+10*rand();
           New(n,a)=b;
           
           
       end
    end
    C1=New(1,:);
    C2=New(2,:);
    C3=New(3,:);
    C4=New(4,:);
    C5=New(5,:);
    f_best=Srang(1,5);
    ccc(step,1)=Srang(1,5);
    aaa(step,1)=best;
 
    
    
end
t=1:step;
 plot(t,ccc,'r',t,aaa,'b');
    disp('best')
    disp(best)
    disp('X1')
    disp(best_c(1,1))
    disp('X2')
    disp(best_c(1,2))
    disp('X3')
    disp(best_c(1,3))
    disp('X4')
    disp(best_c(1,4))