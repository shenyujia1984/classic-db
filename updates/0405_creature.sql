-- Revamp trash mobs in the outer ring of Naxxramas Construct Wing
-- Removed placeholders and spawns backported from WotLK version
-- Added missing groups and spawns in outer ring
-- Based on changed of the three other wings

-- Sources:
-- http://www.wowhead.com/npc=16446#comments
-- http://www.wowhead.com/npc=16447#comments
-- http://www.wowhead.com/npc=16448#comments
-- http://www.wowhead.com/npc=16449#comments
-- http://www.wowhead.com/npc=16451#comments
-- http://www.wowhead.com/npc=16452#comments
-- http://www.wowhead.com/npc=16453#comments


-- ---------------------------------------------
-- Construct Wing
-- ---------------------------------------------

-- Room 1
SET @GUID := 88932;
SET @X := 3478.917;
SET @Y := -3338.876;
SET @Z := 267.594;
SET @O := 4.7137;

-- Two patrolling groups of ghouls around the room (opposite direction) and a shade in the middle
-- DELETE FROM `creature` WHERE `guid` BETWEEN @GUID + 1 AND @GUID + 9;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(@GUID + 8, 16447, 533, 0, 0, @X - 50.04, @Y + 4.12, @Z + 0.01, @O - 0.105, 25, 0, 0, 93736, 0, 0, 0),
(@GUID + 7, 16447, 533, 0, 0, @X - 52.95, @Y + 5.28, @Z + 0.01, @O - 0.105, 25, 0, 0, 93736, 0, 0, 0),
(@GUID + 6, 16447, 533, 0, 0, @X - 53.94, @Y + 0.95, @Z + 0.01, @O - 0.105, 25, 0, 0, 93736, 0, 0, 0),
(@GUID + 5, 16447, 533, 0, 0, @X - 50.82, @Y + 0.61, @Z + 0.01, @O - 0.127, 25, 0, 0, 93736, 0, 0, 2),  -- leading Plagued Ghoul of group 2
(@GUID + 4, 16447, 533, 0, 0, @X - 0.56, @Y + 4.48, @Z + 0.01, @O + 0.137, 25, 0, 0, 93736, 0, 0, 0),
(@GUID + 3, 16447, 533, 0, 0, @X - 2.9, @Y + 4.57, @Z + 0.01, @O + 0.228, 25, 0, 0, 93736, 0, 0, 0),
(@GUID + 2, 16447, 533, 0, 0, @X + 3.4, @Y - 0.02, @Z + 0.01, @O, 25, 0, 0, 93736, 0, 0, 0),
(@GUID + 1, 16447, 533, 0, 0, @X, @Y, @Z, @O, 25, 0, 0, 93736, 0, 0, 2),                        -- leading Plagued Ghoul of group 1, acts as the origin point for placing all other creatures in the room
(@GUID + 9, 16449, 533, 0, 0, @X - 25.53, @Y + 0.59, @Z + 0.01, @O, 25, 5, 0, 65845, 0, 0, 1);  -- Naxxramas Spirit

-- Linked ghouls in each group
-- DELETE FROM `creature_linking` WHERE `guid` IN (@GUID + 3, @GUID + 2, @GUID + 4);
INSERT INTO `creature_linking` VALUES
(@GUID + 3, @GUID + 1, 515),
(@GUID + 4, @GUID + 1, 515),
(@GUID + 2, @GUID + 1, 515);

-- DELETE FROM `creature_linking` WHERE `guid` IN (@GUID + 7, @GUID + 6, @GUID + 8);
INSERT INTO `creature_linking` VALUES
(@GUID + 7, @GUID + 5, 515),
(@GUID + 8, @GUID + 5, 515),
(@GUID + 6, @GUID + 5, 515);

