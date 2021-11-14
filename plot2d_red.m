function plot2d_red(X)
x=X(1,:)'; % x es la matriz con todos los elementos de la fila 1 de X.
y=X(2,:)' ; % y es la matriz con todos los elementos de la fila 2 de X.
plot(x,y,'b-','linewidth',2)
axis([-35 55 -25 50])
axis('square')
end
