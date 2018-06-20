W1=[0.2,-0.3;0.4,0.1;-0.5,0.2];  %??????
W2=[-0.3;-0.2];                  %??????
u1=[-0.4,0.2];                   %????????
u2=0.1;                          %????????
x1=[1,0,1];                      %????
lr=0.9;                          %???
for i=1:1:12000
    Mi1=x1*W1+u1;
    O1=sigmf(Mi1,[1,0]);
    Mi2=O1*W2+u2;
    O2=sigmf(Mi2,[1,0]);
    E6=O2*(1-O2)*(1-O2);
    E5=O1(1,2)*(1-O1(1,2))*E6*W2(2,1);
    E4=O1(1,1)*(1-O1(1,1))*E6*W2(1,1);
    %????????
    W2(1,1)=W2(1,1)+lr*E6*O1(1,1);
    W2(2,1)=W2(2,1)+lr*E6*O1(1,2);
    W1(1,1)=W1(1,1)+lr*E4*x1(1,1);
    W1(1,2)=W1(1,2)+lr*E5*x1(1,1);
    W1(2,1)=W1(2,1)+lr*E4*x1(1,2);
    W1(2,2)=W1(2,2)+lr*E5*x1(1,2);
    W1(3,1)=W1(3,1)+lr*E4*x1(1,3);
    W1(3,2)=W1(3,2)+lr*E5*x1(1,3);
    u2=u2+lr*E6;
    u1(1,1)=u1(1,1)+lr*E4;
    u1(1,2)=u1(1,2)+lr*E5;
    if rem(i,10)==0
    disp(i)
    disp('times runed,the result is:')
    disp(O2)
    disp(',the first layer is:W1')
    disp(W1)
    disp('u1')
    disp(u1)
    disp(',the second layer is:W2')
    disp(W2)
    disp('u2')
    disp(u2)
    plot(i,O2,'r*');
    hold on;
    end
    
    
    
    
end


