include("portal2/portal2_sounds.lua") // Soundscripts
include("portal2/portal2_particles.lua") // Particles
include("portal2/portal2_hooks.lua") // Hooks

-- areaportal window fix
--RunConsoleCommand("r_portalscloseall 0")
--RunConsoleCommand("r_portalsopenall 1")

if not SERVER then return false end

RunConsoleCommand("r_portalscloseall", 0)
RunConsoleCommand("r_portalsopenall", 1)

timer.Simple(2, function() -- because of some valve bug or smth idfk
    local brushes =  ents.FindByClass("func_brush")

    for _, brush in pairs(brushes) do
        local kv = brush:GetKeyValues()

        for k, v in pairs(kv) do
            if k == "targetname" then
                if string.match(v, "areaportal") then
                    print(tostring(v))
                    brush:Remove()
                end
            end
        end
    end

    local APWins = ents.FindByClass("func_areaportalwindow")

    for _, apwin in pairs(APWins) do
        apwin:Remove()
    end
end)