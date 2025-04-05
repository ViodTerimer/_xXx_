local StartTheme = "AmberGlow"
local function LaunchNH_Uni(LTheme)

local version = "0.9.8"
local DC = "https://discord.gg/EEMafffGeY"

local PW = "WTHP-Vincent"
local NHIcon = 7733752575

print("")
print("-----------------------------------------------------------------")
print("-----------------------------------------------------------------")
print("LOADING: Nebula Hub | v"..version)
print("")
print("  _   _      _           _          _    _       _")
print(" | \\ | |    | |         | |        | |  | |     | |    ")
print(" |  \\| | ___| |__  _   _| | __ _   | |__| |_   _| |__  ")
print(" | . ` |/ _ \\ '_ \\| | | | |/ _` |  |  __  | | | | '_ \\ ")
print(" | |\\  |  __/ |_) | |_| | | (_| |  | |  | | |_| | |_) |")
print(" |_| \\_|\\___|_.__/ \\__,_|_|\\__,_|  |_|  |_|\\__,_|_.__/ ")
print("")
print("Version: "..version)
print("")
print("Join our Discord for Informations and the Key")
print("Link: "..DC)
print("-----------------------------------------------------------------")
print("-----------------------------------------------------------------")
print("")

local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Nebula Hub";  -- Titel der Nachricht
    Text = "Loading Nebula Hub";  -- Nachrichtentext
    Duration = 10;  -- Wie lange soll die Nachricht angezeigt werden? (Sekunden)
})




