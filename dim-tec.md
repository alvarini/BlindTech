
**//guidelines// - Mix de ideas - Puede obviarse**
Dimensión técnica

Aparato-mango

- Estimación de los ángulos del aparato y sensores
- Metodología del diseño aplicada
- Ergonomía- sujeción y banda – método de carga
- Peso
- Sistema de acople con bastones – uso sin baston
- Diseño 3D final

Ultrasonic recognition – Batsys

- Estudio de casos frecuentes en espacios urbanos-calle-locales-casas-baños-transporte
- Interpretación de ruido y soluciones
- &quot;superficies irregulares + materiales no reflectantes de ondas ultrasónicas&quot;
- Desarrollo del código

Sistema de orientación GPS - Eorientation

- Interconexion
- Comunicación
- Seguridad y alarmas
- Desarrollo del código

Sistema de comunicación : hapticband

- Diseño de la banda, ergonomía
- Definicion del lenguaje
- Estudio de la resolución de la banda acorde con el lenguaje que queremos transmitir
- Metodologia del diseño para la hapticband – design for X

# Prefacio

Tras el análisis teórico llega a la hora de tomar decisiones vitales en el diseño, tanto de hardware como de software. En un primer acercamiento, la idea es hacer el sistema lo más simple posible, para ello nos gustaría poder reconocer el espacio únicamente con ultrasonidos, aunque la incorporación de una cámara + láser u otra tecnología puede ser implantada para mejorar el sistema (aunque llevaría a un coste superior + peso).

Dividiremos este documento en dos secciones:

-**Diseño del producto**

-**Diseño del software**

Aunque cabe destacar que ambas se han desarrollado en paralelo por parte de los integrantes, habiendo plena comunicación entre los responsables.

Nuestro proyecto está orientado, igualmente, a dos tipos de desarrollos por diversas razones. 
- **Desarrollo Open Source:** Gracias a la gran comunidad creciente de la que se dispone y de que ,además, la idea produce bastante impacto social, las primeras fases del desarrollo y prototipos se desarrollarán e iran mejorando con la ayuda de la comunidad. Es por ello que intentaremos definir todo el proyecto de la manera más intuitiva posible, para aumentar el alcance comunitario. Todo el proyecto será aplicable a software freeware o/y opensource.
- **Desarrollo de producto comercial:** Lógicamente, este producto puede ser desarrollado o fabricado en casa, cual impresora 3D, pero estamos en un ámbito dónde prima la seguridad y fiabilidad del producto. No podemos ofrecerle al invidente un producto "sin terminar" o con posibles "bugs". Es por ello que comercializándolo nos obligamos a adaptarnos a un marco legal, normativo y social además de tests de calidad, durabilidad, fiabilidad, seguridad... Certificados, homologación... así pues, como las impresoras 3D u otros proyectos, puedes decidir montártelo tú mismo o comprarlo. 

Así mismo, toda la documentación se traducirá a inglés una vez se haya consolidado el proyecto.






# Metodología

Para no olvidar ningún detalle y obtener un resultado aceptable se decidió usar una Metodología del diseño e Ingeniería Concurrente. Así pues, las siguientes secciones, conclusiones y resultados se obtendrán siguiendo el marco establecido por la Metodología Design for &quot;X&quot;, siendo nuestra variable &quot;X&quot; la ergonomía, pues de ella depende la mayoría de cuestiones que trataremos.

- Fase 1: Análisis de mercado e identificación de las necesidades de los
- consumidores.
- Fase 2: Especificación del producto.
- Fase 3: Generación del concepto de producto o Diseño conceptual.
- Fase 4: Diseño Preliminar e Ingeniería Básica.
- Fase 5: Diseño final e Ingeniería de detalle

