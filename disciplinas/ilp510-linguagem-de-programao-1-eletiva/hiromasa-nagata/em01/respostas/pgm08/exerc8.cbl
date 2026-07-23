       IDENTIFICATION  DIVISION.
       PROGRAM-ID.     EXERC8.
       AUTHOR.         SEU NOME.
       INSTALLATION.   FATEC-SP.
       DATE-WRITTEN.   18/03/2025.
       DATE-COMPILED.
       SECURITY. APENAS O AUTOR PODE MODIFICA-LO.

       ENVIRONMENT     DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.  MY-PC.
       OBJECT-COMPUTER.  MY-PC.
       SPECIAL-NAMES.    DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT   CADFUN        ASSIGN      TO       DISK
           ORGANIZATION  IS         LINE        SEQUENTIAL.
           SELECT   CADSAI        ASSIGN     TO       DISK
           ORGANIZATION  IS         LINE        SEQUENTIAL.

       DATA           DIVISION.
       FILE SECTION.

       FD  CADFUN
           LABEL   RECORD  STANDARD
           VALUE    OF FILE-ID    IS          "CADALU.DAT".
       01  REG-ENT.
           02 NUM-ENT           PIC 9(05).
           02 NOME-ENT          PIC X(20).
           02 SAL-ENT           PIC 9(05)V99.

       FD  CADSAI
           LABEL   RECORD  STANDARD
           VALUE   OF FILE-ID    IS   "CADSAI.DAT".
       01  REG-SAI.
           02 NUM-SAI           PIC 9(05).
           02 NOME-SAI          PIC X(20).
           02 SAL-SAI           PIC 9(05)V99.

       WORKING-STORAGE SECTION.
           77 FIM-ARQ          PIC X(03)    VALUE "NAO".
           77 SAL-CONT         PIC 9(05)V99.


       PROCEDURE        DIVISION.

       EXEMPLO.
           PERFORM INICIO.
           PERFORM PRINCIPAL
             UNTIL FIM-ARQ EQUAL "SIM".
           PERFORM TERMINO
           STOP RUN.
       INICIO.
           OPEN INPUT CADFUN
                OUTPUT CADSAI.
           PERFORM LEITURA.

           LEITURA.
               READ CADFUN
                  AT END
                  MOVE "SIM" TO FIM-ARQ.
       PRINCIPAL.
           PERFORM GRAVACAO.
           PERFORM LEITURA.

           GRAVACAO.
               IF SAL-ENT <= 1000
                   COMPUTE SAL-CONT = SAL-ENT * (112/100)
               ELSE IF SAL-ENT <= 2000
                   COMPUTE SAL-CONT = SAL-ENT * (111/100)
               ELSE
                   COMPUTE SAL-CONT= SAL-ENT * (110/100)
               END-IF.
               MOVE NUM-ENT TO NUM-SAI
               MOVE NOME-ENT TO NOME-SAI
               MOVE SAL-CONT TO SAL-SAI
               WRITE REG-SAI.

       TERMINO.
           CLOSE CADFUN
                 CADSAI.