-- Added waypoint path for each group
-- DELETE FROM `creature_movement` WHERE `id` = @GUID + 1;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(@GUID + 1, 1, @X, @Y, @Z, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O, 0, 0),
(@GUID + 1, 2, @X - 6.85, @Y - 17.49, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 0.105, 0, 0),
(@GUID + 1, 3, @X - 24.98, @Y - 25.48, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 1.352, 0, 0),
(@GUID + 1, 4, @X - 43.06, @Y - 17.9, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 2.461, 0, 0),
(@GUID + 1, 5, @X - 50.84, @Y + 0.05, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.034, 0, 0),
(@GUID + 1, 6, @X - 43.21, @Y + 18.17, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.827, 0, 0),
(@GUID + 1, 7, @X - 25.22, @Y + 25.44, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 1.546, 0, 0),
(@GUID + 1, 8, @X - 7.17, @Y + 18.77, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 0.868, 0, 0);

-- DELETE FROM `creature_movement` WHERE `id` = @GUID + 5;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(@GUID + 5, 4, @X, @Y, @Z, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O, 0, 0),
(@GUID + 5, 3, @X - 6.85, @Y - 17.49, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 0.105, 0, 0),
(@GUID + 5, 2, @X - 24.98, @Y - 25.48, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 1.352, 0, 0),
(@GUID + 5, 1, @X - 43.06, @Y - 17.9, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 2.461, 0, 0),
(@GUID + 5, 8, @X - 50.84, @Y + 0.05, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.034, 0, 0),
(@GUID + 5, 7, @X - 43.21, @Y + 18.17, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.827, 0, 0),
(@GUID + 5, 6, @X - 25.22, @Y + 25.44, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 1.546, 0, 0),
(@GUID + 5, 5, @X - 7.17, @Y + 18.77, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 0.868, 0, 0);

-- Room 2
SET @GUID3 := 88941;

SET @X := 3479.120;
SET @Y := -3128.973;
SET @Z := 294.661;
SET @O := 4.7400;

-- Two patrolling groups of ghouls around the room (opposite direction) and a shade in the middle
-- DELETE FROM `creature` WHERE `guid` BETWEEN @GUID3 + 1 AND @GUID3 + 9;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(@GUID3 + 8, 16447, 533, 0, 0, @X - 50.04, @Y + 4.12, @Z + 0.01, @O - 0.105, 25, 0, 0, 93736, 0, 0, 0),
(@GUID3 + 7, 16447, 533, 0, 0, @X - 52.95, @Y + 5.28, @Z + 0.01, @O - 0.105, 25, 0, 0, 93736, 0, 0, 0),
(@GUID3 + 6, 16447, 533, 0, 0, @X - 53.94, @Y + 0.95, @Z + 0.01, @O - 0.105, 25, 0, 0, 93736, 0, 0, 0),
(@GUID3 + 5, 16447, 533, 0, 0, @X - 50.82, @Y + 0.61, @Z + 0.01, @O - 0.127, 25, 0, 0, 93736, 0, 0, 2),
(@GUID3 + 4, 16447, 533, 0, 0, @X - 0.56, @Y + 4.48, @Z + 0.01, @O + 0.137, 25, 0, 0, 93736, 0, 0, 0),
(@GUID3 + 3, 16447, 533, 0, 0, @X - 2.9, @Y + 4.57, @Z + 0.01, @O + 0.228, 25, 0, 0, 93736, 0, 0, 0),
(@GUID3 + 2, 16447, 533, 0, 0, @X + 3.4, @Y - 0.02, @Z + 0.01, @O, 25, 0, 0, 93736, 0, 0, 0),
(@GUID3 + 1, 16447, 533, 0, 0, @X, @Y, @Z, @O, 25, 0, 0, 93736, 0, 0, 2),
(@GUID3 + 9, 16449, 533, 0, 0, @X - 25.53, @Y + 0.59, @Z + 0.01, @O, 25, 5, 0, 65845, 0, 0, 1);

-- Linked ghouls in each group
-- DELETE FROM `creature_linking` WHERE `guid` IN (@GUID3 + 3, @GUID3 + 2, @GUID3 + 4);
INSERT INTO `creature_linking` VALUES
(@GUID3 + 3, @GUID3 + 1, 515),
(@GUID3 + 4, @GUID3 + 1, 515),
(@GUID3 + 2, @GUID3 + 1, 515);

