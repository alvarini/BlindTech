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

## Prefacio

Tras el análisis teórico llega a la hora de tomar decisiones vitales en el diseño, tanto de hardware como de software. En un primer acercamiento, la idea es hacer el sistema lo más simple posible, para ello nos gustaría poder reconocer el espacio únicamente con ultrasonidos, aunque la incorporación de una cámara + láser u otra tecnología puede ser implantada para mejorar el sistema (aunque llevaría a un coste superior + peso).

Dividiremos este documento en dos secciones:

-**Diseño del producto**

-**Diseño del software**

Aunque cabe destacar que ambas se han desarrollado en paralelo por parte de los integrantes, habiendo plena comunicación entre los responsables.

Nuestro proyecto está orientado, igualmente, a dos tipos de desarrollos por diversas razones. 
- **Desarrollo Open Source:** Gracias a la gran comunidad creciente de la que se dispone y de que ,además, la idea produce bastante impacto social, las primeras fases del desarrollo y prototipos se desarrollarán e iran mejorando con la ayuda de la comunidad. Es por ello que intentaremos definir todo el proyecto de la manera más intuitiva posible, para aumentar el alcance comunitario. Todo el proyecto será aplicable a software freeware o/y opensource.
- **Desarrollo de producto comercial:** Lógicamente, este producto puede ser desarrollado o fabricado en casa, cual impresora 3D, pero estamos en un ámbito dónde prima la seguridad y fiabilidad del producto. No podemos ofrecerle al invidente un producto "sin terminar" o con posibles "bugs". Es por ello que comercializándolo nos obligamos a adaptarnos a un marco legal, normativo y social además de tests de calidad, durabilidad, fiabilidad, seguridad... Certificados, homologación... así pues, como las impresoras 3D u otros proyectos, puedes decidir montártelo tú mismo o comprarlo. 







# Diseño del mango, metodología y resultados

Para no olvidar ningún detalle y obtener un resultado aceptable se decidió usar una Metodología del diseño e Ingeniería Concurrente. Así pues, las siguientes secciones, conclusiones y resultados se obtendrán siguiendo el marco establecido por la Metodología Design for &quot;X&quot;, siendo nuestra variable &quot;X&quot; la ergonomía, pues de ella depende la mayoría de cuestiones que trataremos.

- Fase 1: Análisis de mercado e identificación de las necesidades de los
- consumidores.
- Fase 2: Especificación del producto.
- Fase 3: Generación del concepto de producto o Diseño conceptual.
- Fase 4: Diseño Preliminar e Ingeniería Básica.
- Fase 5: Diseño final e Ingeniería de detalle

[https://en.wikipedia.org/wiki/Design\_for\_X](https://en.wikipedia.org/wiki/Design_for_X)

## Investigación previa

Se realizó una investigación del mercado sobre los tipos de bastones que se pueden encontrar, sus diferentes características y el tipo de usuario al que está destinado, además se mantuvo conversaciones con invidentes reales y técnicos que enseñan a utilizar el bastón (gracias a la ONCE). Pudimos concluir con una serie de requisitos importantes:

- **Peso:** El total del peso del mango + bastón no debería exceder el medio kilogramo. En caso de no ser posible habría que buscar soluciones para reducir la fatiga que produce el peso en el usuario. Tras varias conversaciones, los usuarios nos pidieron sobre todo comodidad pues el tiempo que puede pasar caminando el usuario es superior a 1 hora. También se considera el centro de gravedad en el diseño, concentrando la masa en las partes superiores.
- **Posibilidad de acople al bastón** : La idea principal era eliminar el bastón pero tras conversaciones con usuarios se decidió permitir el acople, pues sin él el usuario no se sentiría ni cómodo ni seguro.
-
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

## Especificaciones del diseño - Prototipo

**Ultrasonidos:** Datasheet de los ultrasonidos utilizados para experimentos y con los cuales se realizará el primer prototipo.

Tabla 1, HCSR04 datasheet
INTRODUCIR TABLA

Para el óptimo funcionamiento se requiere de una modificación de este módulo, la cual se detallará en este texto. Hemos elegidos estos ultrasonidos por su precio y facilidad de incorporación a nuestro proyecto. Posteriormente se pueden sustituir por unos de mejor calidad y orientados a nuestro fin.

**Mango acopable:** El diseño del mango es compatible y acopable a cualquier bastón y también es posible su uso de manera autónoma. En el se encuentra, a parte de una batería, la electrónica necesaria y la hapticband.

**Hapticband:** Sistema de comunicación usuario-máquina. Compuesto de una pantalla de tamaño por definir, cuyos píxeles serán pequeños vibradores acoplados por matrices y distingiendo 3 zonas, izquierda, centro derecha. La resolución estimada de esta pantalla está pensada entre 12x4 y 24x8. Además posee controles capacitivos para acceder a algunas funciones disponibles.

**Lenguaje de comunicación:** Relacionado directamente con la hapticband, se establecerá un lenguaje sencillo e intuitivo que traducirá decisiones en vibraciones y que el usuario entenderá como órdenes o avisos concretos.

**Dispositivo de apoyo** : Equivalente a las tripas de un smartphone. Este dispostivo se interconecta con el mango para ofrecer apoyo extra de sensores, como GPS, acelerómetro o brújula. Puede ser sustituido por un smartphone normal, previa instalación de una APP. No será objeto de estudio en este proyecto pero se considerará su existencia.

**Electrónica para el prototipado** : En el interior del mango se encontrará un microprocesador principal + microprocesador destinado a tareas de IA y Machine Learning +interfaces de conexión + memoria. Sin embargo, para el primer prototipo se utilizará una placa Intel Edison + Base shield de Arduino. El código podría ser exportado y la electrónica se podría diseñar y fabricar a nuestras necesidades, siendo posible la adaptación al mango.

## Especificaciones del producto final

Considerando parte de lo anterior:

En cuanto al diseño del producto:

En cuanto al diseño interno:

# Diseño Hapticband

Investigacion

Sketches

Descripción del lenguaje

Especificación final

# Diseño del mango

Ergonomía de usuario

Espacio disponible para eléctronica

# Diseño del software

Fuente de experimentos – Información extraída

Nuestro código











1

#
 Los modelos disponibles parecidos al que queremos realizar se encuentran desde 800€ la versión más básica. No existe mucha información en la red y la que hay es de dudosa credibilidad (videos de uso). Además las características que ofrecen no solucionan completamente el problema de la orientación.