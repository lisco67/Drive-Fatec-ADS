       IDENTIFICATION DIVISION.

       PROGRAM-ID.    Exerc7.
       AUTHOR.        SEU NOME.
       INSTALLATION.  FATEC-SP.
       DATE-WRITTEN.  18/03/2025.
       DATE-COMPILED.
       SECURITY.     APENAS O AUTOR PODE MODIFICA-LO.

       ENVIRONMENT DIVISION.

         CONFIGURATION SECTION.
           SOURCE-COMPUTER.  MY-PC.
           OBJECT-COMPUTER.  MY-PC.
           SPECIAL-NAMES.    DECIMAL-POINT IS COMMA.
         INPUT-OUTPUT SECTION.
           FILE-CONTROL.
             SELECT   CAD-ENT   ASSIGN TO DISK
             ORGANIZATION IS  LINE  SEQUENTIAL.
             SELECT   CAD-SAI   ASSIGN TO DISK
             ORGANIZATION IS  LINE  SEQUENTIAL.

       DATA DIVISION.

         FILE SECTION.
           FD CAD-ENT
             LABEL   RECORD    STANDARD
             VALUE  OF FILE-ID IS "CAD-ENT.DAT".
           01 REG-ENT.
             02 MATRI-ENT     PIC 9(05).
             02 NOME-ENT      PIC X(30).
             02 SALARIO-ENT   PIC 9(05)V99.
           FD CAD-SAI
             LABEL   RECORD   STANDARD
             VALUE OF FILE-ID IS "CAD-SAI.DAT".
           01 REG-SAI.
             02 MATRI-SAI     PIC 9(05).
             02 NOME-SAI      PIC X(30).
             02 SALARIO-SAI   PIC 9(05)V99.
         WORKING-STORAGE SECTION.
           77 FIM-ARQ  PIC X(03)  VALUE "NAO".

       PROCEDURE DIVISION.

         TESTE.
           PERFORM INICIO.
           PERFORM PRINCIPAL
             UNTIL FIM-ARQ EQUAL "SIM".
           PERFORM TERMINO
           STOP RUN.

         INICIO.
           OPEN INPUT  CAD-ENT
                OUTPUT CAD-SAI.
           PERFORM LEITURA.

         LEITURA.
           READ CAD-ENT
             AT END
             MOVE "SIM" TO FIM-ARQ.

         PRINCIPAL.
           PERFORM GRAVACAO.
           PERFORM LEITURA.

         GRAVACAO.
             MOVE MATRI-ENT   TO MATRI-SAI.
             MOVE NOME-ENT    TO NOME-SAI.
             MOVE SALARIO-ENT TO SALARIO-SAI.
             IF SALARIO-SAI > 3000
               WRITE REG-SAI
             END-IF.

         TERMINO.
           CLOSE CAD-ENT
                 CAD-SAI.
