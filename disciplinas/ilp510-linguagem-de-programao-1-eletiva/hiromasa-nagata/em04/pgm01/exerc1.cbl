       IDENTIFICATION DIVISION.
           PROGRAM-ID.    EXERC1.
           AUTHOR.        YHAGO.
           DATE-WRITTEN.  14/06/25.
           DATE-COMPILED.
           SECURITY.      SOMENTE O AUTOR PODE MODIFICALO.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES.  DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARQA ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT ARQB ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.
           SELECT  ARQC ASSIGN TO DISK
           ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.

       FD ARQA
           LABEL RECORD STANDARD
           VALUE OF FILE-ID IS "ARQA.DAT".
       01 REG-A.
           02 CODIGO-A    PIC 9(03).
           02 NOME-A      PIC X(30).
           02 TURMA-A     PIC X(20).
       FD ARQB
           LABEL RECORD STANDARD
           VALUE OF FILE-ID IS "ARQB.DAT".
       01 REG-B.
           02 CODIGO-B    PIC 9(03).
           02 NOME-B      PIC X(30).
           02 TURMA-B     PIC X(20).
        FD ARQC
           LABEL RECORD STANDARD
           VALUE OF FILE-ID IS "ARQC.DAT".
       01 REG-C.
           02 CODIGO-C    PIC 9(03).
           02 NOME-C      PIC X(30).
           02 TURMA-C     PIC X(20).
       WORKING-STORAGE SECTION.
           77 CH-ARQA PIC X(04) VALUE SPACES.
           77 CH-ARQB PIC  X(04) VALUE SPACES.

       PROCEDURE DIVISION.

       PGM-04.
       PERFORM INICIO.
       PERFORM PRINCIPAL
           UNTIL CH-ARQA EQUAL CH-ARQB AND
           CH-ARQB EQUAL   HIGH-VALUES.
       PERFORM FIM.
       STOP RUN.
       INICIO.
           OPEN INPUT ARQA
                      ARQB
                OUTPUT ARQC.
           PERFORM LER-ARQA.
           PERFORM LER-ARQB.

       LER-ARQA.
           READ ARQA AT END MOVE HIGH-VALUE TO CH-ARQA.
           IF  NOT(CH-ARQA EQUAL HIGH-VALUE)
               MOVE CODIGO-A TO CH-ARQA
           END-IF.
       LER-ARQB.
           READ ARQB AT END MOVE HIGH-VALUE TO CH-ARQB.
           IF  NOT(CH-ARQB EQUAL HIGH-VALUE)
               MOVE CODIGO-B TO CH-ARQB
           END-IF.
       PRINCIPAL.
           IF CH-ARQA EQUAL CH-ARQB
               PERFORM IGUAL
               PERFORM LER-ARQA
               PERFORM LER-ARQB
           ELSE IF CH-ARQA LESS CH-ARQB
               PERFORM ARQA-MENOR
               PERFORM LER-ARQA
           ELSE IF CH-ARQB LESS CH-ARQA
               PERFORM ARQB-MENOR
               PERFORM LER-ARQB
           END-IF.

       IGUAL.
           PERFORM GRAVAR-ARQA.
           PERFORM GRAVAR-ARQB.
       ARQA-MENOR.
           PERFORM GRAVAR-ARQA.
       ARQB-MENOR.
           PERFORM GRAVAR-ARQB.

       GRAVAR-ARQA.
           MOVE REG-A TO REG-C.
           WRITE REG-C.
       GRAVAR-ARQB.
           MOVE REG-B TO REG-C.
           WRITE REG-C.
       FIM.
           CLOSE ARQA ARQB ARQC.
