       IDENTIFICATION          DIVISION.
       PROGRAM-ID.             EX02.
       AUTHOR.                 GABRIEL MACEDO.
       INSTALLATION.           MY-HOME.
       DATE-WRITTEN.           18/04/2025.
       DATE-COMPILED.
       SECURITY. APENAS O AUTOR PODE MODIFICA-LO.
      *REMARKS LE CADCLI E IMPIME RELATORIO RELCLI.

       ENVIRONMENT             DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.        IBM-PC.
       OBJECT-COMPUTER.        IBM-PC.
       SPECIAL-NAMES.          DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CADCLI ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT RELCLI ASSIGN TO DISK.

       DATA                    DIVISION.
       FILE SECTION.

       FD CADCLI
           LABEL RECORD ARE STANDARD
           VALUE OF FILE-ID IS "CADCLI.DAT".

       01 REG-CLI.
           02 CPF-ENT                  PIC 9(11).
           02 NOME-ENT                 PIC X(30).
           02 ESTADO-ENT               PIC X(02).
           02 CIDADE-ENT               PIC X(30).
           02 TELEFONE1-ENT            PIC 9(04).
           02 TELEFONE2-ENT            PIC 9(04).
           02 DATAVISITA-ENT.
               03 DD                   PIC 9(02).
                   88 DD-VALIDO        VALUE 1 THRU 31.
               03 MM                   PIC 9(02).
                   88 MM-VALIDO        VALUE 1 THRU 12.
               03 AAAA                 PIC 9(04).
                   88 AAAA-VALIDO      VALUE 2010 THRU 2011.
              
       FD RELCLI
           LABEL RECORD IS OMMITED.

       01 REG-RELCLI                   PIC X(80).

       WORKING-STORAGE SECTION.
       77 FIM-ARQ                      PIC X(03) VALUE "NAO".
       77 NUM-PAG                      PIC 9(04) VALUE ZEROES.
       77 NUM-LINHAS                   PIC 9(02) VALUE 25.
       77 TOTAL-CLI                    PIC 9(04) VALUE ZEROES.

       01 CAB-01.
           02 FILLER                   PIC X(70) VALUE SPACES.
           02 FILLER                   PIC X(05) VALUE "PAG.".
           02 NUM-PAG-REL              PIC 99.
           02 FILLER                   PIC X(03) VALUE SPACES.

       01 CAB-02.
           02 FILLER                   PIC X(31) VALUE SPACES.
           02 FILLER                   PIC X(17)
                                       VALUE "TURISMAR TURISMOS".
           02 FILLER                   PIC X(32) VALUE SPACES.

       01 CAB-03.
           02 FILLER                   PIC X(22) VALUE SPACES.
           02 FILLER                   PIC X(23)
                               VALUE "CLIENTES NO PERIODO DE:".
           02 FILLER                   PIC X(12) VALUE " 2010 A 2011".
           02 FILLER                   PIC X(23) VALUE SPACES.

       01 CAB-04.
           02 FILLER                   PIC X(10) VALUE SPACES.
           02 FILLER                   PIC X(04) VALUE "NOME".
           02 FILLER                   PIC X(24) VALUE SPACES.
           02 FILLER                   PIC X(06) VALUE "ESTADO".
           02 FILLER                   PIC X(16) VALUE SPACES.
           02 FILLER                   PIC X(08) VALUE "TELEFONE".
           02 FILLER                   PIC X(12) VALUE SPACES.

       01 CAB-05.
           02 FILLER                   PIC X(20)
               VALUE "--------------------".
           02 FILLER                   PIC X(20)
               VALUE "--------------------".
           02 FILLER                   PIC X(20)
               VALUE "--------------------".
           02 FILLER                   PIC X(20)
               VALUE "--------------------".

       01 DETALHE.
           02 FILLER                   PIC X(04) VALUE SPACES.
           02 NOME-REL                 PIC X(30).
           02 FILLER                   PIC X(06) VALUE SPACES.
           02 ESTADO-REL               PIC X(02).
           02 FILLER                   PIC X(18) VALUE SPACES.
           02 TELEFONE1-REL            PIC 9(04).
           02 FILLER                   PIC X(01) VALUE "-".
           02 TELEFONE2-REL            PIC 9(04).
           02 FILLER                   PIC X(11) VALUE SPACES.

       01 CAB-06.
           02 FILLER                   PIC X(04) VALUE SPACES.
           02 FILLER                   PIC X(19) 
                                       VALUE "Total de Clientes: ".
           02 TOTAL-CLIENTES           PIC 9999.


       PROCEDURE                      DIVISION.

       PGM-EX02.
           PERFORM INICIO.
           PERFORM PRINCIPAL UNTIL FIM-ARQ EQUAL "SIM".
           PERFORM FIM.
           STOP RUN.

       INICIO.
           OPEN INPUT CADCLI
                OUTPUT RELCLI.
           PERFORM LEITURA.

       LEITURA.
           READ CADCLI AT END MOVE "SIM" TO FIM-ARQ.

       PRINCIPAL.
           PERFORM SELECIONA-CLIENTES.
           PERFORM LEITURA.
           IF FIM-ARQ EQUAL "SIM"
               PERFORM EXIBIR-TOTAL.

       SELECIONA-CLIENTES.
           IF DD-VALIDO AND MM-VALIDO AND AAAA-VALIDO 
               PERFORM IMPRESSAO.

       IMPRESSAO.
           IF NUM-LINHAS GREATER THAN 24
                PERFORM CABECALHO.
           PERFORM IMPRIME-DETALHE.

       CABECALHO.
           ADD 1 TO NUM-PAG.
           MOVE NUM-PAG TO NUM-PAG-REL.
           MOVE SPACES TO REG-RELCLI.
           WRITE REG-RELCLI FROM CAB-01 AFTER ADVANCING 2 LINE.
           WRITE REG-RELCLI FROM CAB-02 AFTER ADVANCING 1 LINE.
           WRITE REG-RELCLI FROM CAB-03 AFTER ADVANCING 2 LINES.
           WRITE REG-RELCLI FROM CAB-04 AFTER ADVANCING 2 LINE.
           WRITE REG-RELCLI FROM CAB-05 AFTER ADVANCING 1 LINE.
           MOVE ZEROES TO NUM-LINHAS.

       IMPRIME-DETALHE.
           ADD 1 TO TOTAL-CLI.
           MOVE NOME-ENT TO NOME-REL.
           MOVE ESTADO-ENT TO ESTADO-REL.
           MOVE TELEFONE1-ENT TO TELEFONE1-REL.
           MOVE TELEFONE2-ENT TO TELEFONE2-REL.
           WRITE REG-RELCLI FROM DETALHE AFTER ADVANCING 1 LINES.
           ADD 1 TO NUM-LINHAS.

       EXIBIR-TOTAL.
           MOVE TOTAL-CLI TO TOTAL-CLIENTES.
           WRITE REG-RELCLI FROM CAB-06 AFTER ADVANCING 4 LINES.

       FIM.
           CLOSE CADCLI RELCLI.
           

       

