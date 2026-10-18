-- TÉO HUB CORE 2026 - modular loader scaffold
-- Repo: https://github.com/teoscrvn-glitch/Teo-Hub-Core-2026
-- Starter scaffold only: original AutoFarm/fruit/shop logic is not integrated.

local OWNER, REPO, BRANCH = "teoscrvn-glitch", "Teo-Hub-Core-2026", "main"
local BASE_URL = ("https://raw.githubusercontent.com/%s/%s/%s/"):format(OWNER, REPO, BRANCH)

local function loadModule(path)
    local ok, source = pcall(function() return game:HttpGet(BASE_URL .. path) end)
    if not ok or type(source) ~= "string" or #source == 0 then
        error("[TEO HUB] Download failed: " .. path .. " | " .. tostring(source))
    end
    local compileOk, chunk = pcall(function() return loadstring(source) end)
    if not compileOk or type(chunk) ~= "function" then
        error("[TEO HUB] Compile failed: " .. path .. " | " .. tostring(chunk))
    end
    local runOk, module = pcall(chunk)
    if not runOk or type(module) ~= "table" then
        error("[TEO HUB] Module failed or did not return a table: " .. path .. " | " .. tostring(module))
    end
    return module
end

local function start()
    local config = loadModule("modules/config.lua")
    local status = loadModule("modules/status.lua")
    local ui = loadModule("modules/ui.lua")
    local core = loadModule("modules/core.lua")

    local context = {
        Players = game:GetService("Players"),
        ReplicatedStorage = game:GetService("ReplicatedStorage"),
        TweenService = game:GetService("TweenService"),
        UserInputService = game:GetService("UserInputService"),
        RunService = game:GetService("RunService"),
        Workspace = game:GetService("Workspace"),
        Config = config,
        Status = status,
    }
    context.Player = context.Players.LocalPlayer
    if not context.Player then error("[TEO HUB] LocalPlayer unavailable") end

    if status.init then status.init(context) end
    if ui.init then ui.init(context) end
    if core.init then core.init(context) end
    if status.set then status.set("Modules loaded") end
end

local ok, err = pcall(start)
if not ok then warn("[TEO HUB] Startup failed: " .. tostring(err)) end
