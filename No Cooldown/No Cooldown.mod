return {
	run = function()
		fassert(rawget(_G, "new_mod"), "`No Cooldown` mod must be lower than Vermintide Mod Framework in your launcher's load order.")

		new_mod("No Cooldown", {
			mod_script       = "scripts/mods/No Cooldown/No Cooldown",
			mod_data         = "scripts/mods/No Cooldown/No Cooldown_data",
			mod_localization = "scripts/mods/No Cooldown/No Cooldown_localization",
		})
	end,
	packages = {
		"resource_packages/No Cooldown/No Cooldown",
	},
}
