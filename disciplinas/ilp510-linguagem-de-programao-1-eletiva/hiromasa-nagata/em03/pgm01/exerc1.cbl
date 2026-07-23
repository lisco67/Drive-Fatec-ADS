       IDENTIFICATION DIVISION.
           PROGRAM-ID.   EXERC1.
           AUTHOR.       YHAGO.
           DATE-WRITTEN. 06/05/2025
           DATE-COMPILED.
           SECURITY.     SOMENTE O AUTOR PODE MODIFICALO.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
           SPECIAL-NAMES. DECIMAL-POINT IS COMMA.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ENTRADA   ASSIGN TO DISK
           ORGANISATION IS LINE SEQUENTIAL.
           SELECT ORG      ASSIGN TO DISK.
           SELECT SAIDA   ASSIGN TO DISK
           ORGANISATION IS LINE SEQUENTIAL.
       DATA DIVISION.
       FILE SECTION.
       FD ENTRADA
           LABEL RECORD STANDARD
           VALUE OF FILE-ID IS "CADENT.DAT".
       01 REG-ENT.
         02 ENT-COD          PIC 9(05).
         02 ENT-NOM          PIC X(30).
         02 ENT-SEX          PIC X(01).
       SD ORG.
       01 REG-ORG.
         02 ORG-COD          PIC 9(05).
         02 ORG-NOM          PIC X(30).
         02 ORG-SEX          PIC X(01).
       FD SAIDA
           LABEL RECORD STANDARD
           VALUE OF FILE-ID IS "CADSAI.DAT".
       01 REG-SAI.
         02 SAI-COD          PIC 9(05).
         02 SAI-NOM          PIC X(30).
         02 SAI-SEX          PIC X(01).
       PROCEDURE DIVISION.
       EX01.
           SORT ORG
              ASCENDING KEY ORG-COD
              ASCENDING KEY ORG-NOM
              USING ENTRADA
              GIVING  SAIDA.
        STOP RUN.
