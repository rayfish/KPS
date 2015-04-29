--[[[
@module Test-Runner
@description
Test-Runner for KPS. Used to test KPS Functionality.
]]--
    require("_wow")
require("init")
require("core.logger")
require("core.config")
require("core.kps")
require("core.events")
require("core.locale")
require("core.utils")
require("core.lexer")
require("core.parser")
require("core.rotations")
require("modules.latency")
require("modules.spell.spell")
require("modules.spell.spells")
require("modules.spell.spell_range")
require("modules.spell.spell_state")
require("modules.keys")
require("modules.unit.unit")
require("modules.unit.unit_auras")
require("modules.unit.unit_casting")
require("modules.unit.unit_powers")
require("modules.player.player")
require("modules.player.player_auras")
require("modules.player.player_powers")
require("modules.player.player_procs")
require("rotations.warlock")
require("env")
require("rotations.warlock_destruction")
require("gui.gui")
require("gui.toggle")


kps.combatStep()
