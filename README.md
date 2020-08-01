# Easy Vest

### What is this?
A simple script that gives you a body armor vest.

You can choose between a light, medium, or heavy vest. A light vest will give you 25 armor, medium gives you 50 armor and heavy gives you 100 armor.
Added a fancy animation to make it look more realistic. This script supports both male and female mp_freemode_01 peds.

### Functions
- /vest light -- puts on a light vest.
- /vest medium -- puts on a medium vest.
- /vest heavy -- puts on a heavy vest.
- /vest -- removes vest.

### Installation
- Download the resource and drop it to your resource folder.
- Add ``ensure easyvest`` to your server.cfg

### Edit Config
- Body Armor ID. Change this however you want this to be.
```
SetPedComponentVariation(GetPlayerPed(-1), 9, 3, 1, 0)
```
- You can change the armor value of the vests to whatever you want.
```
SetPedArmour(GetPlayerPed(-1), 0)
```
- Change these values in the Animation section to whatever animation you want. Full animation list https://wiki.gtanet.work/index.php?title=Animations
```
--AnimDict = anim@narcotics@trash
--AnimName = drop_front
```
### To Do
- Command usage Cooldown
- Add hats, glasses and masks
