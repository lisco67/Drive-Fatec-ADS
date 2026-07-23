       IDENTIFICATION  DIVISION.
       PROGRAM-ID.     EXERC1.
       AUTHOR.         YHAGO PESSOA.
       INSTALLATION.   FATEC-SP.
       DATE-WRITTEN.   25/02/2025.
       DATE-COMPILED.  25/02/2025.
       SECURITY. APENAS O AUTOR PODE MODIFICA-LO.

       ENVIRONMENT     DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.  MY-PC.
       OBJECT-COMPUTER.  MY-PC.
       SPECIAL-NAMES.    DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT   CADSOC1     ASSIGN      TO       DISK
           ORGANIZATION  IS         LINE        SEQUENTIAL.
           SELECT   CADSOC2     ASSIGN     TO       DISK
           ORGANIZATION  IS         LINE        SEQUENTIAL.
           SELECT RELSOCIO      ASSIGN      TO       DISK.

       DATA           DIVISION.
       FILE SECTION.

       FD  CADSOC1
           LABEL   RECORD  STANDARD
           VALUE    OF FILE-ID    IS         "CAD-ENT.DAT".
       01  REG-ENT.
           02 CODIGOPAGAMENTO1   PIC 9(02).
           02 NUMEROSOCIO1       PIC 9(06).
           02 NOMESOCIO1         PIC X(30).
           02 VALORPAGAMENTO1    PIC 9(09)V9(02).

       FD  CADSOC2
           LABEL   RECORD  STANDARD
           VALUE   OF FILE-ID    IS   "CAD-SAI.DAT".
       01  REG-SAI.
           02 NUMERO-SOCIO2        PIC 9(06).
           02 NOME-SOCIO2          PIC X(30).
           02 VALOR-PAGAMENTO2     PIC 9(09)V9(02).

       FD  RELSOCIO
           LABEL RECORD IS OMITTED.
       01 REG-ATR      PIC X(80).

       WORKING-STORAGE SECTION.
           77 FIM-ARQ      PIC X(03)    VALUE "NAO".
           77 CT-LIN       PIC 9(02) VALUE 30.
           77 CT-PAG       PIC 9(02) VALUE ZEROS.
           77 SOMA-SOCIO   PIC 9(05) VALUE ZEROS.
           77 SOMA-VALOR  PIC 9(12)V99 VALUE ZEROS.
       01 PAG.
           02 FILLER     PIC X(70) VALUE SPACES.
           02 FILLER     PIC X(05) VALUE "PAG. ".
           02 VAR-PAG    PIC 99.
           02 FILLER     PIC X(03) VALUE SPACES.
       01 CAB-01.
           02 FILLER     PIC X(26) VALUE SPACES.
           02 FILLER     PIC X(27) VALUE "RELAÇÃO DE SÓCIOS ATRASADOS".
           02 FILLER     PIC X(26) VALUE SPACES.
       01 CAB-02.
           02 FILLER     PIC X(03)  VALUE SPACES.
           02 FILLER     PIC X(15) VALUE "NÚMERO DO SÓCIO".
           02 FILLER     PIC X(06) VALUE SPACES.
           02 FILLER     PIC X(13) VALUE "NOME DO SÓCIO".
           02 FILLER     PIC X(15) VALUE SPACES.
           02 FILLER     PIC X(18) VALUE "VALOR DO PAGAMENTO".
           02 FILLER     PIC X(10) VALUE SPACES.
           02 FILLER     PIC X(80) VALUE SPACES.
       01 DETALHE.
           02 FILLER         PIC X(06) VALUE SPACES.
           02 NUMERO-SOCIO   PIC 999.999.
           02 FILLER         PIC X(12) VALUE SPACES.
           02 NOME-SOCIO     PIC X(30).
           02 FILLER         PIC X(01) VALUE SPACES.
           02 VALOR-PAGO     PIC ZZZ.ZZZ.ZZ9,99.
           02 FILLER         PIC X(14) VALUE SPACES.

       01 RODA-1.
           02 FILLER        PIC X(03) VALUE SPACES.
           02 FILLER        PIC X(26)
                             VALUE "Total de Sócios atrasados:".
           02 TOTAL-SOCIO   PIC ZZZZ9.
       01 RODA-2.
           02 FILLER        PIC X(03) VALUE SPACES.
           02 FILLER        PIC X(27)
                               VALUE "Valor Total atrasado     : ".
           02 TOTAL-VALOR  PIC ZZZ.ZZZ.ZZZ.ZZ9,99.
       PROCEDURE        DIVISION.

       PGM.
           PERFORM INICIO.
           PERFORM PRINCIPAL
             UNTIL FIM-ARQ EQUAL "SIM".
           PERFORM TERMINO
           STOP RUN.
       INICIO.
           OPEN INPUT CADSOC1
                OUTPUT CADSOC2 RELSOCIO.
           PERFORM LEITURA.

           LEITURA.
               READ CADSOC1
                  AT END
                  PERFORM RODAPE
                  MOVE "SIM" TO FIM-ARQ.
       PRINCIPAL.
           PERFORM IMPRESSAO.
           PERFORM LEITURA.

       IMPRESSAO.
           IF CODIGOPAGAMENTO1 EQUAL 01 THEN
               PERFORM VALIDO
           ELSE
              PERFORM INVALIDO
           END-IF.
       VALIDO.
           MOVE NUMEROSOCIO1 TO NUMERO-SOCIO2.
           MOVE NOMESOCIO1 TO NOME-SOCIO2.
           MOVE VALORPAGAMENTO1 TO VALOR-PAGAMENTO2.
           WRITE REG-SAI.
       INVALIDO.
           IF CT-LIN GREATER THAN 29
               PERFORM CABECALHO
           END-IF.
           PERFORM DETALHES.
       CABECALHO.
           ADD 1         TO CT-PAG.
           MOVE CT-PAG   TO VAR-PAG.
           MOVE SPACES   TO REG-ATR.
           WRITE REG-ATR AFTER ADVANCING PAGE.
           WRITE REG-ATR FROM PAG AFTER ADVANCING 1 LINE.
           WRITE REG-ATR FROM CAB-01 AFTER ADVANCING 2 LINES.
           WRITE REG-ATR FROM CAB-02 AFTER ADVANCING 2 LINES.
           MOVE ZEROES   TO CT-LIN.
       DETALHES.
           ADD 1 TO SOMA-SOCIO.
           ADD VALORPAGAMENTO1 TO SOMA-VALOR.
           MOVE NUMEROSOCIO1     TO NUMERO-SOCIO.
           MOVE NOMESOCIO1       TO NOME-SOCIO.
           MOVE SOMA-VALOR  TO VALOR-PAGO.
           WRITE REG-ATR FROM DETALHE AFTER ADVANCING 1 LINE.
           ADD 1         TO CT-LIN.

       RODAPE.
           MOVE SOMA-SOCIO TO TOTAL-SOCIO.
           MOVE SOMA-VALOR TO TOTAL-VALOR.
           WRITE REG-ATR FROM RODA-1 AFTER ADVANCING 2 LINE.
           WRITE REG-ATR FROM RODA-2.
       TERMINO.
           CLOSE CADSOC1 CADSOC2 RELSOCIO.
