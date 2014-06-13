
function splinef=spline(x,a,n);




for i = 1:n
   h(i) = x(i+1) - x(i); 
end
for i = 2:n
   alfa(i)= ( ((3/h(i))*(a(i+1) - a(i))) - ((3/h(i-1))*(a(i) - a(i-1))) ); 
end
l(1)=1;
u(1)=0;
z(1)=0;
for i= 2:n
   l(i)=2*(x(i+1)-x(i-1)) - h(i-1)*u(i-1);
   u(i) = h(i)/l(i);
   z(i) = (alfa(i)-h(i-1)*z(i-1))/l(i);
end
l(n+1) = 1;
z(n+1) = 0;
c(n+1) = 0;
for j= n:-1:1
c(j) = z(j)- u(j)*c(j+1);
b(j) = (a(j+1)-a(j))/h(j)-h(j)*(c(j+1)+2*c(j))/3;
d(j) = (c(j+1) - c(j))/(3*h(j));
end
for j=1:n
d2(j)=d(j);
c2(j)=c(j);
b2(j)=b(j);
a2(j)=a(j);
end
coef=[  d2' ; c2' ; b2' ; a2' ];
splinef=mkpp(x,coef);

end