local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Nebula Hub | 🌎 Universial 🌎 | v" .. version,
   Icon = NHIcon, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Nebula Hub",
   LoadingSubtitle = "by venzes_",
   Theme = LTheme,

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Nebula Hub"
   },

   Discord = {
      Enabled = true, -- Prompt the user to join your Discord server if their executor supports it
      Invite = DC, -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Nebula Hub | 🌎 Universial 🌎 | v" .. version,
      Subtitle = "Enter Key",
      Note = "Free Key in our Discord in #get-nebula-hub channel| " .. DC, -- Use this to tell the user how to get a key
      FileName = "WTHP", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = Key -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

-- Tabs

local MainTab = Window:CreateTab("Main Tab", 7733960981) -- Title, Image

local HBE = Window:CreateTab("HitBox Extender", 7733771982) -- Title, Image

local OtherScripts = Window:CreateTab("Other Features", 7734058345) -- Title, Image


local Divider = MainTab:CreateDivider()
local Divider = HBE:CreateDivider()
local Divider = OtherScripts:CreateDivider()

-- Main Tab

local Section = MainTab:CreateSection("Discord")

local Button = MainTab:CreateButton({
	Name = "Copy Discord Invite Link",
	Callback = function()
		setclipboard(tostring(DC))
		Rayfield:Notify({
  		Title = "Link Copied",
   		Content = "The Discord Invite Link has been copied into your clipboard. Paste it into your Brower.",
   		Duration = 6.5,
   		Image = NHIcon,
})
	end
})

local Section = MainTab:CreateSection("Player Settings")

local PST

local Toggle = MainTab:CreateToggle({
   Name = "Toggle Player Settings",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   PST = Value
end,
})

local PSS

local Input = MainTab:CreateInput({
   Name = "Set Player Walkspeed (Max. 10k recommended)",
   CurrentValue = "",
   PlaceholderText = "Speed",
   RemoveTextAfterFocusLost = true,
   Flag = "Input1",
   Callback = function(Text)
	PSS = Text 
	while PST == true do
		wait(0.001)
		game.workspace[game.Players.LocalPlayer.Name].Humanoid.WalkSpeed = PSS 
	end
   end,
})

local PSJH

local Input = MainTab:CreateInput({
   Name = "Set Player Jumpheight (Max. 1k)",
   CurrentValue = "",
   PlaceholderText = "Jump Height",
   RemoveTextAfterFocusLost = true,
   Flag = "Input1",
   Callback = function(Text)
	PSJH = Text 
	while PST == true do
		wait(0.001)
		game.workspace[game.Players.LocalPlayer.Name].Humanoid.JumpPower = PSJH 
	end
   end,
})

local InfiniteJumpEnabled

local Toggle = MainTab:CreateToggle({
	Name = "Enable Infinite Jump",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		InfiniteJumpEnabled = Value
		game:GetService("UserInputService").JumpRequest:connect(function()
			if InfiniteJumpEnabled then
				game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
			end
		end)
	end
})

local Section = MainTab:CreateSection("Nebula Hub made by venzes_, StriderLp and Mega.")


-- HBE

local Section = HBE:CreateSection("HitBox Extender")

local Section = HBE:CreateSection("use ;esp in Infinite Yield to see Player throught Walls")

local function HBEnotON()
	Rayfield:Notify({
	Title = "HitBox Extender not Enabled",
	Content = "Turn it on befor using it",
	Duration = 6.5,
	Image = NHIcon,
	})
end

local HBEon

local HBEnum

local Toggle = HBE:CreateToggle({
   Name = "Enable HitBox Extender",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		HBEon = Value
		if HBEon == true then
			print("HBE is now Enabled")
		elseif HBEon == false then
			HBEnum = 1.5
			_G.HeadSize = HBEnum -- 
			_G.Disabled = true
			game:GetService('RunService').RenderStepped:connect(function()
			if _G.Disabled then
			for i,v in next, game:GetService('Players'):GetPlayers() do
			if v.Name ~= game:GetService('Players').LocalPlayer.Name then
			pcall(function()
			v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
			v.Character.Head.Transparency = 1
			v.Character.Head.BrickColor = BrickColor.new("Red")
			v.Character.Head.Material = "Neon"
			v.Character.Head.CanCollide = false
			v.Character.Head.Massless = true
			end)
			end
			end
			end
			end)
		end
   end,
})

local Input = HBE:CreateInput({
   Name = "Enter Radius",
   CurrentValue = "",
   PlaceholderText = "Radius",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
		if HBEon == true then
			print(Text)
			HBEnum = Text
			_G.HeadSize = HBEnum -- 
			_G.Disabled = true
			game:GetService('RunService').RenderStepped:connect(function()
			if _G.Disabled then
			for i,v in next, game:GetService('Players'):GetPlayers() do
			if v.Name ~= game:GetService('Players').LocalPlayer.Name then
			pcall(function()
			v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
			v.Character.Head.Transparency = 1
			v.Character.Head.BrickColor = BrickColor.new("Red")
			v.Character.Head.Material = "Neon"
			v.Character.Head.CanCollide = false
			v.Character.Head.Massless = true
			end)
			end
			end
			end
			end)
		else
			print("HBE not Enabled")
			HBEnotON()
		end
   end,
})

local Slider = HBE:CreateSlider({
   Name = "Choose Radius (1.5 to 10)",
   Range = {1.5, 10},
   Increment = 0.1,
   Suffix = "studs",
   CurrentValue = 1.5,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		if HBEon == true then
			print(Value)
			HBEnum = Value
			_G.HeadSize = HBEnum -- 
			_G.Disabled = true
			game:GetService('RunService').RenderStepped:connect(function()
			if _G.Disabled then
			for i,v in next, game:GetService('Players'):GetPlayers() do
			if v.Name ~= game:GetService('Players').LocalPlayer.Name then
			pcall(function()
			v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
			v.Character.Head.Transparency = 1
			v.Character.Head.BrickColor = BrickColor.new("Red")
			v.Character.Head.Material = "Neon"
			v.Character.Head.CanCollide = false
			v.Character.Head.Massless = true
			end)
			end
			end
			end
			end)
		else
			print("HBE not Enabled")
			HBEnotON()
		end
   end,
})

local Button = HBE:CreateButton({
	Name = "Check current HBE",
	Callback = function()
		if HBEnum == nil then
			Rayfield:Notify({
			Title = "Check Current HBE",
			Content = "No active HitBox Extender. Standart Roblox Headsize active.",
			Duration = 6.5,
			Image = NHIcon
			})
		else
			Rayfield:Notify({
			Title = "Check Current HBE",
			Content = "Current HitBox Extender: "..HBEnum,
			Duration = 6.5,
			Image = NHIcon,
			})
		end
	end
})

local Section = HBE:CreateSection("Common Used")

local CommonHBEs
local Dropdown = HBE:CreateDropdown({
   Name = "Common Used HitBox Extenders",
   Options = {1,2,3,5,10,20,30,50,80,100,150,200,300,500,1000},
   CurrentOption = {"Select HBE"},
   MultipleOptions = false,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
		for _, v in ipairs(Options) do
			CommonHBEs = v
		end
		if HBEon == true then
			print(CommonHBEs)
			HBEnum = CommonHBEs
			_G.HeadSize = HBEnum -- 
			_G.Disabled = true
			game:GetService('RunService').RenderStepped:connect(function()
			if _G.Disabled then
			for i,v in next, game:GetService('Players'):GetPlayers() do
			if v.Name ~= game:GetService('Players').LocalPlayer.Name then
			pcall(function()
			v.Character.Head.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
			v.Character.Head.Transparency = 1
			v.Character.Head.BrickColor = BrickColor.new("Red")
			v.Character.Head.Material = "Neon"
			v.Character.Head.CanCollide = false
			v.Character.Head.Massless = true
			end)
			end
			end
			end
			end)
		else
			print("HBE not Enabled")
			HBEnotON()
		end
   end,
})


-- Other Scripts

local Section = OtherScripts:CreateSection("Zoom")

local Zoom = false
local ZoomToggle1 = OtherScripts:CreateToggle({
   Name = "Enable Zoom",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		Zoom = Value
   end
})

local Keybind = OtherScripts:CreateKeybind({
   Name = "Zoom Keybind",
   CurrentKeybind = "Z",
   HoldToInteract = true,
   Flag = "Keybind1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Keybind)
		if Keybind == true and Zoom == true then
			game.workspace.Camera.FieldOfView = 5
		else
			game.workspace.Camera.FieldOfView = 70
		end
   end,
})


local Section = OtherScripts:CreateSection("Load Scripts")

local Button = OtherScripts:CreateButton({
	Name = "Load Infinite Yield",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})

local Button = OtherScripts:CreateButton({
	Name = "Load Air Hub Aimbot",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
  	end    
})

local Button = OtherScripts:CreateButton({
	Name = "Load Chat Filter Bypass (Alt best Setting)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Synergy-Networks/products/main/BetterBypasser/loader.lua",true))()
	end    
})

