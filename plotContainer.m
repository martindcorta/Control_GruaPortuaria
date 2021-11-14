function plotContainer(X)
    x=X(1,:)'; 
    y=X(2,:)' ; 
    plot(x,y,'-r','linewidth',2)
    axis([-35 85 -25 50])
    axis('square')
end
