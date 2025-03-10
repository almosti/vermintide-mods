local mod = get_mod("No Cooldown")

-- Your mod code goes here.
-- https://vmf-docs.verminti.de
mod:hook_safe(CareerExtension, "update", function (self, unit, input, dt, context, t)
    -- if not self.player.bot_player then
	--     self._abilities_always_usable=true
    -- end
end)

--- Reset ult.
mod.reset_ult = function()
    -- VMFMod:echo('CD recovered')
	local local_player_unit = Managers.player:local_player().player_unit
	local career_extension = ScriptUnit.extension(local_player_unit, "career_system")
	if career_extension then
        local ability = career_extension._abilities[1]
		career_extension:reduce_activated_ability_cooldown(ability.max_cooldown,1,true)
	end
end
mod:command("ult_reset", mod:localize("reset_ult_command_description"), mod.reset_ult)


mod:hook_safe(CareerExtension, "start_activated_ability_cooldown", function (self, ability_id, refund_percent, modified_cost, ignore_ability_readiness)

    ability_id = ability_id or 1
    local ability = self._abilities[ability_id]
    local current_cooldown = self:current_ability_cooldown(ability_id)
    local min_cooldown = ability.max_cooldown * (1 - ability.cost)
    if mod:get(mod.SETTING_NAMES.ULT_PLAYER) and not self.player.bot_player then
        --refund_percent=0.8
        --Managers.chat:send_chat_message(1, 1, tostring(refund_percent))

        local custom_refund = mod:get(mod.SETTING_NAMES.ULT_PLAYER_REFUND_PERCENT) * 0.01
        self:reduce_activated_ability_cooldown(ability.max_cooldown * custom_refund, ability_id, true)
    else if mod:get(mod.SETTING_NAMES.ULT_BOT) and self.player.bot_player then
        local custom_refund = mod:get(mod.SETTING_NAMES.ULT_BOT_REFUND_PERCENT) * 0.01
        self:reduce_activated_ability_cooldown(ability.max_cooldown * custom_refund, ability_id, true)
    end
    end
end)

return {
	name = "test",
	description = mod:localize("mod_description"),
	is_togglable = true,
}
