%%Entrada de datos pines d2-d10
a = arduino('COM38', 'Uno', 'Libraries', 'JRodrigoTech/HCSR04')
b = arduino('COM38', 'Uno', 'Libraries', 'JRodrigoTech/HCSR04')
c = arduino('COM38', 'Uno', 'Libraries', 'JRodrigoTech/HCSR04')
%Salida de datos por vibraciones. Llamada a funcion vibrator
v1= vibrator(A1,f1)
v2= vibrator(A2,f2)
v3= vibrator(A3,f3)
