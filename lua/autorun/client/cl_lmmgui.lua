surface.CreateFont( "LMMGUITitleFont", {
	font = "Arial",
	size = 20,
	weight = 5000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
})

surface.CreateFont( "LMMGUIFontClose", {
	font = "Arial",
	size = 15,
	weight = 5000,
	blursize = 0,
	scanlines = 0,
	antialias = true,
})

function LMMGUIDarkThemeMain(DFrame, title)
  DFrame.Paint = function( self, w, h )
		draw.RoundedBox(2, 0, 0, DFrame:GetWide(), DFrame:GetTall(), Color(35, 35, 35, 250))
		draw.RoundedBox(2, 0, 0, DFrame:GetWide(), 30, Color(40, 40, 40, 255))
		draw.SimpleText( title, "LMMGUITitleFont", DFrame:GetWide() / 2, 15, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

  local frameclose = vgui.Create("DButton", DFrame)
	frameclose:SetSize(20, 20)
	frameclose:SetPos(DFrame:GetWide() - frameclose:GetWide() - 5, 5)
	frameclose:SetText("X");
	frameclose:SetTextColor(Color(0,0,0,255))
	frameclose:SetFont("LMMGUIFontClose")
	frameclose.hover = false
	frameclose.DoClick = function()
		DFrame:Close()
	end
	frameclose.OnCursorEntered = function(self)
		self.hover = true
	end
	frameclose.OnCursorExited = function(self)
		self.hover = false
	end
	function frameclose:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, (self.hover and Color(255,15,15,250)) or Color(255,255,255,255)) -- Paints on hover
		frameclose:SetTextColor(self.hover and Color(255,255,255,250) or Color(0,0,0,255))
	end
end

function LMMGUIDarkThemeBtn(self)
  self.OnCursorEntered = function(self)
    self.hover = true
  end
  self.OnCursorExited = function(self)
    self.hover = false
  end
  self.Paint = function( self, w, h )
    draw.RoundedBox(0, 0, 0, w, h, (self.hover and Color(0,160,255,250) or Color(255,255,255,255))) -- Paints on hover
    self:SetTextColor(self.hover and Color(255,255,255,255) or Color(0,0,0,250))
  end
end

net.Receive("LMMGUITest",function()
  local DFrame = vgui.Create( "DFrame" )
	DFrame:SetSize( 500, 65 )
	DFrame:SetPos(0,0)
	DFrame:SetDraggable( true )
	DFrame:MakePopup()
	DFrame:SetTitle( "" )
	DFrame:ShowCloseButton( false )
  LMMGUIDarkThemeMain(DFrame, "Testing!")

  local TestBtn = vgui.Create( "DButton", DFrame )
	TestBtn:SetPos( 10, 40 )
	TestBtn:SetSize( DFrame:GetWide() - 20,20 )
	TestBtn:SetText( "Test Button" )
  TestBtn.OnCursorEntered = function(self)
		self.hover = true
	end
	TestBtn.OnCursorExited = function(self)
		self.hover = false
	end
  LMMGUIDarkThemeBtn(TestBtn)
	TestBtn.DoClick = function()
    LocalPlayer():ChatPrint("Clicked!")
	end


end)
