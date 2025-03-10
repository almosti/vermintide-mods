local mod = get_mod("No Cooldown")

local mod_data = {
	name = "No Cooldown",
	description = mod:localize("mod_description"),
	is_togglable = true,
	allow_rehooking = true,
}

mod.SETTING_NAMES = {}
for _, setting_name in ipairs( {
	"ULT_RESET_HOTKEY",
	"ULT_PLAYER",
	"ULT_PLAYER_REFUND_PERCENT",
	"ULT_BOT",
	"ULT_BOT_REFUND_PERCENT",

} ) do
	mod.SETTING_NAMES[setting_name] = setting_name
end

mod_data.options = {
	widgets = {
			{
				setting_id = mod.SETTING_NAMES.ULT_RESET_HOTKEY,
				type = "keybind",
				keybind_trigger = "pressed",
				keybind_type = "function_call",
				function_name = "reset_ult",
				default_value = {},
			},
			{
				setting_id = mod.SETTING_NAMES.ULT_PLAYER,
				type = "checkbox",
				default_value = false,
				sub_widgets = {
					{
						setting_id = mod.SETTING_NAMES.ULT_PLAYER_REFUND_PERCENT,
						type = "numeric",
						range = {0, 100},
						decimal_number = 1,
						default_value = 0
					}
				}
			},
			{
				setting_id = mod.SETTING_NAMES.ULT_BOT,
				type = "checkbox",
				default_value = false,
				sub_widgets = {
					{
						setting_id = mod.SETTING_NAMES.ULT_BOT_REFUND_PERCENT,
						type = "numeric",
						range = {0, 100},
						decimal_number = 1,
						default_value = 0
					}
				}
			},
	}
}

return mod_data