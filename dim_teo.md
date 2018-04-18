Dimensión Teórica

# Prefacio

El objetivo de este texto es entender los problemas físicos a los que nos enfrentamos, proponer una solución y a partir de los resultados obtener un modelo informático del problema que posteriormente, tras optimizarlo, sea exportado a nuestro producto final en el cual trabajará de forma autónoma con toda la información adquirida en el proceso de diseño.

El objetivo que tenemos es utilizar un sistema basado en ultrasonidos únicamente. Dependiendo de los resultados obtenidos valoraremos si merece la pena incluir algo más de tecnología (cámara, IR, tecnología láser…). Este sistema, a diferencia de los ya existentes, trabajará en más de un plano y dirección para así cubrir más espacio, lo que nos permitirá una recreación del medio.

Además haremos uso de herramientas de Machine Learning, incluidas en MatLab o exportables desde Octave, que refinarán el modelado del problema.

La otra parte del problema es la interpretación y transmisión de los resultados a lo que hemos llamado código háptico. Esta parte será desarrollada posteriormente, una vez se tenga un sistema de orientación y visión terminado y conformará la interfaz sistema-usuario.

# Referencias

Como sabemos, la madre naturaleza es una &quot;Ingeniería&quot; ultra desarrollada gracias a una herramienta -La Evolución-. Tras miles y miles de años, las especies se optimizan al medio que habitan-Ley de Darwin-

Es por eso que algunos animales, como el delfín y el murciélago, serán analizados y estudiados para ver que partes de su sistema de visión se pueden importar en nuestro programa.

