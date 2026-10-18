-- Integration point for feature logic.
-- AutoFarm, fruit collection, quest selection and shopping are NOT integrated yet.
local Core = {}

function Core.init(context)
    if context.Status and context.Status.set then
        context.Status.set("UI loaded; feature logic not integrated")
    end
    -- Future integration checklist:
    -- * one movement controller owns character movement
    -- * each task supports cancellation and cleanup
    -- * Remote calls are protected and their server results checked
    -- * stop/disconnect tasks when character respawns or UI closes
end

return Core
