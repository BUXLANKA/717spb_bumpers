MEL.DefineRecipe("540_addition", "gmod_subway_81-717_lvz")
RECIPE.Description = "This mod add additions from 81-540 to 81-717 SPB"

local root_model = "models/bumper/"
local root_mask = "models/mask/"

local metrostroi_model = "models/metrostroi_train/81-717/"
local root_headlights = "models/lamps/540_"

function RECIPE:InjectSpawner(entclass)
    MEL.AddSpawnerField(entclass, {
        [1] = "vlzBumpType",
        [2] = "Spawner.717.bumptype",
        [3] = "List",
        [4] = {"Random", "type-1", "type-2", "type-3"}
    }, true)

    MEL.AddSpawnerField(entclass, {
        [1] = "540maskType",
        [2] = "Spawner.540.MaskType",
        [3] = "List",
        [4] = {"Random", "1-4-1", "1-3-1", "2-2-2n", "Default"}
    }, true)
end

function RECIPE:Inject(ent, entclass)
    MEL.NewClientProp(ent, "lvzBumper", {
        model = root_model .. "bamp_typ1.mdl",
        pos = Vector(0,0,0),
        ang = Angle(0,-90,0),

        modelcallback = function(wagon, cent)
            local models = {
                root_model .. "bamp_typ1.mdl",
                root_model .. "bamp_typ2.mdl"
            }
        return models[wagon:GetNW2Int("vlzBumpType")] end
    }, "vlzBumpType")

    MEL.NewClientProp(ent, "540mask", {
        model = root_model .. "540_141.mdl",
        modelcallback = function(wagon, cent)
            local models = {
                root_mask .. "540_141.mdl",
                root_mask .. "540_131.mdl",
                root_mask .. "540_222.mdl"
            }
            return models[wagon:GetNW2Int("540maskType")]
        end,
        pos = Vector(0,0,0),
        ang = Angle(0,-90,0)
    }, "540maskType")

    MEL.UpdateCallback(ent, "lvzBumper", function(ent, cent)
        local bt = ent:GetNW2Int("vlzBumpType")
        if bt == 3 then cent:SetNoDraw(true) end
    end)

    MEL.UpdateCallback(ent, "mask222_lvz", function(ent, cent) if ent:GetNW2Int("540maskType") == 4 then cent:SetNoDraw(false) else cent:SetNoDraw(true) end end, "540maskType")
    MEL.UpdateCallback(ent, "mask22_1", function(ent, cent) if ent:GetNW2Int("540maskType") == 4 then cent:SetNoDraw(false) else cent:SetNoDraw(true) end end, "540maskType")
    MEL.UpdateCallback(ent, "mask22_2", function(ent, cent) if ent:GetNW2Int("540maskType") == 4 then cent:SetNoDraw(false) else cent:SetNoDraw(true) end end, "540maskType")
    MEL.UpdateCallback(ent, "540mask", function(ent, cent) if ent:GetNW2Int("540maskType") <= 3 then cent:SetNoDraw(false) else cent:SetNoDraw(true) end end, "540maskType")


    MEL.UpdateModelCallback(ent, "Headlights222_1", function(ent)
        if ent:GetNW2Int("540maskType") == 1 then return root_headlights .. "141_grup1.mdl" end
        if ent:GetNW2Int("540maskType") == 2 then return root_headlights .. "131_grup1.mdl" end
        if ent:GetNW2Int("540maskType") == 3 then return root_headlights .. "222_grup1.mdl" end
        if ent:GetNW2Int("540maskType") == 4 then return "models/metrostroi_train/81-717/lamps/headlights_222_group1.mdl" end
    end, "540maskType")
    MEL.UpdateModelCallback(ent, "Headlights222_2", function(ent)
        if ent:GetNW2Int("540maskType") == 1 then return root_headlights .. "141_grup2.mdl" end
        if ent:GetNW2Int("540maskType") == 2 then return root_headlights .. "131_grup2.mdl" end
        if ent:GetNW2Int("540maskType") == 3 then return root_headlights .. "222_grup2.mdl" end
        if ent:GetNW2Int("540maskType") == 4 then return "models/metrostroi_train/81-717/lamps/headlights_222_group2.mdl" end
    end, "540maskType")


    MEL.UpdateModelCallback(ent, "Headlights22_1", function(ent)
        if ent:GetNW2Int("540maskType") == 1 then return root_headlights .. "141_grup1.mdl" end
        if ent:GetNW2Int("540maskType") == 2 then return root_headlights .. "131_grup1.mdl" end
        if ent:GetNW2Int("540maskType") == 3 then return root_headlights .. "222_grup1.mdl" end
        if ent:GetNW2Int("540maskType") == 4 then return "models/metrostroi_train/81-717/lamps/headlights_22_group1.mdl" end
    end, "540maskType")
    MEL.UpdateModelCallback(ent, "Headlights22_2", function(ent)
        if ent:GetNW2Int("540maskType") == 1 then return root_headlights .. "141_grup2.mdl" end
        if ent:GetNW2Int("540maskType") == 2 then return root_headlights .. "131_grup2.mdl" end
        if ent:GetNW2Int("540maskType") == 3 then return root_headlights .. "222_grup2.mdl" end
        if ent:GetNW2Int("540maskType") == 4 then return "models/metrostroi_train/81-717/lamps/headlights_22_group2.mdl" end
    end, "540maskType")

    -- Metrostroi Bykov Extensions adaptation --
    local SPBlogo = "mlogo"
    MEL.UpdateCallback(ent, SPBlogo, function(ent, cent) 
        if ent:GetNW2Int("540maskType") == 1 then 
            cent:SetLocalPos(Vector(461.8,0.5,-47))
        end
        if ent:GetNW2Int("540maskType") == 2 then 
            cent:SetLocalPos(Vector(461.8,0.5,-47))
        end
        if ent:GetNW2Int("540maskType") == 3 then 
            cent:SetLocalPos(Vector(461.8,0.5,-47))
        end
    end, "540maskType")

    MEL.UpdateCallback(ent, SPBlogo, function(ent, cent)
        if ent:GetNW2Int("vlzBumpType") == 3 then cent:SetNoDraw(false) else cent:SetNoDraw(true) end
    end, "vlzBumpType")
end