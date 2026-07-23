       IDENTIFICATION  DIVISION.
       PROGRAM-ID.     EXERC5.
       AUTHOR.         SEU NOME.
       INSTALLATION.   FATEC-SP.
       DATE-WRITTEN.   18/03/2025.
       DATE-COMPILED.  18/03/2025.
       SECURITY. APENAS O AUTOR PODE MODIFICA-LO.
      *REMARKS.  LE O REGISTRO DO ARQUIVO DE ENTRADA
      *          CADALU(CODIGO,NOME,NOTA1,NOTA2 E FALTAS) E GRAVA
      *          NO ARQUVIO DE SAIDA CADAPR(CODIGO,NOME,MEDIA)SOMENTE
      *          AQUELES QUE APRESENTA NOTAS MAIORES QUE 6 E TIVEREM
      *          MENOS QUE 19 FALTAS.

       ENVIRONMENT     DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.  MY-PC.
       OBJECT-COMPUTER.  MY-PC.
       SPECIAL-NAMES.    DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT   CADALU      ASSIGN      TO       DISK
           ORGANIZATION  IS         LINE        SEQUENTIAL.
           SELECT   CADAPR        ASSIGN     TO       DISK
           ORGANIZATION  IS         LINE        SEQUENTIAL.

       DATA           DIVISION.
       FILE SECTION.

       FD  CADALU
           LABEL   RECORD  STANDARD
           VALUE    OF FILE-ID    IS          "CADALU.DAT".
       01  REG-ENT.
           02 NUM-ENT           PIC 9(05).
           02 NOME-ENT          PIC X(20).
           02 NOTA1-ENT         PIC 9(02)V99.
           02 NOTA2-ENT         PIC 9(02)V99.
           02 FALTAS            PIC 9(02).

       FD  CADAPR
           LABEL   RECORD  STANDARD
           VALUE   OF FILE-ID    IS   "CADAPR.DAT".
       01  REG-SAI.
           02 NUM-SAI           PIC 9(05).
           02 NOME-SAI          PIC X(20).
           02 MEDIA-SAI         PIC 9(02)V99.

       WORKING-STORAGE SECTION.
           77 FIM-ARQ          PIC X(03)    VALUE "NAO".
           77 MEDIA-CONT       PIC 9(02)V99.

       PROCEDURE        DIVISION.

       EXEMPLO.
           PERFORM INICIO.
           PERFORM PRINCIPAL
             UNTIL FIM-ARQ EQUAL "SIM".
           PERFORM TERMINO
           STOP RUN.
       INICIO.
           OPEN INPUT CADALU
                OUTPUT CADAPR.
           PERFORM LEITURA.

           LEITURA.
               READ CADALU
                  AT END
                  MOVE "SIM" TO FIM-ARQ.
       PRINCIPAL.
           PERFORM GRAVACAO.
           PERFORM LEITURA.

           GRAVACAO.
               COMPUTE MEDIA-CONT=(NOTA1-ENT + NOTA2-ENT)/2.
               IF MEDIA-CONT >= 7 AND FALTAS <= 18
                   MOVE NUM-ENT TO NUM-SAI
                   MOVE NOME-ENT TO NOME-SAI
                   MOVE MEDIA-CONT TO MEDIA-SAI
                   WRITE REG-SAI
              END-IF.

       TERMINO.
           CLOSE CADALU
                 CADAPR.
