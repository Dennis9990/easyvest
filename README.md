# Easy Vest

### What is this?
A simple script that gives you a vest when executing the /vest command. It will remove the vest with /rvest.
I've added an animation to make it look pretty :D

### Functions
- /vest puts on a vest.
- /rvest removes the vest.

### Installation
- Download the resource and drop it to your resource folder.
- Add ``ensure easyvest`` to your server.cfg

### Edit Config
- Armor ID. Change this however you want this to be.
```
SetPedComponentVariation(GetPlayerPed(-1), 9, 3, 1, 0)
```
-  Change messages. You can choose between ShowNotifications or a more simple chat msg.
```
ShowNotification("Je hebt je vest aangetroken.")  -- ShowNotification or msg("message")
```
- Change these values in the Animation section to whatever animation you want. Full animation list https://wiki.gtanet.work/index.php?title=Animations
```
--AnimDict = anim@narcotics@trash
--AnimName = drop_front
```

