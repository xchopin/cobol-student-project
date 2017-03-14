       IDENTIFICATION DIVISION.
       PROGRAM-ID. INDEX02.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT ETUDIANT ASSIGN TO "fichier.txt"
                           ORGANIZATION IS INDEXED
                           ACCESS MODE IS DYNAMIC
                           RECORD KEY IS NUMETUDIANT.

       DATA DIVISION.
       FILE SECTION.

       FD  ETUDIANT.
       01  ENR-ETUDIANT.
           02 NUMETUDIANT        PIC XXXX.
           02 NOM            PIC X(30).




       WORKING-STORAGE SECTION.


       SCREEN SECTION.
       1 PLAGE-SAISI.
           2 LINE 5 COL 10 VALUE 'SAISIR NUM ETUDIANT: '.
           2 PIC X(4) TO NUMETUDIANT.
               2 LINE 6 COL 10 VALUE 'SAISIR NOM ETUDIANT: '.
           2 PIC X(4) TO NOM.


       PROCEDURE DIVISION.
       

           OPEN OUTPUT ETUDIANT.


           PERFORM  5 TIMES 
               DISPLAY PLAGE-SAISI
               ACCEPT PLAGE-SAISI
               WRITE ENR-ETUDIANT
               INVALID KEY DISPLAY 'Erreur de saisie'
               END-WRITE
               END-PERFORM
               CLOSE ETUDIANT.
           GOBACK.
