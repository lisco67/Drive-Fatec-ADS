       IDENTIFICATION DIVISION.
           PROGRAM-ID.    EXERC2.
           AUTHOR.        YHAGO.
           DATE-WRITTEN.  14/06/25.
           DATE-COMPILED.
           SECURITY.      SOMENTE O AUTOR PODE MODIFICALO.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES.  DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CADANT ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT ARQMOV ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT  CADATU ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT RELOCORR ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.

       FD CADANT
           LABEL RECORD STANDARD
           VALUE OF FILE-ID IS "CADANT.DAT".
       01 REG-ANT.
           02 CC-ANT        PIC 9(03).
           02 TIPO-ANT      PIC X(01).
           02 ENDER-ANT     PIC X(50).
       FD ARQMOV
           LABEL RECORD STANDARD
           VALUE OF FILE-ID IS "ARQMOV.DAT".
       01 REG-MOV.
           02 CC-MOV        PIC 9(03).
           02 TIPO-MOV      PIC X(01).
           02 ENDER-MOV     PIC X(50).
       FD CADATU
           LABEL RECORD STANDARD
           VALUE OF FILE-ID IS "CADATU.DAT".
       01 REG-ATU.
           02 CC-ATU       PIC 9(03).
           02 TIPO-ATU     PIC X(01).
           02 ENDER-ATU    PIC X(50).
       FD RELOCORR
           LABEL RECORD  OMITTED.
       01 REG-ATR      PIC X(80).
       WORKING-STORAGE SECTION.
           77 CH-CADANT PIC  X(04) VALUE SPACES.
           77 CH-ARQMOV PIC  X(04) VALUE SPACES.
           77 CH-TYPE   PIC  X(02) VALUE SPACES.
           77 CT-LIN           PIC 9(02) VALUE 40.
           77 CT-PAG           PIC 9(02) VALUE ZEROS.
       01 WHITE-CAB.
           02 FILLER     PIC X(80) VALUE SPACES.
       01 CAB-01.
           02 FILLER     PIC X(20) VALUE SPACES.
           02 FILLER     PIC X(22) VALUE "Relação de atualização".
           02 FILLER     PIC X(15) VALUE SPACES.
           02 FILLER     PIC X(05) VALUE "PAG. ".
           02 VAR-PAG    PIC ZZ9.
       01 CAB-02.
           02 FILLER     PIC X(06) VALUE "codigo".
           02 FILLER     PIC X(05) VALUE SPACES.
           02 FILLER     PIC X(04) VALUE "tipo".
           02 FILLER     PIC X(10) VALUE SPACES.
           02 FILLER     PIC X(08) VALUE "mensagem".

       01 DETALHE.
           02 FILLER        PIC X(01) VALUE SPACES.
           02 VAR-COD       PIC ZZ9.
           02 FILLER        PIC X(10) VALUE SPACES.
           02 VAR-TIPO      PIC X(01) .
           02 FILLER        PIC X(10) VALUE SPACES.
           02 VAR-MSG       PIC X(50).

       PROCEDURE DIVISION.
       PGM-04.
       PERFORM INICIO.
       PERFORM PRINCIPAL
           UNTIL CH-CADANT EQUAL CH-ARQMOV AND
           CH-ARQMOV EQUAL   HIGH-VALUES.
       PERFORM FIM.
       STOP RUN.
       INICIO.
           OPEN INPUT CADANT
                      ARQMOV
                OUTPUT CADATU RELOCORR.
           PERFORM LER-CADANT.
           PERFORM LER-ARQMOV.

       LER-CADANT.
           READ CADANT AT END MOVE HIGH-VALUE TO CH-CADANT.
           IF  NOT(CH-CADANT EQUAL HIGH-VALUE)
               MOVE CC-ANT TO CH-CADANT
           END-IF.
       LER-ARQMOV.
           READ ARQMOV AT END MOVE HIGH-VALUE TO CH-ARQMOV.
           IF  NOT(CH-ARQMOV EQUAL HIGH-VALUE)
               MOVE CC-MOV TO CH-ARQMOV
           END-IF.
       PRINCIPAL.
           IF TIPO-MOV EQUAL "I" OR TIPO-MOV EQUAL "E" OR TIPO-MOV
                                                          EQUAL "A"
               IF CH-CADANT EQUAL CH-ARQMOV
                   PERFORM IGUAL
                   PERFORM GRAVACAO-REL
                   PERFORM LER-CADANT
                   PERFORM LER-ARQMOV
               ELSE IF CH-CADANT LESS CH-ARQMOV
                   PERFORM CADANT-MENOR
                   PERFORM LER-CADANT
               ELSE IF CH-ARQMOV LESS CH-CADANT
                   PERFORM ARQMOV-MENOR
                   PERFORM GRAVACAO-REL
                   PERFORM LER-ARQMOV
               END-IF
           ELSE
               PERFORM LER-ARQMOV
           END-IF.

       IGUAL.
           IF TIPO-MOV EQUAL "I"
               MOVE "EI" TO CH-TYPE
               PERFORM GRAVACAO-SAIDA-2
           ELSE IF TIPO-MOV EQUAL "A"
               MOVE "EA" TO CH-TYPE
               PERFORM GRAVACAO-SAIDA-1
           ELSE IF TIPO-MOV EQUAL "E"
               MOVE "EE" TO CH-TYPE
           END-IF.
       ARQMOV-MENOR.
           IF TIPO-MOV EQUAL "I"
               MOVE "MI" TO CH-TYPE
               PERFORM GRAVACAO-SAIDA-1
           ELSE IF TIPO-MOV EQUAL "A"
               MOVE "MA" TO CH-TYPE
           ELSE IF TIPO-MOV EQUAL "E"
               MOVE "ME" TO CH-TYPE
           END-IF.
       CADANT-MENOR.
           PERFORM GRAVACAO-SAIDA-2.
       GRAVACAO-SAIDA-1.
           MOVE CC-MOV TO CC-ATU
           MOVE TIPO-MOV TO TIPO-ATU
           MOVE ENDER-MOV TO ENDER-ATU
           WRITE REG-ATU.
       GRAVACAO-SAIDA-2.
           MOVE CC-ANT TO CC-ATU
           MOVE TIPO-ANT TO TIPO-ATU
           MOVE ENDER-ANT TO ENDER-ATU
           WRITE REG-ATU.
       GRAVACAO-REL.
           IF CT-LIN GREATER THAN 39
               PERFORM CABECALHO-01
           END-IF.
           PERFORM DETALHES.

       DETALHES.
           MOVE CC-MOV TO VAR-COD
           MOVE TIPO-MOV TO VAR-TIPO
           IF CH-TYPE EQUAL "EI"
               MOVE "INCLUSÃO P/REG. JÁ EXISTENTE" TO VAR-MSG
           ELSE IF CH-TYPE EQUAL "EE"
               MOVE "REGISTRO EXCLUIDO" TO VAR-MSG
           ELSE IF CH-TYPE EQUAL "EA"
               MOVE TIPO-ANT TO VAR-TIPO
               MOVE "REGISTRO SUBSTITUIDO" TO VAR-MSG
               WRITE REG-ATR FROM DETALHE AFTER ADVANCING 1 LINE
               MOVE TIPO-MOV TO VAR-TIPO
               MOVE "REGISTRO SUBSTITUTO" TO VAR-MSG
               ADD 1 TO CT-LIN
           ELSE IF CH-TYPE EQUAL "MI"
               MOVE "REGISTRO INCLUIDO" TO VAR-MSG
           ELSE IF CH-TYPE EQUAL "MA"
               MOVE "ALTERAÇÃO P/REG. INEXISTENTE" TO VAR-MSG
           ELSE IF CH-TYPE EQUAL "ME"
               MOVE "EXCLUSÃO P/REG. INEXISTENTE" TO VAR-MSG
           END-IF.
           WRITE REG-ATR FROM DETALHE AFTER ADVANCING 1 LINE

           ADD 1 TO CT-LIN.

       CABECALHO-01.
           ADD 1         TO CT-PAG.
           MOVE CT-PAG   TO VAR-PAG.
           MOVE SPACES   TO REG-ATR.
           WRITE REG-ATR AFTER ADVANCING PAGE.
           WRITE REG-ATR FROM CAB-01 AFTER ADVANCING 1 LINE.
           WRITE REG-ATR FROM WHITE-CAB AFTER ADVANCING 1 LINE.
           WRITE REG-ATR FROM CAB-02 AFTER ADVANCING 1 LINE.
           MOVE 4  TO CT-LIN.

       FIM.
           CLOSE CADANT CADATU ARQMOV RELOCORR.
