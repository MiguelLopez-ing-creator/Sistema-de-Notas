// Subproceso o Función requerida para clasificar las notas
Funcion cat <- Categoria(nota)
    Definir cat Como Texto
    Si nota >= 90 Y nota <= 100 Entonces
        cat <- "Sobresaliente"
    Sino
        Si nota >= 76 Y nota <= 89 Entonces
            cat <- "Notable"
        Sino
            Si nota >= 61 Y nota <= 75 Entonces
                cat <- "Satisfactorio"
            Sino
                cat <- "Insuficiente"
            FinSi
        FinSi
    FinSi
FinFuncion

Algoritmo SistemaNotas
    Definir notas Como Entero
    Dimension notas[5] // Arreglo para las notas de los 5 estudiantes
    Definir opcion, i Como Entero
    Definir notas_ingresadas Como Logico
    Definir suma, nota_max, aprobados, puntos_extra Como Entero
    Definir promedio Como Real
    
    // Inicialización del estado del sistema
    notas_ingresadas <- Falso
    
    Repetir
        // Despliegue del Menú Principal
        Escribir "===== SISTEMA DE NOTAS FE729 ====="
        Escribir "1. Ingresar notas"
        Escribir "2. Mostrar notas y categorías"
        Escribir "3. Estadísticas"
        Escribir "4. Sumar puntos extra"
        Escribir "5. Salir"
        Escribir "Opcion:"
        Leer opcion
        
        Segun opcion Hacer
            1:
                // Ingreso de notas con validación individual (0 a 100)
                Para i <- 1 Hasta 5 Con Paso 1 Hacer
                    Repetir
                        Escribir "Ingrese la nota del estudiante ", i, " (0-100):"
                        Leer notas[i]
                        Si notas[i] < 0 O notas[i] > 100 Entonces
                            Escribir "Error: La nota debe estar entre 0 y 100."
                        FinSi
                    Hasta Que notas[i] >= 0 Y notas[i] <= 100
                FinPara
                notas_ingresadas <- Verdadero
                Escribir "¡Notas guardadas con éxito!"
                
            2, 3, 4:
                // Control para validar si ya existen notas en el sistema
                Si NO notas_ingresadas Entonces
                    Escribir "Todavía no hay notas."
                Sino
                    Segun opcion Hacer
                        2:
                            // Mostrar notas individuales acoplando la función Categoria
                            Escribir "--- Notas y Categorías ---"
                            Para i <- 1 Hasta 5 Con Paso 1 Hacer
                                Escribir "Estudiante ", i, ": ", notas[i], " -> ", Categoria(notas[i])
                            FinPara
                            
                        3:
                            // Cálculo de métricas estadísticas
                            suma <- 0
                            nota_max <- notas[1]
                            aprobados <- 0
                            
                            Para i <- 1 Hasta 5 Con Paso 1 Hacer
                                suma <- suma + notas[i]
                                Si notas[i] > nota_max Entonces
                                    nota_max <- notas[i]
                                FinSi
                                Si notas[i] >= 61 Entonces
                                    aprobados <- aprobados + 1
                                FinSi
                            FinPara
                            
                            promedio <- suma / 5
                            Escribir "Promedio: ", promedio
                            Escribir "Nota más alta: ", nota_max
                            Escribir "Aprobados: ", aprobados
                            
                        4:
                            // Suma de puntos extra limitados a un tope de 100
                            Escribir "Ingrese los puntos extra a sumar a todos:"
                            Leer puntos_extra
                            Para i <- 1 Hasta 5 Con Paso 1 Hacer
                                notas[i] <- notas[i] + puntos_extra
                                Si notas[i] > 100 Entonces
                                    notas[i] <- 100 // Límite establecido en el reto
									FinSi
                            FinPara
                            Escribir "Puntos extra aplicados."
                    FinSegun
                FinSi
                
            5:
                Escribir "Saliendo del programa..."
                
            De Otro Modo:
                Escribir "Opción no válida. Intente de nuevo."
        FinSegun
        Escribir "" // Salto de línea
    Hasta Que opcion = 5
FinAlgoritmo