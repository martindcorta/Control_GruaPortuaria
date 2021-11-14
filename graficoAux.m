function graficoAux(cantidadCarrilesBarco, xCarrilBarco, bContenedor, hContenedor, nRand)
                   
%%Barco parte grafica%%
% disposicion de containers
% medida standar de container es ancho 2.45 m , alto= 2,59
%suponemos un barco con capacidad de 15 containers de ancho y dejamos de
%separacion entre ellos 55 cm
%creamos el barco

fig = figure('Name','Autómatas y Control Discreto - Da Corta y Manzano','NumberTitle','off');
axes(...
  'Parent',  fig,...
  'Units',   'pixel',...
  'Position',[100 100 900 600],...
  'Xlim',    [-35 85],...
  'Ylim',    [-30 60],...
  'Visible', 'on');

rectangle( 'Position',[-35,-30,45,30],'FaceColor',[0.4 .4 .4],'EdgeColor',[0.4 .4 .4]);  % creo el piso
rectangle('Position',[0,-30,55,25],'FaceColor',[0.2 .1 .9],'LineWidth', 0.1,'EdgeColor',[0.2 .1 .9] ); % creo el mar
rectangle('Position',[1,-20,48,25],'FaceColor','w','LineWidth', 0.3); %barco

 
hold on;
for i=2:cantidadCarrilesBarco
    rayai = [xCarrilBarco(i)-bContenedor/2     xCarrilBarco(i)+bContenedor/2; -20 -20];
    plotContainer(rayai);   hold on;
    for j=1:(nRand(i)-2) %DIBUJA DOS CONTENEDORES MENOS EN CADA COLUMNA
        CONTENEDORi = [xCarrilBarco(i)-bContenedor/2     xCarrilBarco(i)-bContenedor/2   xCarrilBarco(i)+bContenedor/2   xCarrilBarco(i)+bContenedor/2 ;
                      (j-1)*hContenedor-20    j*hContenedor-20      j*hContenedor-20     (j-1)*hContenedor-20  ];
        plotContainer(CONTENEDORi);   hold on;
    end
end


for i=-30:5:-5
        MUELLEi = [i-bContenedor/2     i-bContenedor/2   i+bContenedor/2   i+bContenedor/2 i-bContenedor/2;
                       0       hContenedor       hContenedor       0     0  ];
        plotContainer(MUELLEi);   hold on;
end

%% Dibujo del barco

%%%grua
rectangle('Position',[-35,45,95,2],'FaceColor','y') %viga principal
rectangle('Position',[-35,0,2,60],'FaceColor','y') %columna 1
rectangle('Position',[-2,0,2,45],'FaceColor','none','LineStyle','--','EdgeColor','y') %columna 2 punteada
rectangle('Position',[-2,0,2,45],'FaceColor','y')%columna 2 rigida
rectangle('Position',[-1,0,1,15],'FaceColor','r','EdgeColor',[0.4 .4 .4])%(viga testera: Ysb =+15m)
rectangle( 'Position',[55,-30,30,90],'FaceColor','k','EdgeColor',[0.4 .4 .4]); 

uicontrol(...
  'Parent',             fig,...
  'Style',              'text',...
  'Units',              'pixel',...
  'Position',           [720 670 120 25], ...
  'HorizontalAlignment','Center',...
  'FontSize', 15, ...
  'BackgroundColor','w' , ...
  'FontWeight', 'bold', ...
  'String',             'ESTADOS');



text (60,40,'Balanceo','Color','white','Fontsize',12);
text (60,30,'Spreader','Color','white','Fontsize',12);
text (60,20, 'Alarma  ','Color','white','Fontsize',12);
text (60,10, 'Reiniciar','Color','white','Fontsize',12);
text (56,-10, 'Modo de operacion:','Color','white','Fontsize',12);



end