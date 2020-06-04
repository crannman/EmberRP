include("shared.lua")

surface.CreateFont( "Roboto", {
	font = "Roboto", --  Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	extended = false,
	size = 14,
	weight = 500,
})


local function ToggleScoreboard(toggle)
  if toggle then
      local scrw, scrh = ScrW(), ScrH()
      EmberRPScoreboard = vgui.Create("DFrame")
      EmberRPScoreboard:SetTitle("")
      EmberRPScoreboard:SetSize(scrw * .3, scrh * .6)
      EmberRPScoreboard:Center()
      EmberRPScoreboard:MakePopup()
      EmberRPScoreboard:ShowCloseButton(false)
      EmberRPScoreboard:SetDraggable(false)
      EmberRPScoreboard:Paint = function(self,w,h)
          surface.SetDrawColor(0,0,0,200)
          surface.DrawRect(0,0,w,h)
          draw.SimpleText("EmberRP Scoreboard","Roboto", w / 2, h * 0.2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
      end
      local scroll = vgui.Create("DscrollPanel", EmberRPScoreboard)
      scroll:SetPos(0, EmberRPScoreboard:GetTall() * .03)
      scroll:SetSize(EmberRPScoreboard:GetWide(), EmberRPScoreboard:GetTall() * .97)
        local ypos = 0
          for k, v in pairs(player.GetAll()) do
            local PlayerPanel = vgui.Create("DPanel", EmberRPScoreboard)
            PlayerPanel:SetPos(0, ypos)
            PlayerPanel:SetSize(EmberRPScoreboard:GetWide(), EmberRPScoreboard:GetTall() * 0.5)
            local name = v:Name()
            PlayerPanel.Paint = function(self,w,h)
              if Is IsValid(v) then
                  surface.SetDrawColor(0,0,0,200)
                  surface.DrawRect(0,0,w,h)
                  draw.SimpleText(v:Name(),"Roboto", w / 2, h / 2, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
              end
                ypos = ypos + PlayerPanel:GetTall() * 1.1
              end
          else
              if IsValid(EmberRPScoreboard) then
                EmberRPScoreboard:Remove()
        end

end


hook.Add("ScoreboardShow", "EmberRPOpenScoreboard", funcction()
    ToggleScoreboard(true)
    return false
end)

hook.Add("ScoreboardHide", "EmberRPHideScoreboard", funcction()
    ToggleScoreboard(false)
end)
