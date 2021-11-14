function [lh,Ba_b,Ksa_b] = PD_balanceo_CARGA_GainScheduling (mc,mlMax,Mt)

    Ba_b   = zeros(1,60); Ksa_b  = zeros(1,60); Ksia_b = zeros(1,60);
    for lh=1:1:60
        %G = tf([0 -1 0],[lG 0 g]); lG=lG+2; %GERA
        %G = tf([0 Mt+mlMax bt],[-(Mt+2*mlMax)*lh 0 -(Mt+mlMax)*g]); %BUBU
        G = tf([-(mc+mlMax) 0],[(Mt+mlMax)*lh 0 Mt]); %EMMA
        polos     = roots(G.den{1});
        modulo    = abs(polos(1));
        omegaPos  = modulo*10;
        mEq       = -(Mt+mlMax)*lh/(mc+mlMax);
        Ba_b(lh)  = mEq*3*omegaPos;
        Ksa_b(lh) = mEq*3*omegaPos*omegaPos;
    end

end