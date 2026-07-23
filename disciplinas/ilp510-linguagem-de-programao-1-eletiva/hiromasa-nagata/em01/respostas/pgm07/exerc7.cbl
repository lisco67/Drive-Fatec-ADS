       IDENTIFICATION DIVISION.

       PROGRAM-ID.    EXERC7.
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
             SELECT   CADALU   ASSIGN TO DISK
             ORGANIZATION IS  LINE  SEQUENTIAL.
             SELECT   CADATU   ASSIGN TO DISK
             ORGANIZATION IS  LINE  SEQUENTIAL.

       DATA DIVISION.

         FILE SECTION.
           FD CADALU
             LABEL   RECORD    STANDARD
             VALUE  OF FILE-ID IS "CADALU.DAT".
           01 REG-ENT.
             02 NUMERO-ENT    PIC 9(05).
             02 NOME-ENT      PIC X(20).
             02 NOTA1-ENT     PIC 9(02)V99.
             02 NOTA2-ENT     PIC 9(02)V99.
             02 NOTA3-ENT     PIC 9(02)V99.
             02 NOTA4-ENT     PIC 9(02)V99.
             02 SEXO-ENT      PIC X(01).
           FD CADATU
             LABEL   RECORD   STANDARD
             VALUE OF FILE-ID IS "CADATU.DAT".
           01 REG-SAI.
             02 NUMERO-SAI    PIC 9(05).
             02 NOME-SAI      PIC X(20).
             02 MEDIA-SAI     PIC 9(02)V99.
             02 SEXO-SAI      PIC X(01).
         WORKING-STORAGE SECTION.
           77 FIM-ARQ  PIC X(03)  VALUE "NAO".
           77 MEDIA-C  PIC 9(02)V99.

       PROCEDURE DIVISION.

         TESTE.
           PERFORM INICIO.
           PERFORM PRINCIPAL
             UNTIL FIM-ARQ EQUAL "SIM".
           PERFORM TERMINO
           STOP RUN.

         INICIO.
           OPEN INPUT  CADALU
                OUTPUT CADATU.
           PERFORM LEITURA.

         LEITURA.
           READ CADALU
             AT END
             MOVE "SIM" TO FIM-ARQ.

         PRINCIPAL.
           PERFORM GRAVACAO.
           PERFORM LEITURA.

         GRAVACAO.
             COMPUTE MEDIA-C = (NOTA1-ENT + NOTA2-ENT + NOTA3-ENT
             + NOTA4-ENT)/4.
             MOVE NUMERO-ENT  TO NUMERO-SAI.
             MOVE NOME-ENT    TO NOME-SAI.
             MOVE MEDIA-C     TO MEDIA-SAI.
             MOVE SEXO-ENT    TO SEXO-SAI.
             IF SEXO-ENT = 'F'
               WRITE REG-SAI
             END-IF.

         TERMINO.
           CLOSE CADALU
                 CADATU.
