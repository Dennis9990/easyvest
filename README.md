# Easy Vest

### What is this?
A simple script that gives you a vest when executing the /vest command. It will remove the vest with /rvest.
I've added an animation to make it look more realistic.

### Functions
- /vest puts on a vest and reffils your armor bar to 100%.
- /rvest removes the vest.

### Installation
- Download the resource and drop it to your resource folder.
- Add ``ensure easyvest`` to your server.cfg

### Edit Config
- Body Armor ID. Change this however you want this to be.
```
SetPedComponentVariation(GetPlayerPed(-1), 9, 3, 1, 0)
```
-  Change messages. You can choose between server notifications or a more simple chat msg.
```
ShowNotification("You put on your vest.")
```
- Change these values in the Animation section to whatever animation you want. Full animation list https://wiki.gtanet.work/index.php?title=Animations
```
--AnimDict = anim@narcotics@trash
--AnimName = drop_front
```
### To Do
- Possibility to add multiple vests.
- 1 command to add/remove vest instead of 2 seperate.
- Command usage Cooldown
- Add hats, glasses and masks
