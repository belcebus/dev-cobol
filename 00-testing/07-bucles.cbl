       IDENTIFICATION DIVISION.
            PROGRAM-ID. CALCULADORA.
       
       ENVIRONMENT DIVISION.
       DATA DIVISION.
         WORKING-STORAGE SECTION.

         77 wks-num-1    PIC S9(05)V99.
         77 wks-num-2    PIC S9(05)V99.
         77 wks-res      PIC -ZZZZZZZZZ9.99.
         77 wks-opcion   PIC A(03).
         77 wks-eleccion PIC 9(01).
         77 wks-resto    PIC ZZZZ9.

       PROCEDURE DIVISION.
       0001-MI-SECCION SECTION.
       0001-MAIN.

      * BUCLE WHILE CON CONDICION DE SALIDA   
           PERFORM 0000-Calculadora UNTIL wks-eleccion = 2.

           STOP RUN.

       0000-Calculadora.
           >>SOURCE FORMAT IS FREE
           DISPLAY "1-. USAR LA CALCULADORA, 2-. SALIR" LINE 1 ERASE SCREEN.
           >>SOURCE FORMAT IS FIXED
           ACCEPT wks-eleccion LINE 2.
           IF wks-eleccion = 1
             PERFORM 0001-PedirDatos
             PERFORM 0002-EjecutarOperacion
           ELSE IF wks-eleccion = 2
              NEXT SENTENCE
           ELSE
             DISPLAY "OPCION INCORRECTA" LINE 3
           END-IF.
 
       0001-PedirDatos.
           *> 1DISPLAY "Calculadora" LINE 3.
           DISPLAY "DAME EL NUMERO 1:" LINE 4.
           ACCEPT wks-num-1 LINE 4 COLUMN 19.
           DISPLAY "DAME EL NUMERO 2:" LINE 5.
           ACCEPT wks-num-2 LINE 5 COLUMN 19.

           DISPLAY "SELECCIONA OPERACION: S = SUMA, " LINE 6
           "R: RESTA, M:MULTIPLICAR, D:DIVISION" LINE 7
           "L: MODULO, P: POTENCIA, Z: RAIZ" LINE 8.
           ACCEPT wks-opcion LINE 9.
           MOVE FUNCTION UPPER-CASE(wks-opcion) TO wks-opcion.

       0002-EjecutarOperacion.
           IF wks-opcion = "S"
             ADD wks-num-1 TO wks-num-2 GIVING wks-res
           ELSE IF wks-opcion = "R"
             SUBTRACT wks-num-2 FROM wks-num-1 GIVING wks-res
           ELSE IF wks-opcion = "M"
             MULTIPLY wks-num-1 BY wks-num-2 GIVING wks-res
           ELSE IF wks-opcion = "D" OR "L"
             >>SOURCE FORMAT IS FREE
             DIVIDE wks-num-1 BY wks-num-2 GIVING wks-res REMAINDER wks-resto
             >>SOURCE FORMAT IS FIXED
           ELSE IF wks-opcion = "P"
             COMPUTE wks-res = wks-num-1 ** wks-num-2
           ELSE IF wks-opcion = "Z"
             COMPUTE wks-res = wks-num-1 ** (1/wks-num-2)
             
           ELSE
             DISPLAY "OPERACION NO VALIDA" LINE 10
           END-IF.

           IF wks-opcion = "S" OR "R" OR "M" OR "D" OR "P" OR "Z"
               DISPLAY wks-res LINE 10
           ELSE IF wks-opcion = "L"
               DISPLAY wks-resto LINE 10
           END-IF.

           DISPLAY "PRESIONE CUALQUIER TECLA PARA CONTINUAR" LINE 11.
           STOP " ".
       END PROGRAM CALCULADORA.
