       IDENTIFICATION  DIVISION.
       PROGRAM-ID.     EXERC6.
       AUTHOR.         YHAGO PESSOA.
       INSTALLATION.   FATEC-SP.
       DATE-WRITTEN.   29/04/2025.
       DATE-COMPILED.  29/04/2025.
       SECURITY. APENAS O AUTOR PODE MODIFICA-LO.

       ENVIRONMENT     DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.  MY-PC.
       OBJECT-COMPUTER.  MY-PC.
       SPECIAL-NAMES.    DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT      CADCLI     ASSIGN      TO       DISK
           ORGANIZATION  IS    LINE        SEQUENTIAL.
           SELECT   CADOK ASSIGN     TO       DISK
           ORGANIZATION  IS   LINE        SEQUENTIAL.
           SELECT RELOCOR     ASSIGN      TO       DISK.

       DATA           DIVISION.
       FILE SECTION.

       FD  CADCLI
           LABEL   RECORD  STANDARD
           VALUE    OF FILE-ID    IS         "CAD-ENT.DAT".
       01   REGCLI.
           02 CODIGO-ENT         PIC 9(03).
           02 CPF-ENT            PIC 9(11).
           02 NOME-ENT           PIC X(30).
           02 ESTADO-ENT         PIC X(02).
             88 ESTADO-VALIDO      VALUE
              'AC' 'AL' 'AP' 'AM' 'BA' 'CE' 'DF' 'ES' 'GO'
              'MA' 'MT' 'MS' 'MG' 'PA' 'PB' 'PR' 'PE' 'PI'
              'RJ' 'RN' 'RS' 'RO' 'RR' 'SC' 'SP' 'SE' 'TO'.
           02 CIDADE-ENT         PIC X(30).
           02 EMAIL-ENT          PIC X(30).
           02 TELEFONE-ENT       PIC 9(10).

       FD  CADOK
           LABEL   RECORD  STANDARD
           VALUE   OF FILE-ID    IS   "CAD-SAI.DAT".
       01  REGOK.
           02 CPF-SAI            PIC 9(11).
           02 NOME-SAI           PIC X(30).
           02 ESTADO-SAI         PIC X(02).
           02 CIDADE-SAI         PIC X(30).
           02 EMAIL-SAI          PIC X(30).
           02 TELEFONE-SAI       PIC 9(10).


       FD  RELOCOR
           LABEL RECORD IS OMITTED.
       01 REG-ATR      PIC X(80).

       WORKING-STORAGE SECTION.
           77 FIM-ARQ           PIC X(03)    VALUE "NAO".
           77 CT-LIN            PIC 9(02) VALUE 40.
           77 CPF-VALIDO        PIC X(01) VALUE "S".
           77 NOME-VALIDO       PIC X(01) VALUE "S".
           77 CIDADE-VALIDO     PIC X(01) VALUE "S".
           77 EMAIL-VALIDO      PIC X(01) VALUE "S".
           77 CPF-01            PIC 9(01) VALUE ZEROS.
           77 CPF-02            PIC 9(01) VALUE ZEROS.
           77 CPF-03            PIC 9(01) VALUE ZEROS.
           77 CPF-04            PIC 9(01) VALUE ZEROS.
           77 CPF-05            PIC 9(01) VALUE ZEROS.
           77 CPF-06            PIC 9(01) VALUE ZEROS.
           77 CPF-07            PIC 9(01) VALUE ZEROS.
           77 CPF-08            PIC 9(01) VALUE ZEROS.
           77 CPF-09            PIC 9(01) VALUE ZEROS.
           77 CPF-10            PIC 9(01) VALUE ZEROS.
           77 CPF-11            PIC 9(01) VALUE ZEROS.
           77 SOMA              PIC 9(04) VALUE ZEROS.
           77 RESTO1            PIC 9(02) VALUE ZEROS.
           77 RESTO2            PIC 9(02) VALUE ZEROS.
           77 I                 PIC 9(01) VALUE ZEROS.
           77 TOTAL-ERROS       PIC 9(01) VALUE ZEROS.
           77 DIGITO1           PIC 9(02) VALUE ZEROS.
           77 DIGITO2           PIC 9(02) VALUE ZEROS.


       01 ERROR-LISTA.
           02 ERROR-ITEM  PIC X(50)  OCCURS 5 TIMES.

       01 CAB-01.
           02 FILLER     PIC X(30) VALUE SPACES.
           02 FILLER     PIC X(17) VALUE "TURISMAR TURISMOS".


       01 CAB-02.
           02 FILLER     PIC X(20) VALUE SPACES.
           02 FILLER     PIC X(45)
                 VALUE "RELATÓRIO DE DADOS DE CLIENTES INCONSISTENTES".
       01 CAB-03.
           02 FILLER     PIC X(17) VALUE "CÓDIGO DO CLIENTE".
           02 FILLER     PIC X(10) VALUE SPACES.
           02 FILLER     PIC X(15) VALUE "DADOS INVÁLIDOS".
       01 CAB-LINE.
           02 FILLER     PIC X(80) VALUE ALL"-".

       01 DETALHE-01.
           02 CODIGO-REG     PIC  ZZ9.
           02 FILLER         PIC X(15) VALUE SPACES.
           02 ERROR-REG1     PIC  X(20).
       01 DETALHE-02.
           02 FILLER         PIC X(18) VALUE SPACES.
           02 ERROR-REG2     PIC  X(20).

       PROCEDURE        DIVISION.

       PGM.
           PERFORM INICIO.
           PERFORM PRINCIPAL
             UNTIL FIM-ARQ EQUAL "SIM".
           PERFORM TERMINO
           STOP RUN.
       INICIO.
           MOVE "CPF INVÁLIDO"           TO ERROR-ITEM(1).
           MOVE "NOME NÃO INFORMADO”"    TO ERROR-ITEM(2).
           MOVE "ESTADO INVÁLIDO"        TO ERROR-ITEM(3).
           MOVE "CIDADE NÃO INFORMADA"   TO ERROR-ITEM(4).
           MOVE " EMAIL SEM DESCRIÇÃO"   TO ERROR-ITEM(5).
           OPEN INPUT CADCLI
                OUTPUT CADOK RELOCOR.
           PERFORM LEITURA.

           LEITURA.
               READ CADCLI
                  AT END
                  MOVE "SIM" TO FIM-ARQ.
       PRINCIPAL.
           PERFORM VALIDARCPF.
           PERFORM VALIDARNOME.
           PERFORM VALIDACIDADE.
           PERFORM VALIDAREMAIL.
           IF (ESTADO-VALIDO AND CPF-VALIDO = "S" AND NOME-VALIDO = "S"
               AND  CIDADE-VALIDO = "S" AND EMAIL-VALIDO ="S")
                   PERFORM VALIDO
           ELSE
               PERFORM INVALIDO
           END-IF.
           PERFORM LEITURA.

       VALIDARCPF.
           MOVE CPF-ENT(1:1) TO CPF-01
           MOVE CPF-ENT(2:1) TO CPF-02
           MOVE CPF-ENT(3:1) TO CPF-03
           MOVE CPF-ENT(4:1) TO CPF-04
           MOVE CPF-ENT(5:1) TO CPF-05
           MOVE CPF-ENT(6:1) TO CPF-06
           MOVE CPF-ENT(7:1) TO CPF-07
           MOVE CPF-ENT(8:1) TO CPF-08
           MOVE CPF-ENT(9:1) TO CPF-09
           MOVE CPF-ENT(10:1) TO CPF-10
           MOVE CPF-ENT(11:1) TO CPF-11
           COMPUTE SOMA = CPF-01 * 10 + CPF-02 * 9 + CPF-03 * 8 +
           CPF-04 * 7 + CPF-05 * 6 + CPF-06 * 5 + CPF-07 * 4 + CPF-08
           * 3 + CPF-09 * 2.
            IF RESTO2 < 2
               MOVE 0 TO DIGITO2
           ELSE
               COMPUTE DIGITO2 = 11 - RESTO2
           END-IF

           IF CPF-10 = DIGITO1 AND CPF-11 = DIGITO2
               MOVE "S" TO CPF-VALIDO
           ELSE
               MOVE "N" TO CPF-VALIDO
               ADD 1 TO TOTAL-ERROS
           END-IF.
       VALIDARNOME.
           IF NOME-ENT EQUAL ZEROS
               MOVE "N" TO NOME-VALIDO
               ADD 1 TO TOTAL-ERROS
           END-IF.
       VALIDACIDADE.
           IF CIDADE-ENT  EQUAL ZEROS
               MOVE "N" TO CIDADE-VALIDO
               ADD 1 TO TOTAL-ERROS
           END-IF.

       VALIDAREMAIL.
           IF EMAIL-ENT EQUAL ZEROS
               MOVE "N" TO EMAIL-VALIDO
               ADD 1 TO TOTAL-ERROS
           END-IF.

       VALIDO.
           MOVE CPF-ENT TO CPF-SAI.
           MOVE NOME-ENT TO NOME-SAI.
           MOVE ESTADO-ENT TO ESTADO-SAI.
           MOVE CIDADE-ENT TO CIDADE-SAI.
           MOVE EMAIL-ENT TO EMAIL-SAI.
           MOVE TELEFONE-ENT TO TELEFONE-SAI.
           WRITE REGOK.
       INVALIDO.
           IF CT-LIN GREATER THAN 39
               PERFORM CABECALHO
           END-IF.
           PERFORM IMPRESSAO UNTIL TOTAL-ERROS EQUAL 0.

       CABECALHO.
           MOVE SPACES   TO REG-ATR.
           WRITE REG-ATR AFTER ADVANCING PAGE.
           WRITE REG-ATR FROM CAB-01.
           WRITE REG-ATR FROM CAB-02 AFTER ADVANCING 2 LINES.
           WRITE REG-ATR FROM CAB-03 AFTER ADVANCING 2 LINES.
           WRITE REG-ATR FROM CAB-LINE AFTER ADVANCING 1 LINES.
           MOVE ZEROS   TO CT-LIN.


       IMPRESSAO.
           ADD 1 TO I
           IF I = 1
               PERFORM DETALHE01
           END-IF.
           PERFORM DETALHE02.

           COMPUTE TOTAL-ERROS = TOTAL-ERROS - 1.
           ADD 1         TO CT-LIN.

       DETALHE01.
           MOVE CODIGO-ENT TO CODIGO-REG.
           IF CPF-VALIDO EQUAL "N"
               MOVE ERROR-ITEM(1) TO ERROR-REG1
               MOVE "S" TO CPF-VALIDO
           ELSE IF NOME-VALIDO EQUAL "N"
               MOVE ERROR-ITEM(2) TO ERROR-REG1
               MOVE "S" TO NOME-VALIDO
           ELSE IF NOT(ESTADO-VALIDO)
               MOVE ERROR-ITEM(3) TO ERROR-REG1
               MOVE "SP" TO ESTADO-ENT
           ELSE IF  CIDADE-VALIDO EQUAL "N"
               MOVE ERROR-ITEM(4) TO ERROR-REG1
               MOVE "S" TO CIDADE-VALIDO
           ELSE IF  EMAIL-VALIDO EQUAL "N"
               MOVE ERROR-ITEM(5) TO ERROR-REG1
               MOVE "S" TO EMAIL-VALIDO
           END-IF.
            WRITE REG-ATR FROM DETALHE-01 AFTER ADVANCING 2 LINE.

       DETALHE02.
           IF CPF-VALIDO EQUAL "N"
               MOVE ERROR-ITEM(1) TO ERROR-REG2
               MOVE "S" TO CPF-VALIDO
           ELSE IF NOME-VALIDO EQUAL "N"
               MOVE ERROR-ITEM(2) TO ERROR-REG2
               MOVE "S" TO NOME-VALIDO
           ELSE IF NOT(ESTADO-VALIDO)
               MOVE ERROR-ITEM(3) TO ERROR-REG2
               MOVE "SP" TO ESTADO-ENT
           ELSE IF  CIDADE-VALIDO EQUAL "N"
               MOVE ERROR-ITEM(4) TO ERROR-REG2
               MOVE "S" TO CIDADE-VALIDO
           ELSE IF  EMAIL-VALIDO EQUAL "N"
               MOVE ERROR-ITEM(5) TO ERROR-REG2
               MOVE "S" TO EMAIL-VALIDO
           END-IF.
            WRITE REG-ATR FROM DETALHE-02 AFTER ADVANCING 1 LINE.
       TERMINO.
           CLOSE CADCLI CADOK RELOCOR.
