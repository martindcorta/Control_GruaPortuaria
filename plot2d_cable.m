function plot2d_cable(X)
x=X(1,:)'; 
y=X(2,:)' ; 
plot(x,y,'-c','linewidth',0.5)
axis([-35 55 -25 50])
axis('square')
end
