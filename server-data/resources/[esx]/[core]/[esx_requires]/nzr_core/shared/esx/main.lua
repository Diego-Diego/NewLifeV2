Config = {}

-- identity
Config.Locale = GetConvar('esx:locale', 'fr')
Config.EnableESXIdentity = true
Config.MaxSalary = 3500

-- status
Config.StatusMax      = 1000000
Config.TickTime       = 1000
Config.UpdateInterval = 30000

Config.EnableHealth   = true
Config.EnableArmor    = true

Config.Items = {
	["bread"] = {
		type = "food",
		prop= "prop_cs_burger_01",
		status = 200000,
		remove = true
	},
	
	["water"] = {
		type = "drink",
		prop = "prop_ld_flow_bottle",
		status = 100000,
		remove = true
	},

	["beer"] = {
		type = "drunk",
		prop = "prop_beer_logopen",
		status = 100000,
		remove = true
	}
}

--identity

-- [Config.EnableCommands]
-- Enables Commands Such As /char and /chardel
Config.EnableCommands   = true

-- EXPERIMENTAL Character Registration Method
Config.UseDeferrals     = false

-- These values are for the date format in the registration menu
-- Choices: DD/MM/YYYY | MM/DD/YYYY | YYYY/MM/DD
Config.DateFormat       = 'DD/MM/YYYY'

-- These values are for the second input validation in server/main.lua
Config.MaxNameLength    = 20 -- Max Name Length.
Config.MinHeight        = 120 -- 120 cm lowest height
Config.MaxHeight        = 220 -- 220 cm max height.
Config.LowestYear       = 1900 -- 112 years old is the oldest you can be.
Config.HighestYear      = 2005 -- 18 years old is the youngest you can be.

Config.FullCharDelete   = true -- Delete all reference to character.
Config.EnableDebugging  = ESX.GetConfig().EnableDebug -- prints for debugging :)
