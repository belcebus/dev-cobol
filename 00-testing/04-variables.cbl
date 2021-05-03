       IDENTIFICATION DIVISION.
       PROGRAM-ID. 04-VARIABLES.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
        WORKING-STORAGE SECTION.
      
      *VARABLE QUE NO SE PUEDE DIVIDIR, ES DECIR, NO ES COMPUESTA: 77
        77 WKS-NOMBRE                          PICTURE A(30).
      
      *VARIABLE QUE PUEDE SER COMPUESTA, REGISTROS: 01
        01 WKS-REGISTRO-EMPLEADO.
           02 WKS-NOM-EMP.
              03 WKS-NOMBRE-EMPLEADO           PICTURE A(30) 
                                                 VALUE "DAVID".
              03 WKS-PRIMER-APELLIDO           PICTURE A(30)
                                                 VALUE "HERNANDEZ". 
              03 WKS-SEGUNDO-APELLIDO          PICTURE A(30)
                                                 VALUE "MARTIN".
           02 WKS-EDAD                         PICTURE 9(02)
                                                 VALUE 42.
           02 WKS-SALARIO                      PICTURE 9(05)V9(2)
                                                 VALUE 789.34.
      
      *NIVEL PARA RENOMBRADO DE VARIABLES. LAS ELEMENTALES Y EL AGRUPADO
      *PRINCIPAL NO PUEDEN SER RENOMBRADOS. DEBEN ESTAR AL MISMO NIVEL.
        66  WKS-APELLIDOS RENAMES WKS-PRIMER-APELLIDO THRU WKS-SEGUNDO-A
      -    PELLIDO.
      *NIVEL PARA VER SI SE CUMPLEN CONDICIONES SOBRE LA VARIABLE.
        01 BANDERA                             PIC 9(01).
           88 WKS-TRUE  VALUE 1.
           88 WKS-FALSE VALUE 0.
        77 GASTOS                              PIC 9(05)V99.
        77 WS-HORAS                            PIC 9(10).
        77 WS-DIRECCION                        PIC X(100)
            VALUE "JUAN CARLOS CALDERON 3 ESC 2 3D LAS ROZAS DE MADRID".

       PROCEDURE DIVISION.
        00001-PRIMER-SECTION SECTION.
         00001-PRIMER-PARRAFO.
           DISPLAY " ".
           DISPLAY "PROGRAMA DE VARIABLES".
           ACCEPT WKS-NOMBRE.
           DISPLAY "HOLA, " WKS-NOMBRE.
           DISPLAY "REGISTRO EMPLEADO: " WKS-REGISTRO-EMPLEADO.
           DISPLAY "EDAD: " WKS-EDAD.
           DISPLAY "NOMBRE TRABAJADOR: " WKS-NOMBRE-EMPLEADO.
           DISPLAY "APELLIDOS TRABAJADOR: " WKS-APELLIDOS.
           DISPLAY "DIRECCION: " WS-DIRECCION.
           DISPLAY "GASTOS: " GASTOS.
           DISPLAY "BANDERA: " BANDERA.
           
       STOP RUN.
       END PROGRAM 04-VARIABLES.
       