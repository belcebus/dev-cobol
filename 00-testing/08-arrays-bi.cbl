       ID DIVISION.
       PROGRAM-ID. 08-ARRAYS-BI.
       AUTHOR. DAVID HERNANDEZ MARTIN.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

         >>SOURCE FORMAT IS FREE
         01 trabajadores.
             02 datos-trabajador OCCURS 1 TO 100 TIMES DEPENDING ON indice-alta INDEXED BY INDX.       
                03 nombre-trabajador PIC X(50).
                03 apellido-pat      PIC X(50).
                03 apellido-mat      PIC X(50).
                03 salario           PIC S9(05)V99.
                03 id-trabajador     PIC 9(02).
                03 departamentos.
                   04 id-departamento PIC 9(02) OCCURS 3 TIMES.
  
         77 indice               PIC 9(03) VALUE 0.
         77 indice-dep           PIC 9(01) VALUE 0.
         77 indice-alta          PIC 9(03) VALUE 0.
         77 indice-alta-dep      PIC 9(01) VALUE 0.
         
         77 salario-format       PIC -ZZZZ9.99.
         77 id-consulta          PIC 9(03).

         01 opcion               PIC A(01) VALUE SPACE.
            88 opcion-alta        VALUE 'A'.
            88 opcion-consulta    VALUE 'C'.
            88 opcion-si          VALUE 'S'.
            88 opcion-no          VALUE 'N'.
            88 opcion-general     VALUE 'G'.
            88 opcion-particular  VALUE 'P'.
         
         77 terminar             PIC 9(01) VALUE ZERO.

       PROCEDURE DIVISION.
       0000-MAIN SECTION.
       0000-PRINCIPAL.
           DISPLAY "=== NOMINAS ===".
           MOVE 1 TO indice-alta.
           PERFORM 0003-MENU UNTIL terminar = 1.
           STOP RUN.

       0001-CAPTURA-TRABAJADOR. 

           DISPLAY "NOMBRE TRABAJADOR". 
           ACCEPT nombre-trabajador(indice-alta).
           
           DISPLAY "APELLIDO PATERNO".
           ACCEPT apellido-pat(indice-alta).
           
           DISPLAY "APELLIDO MATERNO".
           ACCEPT apellido-mat(indice-alta).
           
           PERFORM 0004-CAPTURA-DEPARTAMENTOS-TRABAJADOR UNTIL indice-alta-dep = 3.
           MOVE 0 TO indice-alta-dep.

           DISPLAY "SALARIO".
           ACCEPT salario(indice-alta).

           MOVE indice-alta TO id-trabajador(indice-alta).
           MULTIPLY id-trabajador(indice-alta) BY 10 GIVING id-trabajador(indice-alta).
           ADD 1 TO indice-alta.

       0002-MOSTRAR-TRABAJADORES.

           DISPLAY "ID:      " id-trabajador(indice).
           DISPLAY "NOMBRE:  " nombre-trabajador(indice).
           DISPLAY "APP PAT: " apellido-pat(indice).
           DISPLAY "APP MAT: " apellido-mat(indice).
           
           PERFORM 0007-MOSTRAR-DEPARTAMENTOS UNTIL indice-dep > 2.
           MOVE 0 TO indice-dep.
    
           MOVE salario(indice) TO salario-format.
           DISPLAY "SALARIO: " salario-format.

           ADD 1 TO indice.

       0003-MENU.

           DISPLAY "A = ALTA, C = CONSULTA, S = SALIR".
           ACCEPT opcion.
           MOVE 1 TO indice.

           IF opcion-alta
               IF indice-alta < 100
                   PERFORM 0001-CAPTURA-TRABAJADOR
               ELSE
                   DISPLAY "MEMORIA LLENA"
           ELSE IF opcion-consulta
               DISPLAY "G = GENERAL, P = PARTICULAR"
               ACCEPT opcion
               IF opcion-general
                   PERFORM 0002-MOSTRAR-TRABAJADORES UNTIL indice = indice-alta
               ELSE IF opcion-particular
                   PERFORM 0005-MOSTRAR-TRABAJADOR-ID-ALT
                ELSE
                   DISPLAY "OPCION NO VALIDA"
           ELSE IF opcion-si
               MOVE 1 TO terminar
           ELSE
               DISPLAY "OPCION NO VALIDA"
           END-IF.

       0004-CAPTURA-DEPARTAMENTOS-TRABAJADOR.

           ADD 1 TO indice-alta-dep.
           DISPLAY "DEPARTAMENTO" indice-alta-dep.
           ACCEPT id-departamento(indice-alta,indice-alta-dep).

           MOVE " " TO opcion.
           PERFORM 0006-OTRO-DEPARTAMENTO UNTIL opcion-si OR opcion-no OR indice-alta-dep = 3.

           IF opcion-no
               MOVE 3 TO indice-alta-dep    
           END-IF.
 
       0005-MOSTRAR-TRABAJADOR-ID-ALT.
 
           DISPLAY "INTRODUCE EL IDENTIFICADOR: ".
           ACCEPT id-consulta.

           SET INDX TO 1
           SEARCH datos-trabajador
               AT END DISPLAY "TRABAJADOR NO ENCONTRADO"
               WHEN id-trabajador(INDX) = id-consulta
                  DISPLAY "ID:      " id-trabajador(INDX)
                  DISPLAY "NOMBRE:  " nombre-trabajador(INDX)
                  DISPLAY "APP PAT: " apellido-pat(INDX)
                  DISPLAY "APP MAT: " apellido-mat(INDX)
                  MOVE INDX TO indice
                  PERFORM 0007-MOSTRAR-DEPARTAMENTOS UNTIL indice-dep > 2
                  MOVE 0 TO indice-dep
                  MOVE salario(INDX) TO salario-format
                  DISPLAY "SALARIO: " salario-format           
           END-SEARCH.

       0006-OTRO-DEPARTAMENTO.      
           DISPLAY "OTRO DEPARTAMENTO? S/N".
           ACCEPT opcion.

           IF NOT opcion-si AND NOT opcion-no
               DISPLAY "OPCION INCORRECTA"
           END-IF.

       0007-MOSTRAR-DEPARTAMENTOS.

           ADD 1 TO indice-dep.
           IF id-departamento(indice,indice-dep) NOT = 0
               DISPLAY "DEPART" indice-dep ": " id-departamento(indice,indice-dep)
           ELSE
               MOVE 3 TO indice-dep
           END-IF.
            
       END PROGRAM 08-ARRAYS-BI.
