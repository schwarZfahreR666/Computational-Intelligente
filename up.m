function y=up(x,m,n)
w=0.5;
c1=2;
c2=2;
r1=rand();
r2=rand();
x(2,1)=w*x(2,1)+c1*r1*(m(1,1)-x(1,1))+c2*r2*(n(1,1)-x(1,1));
x(2,2)=w*x(2,2)+c1*r1*(m(1,2)-x(1,2))+c2*r2*(n(1,2)-x(1,2));
x(1,1)=x(1,1)+x(2,1);
x(1,2)=x(1,2)+x(2,2);
if x(1,1)>10
    x(2,1)=x(2,1)*(-1);
    x(1,1)=10;
end
if x(1,2)>10
    x(2,2)=x(2,2)*(-1);
    x(1,2)=10;
end
if x(1,1)<-10
    x(2,1)=x(2,1)*(-1);
    x(1,1)=-10;
end
if x(1,2)<-10
    x(2,2)=x(2,2)*(-1);
    x(1,2)=-10;
end
y=x;
