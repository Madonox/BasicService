-- Madonox
local ServiceClass = {}
local rs = game:GetService("RunService")
ServiceClass.name = nil
ServiceClass.restrictions = nil
ServiceClass.functions = {
	["result"] = function()
		print("BasicService: success")
	end,
}
ServiceClass.audit = {}
function ServiceClass:Get()
	if ServiceClass.restrictions == false then
		table.insert(ServiceClass.audit,#ServiceClass.audit+1,"get")
		return self.functions
	else
		if rs:IsServer() then
			table.insert(ServiceClass.audit,#ServiceClass.audit+1,"get")
			return self.functions
		else
			return {
				["result"] = function()
					warn("Unauthorized.")
				end,
			}
		end
	end
end
function ServiceClass:Construct(name,restrictions)
	table.insert(ServiceClass.audit,#ServiceClass.audit+1,"construct")
	ServiceClass.name = name
	ServiceClass.restrictions = restrictions
end
function ServiceClass:Deconstruct()
	table.insert(ServiceClass.audit,#ServiceClass.audit+1,"deconstruct")
	self = nil
	script:Destroy()
end
function ServiceClass:Define(funct,func)
	if ServiceClass.functions[funct] == nil then
		ServiceClass.functions[funct] = func
	else
		warn("BasicService overwrite on service "..ServiceClass.name.." function: "..funct)
		ServiceClass.functions[funct] = func
	end
end
function ServiceClass:Audit()
	return ServiceClass.audit
end
return ServiceClass
