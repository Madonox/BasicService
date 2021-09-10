-- Madonox
local rs = game:GetService("RunService")
local BasicService = {}

BasicService.services = {}
BasicService.httpEnabled = false
local http = game:GetService("HttpService")
BasicService.httpEnabled = pcall(function()
	http:GetAsync("https://www.google.com")
end)
if BasicService.httpEnabled == false then
	warn("BasicService requests the usage of HTTP service for naming modules, while it is not required, it is benificial.")
end
function BasicService:Index(serviceName : string,functionsKey,isSecure : boolean)
	local serviceClass = script.Parent.Classes.ServiceClass:Clone()
	serviceClass.Parent = script.Parent.Bin
	if BasicService.httpEnabled == true then
		serviceClass.Name = http:GenerateGUID(false)
	end
	for i,v in pairs(functionsKey) do
		require(serviceClass):Define(i,v)
	end
	require(serviceClass):Construct(serviceName,isSecure)
	BasicService.services[serviceName] = require(serviceClass):Get()
end
function BasicService:GetService(name : string)
	if BasicService.services[name] ~= nil then
		return BasicService.services[name],"pass"
	else
		return {
			["result"] = function()
				warn("No service found under the name of "..name)
			end,
		},"err"
	end
end

return BasicService
