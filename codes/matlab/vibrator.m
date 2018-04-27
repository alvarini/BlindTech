%%Reglas
%%0,2-1m%%
minc=0,2;
maxc=1;
%%1-2,5m%%
minm=maxc;
maxm=2,5;
%%2,5-4%%
minl=maxm;
maxl=4;
%%gradientes
Gradiente_cerca= [minc:0,05:maxc];
Gradiente_medio= [minm:0,25:maxm];
Gradiente_lejos= [minl:1:maxl];
%%Cambiamos el step entre 0,05 y 1 para mejorar la eficencia del codigo
if readistance = [0,2:0,05:1];
    A= [minc:0,05:maxc];
    f= [hz(5):0,05:hz(50)]
else
    A= [minm:0,25:maxm];
    f= [hz(5):0,25:hz(50)]
else 
    A= [minl:1:maxl];
    f= [hz(5):1:hz(50)]
end
    
    %%Salida de vibrador vibrator(x,y)
A= x;
f= y;

    
    