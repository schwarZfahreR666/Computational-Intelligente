function out=renew(A,t,step)
dis=[99999,3,1,2;3,99999,5,4;1,5,99999,2;2,4,2,99999];
P_able=[2,3,4;1,3,4;1,2,4;1,2,3];
t_able=P_able(A(1,step),:);
P_t=zeros(1,4);
P_c=zeros(1,4);
c=0;
a=1;
b=-2;
p=0.5;
sum1=0;
for m=1:1:step
    for n=1:1:3
        if A(1,m)==t_able(1,n);
            t_able(1,n)=0;
          
        end
       
    end
end
for n=1:1:3
    if t_able(n)~=0
        c=c+1;
        able_c(1,c)=t_able(1,n);
        
    end
end
for i=1:1:c
    P_t(1,able_c(1,i))=(t(A(1,step),able_c(1,i))^a)*(dis(A(1,step),able_c(1,i))^b);
    sum1=sum1+P_t(1,able_c(1,i));
end
for i=1:1:c
    P_c(1,able_c(1,i))=P_t(1,able_c(1,i))/sum1;
end
c_rate=rand();

switch c
    case 3
    
    if c_rate<P_c(1,able_c(1,1))
        next=able_c(1,1);
    end
    if c_rate>=P_c(1,able_c(1,1))&&c_rate<(P_c(1,able_c(1,1))+P_c(1,able_c(1,2)))
        next=able_c(1,2);
    end
    if c_rate>=(P_c(1,able_c(1,1))+P_c(1,able_c(1,2)))&&c_rate<(P_c(1,able_c(1,1))+P_c(1,able_c(1,2))+P_c(1,able_c(1,3)))
        next=able_c(1,3);
    end
    case 2
        if c_rate<P_c(1,able_c(1,1))
        next=able_c(1,1);
        end
        if c_rate>=P_c(1,able_c(1,1))&&c_rate<(P_c(1,able_c(1,1))+P_c(1,able_c(1,2)))
        next=able_c(1,2);
        end
    case 1
        next=able_c(1,1);
    case 0
        next=A(1,1);
end
out=next;
            
