       PROGRAM-ID. prueba-array.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       >> SOURCE FORMAT IS FREE
         01 TRABAJADORES.
           02 TRABAJADOR OCCURS 1 TO 3 TIMES DEPENDING ON INDICE
                         INDEXED BY INDX.
               03 IDENTIFICADOR PIC 9(02).
               03 NOMBRE PIC A(10).
               03 APELLIDO PIC A(10).

         77 INDICE PIC 9(02) VALUE 1.

         77 ELEMENTO-BUSQUEDA PIC 9(02) VALUE 30.
       
       PROCEDURE DIVISION.
       
           PERFORM 0000-INITIALIZE.
           PERFORM 0001-DISPLAY-TRABAJADORES UNTIL INDICE > 3.
    
           DISPLAY "                      ".
           DISPLAY "**********************".
           DISPLAY "                      ".

           SET INDX TO 1
           SEARCH TRABAJADOR 
               AT END 
                   DISPLAY "NO ENCONTRADO"
               WHEN IDENTIFICADOR(INDX) = ELEMENTO-BUSQUEDA
                   DISPLAY "               "
                   DISPLAY INDX
                   DISPLAY "IDENTIFICADOR: " IDENTIFICADOR(INDX)
                   DISPLAY "NOMBRE       : " NOMBRE(INDX)
                   DISPLAY "APELLIDO     : " APELLIDO(INDX)
           END-SEARCH.

           STOP RUN.

       
       0000-INITIALIZE.
           MOVE 10 TO IDENTIFICADOR(1).
           MOVE "DAVID" TO NOMBRE(1).
           MOVE "HERNANDEZ" TO APELLIDO(1).
           MOVE 20 TO IDENTIFICADOR(2).
           MOVE "LAURA" TO NOMBRE(2).
           MOVE "CUETO" TO APELLIDO(2).
           MOVE 30 TO IDENTIFICADOR(3).
           MOVE "ANTONIO" TO NOMBRE(3).
           MOVE "MARTIN" TO APELLIDO(3).

       0001-DISPLAY-TRABAJADORES.
           DISPLAY "               "
           DISPLAY "IDENTIFICADOR: " IDENTIFICADOR(INDICE).
           DISPLAY "NOMBRE       : " NOMBRE(INDICE).
           DISPLAY "APELLIDO     : " APELLIDO(INDICE).
           ADD 1 TO INDICE.

       END PROGRAM prueba-array.

