function plot2d_yelow(X)
x=X(1,:)'; % x es la matriz con todos los elementos de la fila 1 de X.
y=X(2,:)' ; % y es la matriz con todos los elementos de la fila 2 de X.
plot(x,y,'-y','linewidth',2) %,'MarkerFaceColor','b')
axis([-35 55 -25 50])
axis('square')
end