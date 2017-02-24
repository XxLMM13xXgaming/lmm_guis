util.AddNetworkString("LMMGUITest")

concommand.Add("guitest",function(ply)
  net.Start("LMMGUITest")
  net.Send(ply)
end)
