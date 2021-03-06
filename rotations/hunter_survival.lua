--[[[
@module Hunter Survival Rotation
@generated_from hunter_survival.simc
@version 6.2.2
]]--
local spells = kps.spells.hunter
local env = kps.env.hunter


kps.rotations.register("HUNTER","SURVIVAL",
{
    {{"nested"}, 'activeEnemies.count > 1', { -- call_action_list,name=aoe,if=active_enemies>1
        {spells.stampede, 'player.hasAgiProc or (  and ( player.hasAgiProc or player.hasProc or player.hasAgiProc ) )'}, -- stampede,if=buff.potion.up|(cooldown.potion.remains&(buff.archmages_greater_incandescence_agi.up|trinket.stat.any.up|buff.archmages_incandescence_agi.up))
        {spells.explosiveShot, 'player.buffStacks(spells.lockAndLoad) and ( not player.hasTalent(6, 3) or spells.barrage.cooldown > 0 )'}, -- explosive_shot,if=buff.lock_and_load.react&(!talent.barrage.enabled|cooldown.barrage.remains>0)
        {spells.barrage}, -- barrage
        {spells.blackArrow, 'not target.hasMyDebuff(spells.blackArrow)'}, -- black_arrow,if=!ticking
        {spells.explosiveShot, 'activeEnemies.count < 5'}, -- explosive_shot,if=active_enemies<5
        {spells.explosiveTrap, 'target.myDebuffDuration(spells.explosiveTrap) <= 5'}, -- explosive_trap,if=dot.explosive_trap.remains<=5
        {spells.aMurderOfCrows}, -- a_murder_of_crows
        {spells.direBeast}, -- dire_beast
-- ERROR in 'multishot,if=buff.thrill_of_the_hunt.react&focus>50&cast_regen<=focus.deficit|dot.serpent_sting.remains<=5|target.time_to_die<4.5': Spell 'kps.spells.hunter.thrillOfTheHunt' unknown (in expression: 'buff.thrill_of_the_hunt.react')!
-- ERROR in 'cobra_shot,if=buff.pre_steady_focus.up&buff.steady_focus.remains<5&focus+14+cast_regen<80': Spell 'kps.spells.hunter.preSteadyFocus' unknown (in expression: 'buff.pre_steady_focus.up')!
        {spells.multishot, 'player.focus >= 70 or player.hasTalent(7, 2)'}, -- multishot,if=focus>=70|talent.focusing_shot.enabled
        {spells.cobraShot}, -- cobra_shot
    }},
    {spells.aMurderOfCrows}, -- a_murder_of_crows
    {spells.stampede, 'player.hasAgiProc or (  and ( player.hasAgiProc or player.hasProc ) ) or target.timeToDie <= 45'}, -- stampede,if=buff.potion.up|(cooldown.potion.remains&(buff.archmages_greater_incandescence_agi.up|trinket.stat.any.up))|target.time_to_die<=45
    {spells.blackArrow, 'target.myDebuffDuration(spells.blackArrow) < player.gcd * 1.5'}, -- black_arrow,if=remains<gcd*1.5
    {spells.arcaneShot, '( player.hasAgiProc and  < 4 ) or target.myDebuffDuration(spells.serpentSting) <= 3'}, -- arcane_shot,if=(trinket.proc.any.react&trinket.proc.any.remains<4)|dot.serpent_sting.remains<=3
    {spells.explosiveShot}, -- explosive_shot
-- ERROR in 'cobra_shot,if=buff.pre_steady_focus.up': Spell 'kps.spells.hunter.preSteadyFocus' unknown (in expression: 'buff.pre_steady_focus.up')!
    {spells.direBeast}, -- dire_beast
-- ERROR in 'arcane_shot,if=(buff.thrill_of_the_hunt.react&focus>35)|target.time_to_die<4.5': Spell 'kps.spells.hunter.thrillOfTheHunt' unknown (in expression: 'buff.thrill_of_the_hunt.react')!
-- ERROR in 'glaive_toss': Spell 'glaiveToss' unknown!
-- ERROR in 'powershot': Spell 'powershot' unknown!
    {spells.barrage}, -- barrage
    {spells.explosiveTrap, 'not player.hasAgiProc and not player.hasProc'}, -- explosive_trap,if=!trinket.proc.any.react&!trinket.stacking_proc.any.react
-- ERROR in 'arcane_shot,if=talent.steady_focus.enabled&!talent.focusing_shot.enabled&focus.deficit<action.cobra_shot.cast_regen*2+28': Unknown expression 'action.cobra_shot.'!
    {spells.cobraShot, 'player.hasTalent(4, 1) and player.buffDuration(spells.steadyFocus) < 5'}, -- cobra_shot,if=talent.steady_focus.enabled&buff.steady_focus.remains<5
-- ERROR in 'focusing_shot,if=talent.steady_focus.enabled&buff.steady_focus.remains<=cast_time&focus.deficit>cast_regen': Spell 'focusingShot' unknown!
    {spells.arcaneShot, 'player.focus >= 70 or player.hasTalent(7, 2) or ( player.hasTalent(4, 1) and player.focus >= 50 )'}, -- arcane_shot,if=focus>=70|talent.focusing_shot.enabled|(talent.steady_focus.enabled&focus>=50)
-- ERROR in 'focusing_shot': Spell 'focusingShot' unknown!
    {spells.cobraShot}, -- cobra_shot
}
,"hunter_survival.simc")
