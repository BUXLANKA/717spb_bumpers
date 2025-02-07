MEL.DefineRecipe("540spb_masks", "gmod_subway_81-717_lvz")
RECIPE.Description = "This mod add masks from 81-540 for 81-717 SPB"

local root_model = "models/mask/"
local stock_model = "models/metrostroi_train/81-717/"

function RECIPE:InjectSpawner(entclass)
    MEL.AddSpawnerField(entclass, {
        [1] = "540MaskType",
        [2] = "Spawner.540.MaskType",
        [3] = "List",
        [4] = {"Default","1-4-1","1-3-1","2-2-2n"},
    }, false)

    MEL.RemoveSpawnerField(entclass, "MaskType")
end

function RECIPE:Inject(ent, entclass)
    -- MEL.NewClientProp(ent, "540mask", {
    --     model = root_model .. "540_141.mdl",
    --     pos = Vector(0,0,0),
    --     ang = Angle(0,-90,0),

    --     modelcallback = function(wagon, cent)
    --         local models = {
    --             root_model .. "540_141.mdl",
    --             root_model .. "540_131.mdl",
    --             root_model .. "540_222.mdl"
    --         }
    --     return models[wagon:GetNW2Int("MaskType")] end
    -- }, "MaskType")

    MEL.NewClientProp(ent, "540_141", {
        model = root_model .. "540_141.mdl",
        pos = Vector(0,0,0),
        ang = Angle(0,0,0)
    })
    MEL.NewClientProp(ent, "540_131", {
        model = root_model .. "540_131.mdl",
        pos = Vector(0,0,0),
        ang = Angle(0,0,0)
    })
    MEL.NewClientProp(ent, "540_222n", {
        model = root_model .. "540_222.mdl",
        pos = Vector(0,0,0),
        ang = Angle(0,0,0)
    })

    MEL.UpdateCallback(ent, "mask22_1", function(ent, cent)
        if ent:GetNW2Int("MaskType") == 1 then cent:SetNoDraw(false) end
    end)
    MEL.UpdateCallback(ent, "mask22_2", function(ent, cent)
        if ent:GetNW2Int("MaskType") == 2 then cent:SetNoDraw(false) else cent:SetNoDraw(true) end
    end)
    MEL.UpdateCallback(ent, "mask222_lvz", function(ent, cent)
        if ent:GetNW2Int("MaskType") == 3 then cent:SetNoDraw(true) else cent:SetNoDraw(true) end
    end)

    MEL.UpdateCallback(ent, "540_141", function(ent, cent)
        if ent:GetNW2Int("MaskType") == 4 then cent:SetNoDraw(true) else cent:SetNoDraw(true) end
    end)
    MEL.UpdateCallback(ent, "540_131", function(ent, cent)
        if ent:GetNW2Int("MaskType") == 5 then cent:SetNoDraw(true) else cent:SetNoDraw(true) end
    end)
    MEL.UpdateCallback(ent, "540_222n", function(ent, cent)
        if ent:GetNW2Int("MaskType") == 6 then cent:SetNoDraw(true) else cent:SetNoDraw(true) end
    end)







    -- MEL.UpdateCallback(ent, "mask222_lvz", function(ent, cent)
    --     if ent:GetNW2Int("MaskType") then cent:SetNoDraw(true) end
    -- end)
    -- MEL.UpdateCallback(ent, "mask22_1", function(ent, cent)
    --     if ent:GetNW2Int("MaskType") then cent:SetNoDraw(true) end
    -- end)
    -- MEL.UpdateCallback(ent, "mask22_2", function(ent, cent)
    --     if ent:GetNW2Int("MaskType") then cent:SetNoDraw(true) end
    -- end)

    -- MEL.UpdateCallback(ent, "540mask", function(ent, cent)
    --     if ent:GetNW2Int("MaskType") == 1 then cent:SetNoDraw(true) end
    -- end)


    -- -- MEL.NewClientProp(ent, "717_stockmask", {
    -- --     model = stock_model .. "mask_spb_222.mdl",
    -- --     pos = Vector(0,0,0),
    -- --     ang = Angle(0,0,0),

    -- --     modelcallback = function(wagon, cent)
    -- --         local models = {
    -- --             stock_model .. "mask_spb_222.mdl",
    -- --             stock_model .. "mask_22.mdl",
    -- --             stock_model .. "mask_22s.mdl",
    -- --         }
    -- --     return models[wagon:GetNW2Int("MaskType", 4)] end
    -- -- }, "MaskType")

    -- MEL.UpdateCallback(ent, "540mask", function(ent, cent)
    --     local mt = ent:GetNW2Int("MaskType")
    --     if mt == 4 or 5 or 6 then cent:SetNoDraw(false) end
    -- end)
end