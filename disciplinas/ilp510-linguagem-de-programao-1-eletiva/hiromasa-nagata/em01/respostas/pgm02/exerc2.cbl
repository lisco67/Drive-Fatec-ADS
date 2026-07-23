       IDENTIFICATION  DIVISION.
       PROGRAM-ID.     EXERC2.
       AUTHOR.         SEU NOME.
       INSTALLATION.   FATEC-SP.
       DATE-WRITTEN.   25/02/2025.
       DATE-COMPILED.  25/02/2025.
       SECURITY. APENAS O AUTOR PODE MODIFICA-LO.
      *REMARKS.  LE OS REGISTRO DO ARQUIVO DE ENTRADA
      *          CADALU(CODIGO, NOME, SEXO, DATA) E GRAVA NO
      *          ARQUIVO DE SAIDA CADATU(CODIGO, NOME, DATA).

       ENVIRONMENT     DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.  MY-PC.
       OBJECT-COMPUTER.  MY-PC.
       SPECIAL-NAMES.    DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT   CADALU      ASSIGN      TO       DISK
           ORGANIZATION  IS         LINE        SEQUENTIAL.
           SELECT   CADATU        ASSIGN     TO       DISK
           ORGANIZATION  IS         LINE        SEQUENTIAL.

       DATA           DIVISION.
       FILE SECTION.

       FD  CADALU
           LABEL   RECORD  STANDARD
           VALUE    OF FILE-ID    IS          "CADALU.DAT".
       01  REG-ENT.
           02 NUM-ENT           PIC 9(05).
           02 NOME-ENT          PIC X(20).
           02 SEXO-ENT          PIC X(01).
           02 DD-ENT            PIC 9(02).
           02 MM-ENT            PIC 9(02).
           02 AAAA-ENT          PIC 9(04).

       FD  CADATU
           LABEL   RECORD  STANDARD
           VALUE   OF FILE-ID    IS   "CADATU.DAT".
       01  REG-SAI.
           02 NUM-SAI           PIC 9(05).
           02 NOME-SAI          PIC X(20).
           02 DD-SAI            PIC 9(02).
           02 MM-SAI            PIC 9(02).
           02 AAAA-SAI          PIC 9(04).

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
           OPEN INPUT CADALU
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
               MOVE NUM-ENT TO NUM-SAI.
               MOVE NOME-ENT TO NOME-SAI.
               MOVE DD-ENT TO DD-SAI.
               MOVE MM-ENT TO MM-SAI.
               MOVE AAAA-ENT TO AAAA-SAI.
               WRITE REG-SAI.

       TERMINO.
           CLOSE CADALU
                 CADATU.