[https://www.vix.com/es/btg/curiosidades/5410/como-funciona-la-ecolocalizacion-en-los-delfines](https://www.vix.com/es/btg/curiosidades/5410/como-funciona-la-ecolocalizacion-en-los-delfines)

[http://www.fisica.unam.mx/noticias\_ecolocalizacion2013.php](http://www.fisica.unam.mx/noticias_ecolocalizacion2013.php)

# Acercamiento Físico

## Teoría de ondas

### Ultrasonidos

Una onda ultrasónica es una onda mecánica (es decir interactúa con sólidos) cuya frecuencia supera a la audible por el ser humano –  &gt; 20 000Hz . Están se dispersan por un medio elástico, en nuestro caso, el aire.

Existen diferentes tipos de ondas pero en nuestro proyecto sólo damos cabida a las de tipo longitudinal y planas.

**Onda longitudinal:** Aquella que produce una interacción en las partículas con una dirección paralela a la que toma la onda en su propagación. Producen cierto efecto de dilatación e irrotacionalidad en las partículas, por eso son perfectas para registrar los objetos que hay alrededor.

(λ+2G)∂2u∂2x=ρ∂2u∂2t2

Siendo &quot;u&quot; el desplazamiento de la partícula debido a la onda, G y lambda constantes del aire y ρ la densidad del aire

**Ondas planas:** Su amplitud de movimiento observada en el plano perpendicular a la dirección de propagación es uniforme, por lo tanto se mueven de manera rectilínea. Estas características la hacen perfecta para la detección de objetos pequeños (siempre y cuando no sean menores que la longitud de la onda ultrasónica)

Para simplificar el problema al que nos enfrentamos, tras la descripción teórica se concluirán las simplificaciones e idealizaciones consideradas para su resolución.

### Velocidades de la onda

En la propagación de las ondas elásticas ultrasonoras, se encuentran diferentes tipos de velocidades. De mayor interés son: _la velocidad de grupo, velocidad de fase y velocidad de señal_.

 Cada uno de estos tipos de velocidades involucra un fenómeno particular, y no deben ser confundidos entre sí, ni con la velocidad de las partículas.

La  **velocidad de fase**  puede ser definida como la velocidad con la que una fase es propagada a lo largo de una onda.

La  **velocidad de grupo**  es un término usado para indicar la velocidad con la cual el envolvente de una onda es propagado cuando la onda es modulada en amplitud. La frecuencia portadora debe ser alta para así manifestar esta condición. Este tipo de velocidad, en algunos contextos, es también llamada velocidad de volumen. Cada vez que es usado el término **velocidad a secas** , se referirá a la velocidad de grupo.

La velocidad de fase y la velocidad de grupo pueden tener valores iguales o distintos. En el primer caso el material no es dispersivo, y en el segundo si lo es. Un material es dispersivo cuando señales de diferentes frecuencias viajan con diferentes velocidades. No está enteramente establecido si las señales de ultrasonido son o no dispersivas bajo todas las posibles condiciones. En el aire no podrán ser dispersivas.

La velocidad de señal es una condición muy compleja que existe sólo cuando un medio es dispersivo. En tal caso diferentes señales parecieran viajar con diferentes velocidades, siendo la velocidad real de viaje de una señal particular la velocidad de señal.

La velocidad de la onda y la velocidad de las partículas individuales del material no son lo mismo. En todos los casos es la velocidad de propagación de la onda la cual es referida.

### Velocidad de propagación de una Onda Ultrasonora en un Medio Gaseoso

A partir de las ecuaciones de estado y la relación de gas ideal se obtiene:

c2=R&#39;TM

Siendo M peso molecuar (Hidrógeno, Nitrógeno, Carbono y Oxígeno), T temperatura, R la constante de gas ideal aplicada al aire

### Detección y eliminación de &quot;ruido&quot;- Influencia del ambiente y material

En nuestro caso, el material a estudiar será el aire, que también es el espacio que consideraremos en todo este estudio.

En el espacio urbano nos encontramos con mucha variedad de objetos, los cuales serán simplificados para la aplicación de la teoría y la posterior traducción a código. Al emitir ondas ultrasónicas sobre estos objetos hay que hacer diversas consideraciones:

- **Material** , según el material obtendremos diferente respuesta pues se puede recibir desde una onda 100% reflejada hasta una onda 100% absorbida. También se considera el caso de un mismo sólido con diferentes coeficientes debido al tratamiento superficial como puede ser la pintura o el pulido de una barra metálica (frecuentes en señalización).
- **Geometría,** consideraremos sólidos enteros y sólidos formados por patrones o ritmos (barandillas, escaleras…)
- **Contaminación o partículas en el aire** , en caso de aires contaminados o factores meteorológicos (lluvia, polvo, nieve), donde abunda la presencia de moléculas más pesadas y grandes, se aplicará un factor correctivo.

Estas consideraciones provocarán diferentes efectos:

**Difracción:** Cuando un frente de ondas ultrasonoras pasa a través de ranuras estrechas, por los bordes de cuerpos opacos, o es reflejado o transmitido desde superficies, el frente sufre una modificación. Esta modificación del frente de onda es llamada difracción. Este fenómeno causa la curvatura de las ondas alrededor de los objetos que se interponen en su trayectoria. Las señales ultrasonoras que podrían ser normalmente recibidas en un cierto punto pueden ser desviadas por difracción y, por lo tanto, ser recibidas en alguna otra posición.Los efectos de la difracción son de interés en muchas aplicaciones ultrasónicas tales como en la medición de atenuación del sonido en materiales, inspección no destructiva de materiales, sonido bajo el agua, e imágenes.

**Atenuación:** La atenuación se refiere a la disminución de la intensidad de un frente de onda cuando éste avanza dentro de un medio. Entre los factores que contribuyen a esta atenuación están; la propagación del rayo (spreading), la dispersión del rayo desde un obstáculo (scattering), la conversión de modos de onda que ocurre al dividirse la energía en dos o más modos de onda, y la atenuación debido a varios otros mecanismos.

Existen más efectos que no consideraremos al usar el medio aéreo como medio de propagación.

### Interferencias externas

Dispositivos que usen ultrasonido en la calle, como los vehículos. En principio no tienen porque interferir mucho con nuestro sistema, por eso no se detalla.

## Generadores de ultrasonido
.........
## Idealización del problema

Aunque no se haya definido aún el rango máximo de detección, el óptimo estaría entre 3 y 4 metros, lo suficiente como para permitir un mayor ritmo de paseo seguro. Por lo tanto, los fenómenos de atenuación serán considerados en el rango máximo de detección, pero no en los de proximitud cercana.

La difracción puede darse en alguna situación con sólidos repetitivos (barandillas, vallas...) , por ejemplo, cuando la onda emitida toca tangencialmente alguna arista (ocurre si la dirección de paseo es paralela al sólido de repetición), el hueco de paso se hace demasiado pequeño y podría perderse la onda o recibirla con información errónea. En este caso, dentro del código habría que escribir un subprograma que detecte este fenómeno y lo idealice.

**Sólidos considerados, primitivas:**

- Cubos con relación b/h&gt; 1, es decir, cubos anchos.

- Cubos con relación b/h&lt;=1

- Esferas

- Planos con estructura de repetición, como aceras, barandillas, verjas.

- Superficies irregulares, donde incluimos los vehículos, arquitectura y elementos no considerados, viandantes… regulados con ayuda del machine learning (ver sección de código)
- ![](\/figuras/dia1.jpg)



**Materiales:**

- Hormigón, cementos y variantes : poseen el mismo coeficiente y debido a su solidez son los más fáciles de tratar

- Tratamientos superficiales : Pulidos, rugosidades, pinturas, cada una será considerada.

- Telas y tejidos: Piel humana, ropa, cortinas…



## Estudio del posicionamiento de emisores y receptores
![](\/figuras/dia2.jpg)


