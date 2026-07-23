       IDENTIFICATION  DIVISION.
       PROGRAM-ID.     EXERC5.
       AUTHOR.         YHAGO PESSOA.
       INSTALLATION.   FATEC-SP.
       DATE-WRITTEN.   28/04/2025.
       DATE-COMPILED.  28/04/2025.
       SECURITY. APENAS O AUTOR PODE MODIFICA-LO.

       ENVIRONMENT     DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.  MY-PC.
       OBJECT-COMPUTER.  MY-PC.
       SPECIAL-NAMES.    DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT      ARQALU     ASSIGN      TO       DISK
           ORGANIZATION  IS    LINE        SEQUENTIAL.
           SELECT   ARQREP     ASSIGN     TO       DISK
           ORGANIZATION  IS   LINE        SEQUENTIAL.
           SELECT RELAPROV      ASSIGN      TO       DISK.

       DATA           DIVISION.
       FILE SECTION.

       FD  ARQALU
           LABEL   RECORD  STANDARD
           VALUE    OF FILE-ID    IS         "CAD-ENT.DAT".
       01  REG-ALU.
           02 MATRICULA-ENT      PIC 9(07).
           02 NOME-ENT           PIC X(30).
           02 NOTA1-ENT          PIC 9(02)V9(02).
           02 NOTA2-ENT          PIC 9(02)V9(02).
           02 NOTA3-ENT          PIC 9(02)V9(02).
           02 FALTAS-ENT         PIC 9(02).
           02 SEXO-ENT           PIC X(01).

       FD  ARQREP
           LABEL   RECORD  STANDARD
           VALUE   OF FILE-ID    IS   "CAD-SAI.DAT".
       01  REG-REP.
           02 MATRICULA-SAI      PIC 9(07).
           02 NOME-SAI           PIC X(30).
           02 NOTA1-SAI          PIC 9(02)V9(02).
           02 NOTA2-SAI          PIC 9(02)V9(02).
           02 NOTA3-SAI          PIC 9(02)V9(02).
           02 FALTAS-SAI         PIC 9(02).
           02 SEXO-SAI           PIC X(01).


       FD  RELAPROV
           LABEL RECORD IS OMITTED.
       01 REG-ATR      PIC X(80).

       WORKING-STORAGE SECTION.
           77 FIM-ARQ           PIC X(03)    VALUE "NAO".
           77 CT-LIN            PIC 9(02) VALUE 30.
           77 CT-PAG            PIC 9(02) VALUE ZEROS.
           77 SOMA-APROVADOS    PIC 9(05) VALUE ZEROS.
           77 SOMA-MEDIAALUNO   PIC 999V99    VALUE ZEROS.
           77 SOMA-MEDIA        PIC 999V99   VALUE ZEROS.
           77 MATRICULA-TEXT    PIC  X(07).


       01 PAG.
           02 FILLER     PIC X(20) VALUE SPACES.
           02 FILLER     PIC X(27) VALUE "RELAÇÃO DE ALUNOS APROVADOS".
           02 FILLER     PIC X(20) VALUE SPACES.
           02 FILLER     PIC X(05) VALUE "PAG. ".
           02 VAR-PAG    PIC ZZ9.

       01 CAB-01.
           02 FILLER     PIC X(05) VALUE SPACES.
           02 FILLER     PIC X(06) VALUE "NÚMERO".
           02 FILLER     PIC X(15) VALUE SPACES.
           02 FILLER     PIC X(13) VALUE "NOME DO ALUNO".
           02 FILLER     PIC X(15) VALUE SPACES.
           02 FILLER     PIC X(05) VALUE "MEDIA".
           02 FILLER     PIC X(10) VALUE SPACES.
           02 FILLER     PIC X(06) VALUE "FALTAS".

       01 DETALHE.
           02 FILLER         PIC X(06) VALUE SPACES.
           02 NUMERO1        PIC X(06).
           02 FILLER         PIC X(01) VALUE "-".
           02 NUMERO2        PIC X(01).
           02 FILLER         PIC X(12) VALUE SPACES.
           02 NOME           PIC X(30).
           02 FILLER         PIC X(01) VALUE SPACES.
           02 MEDIA          PIC Z9,99.
           02 FILLER         PIC X(14) VALUE SPACES.
           02 FALTAS         PIC 99.

       01 RODA-1.
           02 FILLER        PIC X(03) VALUE SPACES.
           02 FILLER        PIC X(26)
                             VALUE "Total de alunos aprovados:".
           02 TOTAL-ALUNOS   PIC ZZZZ9.
       01 RODA-2.
           02 FILLER        PIC X(03) VALUE SPACES.
           02 FILLER        PIC X(27)
                               VALUE "Media geral da turma     : ".
           02 TOTAL-MEDIA  PIC Z9,99.
       PROCEDURE        DIVISION.

       PGM.
           PERFORM INICIO.
           PERFORM PRINCIPAL
             UNTIL FIM-ARQ EQUAL "SIM".
           PERFORM TERMINO
           STOP RUN.
       INICIO.
           OPEN INPUT ARQALU
                OUTPUT ARQREP RELAPROV.
           PERFORM LEITURA.

           LEITURA.
               READ ARQALU
                  AT END
                  PERFORM RODAPE
                  MOVE "SIM" TO FIM-ARQ.
       PRINCIPAL.
           PERFORM CONTA.
           PERFORM VALIDATION.
           PERFORM LEITURA.
       CONTA.
           COMPUTE SOMA-MEDIA = (NOTA1-ENT + NOTA2-ENT + NOTA3-ENT)/3.

       VALIDATION.
               IF SOMA-MEDIA >= 7 AND FALTAS-ENT <= 16 THEN
                      PERFORM VALIDO
               ELSE
                   PERFORM INVALIDO
               END-IF.

       VALIDO.
            IF CT-LIN GREATER THAN 29
               PERFORM CABECALHO
           END-IF.
           PERFORM DETALHES.
       INVALIDO.
           MOVE REG-ALU TO REG-REP.
           WRITE REG-REP.

       CABECALHO.
           ADD 1         TO CT-PAG.
           MOVE CT-PAG   TO VAR-PAG.
           MOVE SPACES   TO REG-ATR.
           WRITE REG-ATR AFTER ADVANCING PAGE.
           WRITE REG-ATR FROM PAG AFTER ADVANCING 1 LINE.
           WRITE REG-ATR FROM CAB-01 AFTER ADVANCING 2 LINES.
           MOVE ZEROES   TO CT-LIN.
       DETALHES.
           ADD 1 TO SOMA-APROVADOS.
           ADD SOMA-MEDIA TO SOMA-MEDIAALUNO.
           MOVE MATRICULA-ENT TO MATRICULA-TEXT.
           MOVE MATRICULA-ENT(1:6) TO NUMERO1.
           MOVE MATRICULA-ENT(7:1) TO NUMERO2.
           MOVE NOME-ENT TO NOME.
           MOVE SOMA-MEDIA TO MEDIA.
           MOVE FALTAS-ENT TO FALTAS.
           WRITE REG-ATR FROM DETALHE AFTER ADVANCING 1 LINE.
           ADD 1         TO CT-LIN.


       RODAPE.
           COMPUTE SOMA-MEDIAALUNO = SOMA-MEDIAALUNO/SOMA-APROVADOS.
           MOVE SOMA-APROVADOS TO TOTAL-ALUNOS.
           MOVE SOMA-MEDIAALUNO TO TOTAL-MEDIA
           WRITE REG-ATR FROM RODA-1 AFTER ADVANCING 2 LINE.
           WRITE REG-ATR FROM RODA-2.
       TERMINO.
           CLOSE ARQALU RELAPROV ARQREP .