-- DELETE FROM `creature_linking` WHERE `guid` IN (@GUID3 + 7, @GUID3 + 6, @GUID3 + 8);
INSERT INTO `creature_linking` VALUES
(@GUID3 + 7, @GUID3 + 5, 515),
(@GUID3 + 8, @GUID3 + 5, 515),
(@GUID3 + 6, @GUID3 + 5, 515);

-- Added waypoint path for each group
-- DELETE FROM `creature_movement` WHERE `id` = @GUID3 + 1;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(@GUID3 + 1, 1, @X, @Y, @Z, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O, 0, 0),
(@GUID3 + 1, 2, @X - 6.85, @Y - 17.49, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 0.105, 0, 0),
(@GUID3 + 1, 3, @X - 24.98, @Y - 25.48, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 1.352, 0, 0),
(@GUID3 + 1, 4, @X - 43.06, @Y - 17.9, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 2.461, 0, 0),
(@GUID3 + 1, 5, @X - 50.84, @Y + 0.05, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.034, 0, 0),
(@GUID3 + 1, 6, @X - 43.21, @Y + 18.17, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.827, 0, 0),
(@GUID3 + 1, 7, @X - 25.22, @Y + 25.44, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 1.546, 0, 0),
(@GUID3 + 1, 8, @X - 7.17, @Y + 18.77, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 0.868, 0, 0);

-- DELETE FROM `creature_movement` WHERE `id` = @GUID3 + 5;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(@GUID3 + 5, 4, @X, @Y, @Z, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O, 0, 0),
(@GUID3 + 5, 3, @X - 6.85, @Y - 17.49, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 0.105, 0, 0),
(@GUID3 + 5, 2, @X - 24.98, @Y - 25.48, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 1.352, 0, 0),
(@GUID3 + 5, 1, @X - 43.06, @Y - 17.9, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 2.461, 0, 0),
(@GUID3 + 5, 8, @X - 50.84, @Y + 0.05, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.034, 0, 0),
(@GUID3 + 5, 7, @X - 43.21, @Y + 18.17, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.827, 0, 0),
(@GUID3 + 5, 6, @X - 25.22, @Y + 25.44, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 1.546, 0, 0),
(@GUID3 + 5, 5, @X - 7.17, @Y + 18.77, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 0.868, 0, 0);

-- Room 3
SET @GUID4 := 88950;

SET @X := 3335.932;
SET @Y := -2990.191;
SET @Z := 294.662;
SET @O := 4.6992;

-- Two patrolling groups of ghouls around the room (opposite direction) and a shade in the middle
-- DELETE FROM `creature` WHERE `guid` BETWEEN @GUID4 + 1 AND @GUID4 + 9;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(@GUID4 + 8, 16447, 533, 0, 0, @X - 50.04, @Y + 4.12, @Z + 0.01, @O - 0.105, 25, 0, 0, 93736, 0, 0, 0),
(@GUID4 + 7, 16447, 533, 0, 0, @X - 52.95, @Y + 5.28, @Z + 0.01, @O - 0.105, 25, 0, 0, 93736, 0, 0, 0),
(@GUID4 + 6, 16447, 533, 0, 0, @X - 53.94, @Y + 0.95, @Z + 0.01, @O - 0.105, 25, 0, 0, 93736, 0, 0, 0),
(@GUID4 + 5, 16447, 533, 0, 0, @X - 50.82, @Y + 0.61, @Z + 0.01, @O - 0.127, 25, 0, 0, 93736, 0, 0, 2),
(@GUID4 + 4, 16447, 533, 0, 0, @X - 0.56, @Y + 4.48, @Z + 0.01, @O + 0.137, 25, 0, 0, 93736, 0, 0, 0),
(@GUID4 + 3, 16447, 533, 0, 0, @X - 2.9, @Y + 4.57, @Z + 0.01, @O + 0.228, 25, 0, 0, 93736, 0, 0, 0),
(@GUID4 + 2, 16447, 533, 0, 0, @X + 3.4, @Y - 0.02, @Z + 0.01, @O, 25, 0, 0, 93736, 0, 0, 0),
(@GUID4 + 1, 16447, 533, 0, 0, @X, @Y, @Z, @O, 25, 0, 0, 93736, 0, 0, 2),
(@GUID4 + 9, 16449, 533, 0, 0, @X - 25.53, @Y + 0.59, @Z + 0.01, @O, 25, 5, 0, 65845, 0, 0, 1);

