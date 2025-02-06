MEL.DefineRecipe("717spb_bumper", "gmod_subway_81-717_lvz")
RECIPE.Description = "This mod add bumpers for 81-717 SPB"
local root_model = "models/bumper/"
local root_mask = "models/mask/"

function RECIPE:InjectSpawner(entclass)
    MEL.AddSpawnerField(entclass, {
        [1] = "vlzBumpType",
        [2] = "Spawner.717.bumptype",
        [3] = "List",
        [4] = {"type-1", "type-2", "type-3"}
    })
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

    MEL.UpdateCallback(ent, "lvzBumper", function(ent, cent)
        local bt = ent:GetNW2Int("vlzBumpType")
        if bt == 3 then cent:SetNoDraw(true) end
    end)
end