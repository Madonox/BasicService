# BasicService

Welcome to the BasicService website!  Below, you'll be able to see a list of instructions on how to install the service, as well as use it!

# Installation
In order to install the system, simply insert the model and drag it into ReplicatedStorage, then you're done!
Additionally, if you'd like the service files names to be randomized simply enable HTTP requests on your game!
Model: https://www.roblox.com/library/7448578588/BasicService

> **Note:** In the event that you find a bug with the system, please report the bug to **Madonox#8787** on Discord!
## Usage

BasicService offers a simple, yet quite effective system for all developers to use to hopefully help speed up their programming as a whole.

Require the API module:
```lua
local BasicService = require(game.ReplicatedStorage.BasicService.BasicService)
```
Once that is done, you may use the API!
Example API method:
```lua
BasicService:Index("testService",{
	["testFunction"] = function()
		print("test!")
	end
},false)
```

|Method|Arguments                          |Function|
|----------------|-------------------------------|-----------------------------|
|Index|`serviceName` `functionsArray` `true|false`            |Define a service, setting the third argument to true will disable the abilities for clients to use the service.          |
|GetService|`serviceName`            |Returns the service requested if it is defined.            |