local Button = OtherScripts:CreateButton({
	Name = "Load Dex Debugging Tool (Load only once)",
	Callback = function()
		loadstring(game:HttpGet("https://gist.githubusercontent.com/venzes000/fe0d12d7b2045cf5f8c3fa8dcecf68da/raw/a0e2dfc5375d58553e15bddffcacb35a64572c3b/Dex%2520Debuging%2520Tool%2520v1"))()
	end    
})

local Section = OtherScripts:CreateSection("GUI Settings")

local Button = OtherScripts:CreateButton({
	Name = "Terminate GUI",
	Callback = function()
		Rayfield:Destroy()
	end
})

local Dropdown = OtherScripts:CreateDropdown({
   Name = "Select GUI Theme",
   Options = {"AmberGlow","Amethyst","DarkBlue","Ocean","DarkBlue","Light","Serenity","Default"},
   CurrentOption = {StartTheme},
   MultipleOptions = false,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
		for _, v in ipairs(Options) do
			print(v)
			StartTheme = v
			Rayfield:Destroy()
			LaunchNH_Uni(StartTheme)
		end
   end,
})

local Button = OtherScripts:CreateButton({
	Name = "Restart GUI",
	Callback = function()
		LaunchNH_Uni(StartTheme)
	end
})



end -- REAL END OF NEBULA HUB



LaunchNH_Uni(StartTheme)