[https://en.wikipedia.org/wiki/Design\_for\_X](https://en.wikipedia.org/wiki/Design_for_X)

# Investigación previa

Se realizó una investigación del mercado sobre los tipos de bastones que se pueden encontrar, sus diferentes características y el tipo de usuario al que está destinado, además se mantuvo conversaciones con invidentes reales y técnicos que enseñan a utilizar el bastón (gracias a la ONCE). Pudimos concluir con una serie de requisitos importantes:

- **Peso:** El total del peso del mango + bastón no debería exceder el medio kilogramo. En caso de no ser posible habría que buscar soluciones para reducir la fatiga que produce el peso en el usuario. Tras varias conversaciones, los usuarios nos pidieron sobre todo comodidad pues el tiempo que puede pasar caminando el usuario es superior a 1 hora. También se considera el centro de gravedad en el diseño, concentrando la masa en las partes superiores.
- **Posibilidad de acople al bastón** : La idea principal era eliminar el bastón pero tras conversaciones con usuarios se decidió permitir el acople, pues sin él el usuario no se sentiría ni cómodo ni seguro.

- **Volumen ajustado:** En el mercado existen varios modelos(*) y estos no cumplen los requisitos expuestos anteriormente y, sobre todo, el volumen. Disponemos de tecnología suficientemente avanzada como para hacer un aparato de dimensiones reducidas.
- **Utilización exclusiva de ultrasonidos** : En principio se consideró el uso de cámaras y otros sensores. Esto solo aumentaría la dificultad del proyecto, el precio y otros factores. Se pueden conseguir grandes resultados con ultrasonidos y nos centraremos en ello. En un futuro se podría considerar su incorporación.
- **Lenguaje no intrusivo** : No debemos intervenir demasiado en los sentidos de los usuarios, por ello se eligió el lenguaje mediante vibraciones. Se consideró el uso de audio para indicaciones o control por voz, pero estos interferían en sobre los sentidos de los invidentes, los cuales están más desarrollados que los demás al no disponer de la visión en cierto porcentaje. No obstante, el audio y el control por voz, al igual que las cámaras, podrían ser incorporados en un futuro además que es una función que algunos usuarios reclamarían.
*:Los modelos disponibles parecidos al que queremos realizar se encuentran desde 800€ la versión más básica. No existe mucha información en la red y la que hay es de dudosa credibilidad (videos de uso). Además las características que ofrecen no solucionan completamente el problema de la orientación.
Además, tras comentar la idea en la asociación malagueña de la ONCE se despertó el interés a los allí presentes y obtuvimos otros datos extras importantes:

- Sueldo medio de un invidente: 1200€
- Precio medio de gadgets para invidentes: entre 700-1000€
- Asequibilidad de un invidente individual: &gt;300€
- Asequibilidad de un invidente respaldado por la familia: &gt;500€
- Coste y espera de un perro guía: 30.000€ y esperas de hasta 5 años.
- Imposibilidad de ir a lugares nuevos o no conocidos
- Imposibilidad de moverse a veces de manera autónoma
- Falta de información en sitios públicos.

# Especificaciones del diseño - Prototipo basado en herramientas abiertas

**Ultrasonidos:** Utilizado el módulo para arduino HCSR04

Para el óptimo funcionamiento se requiere de una modificación de este módulo, la cual se detallará en este texto. Hemos elegidos estos ultrasonidos por su precio y facilidad de incorporación a nuestro proyecto. Posteriormente se pueden sustituir por unos de mejor calidad y orientados a nuestro fin.
Se usarán varios pares de ultrasonidos para reconocer el espacio. En principio el área que queremos abarcar es de 180 grados en la horizontal, entre 15-45 en la vertical (este ángulo depende de la altura del invidente), y otros sitios clave en las áreas muertas (especificado en dim_teo).

**Mango acopable:** El diseño del mango es compatible y acopable a cualquier bastón y también es posible su uso de manera autónoma. En el se encuentra, a parte de una batería, la electrónica necesaria y la hapticband. Imprimible en 3D y montaje con piezas normalizadas.

**Hapticband:** Sistema de comunicación usuario-máquina. Compuesto de una pantalla de tamaño por definir, cuyos píxeles serán pequeños vibradores acoplados por matrices y distingiendo 3 zonas, izquierda, centro derecha. La resolución estimada de esta pantalla está pensada entre 6x3 y 12x4. Además posee controles capacitivos para acceder a algunas funciones disponibles. Se pueden utilizar por ejemplo los ROB-08449. La superficie y el dispositivo en general será muy intuitivo y touchfriendly, es decir, cómodo de tocar, diseñado para ser tocado.

**Lenguaje de comunicación:** Relacionado directamente con la hapticband, se establecerá un lenguaje sencillo e intuitivo que traducirá decisiones en vibraciones y que el usuario entenderá como órdenes o avisos concretos.

**Dispositivo de apoyo** : Equivalente a las tripas de un smartphone. Este dispostivo se interconecta con el mango para ofrecer apoyo extra de sensores, como GPS, acelerómetro o brújula. Puede ser sustituido por un smartphone normal, previa instalación de una APP. No será objeto de estudio en este proyecto pero se considerará su existencia.

**Electrónica para el prototipado** : En el interior del mango se encontrará un microprocesador principal, arduino, rapsberry, orange pi, intel edison... + +interfaces de conexión + memoria+ batería. Sin embargo, para el primer prototipo se utilizará una placa Intel Edison + Base shield de Arduino. El código podría ser exportado y la electrónica se podría diseñar y fabricar a nuestras necesidades, siendo posible la adaptación al mango.

# Especificaciones del producto final
**
Considerando parte de lo anterior:**
En cuánto a la eléctronica, sería interesante incluir un cooprocesador destinado a tareas de IA y Machine Learning, que mejorarán los resultados para cada usuario individual, según su zona.

**En cuanto al diseño del producto:**
Será fabricado en mejores materiales, más duraderos, livianos y ergonómicos. Además las tolerancias en la fabricación nos permitirán un resultado en general bastante óptimo.
**
En cuanto al diseño interno:**
Toda la eléctronica, conectividad etc estará integrado en una placa prediseñada, dónde ahorraremos peso y energía. La hapticband también mejoraría muchísimo, utilizando otro tipo de vibradores (desde piezoeléctricos hasta cualquier sistema que pueda vibrar, cada cual con diferentes sensaciones)

# Diseño Hapticband

## Investigacion
### Innovacion en vibracion
**Ultrahaptics:** Ultrasonidos mueven el aire para provocar el efecto del tacto. Es una tecnología aún en desarrollo pero bastante interesante que además refleja la utilidad que pueden llegar a tener los ultrasonidos.
https://www.ultrahaptics.com/applications/
**AirReal:** By Disney, su objetivo es transmitir sensaciones de tacto conforme se consume contenido multimedia. La vibración se transmite sin contacto por medio aros toroidales de aire. 

Además, la tecnología háptica se encuentra en muchas disciplinas como la medicina, la informática, los videojuegos etc... 
Tras la investigación se concluye que la idea principal sigue siendo viable, es decir, una especie de pantalla de vibradores, los cuales pueden ser similares a los de los smartphones (por su tamaño)

## Sketches
![](\/figuras/hapticsketch.jpg)
## Descripción del lenguaje
Gracias a las virtudes de las vibraciones tenemos dos parámetros importantes
- Amplitud, A, **~**
- Frecuencia, f, **'**
Debemos diseñar un lenguaje que se adapte a estos parámetros, así pues, mediante signos, interpretaremos las señales vibratorias en el texto para mejor entendimiento del lector.
La estructura será: Amplitud^Frecuencia^ =  A^f^= **~^'^**.
Así pues la amplitud define la magnitud del obstáculo y la amplitud la cercanía.
En el hapticband disponemos de 3 zonas, izquierda, centro, derecha. Cada zona integrará un conjunto de vibradores y cada zona interpretará su espacio y lo comunicará, tanto horizontal como verticalmente. El reconocimiento será contínuo por seguridad, pero el usuario puede verificar algún espacio si planea algún movimiento. 
Como nombre descriptivo lo llamaremos HAF, que mezcla háptico, amplitud y frecuencia. 

### Niveles de amplitud
A- Obstáculo esquivable variando la dirección levemente, fácil de esquivar. Objeto pequeño, tanto de alto como de ancho
AA - Obstáculo esquivable variando la dirección más de un paso a ambos lados. Objeto mediano.
AAA - Obstáculo muy grande, dificil de esquivar o de superficie irreconocible. Se requiere otra verificación que se dará conforme el usuario intenta esquivarlo. 
### Niveles de frecuencia
'- Objeto lejano
''- Objeto relativamente cerca, poca precaución.
'''- Objeto inminente, disminuir ritmo de paso.
### Código lingüistico
Este sería el lenguaje básico. Cumple las premisas que queríamos, simplicidad y poco interferente en los sentidos. El usuario puede decidir cuando ser informado. 

## Diseño preliminar
![](\/figuras/HAPTIC.jpg)
El ángulo que abarca la banda es similar al que abarcan los sensores, unos 135º.
La banda que lo rodea ofrece un espacio extra que puede servirnos en un futuro (pero no es decisiva)
Los materiales serán alumunio rugososo (con cierta textura, quizás radial)

## Task list hapticband
-Diseñar ensamblaje
-Diseñar matrices de vibradores 3x3x3
-Inclusión de un botón extra cerca del pulgar


# Diseño del mango
## Dimensiones a considerar
Todas las dimensiones están relacionadas con el bastón clásico blanco. Lo óptimo sería diseñar un nuevo bastón, que ayudaría a reducir el peso y mejorar el agarre.
## Ergomía a la mano en base al uso del bastón de invidentes
Para el diseño, nos hemos basado en testimonios reales de invidentes y además hemos realizado una pequeña investigación de cómo se les enseña a usarlos. El primer diseño realizado era ergonómico pero no se adaptaba a los requisitos.
![](\/figuras/v1.jpg)

En el diseño final se ha considerado la postura "cilíndrica", dónde en el frontal va el pulgar y en un lateral el dedo índice (que apoyará en la hapticband). Además se ha quitado material en las zonas de contacto con la mano, que también serán cubiertas por una goma comfortable y absorvedora del sudor. Las medidas están optimizadas para poder acceder de manera muy fácil a la hapticband y botones. 
![](\/figuras/cilindrica.png)
## Sketches
![](\/figuras/mangosketch.jpg)

## Resultado preliminar
![](\/figuras/sup.png)
![](\/figuras/inf.jpg)
![](\/figuras/iso.jpg)


(Notése que hemos tenido problemas con el software. En blanco la posición de los ultrasonidos, en azul la hapticband y botones y en negro el mango)

## Task list diseño
-Refinar el diseño
-Obtener en mango en dos piezas acopables - obtener volumen máximo disponible
-Estudio de materiales - Estimación de peso
-Diseño interior para el acoplamiento de la electrónica y batería


# Diseño del software 
## Fuente de experimentos – Información extraída 
Antes de entrometernos en el modelo, hemos rebuscado información sobre proyectos abiertos parecidos al nuestro, es decir, que hagan uso de los ultrasonidos. Así nos hemos encontrado con los siguientes y hemos extraido diversa información:
### Radares/Sónar
Funcionan casi igual que nuestro proyecto, pero el emisor/receptor está controlado por un servo. En nuestro caso, tendremos fijados los ángulos de emisión y recepción, y cada módulo de ultrasonido abarcará cierto área:
![](\/figuras/angulohcsr04.jpg)
Según las especificaciones del sensor, cada módulo podría barrer 6,28m^2, según especificaciones, pero realmente será menor (unos 5,6m^2). Para reconocer el espacio en 180 grados necesitaríamos 3 modulos que abarcarán un total de 135º, es decir, 16,8m^2. Los 45 grados restantes, para llegar a 180, se complementan con el movimiento del bastón. 

Los sónar barren en 360 grados gracias a la movilidad de los sensores. Se podría extrapolar a nuestro proyecto de dos maneras:
Un sensor que rote alrededor del mango
Cambiar el movimiento del bastón de zigzag a una rotación de muñeca: El cuerpo del mango tendría un grado de libertad y con un simple movimiento de muñeca puedes apuntar y reconocer el espacio deseado. 

Sin embargo, preferimos seguir con la idea de 3 sensores fijos, pues el invidente no sabría realmente a dónde apuntar y sería algo más incómodo e incompatible con el hábito del bastón normal. El rotativo igualmente complicaría mucho el proyecto, pero son opciones que se podrían considerar en un futuro. 
### Machine Learning
[Proyecto Q-Learning]http://https://github.com/kennydl/Reinforcment-Learning-With-Q-Learning
Es una tésis en la cual modelan un robot que reconoce el espacio y se mueve sin chocar por medio de ultrasonidos. La disposición e instalación se aproxima a la de nuestro proyecto. Sería interesante aprovechar esta virtud que ofrece Matlab, la del modelado de inteligencia artificial, pues ayudaría a una orientación mucho mejor y rápida. 

### GitHubs y links de interés
-https://github.com/LuisAfonso95/Small-Projects/blob/master/MatLab%20SRF04%20Graph/MatLab_SRF04_simple_single_Plot.m
-https://github.com/tomasdecamino/ArduinoStuff/tree/master/Arduino_Radar
-https://github.com/kennydl/Reinforcment-Learning-With-Q-Learning/tree/master/Matlab
-https://es.mathworks.com/matlabcentral/fileexchange/58434-mapping-your-surroundings-using-matlab-and-arduino

###Banco de pruebas
![](\/figuras/material1.jpg)
![](\/figuras/material2.jpg)
![](\/figuras/conexion.png)

###Descripcion
Como se mencionó anteriormente, usaremos la placa Intel Edison (cortesía de un congreso de Teléfonica-Movistar en el edificio Green Ray, Málaga). Para esta placa no existen módulos predefinidos en Matlab, pero es fácil e intuitivo de configurar. Además nos ofrece conectividad por Wifi y Bluetooth, lo que nos permite trabajar con ella una vez montada sin tener que desmontar/montar. 
No obstante todo el código es compatible con Arduino. 
Nos hemos apoyado del módulo HCSR04 creado por JRodrigoTech. 
A continuación se puede observar las partes más importantes del código y las fuentes en las que nos hemos basado. Mencionar que todo el código está comentado (ingles/español), por lo que si no queda algo claro es recomendable leer el código.
![](\/figuras/esquema.png)
#### Código base para cada módulo
**Captación de datos de cada sensor**
```
%% Create an Arduino object with the necessary add-ons.
%% Create HCSR04 Object
a = arduino('COM4', 'Uno', 'Libraries', {'JRodrigoTech/HCSR04', 'Servo'});
b= edison('COM9', 'Uno', 'Libraries' edison({JRodrigoTech/HCSR04','Servo'});
% Create ultrasonic sensor object with trigger pin D12 and echo pin D13.
sensor = addon(a, 'JRodrigoTech/HCSR04', 'D12', 'D13')
%% Measure Sensed Distance in Meters 
val = readDistance(sensor);
sprintf('Current distance is %.4f meters\n', val)
%% Measure Distance from Sensed Time
% The distance can be computed from the sensed time using this equation,
% distance = (time x speedOfSound)/2. Assume speed of sound is 340m/s here.
t = readTravelTime(sensor);
sprintf('Current distance is %.4f meters\n', 340*t/2)
```
El parámetro `servo` es para el caso de un sensor acoplado a un motor servo que se mueve para reconocer el espacio. Nosotros tendremos 3 fuentes de datos. Cada sensor emitirá ultrasonidos y es posible que se creen interferencias, esto lo trataremos más tarde, solucionándolo cambiando el timing o añadiendo un delay, posibilitándonos el reconocimiento de diferentes "echoes" sin ningún problema 

```
%% Clean Up
clear sensor
clear a
%% Create an ultrasonic sensor object with trigger pin D12 and echo pin D13.
%% Make a polar plot of the distance data to display the map. 
%  Limit the theta values to be between 0 and 180 because the map is only
%  for obstacles in front of the HCSR04
polarplot (table(:,1)*pi/180, table (:,2));
title('Map of the Environment');
thetalim([0 180]);
grid on;
```
Graficamos resultados, con el comando `grid on`, fijamos la gráfica para luego superponer los resultados de los otros sensores. 

Con este simple código estamos listos para hacer pruebas, probar la distancia efectiva de reconocimiento, el rebote de ondas según el material, la influencia del ruido e interferencias...

### Echoes delay
 [**autor: Juchen **](http://https://www.robotshop.com/letsmakerobots/users/juchen)
```
/*
 HC-SR04 Ping distance sensor
 VCC to arduino 5v GND to arduino GND
 Echos to Arduino pin 13 and 8, Trig to Arduino pin 12
 */

#define trigPin 12
#define echoPin 13
#define echoPin2 8

void setup() {
  Serial.begin (9600);
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
   pinMode(echoPin2, INPUT);
}

void loop() {
  long duration, distance, distance2;
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(20);
  digitalWrite(trigPin, LOW);
  duration = pulseIn(echoPin, HIGH);
  distance = (duration/2) / 29.1;
  duration = duration + pulseIn(echoPin2, HIGH);//maybe first duration should
  distance2 = (duration/2) / 29.1;//be added to second duration because
  if (distance >= 200 || distance <= 0){ //the sound is traveling all the time
    Serial.println("Out of range");
  }
  else {
    Serial.print(distance); //messy debugging
    Serial.println(" cm");
       Serial.print(distance2);
    Serial.println(" cm");
        Serial.println(" XXX");
  }
  delay(500);
}
```
En una primera prueba con los 3 sensores (Gráficas superpuestas):
![](\/figuras/prueba1.png)
Se aprecia aún un pequeño desajuste en el sensor izquierdo. Teníamos 3 obstáculos, uno para cada zona a una distacia máxima de 1,5m.

### Trisensor.m
Combina la recogida de datos de los 3 sensores y envía la información a vibrator.m

### Vibrator.m
Este script recibe las lecturas de distancias y las clasifica, devolviendo cierto gradiente de vibraciones a cada vibrador. Para las primeras pruebas hemos utilizado 3 vibradores, pero como ya se comentó dispondremos 3 regiones de vibración, cada una forma una pantalla de 3x3. Así la interpretación de la vibración es mucho más efectiva y cómoda. 

La idea es obtener una vibración progresiva, llegando al máximo cuando el objeto está muy cerca. La lectura mínima es de 0,2m y la máxima entre 3-4metros. 

### Task list de código
- Refinar el código principal
- Incorporar Machine Learning
- Programa para interconectar con el smartphone.Obtener apoyo de otros sensores incorporados en los teléfonos como GPS, acelerómetro y brújulas. Refinar el lenguaje de comunicación para obtener información de estos sensores (por ejemplo sugerir un giro, la presencia de semáforos, el acceso a zonas adaptadas...)
- Sistema de alarma en caso de desorientación
Obtener ayuda o seguir un protocolo en el caso de que los sensores fallen. 















