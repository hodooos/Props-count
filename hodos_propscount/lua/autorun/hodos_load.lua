--/ Don't touche if you don't no why you do.
HODOS = HODOS or {}

--/ Function
local function inc(f) return include("hodos_propscount/"..f) end
local function addcs(f) return AddCSLuaFile("hodos_propscount/"..f) end

--/ Core
if SERVER then
    addcs("config.lua")
    inc("config.lua")
    addcs("client/cl_hodos_propscount.lua")
else
    inc("config.lua")
    inc("client/cl_hodos_propscount.lua")
end