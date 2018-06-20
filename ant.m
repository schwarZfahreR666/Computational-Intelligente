%init 
dis=[99999,3,1,2;3,99999,5,4;1,5,99999,2;2,4,2,99999];
P_able=[2,3,4;1,3,4;1,2,4;1,2,3];
a=1;
b=2;
p=0.5;
t=[0.3,0.3,0.3,0.3;0.3,0.3,0.3,0.3;0.3,0.3,0.3,0.3;0.3,0.3,0.3,0.3];

gbest=10000;
lbest=zeros(1,5);
% start loop
for g_step=1:1:200
A1=zeros(1,5);
A2=zeros(1,5);
A3=zeros(1,5);
A1(1,1)=floor(1+4*rand());
A2(1,1)=floor(1+4*rand());
A3(1,1)=floor(1+4*rand());
step=0;
for i=1:1:4
    step=step+1;
    A1_next=renew(A1,t,step);
    A2_next=renew(A2,t,step);
    A3_next=renew(A3,t,step);
    A1(1,step+1)=A1_next;
    A2(1,step+1)=A2_next;
    A3(1,step+1)=A3_next;
    
end
C1=dis(A1(1,1),A1(1,2))+dis(A1(1,2),A1(1,3))+dis(A1(1,3),A1(1,4))+dis(A1(1,4),A1(1,5));
C2=dis(A2(1,1),A2(1,2))+dis(A2(1,2),A2(1,3))+dis(A2(1,3),A2(1,4))+dis(A2(1,4),A2(1,5));
C3=dis(A3(1,1),A3(1,2))+dis(A3(1,2),A3(1,3))+dis(A3(1,3),A3(1,4))+dis(A3(1,4),A3(1,5));
for m=1:1:4
    for n=1:1:4
        t(m,n)=(1-p)*t(m,n);
    end
end
for m=1:1:4
    t(A1(1,m),A1(1,m+1))=t(A1(1,m),A1(1,m+1))+1/C1;
end
for m=1:1:4
    t(A2(1,m),A2(1,m+1))=t(A2(1,m),A2(1,m+1))+1/C2;
end
for m=1:1:4
    t(A3(1,m),A3(1,m+1))=t(A3(1,m),A3(1,m+1))+1/C3;
end
rang(1,1)=C1;
rang(1,2)=C2;
rang(1,3)=C3;
[Srang,index]=sort(rang);
if Srang(1,1)<gbest
    gbest=Srang(1,1);
    switch index(1,1)
        case 1
            lbest=A1;
        case 2
            lbest=A2;
        case 3
            lbest=A3;
    end
end
aaa(1,g_step)=C1;
bbb(1,g_step)=C2;
ccc(1,g_step)=C3;
end
disp(gbest)
disp(lbest)
plot(1:g_step,aaa,'r',1:g_step,bbb,'b',1:g_step,ccc,'c')
