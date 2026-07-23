       IDENTIFICATION DIVISION.
           PROGRAM-ID.       EXERC3.
           AUTHOR.           YHAGO.
           DATE-WRITTEN.     20-05-2025.
           DATE-COMPILED.
           SECURITY.         APENAS O AUTOR PODE MODIFICA-LO.
       ENVIRONMENT DIVISION.
           CONFIGURATION SECTION.
               SOURCE-COMPUTER. PC.
               OBJECT-COMPUTER. PC.
               SPECIAL-NAMES.   DECIMAL-POINT IS COMMA.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
               SELECT ENTRADA   ASSIGN TO DISK
               ORGANIZATION IS LINE SEQUENTIAL.
               SELECT ORG       ASSIGN TO DISK.
               SELECT SAIDA     ASSIGN TO DISK
               ORGANIZATION IS LINE SEQUENTIAL.
       DATA DIVISION.
           FILE SECTION.
           FD ENTRADA
              LABEL RECORD STANDARD
              VALUE OF FILE-ID IS "CADENT.DAT".
           01 REG-ENT.
             02 ENT-COD      PIC 9(05).
             02 ENT-NOM      PIC X(30).
             02 ENT-SEX      PIC X(01).

           SD ORG.
           01 REG-ORG.
             02 ORG-COD      PIC 9(05).
             02 ORG-NOM      PIC X(30).

           FD SAIDA
              LABEL RECORD STANDARD
              VALUE OF FILE-ID IS "CADSAI.DAT".
           01 REG-SAI.
             02 SAI-COD      PIC 9(05).
             02 SAI-NOM      PIC X(30).

           WORKING-STORAGE SECTION.
           77 FIM-ARQ        PIC X(01) VALUE "N".
       PROCEDURE DIVISION.
           EX.
             SORT ORG
                  ASCENDING KEY ORG-COD
                  INPUT PROCEDURE  ROT-ENT
                  GIVING SAIDA.
             STOP RUN.

           ROT-ENT SECTION.
             PERFORM INICIO-ENT.
             PERFORM PRINCIPAL-ENT
                     UNTIL FIM-ARQ EQUAL "S".
             PERFORM FIM-ENT.

           INICIO-ENT SECTION.
             OPEN INPUT ENTRADA.
             PERFORM LER-ENT.

           LER-ENT SECTION.
             READ ENTRADA AT END
                  MOVE "S" TO FIM-ARQ.

           PRINCIPAL-ENT SECTION.
             PERFORM SELECAO-ENT.
             PERFORM LER-ENT.

           SELECAO-ENT SECTION.
             IF ENT-SEX EQUAL "M" PERFORM GRAVA-ENT.

           GRAVA-ENT SECTION.
             MOVE ENT-COD TO ORG-COD.
             MOVE ENT-NOM TO ORG-NOM.
             RELEASE REG-ORG.

           FIM-ENT SECTION.
             CLOSE ENTRADA.
