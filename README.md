Réalisation de l'application mobile d'une pizzeria en flutter via Android Studio.

L’application récupère la liste des produits directement depuis une base de données.

La base de données contient aussi la liste des utilisateurs. La table utilisateurs est composée ainsi :
-	Id 
-	Login (correspond à l’adresse mail)
-	PasswordHash (les mots de passe sont hasher en sha512 pour plus de sécurité 
-	
Liste des packages utiliser :
-	Badges (Utilisé pour le compteur de produit du panier)
-	Mysql1 (Package permettant d’utiliser une bdd mysql)
-	Crypto (Utilisé pour le hashage des mots de passe)

Tout les packages utilisée sont disponible sur https://pub.dev


Capture d'écrans :

- Acceuil :

![Image1](https://user-images.githubusercontent.com/57561063/142246319-2105aa35-4544-48a4-b76b-ef2e2a7d830f.png)

- Page de détails

![details](https://user-images.githubusercontent.com/57561063/142246408-9d944806-5e5a-4227-b719-f366874cdad6.png)

- Panier

![panier](https://user-images.githubusercontent.com/57561063/142246462-ef8e9c3a-09ab-473f-a491-fc63ab8a80ab.png)
