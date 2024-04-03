function xdot=sir_multi_update(t,x)
global mu lambda
xdot=zeros(22,1);
%for infacted
xdot(1)=-mu*x(1)+lambda*(x(12))*(x(2)+x(3)+x(4)+x(7))+lambda*(x(12))*x(10);
xdot(2)=-mu*x(2)+lambda*(x(13))*(x(1)+x(3))+lambda*(x(13))*x(10);
xdot(3)=-mu*x(3)+lambda*(x(14))*(x(1)+x(2))+lambda*(x(14))*x(8);
xdot(4)=-mu*x(4)+lambda*(x(15))*(x(1)+x(5)+x(7))+lambda*(x(15))*x(11);
xdot(5)=-mu*x(5)+lambda*(x(16))*(x(4)+x(6));
xdot(6)=-mu*x(6)+lambda*(x(17))*(x(5)+x(7));
xdot(7)=-mu*x(7)+lambda*(x(18))*(x(1)+x(4)+x(6))+lambda*(x(18))*x(9);
xdot(8)=-mu*x(8)+lambda*(x(19))*(x(9)+x(10)+x(11))+lambda*(x(19))*x(3);
xdot(9)=-mu*x(9)+lambda*(x(20))*(x(8)+x(10))+lambda*(x(20))*x(7);
xdot(10)=-mu*x(10)+lambda*(x(21))*(x(8)+x(9)+x(11))+lambda*(x(21))*(x(1)+x(2));
xdot(11)=-mu*x(11)+lambda*(x(22))*(x(8)+x(10))+lambda*(x(22))*x(4);
%s1=x12, s2=x13, s3=x14, s4=x15, s5=x16, s6=x17, s7=x18, s8=x19, s9=x20, s10=x21,s11=x22
%sus

xdot(12)=-lambda*(x(12))*(x(2)+x(3)+x(4)+x(7))-lambda*(x(12))*x(10);
xdot(13)=-lambda*(x(13))*(x(1)+x(3))-lambda*(x(13))*x(10);
xdot(14)=-lambda*(x(14))*(x(1)+x(2))-lambda*(x(14))*x(8);
xdot(15)=-lambda*(x(15))*(x(1)+x(5)+x(7))-lambda*(x(15))*x(11);
xdot(16)=-lambda*(x(16))*(x(4)+x(6));
xdot(17)=-lambda*(x(17))*(x(5)+x(7));
xdot(18)=-lambda*(x(18))*(x(1)+x(4)+x(6))-lambda*(x(18))*x(9);
xdot(19)=-lambda*(x(19))*(x(9)+x(10)+x(11))-lambda*(x(19))*x(3);
xdot(20)=-lambda*(x(20))*(x(8)+x(10))-lambda*(x(20))*x(7);
xdot(21)=-lambda*(x(21))*(x(8)+x(9)+x(11))-lambda*(x(21))*(x(1)+x(2));
xdot(22)=-lambda*(x(22))*(x(8)+x(10))-lambda*(x(22))*x(4);
 %recovary model

 % xdot(23)=mu*x(1);
 % xdot(24)=mu*x(2);
 % xdot(25)=mu*x(3);
 % xdot(26)=mu*x(4);
 % xdot(27)=mu*x(5);
 % xdot(28)=mu*x(6);
 % xdot(29)=mu*x(7);
 % xdot(30)=mu*x(8);
 % xdot(31)=mu*x(9);
 % xdot(32)=mu*x(10);
 % xdot(33)=mu*x(11);