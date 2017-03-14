       IDENTIFICATION DIVISION.
       PROGRAM-ID. MENU_PRINCIPAL.
       
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.

          
      ******************************************************************
      *      DECLARATION DES VARIABLES DU PROGRAMME                    *
      ******************************************************************
   
       DATA DIVISION.
      
       
       01 CHOIX PIC X(1).
       

       
      ******************************************************************
      *       KEYBOARD LISTNER : CHOIX DU MENU                         *
      ******************************************************************
       


       SCREEN SECTION.
       
       
       
       

         01 MENU.
           2  BLANK SCREEN.
           2 LINE 1 COL 1 VALUE '1) Saisir une facture'.
           2 LINE 3 COL 1 VALUE '2) Visualiser ou modifier une facture'
           2 LINE 5 COL 1 VALUE '3) Supprimer une facture'.
           2 LINE 7 COL 1 VALUE '4) Lister les factures d’un client'.
           2 LINE 10 COL 5 VALUE 'Entrer votre choix ou taper Q pour quitter :  '.
           2 PIC X(1) TO CHOIX.
           
          



           PERFORM UNTIL CHOIX = "Q"
              DISPLAY MENU
              ACCEPT CHOIX
              
               EVALUATE CHOIX

               WHEN "2" 
               CALL "EDITER"
                     
               
               
               
               END-EVALUATE


               END-PERFORM
          GOBACK.
          
          
          
          
          
      ******************************************************************
      *      EDITER LE FICHIER                                         *
      ******************************************************************
   
          
          
          IDENTIFICATION DIVISION.
       PROGRAM-ID. EDITER.
       ENVIRONMENT DIVISION. 
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT Facture ASSIGN TO "facture.txt"
                           ORGANIZATION IS INDEXED
                           ACCESS MODE IS DYNAMIC
                           RECORD KEY IS Num-fact
                           ALTERNATE RECORD KEY IS Num-client
                                           WITH DUPLICATES.

       DATA DIVISION.
       FILE SECTION.

       FD  FACTURE.
       01  ENR-FACTURE.
           02 Num-fact     PIC 9(6).
           02 Num-client   PIC 9(6).
           02 Date-fact PIC X(8).
           02 Qte-article PIC 9(3).
           02 Total-fact PIC 9(9)v99.



       WORKING-STORAGE SECTION.

      
       SCREEN SECTION.
        
         1 EDITION.
           2 BLANK SCREEN.
           2 LINE 2 COL 25 VALUE 'CREATION DE FACTURE  '.
           
           2 LINE 5 COL 2 VALUE 'Saisir le num de la facture:  '.
           2 PIC 9(6) TO Num-fact.
           
           2 LINE 7 COL 2 VALUE 'Saisir le num du client:  '.
           2 PIC 9(6) TO Num-client.
           
           2 LINE 9 COL 2 VALUE 'Saisir la date de la facture:  '.
           2 PIC X(8) TO Date-fact.

           2 LINE 11 COL 2 VALUE 'Saisir le nombre d article:  '.
           2 PIC 9(3) TO Qte-article.
           
           2 LINE 13 COL 2 VALUE 'Saisir le total de la facture  '.
           2 PIC 9(9)v99 TO Total-fact.
           

       PROCEDURE DIVISION.
       

           OPEN OUTPUT FACTURE.


           
               DISPLAY EDITION
               ACCEPT EDITION
               WRITE ENR-FACTURE
               INVALID KEY DISPLAY 'Erreur de saisie'
               END-WRITE
              
               CLOSE FACTURE.
           EXIT PROGRAM
           END PROGRAM EDITER.


       