-- Linked ghouls in each group
-- DELETE FROM `creature_linking` WHERE `guid` IN (@GUID4 + 3, @GUID4 + 2, @GUID4 + 4);
INSERT INTO `creature_linking` VALUES
(@GUID4 + 3, @GUID4 + 1, 515),
(@GUID4 + 4, @GUID4 + 1, 515),
(@GUID4 + 2, @GUID4 + 1, 515);

-- DELETE FROM `creature_linking` WHERE `guid` IN (@GUID4 + 7, @GUID4 + 6, @GUID4 + 8);
INSERT INTO `creature_linking` VALUES
(@GUID4 + 7, @GUID4 + 5, 515),
(@GUID4 + 8, @GUID4 + 5, 515),
(@GUID4 + 6, @GUID4 + 5, 515);

-- Added waypoint path for each group
-- DELETE FROM `creature_movement` WHERE `id` = @GUID4 + 1;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(@GUID4 + 1, 1, @X, @Y, @Z, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O, 0, 0),
(@GUID4 + 1, 2, @X - 6.85, @Y - 17.49, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 0.105, 0, 0),
(@GUID4 + 1, 3, @X - 24.98, @Y - 25.48, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 1.352, 0, 0),
(@GUID4 + 1, 4, @X - 43.06, @Y - 17.9, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 2.461, 0, 0),
(@GUID4 + 1, 5, @X - 50.84, @Y + 0.05, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.034, 0, 0),
(@GUID4 + 1, 6, @X - 43.21, @Y + 18.17, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.827, 0, 0),
(@GUID4 + 1, 7, @X - 25.22, @Y + 25.44, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 1.546, 0, 0),
(@GUID4 + 1, 8, @X - 7.17, @Y + 18.77, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 0.868, 0, 0);

-- DELETE FROM `creature_movement` WHERE `id` = @GUID4 + 5;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(@GUID4 + 5, 4, @X, @Y, @Z, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O, 0, 0),
(@GUID4 + 5, 3, @X - 6.85, @Y - 17.49, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 0.105, 0, 0),
(@GUID4 + 5, 2, @X - 24.98, @Y - 25.48, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 1.352, 0, 0),
(@GUID4 + 5, 1, @X - 43.06, @Y - 17.9, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 2.461, 0, 0),
(@GUID4 + 5, 8, @X - 50.84, @Y + 0.05, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.034, 0, 0),
(@GUID4 + 5, 7, @X - 43.21, @Y + 18.17, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.827, 0, 0),
(@GUID4 + 5, 6, @X - 25.22, @Y + 25.44, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 1.546, 0, 0),
(@GUID4 + 5, 5, @X - 7.17, @Y + 18.77, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 0.868, 0, 0);

-- Room 4
SET @GUID2 := 88959;
SET @X := 3128.278;
SET @Y := -2985.704;
SET @Z := 267.593;
SET @O := 4.7047;

