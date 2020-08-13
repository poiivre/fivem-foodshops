### [EN]  [FR]

##### Pack With / Pack Contenant :
- [x] SLN_DrinkingFoutain
- [x] SLN_CoffeeMachine
- [x] SLN_VendingMachine

# [EN] PACK : Drinking Fountains, Coffee & Vending Machines [ ESX ]
Created by Selene Desna on August 13, 2020 for [ Holliday's RP https://discord.gg/rzPAeFr ]

This Script need your database to have a coffee item and the three item you want in the vending machines.
To use the Drinking Fountains you will need esx_status : [ github.com/esx-framework/esx_status ]
If you need help to modify it to be useable with another script, you can contact me on GitHub.


### Config :
Warning : Changing variables that are not in the following list can broke the script !

```
NotifArgent       : Notif if not enough money

Cafe.Prix         : Coffee Machine use price 		
Cafe.Taille       : Size from the coord in which the coffee machine is useable
Cafe.Anim         : Do the player play 'get their coffee in machine' anim ?	
Cafe.Notif        : Notif if nearby a coffee machine
Cafe.Notif2       : Notif if pay for a coffee
Cafe.Item         : Coffee item name in database 
Cafe.Pos          : List of coffee machine

Fontaine.Prix     : Fountain use price 		
Fontaine.Taille   : Size from the coord in which the fountain is useable
Fontaine.Anim     : Do the player play drinking anim ?	
Fontaine.Notif    : Notif if nearby a fountain
Fontaine.Notif2   : Notif if drinking at fountain
Fontaine.Hydrate  : Thirst rate added to player ( esx_status )
Fontaine.Pos      : List of foutains

VendingM.Prix     : Vending Machine use price 		
VendingM.Taille   : Size from the coord in which the Vending Machine is useable
VendingM.Anim     : Do the player play 'get their item in machine' anim ?	
VendingM.Notif    : Notif if nearby a Vending Machine
VendingM.Notif2   : Notif if pay for an item
VendingM.Item..   : items names in database 
VendingM.Pos      : List of Vending Machine
```

To add a coffee / vending machine or a foutain copy the following line in corresponding .Pos list and replace the '0.0' the new coordinates 
(do not forget the ',' at the end !) :
```
{ x = 0.0, y = 0.0, z = 0.0},
```




# [FR] PACK : Fontaine à Eau, Machine à Café & Distributeurs [ ESX ]
Creer par Selene Desna le  13 aout 2020 pour [ Holliday's RP https://discord.gg/rzPAeFr ]

Ce Script à besoin que votre base de donnée est un item café et les trois item choisi pour les distributeurs.
Pour utilisé les fontaine à eau vous aurez besoin de esx_status : [ github.com/esx-framework/esx_status ]
Si vous avez besoin d'aide afin de le lier a un autre script contactez moi sur GitHub.

### Config :
Attention : Changer des variable autre que les suivante peut bloqué le script !
```
NotifArgent       : Notif si le joueur n'as pas assez d'argent

Cafe.Prix         : Prix d'utilisation des Machine à Café		
Cafe.Taille       : Taille autour des coord ou le joueur a acces a la Machine à Café	
Cafe.Anim         : Est-ce que le joueur joue l'animation 'Recuperer son Café' ?
Cafe.Notif        : Notif si le joueur est proche d'une Machine à Café	
Cafe.Notif2       : Notif si le joueur achete a une Machine à Café	
Cafe.Item         : Nom de l'item Café dans la base de donnée
Cafe.Pos          : Liste des Machines à Café	

Fontaine.Prix     : Prix d'utilisation de la Fontaine		
Fontaine.Taille   : Taille autour des coord ou le joueur a acces a la fontaine
Fontaine.Anim     : Est-ce que le joueur joue l'animation ?
Fontaine.Notif    : Notif si le joueur est proche d'une fontaine
Fontaine.Notif2   : Notif si le joueur boit a une fontaine
Fontaine.Hydrate  : Taux d'hydratation ajouter au joueur ( esx_status )
Fontaine.Pos      : Liste des fontaines

VendingM.Prix     : Prix d'utilisation des Distributeurs		
VendingM.Taille   : Taille autour des coord ou le joueur a acces a la Distributeurs	
VendingM.Anim     : Est-ce que le joueur joue l'animation 'Recuperer son Item' ?
VendingM.Notif    : Notif si le joueur est proche d'un Distributeurs	
VendingM.Notif2   : Notif si le joueur achete a un Distributeurs	
VendingM.Item..   : Nom des items à vendre dans la base de donnée
VendingM.Pos      : Liste des Distributeurs	
```
Pour ajouter une Machine à Café, Fontaine ou Distributeur	, copier cette ligne dans la liste .Pos correspondante et remplacer les '0.0' par les coordonnées 
( n'oublier pas le ',' a la fin !):
```
{ x = 0.0, y = 0.0, z = 0.0},
```
