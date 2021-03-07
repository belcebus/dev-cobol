      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. Ficheros.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.
       OBJECT-COMPUTER.
       SPECIAL-NAMES.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
      *Ruta donde esta el fichero
           SELECT INFILE ASSIGN TO "Fichero.txt"
           ORGANIZATION IS LINE SEQUENTIAL.
      *     ORGANIZATION IS TIPO-DE-ORGANIZACION
      *     SEQUENTIAL, RELATIVE, INDEXED
      *    ACCESS MODE IS Modo-de-acceso-al-fichero
      *     SEQUENTIAL, RANDOM, DYNAMIC
      *     RECORD KEY IS Clave-registro
      *    FILE STATUS IS Variable-estado-fichero.

       DATA DIVISION.
       FILE SECTION.
       FD INFILE.
       01  REG-INFILE.
           02  LETRAS       PIC A(10).

       WORKING-STORAGE SECTION.
       01  WKS-INFILE.
           02  WKS-LETRAS       PIC A(10).
       01  WS-EOF PIC A(1).
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           DISPLAY "Lectura de Fichero"
           OPEN INPUT INFILE.
               PERFORM UNTIL WS-EOF='Y'
               READ INFILE INTO WKS-INFILE
                       AT END MOVE 'Y' TO WS-EOF
                       NOT AT END DISPLAY WKS-INFILE
                   END-READ
               END-PERFORM.
           CLOSE INFILE.

           STOP RUN.
       END PROGRAM Ficheros.
