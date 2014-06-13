noi=input('enter how many number will you enter:');%get number of inputs from user
grid on; %open grits
%to get good graph numbers should be big so intervals are arranged again
xlim([0 100]); 
ylim([0 100]);
[x,y]=ginput(noi);
%Arrange time 0.1.2.3......n-1
t=zeros(noi,1);
t(1)=0;
for i=1:noi-1
    t(i+1)=i;
end

splinex=myspline(t,x,noi-1); %calculate x splines
spliney=myspline(t,y,noi-1); %calculate y splines

for j=1:length(x)
    
    xx(j)=ppval(splinex,t(j)); %put t value in xspline find an x
    yy(j)=ppval(spliney,t(j)); %put t value in yspline find an y which is pair with upper x
    
end
plot(xx,yy);
