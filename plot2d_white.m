function plot2d_white(X)
    x=X(1,:)'; 
    y=X(2,:)' ; 
    plot(x,y,'-w','linewidth',2)
    axis([-35 55 -25 50])
    axis('square')
end