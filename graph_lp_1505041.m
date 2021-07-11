x=0:.0001:15;

y1=(14-1.2*x)/2.25;
y2=(8-x)/1.1;
y3=(9-2.5*x);

diffy30=abs(y3-0);
sub=find(diffy30==min(diffy30));
a3=x(sub);
b3=0;

a4=0;
b4=(14-1.2*a4)/2.25;

a1=0;
b1=0;

diffy1y3=abs(y1-y3);
sub=find(diffy1y3==min(diffy1y3));
a2=x(sub);
b2=(14-1.2*a2)/2.25;

p=plot(x,y1,'r',...
    x,y2,'b',...
    x,y3,'k',...
    a2,b2,'o',...
    a1,b1,'o',...
    a3,b3,'o',...
    a4,b4,'o');
%p(4).MarkerSize=6;

xlabel('X1')
ylabel('X2')

grid on
hold on
axis([0 12 0 10])
set(gca,'XTick',0:1:12)
set(gca,'YTick',0:1:10)
legend('Line 1','Line 2','Line 3')
xfiller=[a1 a3 a2 a4 a1];
yfiller=[b1 b3 b2 b4 b1];
fill(xfiller,yfiller,'g')

z=zeros(4);
z(1)=1.75*a1+1.25*b1;
z(2)=1.75*a2+1.25*b2;
z(3)=1.75*a3+1.25*b3;
z(4)=1.75*a4+1.25*b4;

max=-inf;
index=0;
for i=1:4
    if z(i)>max
        max=z(i);
        index=i;
    end
end

if index==1
    disp('Zmax')
    disp(max)
    disp('X1')
    disp(a1)
    disp('X2')
    disp(b1)
end


if index==2
    disp('Zmax')
    disp(max)
    disp('X1')
    disp(a2)
    disp('X2')
    disp(b2)
end

if index==3
    disp('Zmax')
    disp(max)
    disp('X1')
    disp(a3)
    disp('X2')
    disp(b3)
end

if index==4
    disp('Zmax')
    disp(max)
    disp('X1')
    disp(a4)
    disp('X2')
    disp(b4)
end





