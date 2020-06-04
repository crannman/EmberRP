GM.Version = "1"
GM.Name = "EmberRP"
GM.Author = "By Crannman."

DeriveGamemode("sandbox")
DEFINE_BASECLASS("gamemode_sandbox")

GM.Sandbox = BaseClass


AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")


include("shared.lua")

-- Include Other Scripts
AddCSLuaFile("vgui/scoreboard.lua")

function GM:PlayerSpawn(ply)
  ply:SetGravity(.8)
  ply:SetMaxHealth(100)
  ply:SetRunSpeed(500)
  ply:Give("weapon_physgun")
  ply:SetupHands()

end


    end