-- Two patrolling groups of ghouls around the room (opposite direction) and a shade in the middle
-- DELETE FROM `creature` WHERE `guid` BETWEEN @GUID2 + 1 AND @GUID2 + 9;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `DeathState`, `MovementType`) VALUES
(@GUID2 + 8, 16447, 533, 0, 0, @X - 50.04, @Y + 4.12, @Z + 0.01, @O - 0.105, 25, 0, 0, 93736, 0, 0, 0),
(@GUID2 + 7, 16447, 533, 0, 0, @X - 52.95, @Y + 5.28, @Z + 0.01, @O - 0.105, 25, 0, 0, 93736, 0, 0, 0),
(@GUID2 + 6, 16447, 533, 0, 0, @X - 53.94, @Y + 0.95, @Z + 0.01, @O - 0.105, 25, 0, 0, 93736, 0, 0, 0),
(@GUID2 + 5, 16447, 533, 0, 0, @X - 50.82, @Y + 0.61, @Z + 0.01, @O - 0.127, 25, 0, 0, 93736, 0, 0, 2),
(@GUID2 + 4, 16447, 533, 0, 0, @X - 0.56, @Y + 4.48, @Z + 0.01, @O + 0.137, 25, 0, 0, 93736, 0, 0, 0),
(@GUID2 + 3, 16447, 533, 0, 0, @X - 2.9, @Y + 4.57, @Z + 0.01, @O + 0.228, 25, 0, 0, 93736, 0, 0, 0),
(@GUID2 + 2, 16447, 533, 0, 0, @X + 3.4, @Y - 0.02, @Z + 0.01, @O, 25, 0, 0, 93736, 0, 0, 0),
(@GUID2 + 1, 16447, 533, 0, 0, @X, @Y, @Z, @O, 25, 0, 0, 93736, 0, 0, 2),
(@GUID2 + 9, 16449, 533, 0, 0, @X - 25.53, @Y + 0.59, @Z + 0.01, @O, 25, 5, 0, 65845, 0, 0, 1);

-- Linked ghouls in each group
-- DELETE FROM `creature_linking` WHERE `guid` IN (@GUID2 + 3, @GUID2 + 2, @GUID2 + 4);
INSERT INTO `creature_linking` VALUES
(@GUID2 + 3, @GUID2 + 1, 515),
(@GUID2 + 4, @GUID2 + 1, 515),
(@GUID2 + 2, @GUID2 + 1, 515);

-- DELETE FROM `creature_linking` WHERE `guid` IN (@GUID2 + 7, @GUID2 + 6, @GUID2 + 8);
INSERT INTO `creature_linking` VALUES
(@GUID2 + 7, @GUID2 + 5, 515),
(@GUID2 + 8, @GUID2 + 5, 515),
(@GUID2 + 6, @GUID2 + 5, 515);

-- Added waypoint path for each group
-- DELETE FROM `creature_movement` WHERE `id` = @GUID2 + 1;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(@GUID2 + 1, 1, @X, @Y, @Z, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O, 0, 0),
(@GUID2 + 1, 2, @X - 6.85, @Y - 17.49, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 0.105, 0, 0),
(@GUID2 + 1, 3, @X - 24.98, @Y - 25.48, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 1.352, 0, 0),
(@GUID2 + 1, 4, @X - 43.06, @Y - 17.9, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 2.461, 0, 0),
(@GUID2 + 1, 5, @X - 50.84, @Y + 0.05, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.034, 0, 0),
(@GUID2 + 1, 6, @X - 43.21, @Y + 18.17, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.827, 0, 0),
(@GUID2 + 1, 7, @X - 25.22, @Y + 25.44, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 1.546, 0, 0),
(@GUID2 + 1, 8, @X - 7.17, @Y + 18.77, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 0.868, 0, 0);

-- DELETE FROM `creature_movement` WHERE `id` = @GUID2 + 5;
INSERT INTO `creature_movement` (`id`, `point`, `position_x`, `position_y`, `position_z`, `waittime`, `script_id`, `textid1`, `textid2`, `textid3`, `textid4`, `textid5`, `emote`, `spell`, `wpguid`, `orientation`, `model1`, `model2`) VALUES
(@GUID2 + 5, 4, @X, @Y, @Z, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O, 0, 0),
(@GUID2 + 5, 3, @X - 6.85, @Y - 17.49, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 0.105, 0, 0),
(@GUID2 + 5, 2, @X - 24.98, @Y - 25.48, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 1.352, 0, 0),
(@GUID2 + 5, 1, @X - 43.06, @Y - 17.9, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 2.461, 0, 0),
(@GUID2 + 5, 8, @X - 50.84, @Y + 0.05, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.034, 0, 0),
(@GUID2 + 5, 7, @X - 43.21, @Y + 18.17, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O - 3.827, 0, 0),
(@GUID2 + 5, 6, @X - 25.22, @Y + 25.44, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 1.546, 0, 0),
(@GUID2 + 5, 5, @X - 7.17, @Y + 18.77, @Z + 0.01, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, @O + 0.868, 0, 0);