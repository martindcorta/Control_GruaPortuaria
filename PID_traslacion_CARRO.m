function [Ba_t,Ksa_t,Ksia_t] = PID_traslacion_CARRO (bt,Mt)

    w_t    = bt/Mt; 
    n_t    = 2.5;
    Wpos_t = 10*w_t;

    Ba_t   =  Mt*n_t*Wpos_t;
    Ksa_t  =  Mt*n_t*Wpos_t^2;
    Ksia_t =  Mt*Wpos_t^3;

end