# Easy Vest

### What is this?
A simple script that gives you a vest when executing the /vest command. It will remove the vest with /rvest.
I've added an animation to make it look pretty :D

### Functions
- /vest puts on a vest(body armor)
- /rvest removes the vest.

### Installation
- Download the resource and drop it to your resource folder.
- Add ``ensure easyvest`` to your server.cfg

### Edit Config
- Armor ID. Change this however you want this to be.
```
SetPedComponentVariation(GetPlayerPed(-1), 9, 3, 1, 0)
```

- To Update a skill you do following:
```lua
    exports["gamz-skillsystem"]:UpdateSkill(skill, amount)
```
  so if you were to add 2% to Stamina you do
```lua
    exports["gamz-skillsystem"]:UpdateSkill("Stamina", 2)
```
- There is also an export to get the current skill if you were to do something from another script
```lua
    exports["gamz-skillsystem"]:GetCurrentSkill(skill)
```

