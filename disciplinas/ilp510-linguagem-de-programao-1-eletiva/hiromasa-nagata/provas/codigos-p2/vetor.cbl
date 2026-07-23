       IDENTIFICATION DIVISION.
       PROGRAM-ID. TAB02.
       AUTHOR. HIRO.
       INSTALLATION. FATEC-SP.
       DATE-WRITTEN. 23/09/2025.
       DATE-COMPILED.
       SECURITY. APENAS O AUTOR PODE MODIFICA-LO.
      *REMARKS. LE UM REGISTRO COM TABELA DE TEMPERATURA
      * GRAVA OS TOTAIS DA CIDADE EM UM REGISTRO.

       ENVIRONMENT    DIVISION.
       CONFIGURATION  SECTION.
       SOURCE-COMPUTER. IBM-PC.
       OBJECT-COMPUTER. IBM-PC.
       SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
           SELECT ARQ-ENT ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT CAD-SAI ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.

       FILE SECTION.

       FD ARQ-ENT
            LABEL  RECORD    ARE STANDARD
            VALUE OF FILE-ID IS "ARQ-ENT.DAT".

       01 REG-ENT.
           02 COD-CIDADE   PIC 9(002).
           02 TEMP-CIDADE  PIC 9(003)
                           OCCURS 10 TIMES.

       FD CAD-SAI 
           LABEL RECORD    ARE STANDARD.

       01 REG-SAI.
           02 COD-SAI      PIC 9(002).
           02 MEDIA-SAI    PIC 9(003)V9(02).

       WORKING-STORAGE   SECTION.
       77 FIM-ARQ      PIC X(03)        VALUE "NAO".
       77 CTR          PIC 9(02)        VALUE ZEROS.
       77 TOTAL        PIC 9(13)V9(04)  VALUE ZEROES.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
       

       PROCEDURE       DIVISION.
       PGM-TAB01.
          PERFORM   INICIO.
          PERFORM   PRINCIPAL   UNTIL
                         FIM-ARQ   EQUAL  "SIM".
          PERFORM  FIM.
          STOP RUN.

       INICIO.
           OPEN    INPUT ARQ-ENT
                   OUTPUT CAD-SAI.
           PERFORM LEITURA.

       LEITURA.
           READ ARQ-ENT
                AT END MOVE "SIM" TO FIM-ARQ.

       PRINCIPAL.
           PERFORM ACUMULA-TEMP.
           PERFORM GRAVA-SAI.
           PERFORM LEITURA.

       ACUMULA-TEMP.
           MOVE ZEROS TO TOTAL.
           MOVE 1 TO CTR.
           PERFORM SOMA-TAB 10 TIMES.
           DIVIDE 10 INTO TOTAL.

       SOMA-TAB.
           ADD TEMP-CIDADE (CTR) TO TOTAL.
           ADD 1                 TO CTR.

       GRAVA-SAI.
           MOVE  COD-CIDADE TO COD-SAI.
           MOVE  TOTAL TO MEDIA-SAI.
           WRITE REG-SAI.
       FIM.
           CLOSE   ARQ-ENT
                   CAD-SAI.

