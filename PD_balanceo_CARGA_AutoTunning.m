function [lh,Kp,Ki,Kd,Tf,l1] = PD_balanceo_CARGA_AutoTunning(mc,mlMax,Mt,g)

Kp=zeros(1,60); Ki=zeros(1,60); Kd=zeros(1,60); Tf=zeros(1,60); l1=zeros(1,60);
for lh=1:1:60
    %G = tf([0 -1 0],[lG 0 g]); lG=lG+2; %GERA
    %G = tf([0 Mt+mlMax bt],[-(Mt+2*mlMax)*lh 0 -(Mt+mlMax)*g]); %BUBU
    G = tf([-(mc+mlMax) 0],[(Mt+mlMax)*lh 0 Mt*g]); % EMMA
    Controladores=pidtune(G,'PIDF');
    Kp(lh)=Controladores.Kp;
    Ki(lh)=Controladores.Ki;
    Kd(lh)=Controladores.Kd;
    Tf(lh)=Controladores.Tf;
    l1(lh)=lh;
end

end