       IDENTIFICATION DIVISION.
       PROGRAM-ID. PRUEBA.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  WKS-USER.
         02 WKS-NOMBRE PIC A(10).
         02 WKS-APELLIDO PIC A(10).

       PROCEDURE DIVISION.
           PERFORM A.
           PERFORM B.
           PERFORM A.
           GOBACK.

          A. 
           DISPLAY "PARRAFO A".
           ACCEPT WKS-NOMBRE OF WKS-USER.
           
          B.
           DISPLAY "PARRAFO B".
          C.
           DISPLAY "PARRAFO C".
           STOP RUN.
       END PROGRAM PRUEBA.
       