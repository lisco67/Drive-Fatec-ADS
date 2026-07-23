       IDENTIFICATION  DIVISION.
       PROGRAM-ID.     EXERC1.
       AUTHOR.         YHAGO PESSOA.
       INSTALLATION.   FATEC-SP.
       DATE-WRITTEN.   25/02/2025.
       DATE-COMPILED.  25/02/2025.
       SECURITY. APENAS O AUTOR PODE MODIFICA-LO.
      *REMARKS.  LE O REGISTRO DO ARQUIVO DE ENTRADA
      *          CADCLI1(CODIGO, NOME) E GRAVA NO
      *          ARQUIVO DE SAIDA CADCLI2 (NOME, CODIGO).

       ENVIRONMENT     DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.  MY-PC.
       OBJECT-COMPUTER.  MY-PC.
       SPECIAL-NAMES.    DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT   CADCLI1      ASSIGN      TO       DISK
           ORGANIZATION  IS         LINE        SEQUENTIAL.
           SELECT   CADCLI2        ASSIGN     TO       DISK
           ORGANIZATION  IS         LINE        SEQUENTIAL.

       DATA           DIVISION.
       FILE SECTION.

       FD  CADCLI1
           LABEL   RECORD  STANDARD
           VALUE    OF FILE-ID    IS          "CAD-ENT.DAT".
       01  REG-ENT.
           02 COD-ENT           PIC 9(05).
           02 NOME-ENT          PIC X(20).

       FD  CADCLI2
           LABEL   RECORD  STANDARD
           VALUE   OF FILE-ID    IS   "CAD-SAI.DAT".
       01  REG-SAI.
           02 NOME-SAI         PIC X(20).
           02 COD-SAI          PIC 9(05).
       WORKING-STORAGE SECTION.
           77 FIM-ARQ          PIC X(03)    VALUE "NAO".

       PROCEDURE        DIVISION.

       EXEMPLO.
           PERFORM INICIO.
           PERFORM PRINCIPAL
             UNTIL FIM-ARQ EQUAL "SIM".
           PERFORM TERMINO
           STOP RUN.
       INICIO.
           OPEN INPUT CADCLI1
                OUTPUT CADCLI2.
           PERFORM LEITURA.

           LEITURA.
               READ CADCLI1
                  AT END
                  MOVE "SIM" TO FIM-ARQ.
       PRINCIPAL.
           PERFORM GRAVACAO.
           PERFORM LEITURA.

           GRAVACAO.
               MOVE COD-ENT TO COD-SAI.
               MOVE NOME-ENT TO NOME-SAI.
               WRITE REG-SAI.

       TERMINO.
           CLOSE CADCLI1
                 CADCLI2.
