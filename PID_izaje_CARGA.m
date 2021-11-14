function [Ba_h,Ksa_h,Ksia_h] = PID_izaje_CARGA (bh,Mh)

    w_h    = bh/Mh;
    n_h    = 2.5;
    Wpos_h = 10*w_h;

    Ba_h   = Mh*n_h*Wpos_h;
    Ksa_h  = Mh*n_h*Wpos_h^2;
    Ksia_h = Mh*Wpos_h^3;

end