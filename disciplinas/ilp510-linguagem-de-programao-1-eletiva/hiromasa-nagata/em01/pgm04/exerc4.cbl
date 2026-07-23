       IDENTIFICATION DIVISION.
       PROGRAM-ID.     EXERC4.
       AUTHOR.         YHAGO PESSOA.
       INSTALLATION.   FATEC-SP.
       DATE-WRITTEN.   18/03/2025.
       DATE-COMPILED.
       SECURITY. APENAS O AUTOR PODE MODIFICA-LO.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER.  FATECSP-PC.
       OBJECT-COMPUTER.  FATECSP-PC.
       SPECIAL-NAMES.    DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CADCLI1 ASSIGN TO 'CADCLI1.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT CADCLI2 ASSIGN TO 'CADCLI2.DAT'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

       FD  CADCLI1.
       01  REG-ENT.
           02 COD-ENT     PIC 9(05).
           02 NOME-ENT    PIC X(20).
           02 SEXO        PIC X(01).

       FD  CADCLI2.
       01  REGISTRO-CADCLI2.
           02 COD-SAI     PIC 9(05).
           02 NOME-SAI    PIC X(20).

       WORKING-STORAGE SECTION.
       77  FIM-ARQUIVO    PIC X(03) VALUE 'NAO'.
       77  CONTINUAR      PIC X VALUE 'Y'.

       PROCEDURE DIVISION.

       EXEMPLO.
           PERFORM ABRIR-ARQUIVOS.
           PERFORM LEITURA-REGISTROS.
           PERFORM FECHAR-ARQUIVOS.
           STOP RUN.

       ABRIR-ARQUIVOS.
           OPEN INPUT CADCLI1
                OUTPUT CADCLI2.

       LEITURA-REGISTROS.
           READ CADCLI1 INTO REG-ENT
               AT END
                   MOVE 'S' TO FIM-ARQUIVO
               NOT AT END
                   IF SEXO OF REG-ENT = 'M'
                       MOVE COD-ENT TO COD-SAI
                       MOVE NOME-ENT TO NOME-SAI
                       WRITE REGISTRO-CADCLI2
                   END-IF
                   IF FIM-ARQUIVO = 'NAO' THEN
                       GO TO LEITURA-REGISTROS
                   END-IF
           END-READ.

       FECHAR-ARQUIVOS.
           CLOSE CADCLI1
                 CADCLI2.
