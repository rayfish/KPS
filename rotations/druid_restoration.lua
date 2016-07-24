--[[[
@module Druid Restoration Rotation
@version 7.0.3
]]--
local spells = kps.spells.druid
local env = kps.env.druid

kps.rotations.register("DRUID","RESTORATION",
{   
    -- Keys
    {spells.rebirth, 'keys.ctrl and target.isDead and spells.rebirth.inRange("target")', target },
    {spells.rebirth, 'keys.ctrl and mouseover.isDead and spells.rebirth.inRange("mouseover")', mouseover },
    {spells.efflorescence, 'keys.shift'},

     -- Simple Resto-Feral-Hybrid Catform
    {{"nested"}, 'player.hasBuff(spells.catForm)', {
    {spells.rake, 'target.myDebuffDuration(spells.rake) < 3 and ( ( target.timeToDie - target.myDebuffDuration(spells.rake) > 3 and activeEnemies.count < 3 ) or target.timeToDie - target.myDebuffDuration(spells.rake) > 6 )'},
    {spells.rip, 'target.comboPoints == 5 and target.myDebuffDuration(spells.rip) < 7.2 and target.timeToDie - target.myDebuffDuration(spells.rip) > 18'},
    {spells.ferociousBite, 'target.comboPoints == 5 and target.hasMyDebuff(spells.rip) and target.myDebuffDuration(spells.rip) > 11'},
    {spells.shred, 'player.energyTimeToMax < 1.3 and target.comboPoints < 5'},
    }},

    -- Cooldowns
    {{"nested"}, 'kps.cooldowns', {
        --{kps.runMacro('/use 5512'), 'player.hp < 0.15' }, -- WIP - use healthstone
        {spells.innervate, 'player.mana < 0.75', player},
        {spells.barkskin, 'player.hp < 0.7', player},
        {spells.ironbark, 'kps.heal.defaultTank.hpIncoming < 0.65 and not (kps.heal.defaultTank.hasBuff(spells.barkskin) or kps.heal.defaultTank.hasBuff(spells.ironbark))', kps.heal.defaultTank},
    }},

    {spells.swiftmend, 'kps.heal.defaultTarget.hp < 0.7 and not player.hasBuff(spells.soulOfTheForest)', kps.heal.defaultTarget },
    -- Tank
    {spells.lifebloom, 'kps.heal.defaultTank.hp < 1 and kps.heal.defaultTank.myBuffDuration(spells.lifebloom) < 3', kps.heal.defaultTank},
    {spells.rejuvenation, '(kps.heal.defaultTarget.myBuffDuration(spells.rejuvenation) < 3 or (player.hasTalent(6, 3) and kps.heal.defaultTank.myBuffDuration(spells.germination) < 3)) and kps.heal.defaultTank.hp < 1', kps.heal.defaultTank},
    {spells.rejuvenation, '(kps.heal.defaultTarget.myBuffDuration(spells.rejuvenation) < 3 or (player.hasTalent(6, 3) and kps.heal.defaultTank.myBuffDuration(spells.germination) < 3)) and kps.heal.defaultTank.hp < 1', kps.heal.defaultTank},
    {spells.wildGrowth, 'kps.multiTarget and kps.heal.defaultTarget.hpIncoming < 0.9 and kps.heal.defaultTarget.hp < 1', kps.heal.defaultTarget},
    -- General
    {spells.rejuvenation, '(kps.heal.defaultTarget.myBuffDuration(spells.rejuvenation) < 3 or (player.hasTalent(6, 3) and kps.heal.defaultTarget.myBuffDuration(spells.germination) < 3)) and kps.heal.defaultTarget.hp < 0.9', kps.heal.defaultTarget},

    {spells.regrowth, 'kps.heal.defaultTarget.hpIncoming < 0.5 or (player.hasBuff(spells.innervate) and kps.heal.defaultTarget.hp < 0.9) or (player.hasBuff(spells.clearcasting) and kps.heal.defaultTarget.hpIncoming < 0.9)', kps.heal.defaultTarget},

    {spells.healingTouch, 'kps.heal.defaultTarget.hp < 0.6', kps.heal.defaultTarget},

},"7.0.3 Restoration")
