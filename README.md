# Easy Vest

### What is this?
A simple script that gives you a vest when executing the /vest command.
I've added an animation to make it look more realistic.

### V1.1 uses a skinchanger native. Make sure to download and add skinchanger as well or easy vest won't work. 

### Functions
- /vest puts on or removes a vest

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
- Command usage Cooldown
- Add hats, glasses and masks
- Add statement for both genders.
