local StartTheme = "AmberGlow"
local function LaunchNH_WT(LTheme)

local version = "0.9.9.1"
local DC = "https://discord.gg/EEMafffGeY"
local Key = {"667756", "WTHP"}
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
   Name = "Nebula Hub | ⚔️ War Tycoon ⚡ | v" .. version,
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
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = DC, -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Nebula Hub | ⚔️ War Tycoon ⚡ | v" .. version,
      Subtitle = "Enter Key",
      Note = "Free Key in our Discord in #get-nebula-hub channel| " .. DC, -- Use this to tell the user how to get a key
      FileName = "WTHP", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = Key -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

-- Taps
local MainTab = Window:CreateTab("Main Tab", 7733960981) -- Title, Image

local HomeTP = Window:CreateTab("Home Teleport Points", 7733954760) -- Title, Image

local BaseTP = Window:CreateTab("Teleport Points", 7733954611) -- Title, Image

local HBE = Window:CreateTab("HitBox Extender", 7733771982) -- Title, Image

local WS = Window:CreateTab("Gun Scripts", 7733992424) -- Title, Image

local OtherScripts = Window:CreateTab("Other Features", 7734058345) -- Title, Image

local LoadScripts = Window:CreateTab("Load Scripts", 7733770755) -- Title, Image


-- Dividers

local Divider = MainTab:CreateDivider()
local Divider = HomeTP:CreateDivider()
local Divider = BaseTP:CreateDivider()
local Divider = HBE:CreateDivider()
local Divider = WS:CreateDivider()
local Divider = OtherScripts:CreateDivider()
local Divider = LoadScripts:CreateDivider()


-- Main Tab

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

local Input = MainTab:CreateInput({
   Name = "Execute Own Code",
   CurrentValue = "",
   PlaceholderText = "Put Code here",
   RemoveTextAfterFocusLost = true,
   Flag = "Input1",
   Callback = function(Text)
	loadstring(tostring(Text))()
   end,
})

local Section = MainTab:CreateSection("Player Settings")

local PST

local Toggle = MainTab:CreateToggle({
   Name = "Toggle Player Settings",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
   PST = Value
   if PST == false then
		game.workspace[game.Players.LocalPlayer.Name].Humanoid.WalkSpeed = 16 
   	end
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

local Button = MainTab:CreateButton({
	Name = "Remove Fall Damage",
	Callback = function()
		if game.ReplicatedStorage.ACS_Engine.Events:FindFirstChild("FDMG") then
			game.ReplicatedStorage.ACS_Engine.Events.FDMG:Destroy()
		end
	end
})





local Section = MainTab:CreateSection("Nebula Hub made by venzes_, StriderLp and Mega.")


-- Home TP

local HTP = HomeTP:CreateSection("Teleport Points inside your Base")

local checked = 0

local Button = HomeTP:CreateButton({
	Name = "Check Team (click here while in your Base)",
	Callback = function()

		local Team = game.Players.LocalPlayer.Team.Name
		print(Team)

		local loadout
		local OilHouse
		local Nuke
		local Bunker
		local Vehicle
		local Tank
		local Heli
		local Plane
		local Boat
		local Ship
		local Drone
				
		local TankCrate
		local HeliCrate
		local PlaneCrate



		if game.workspace.Tycoon.Tycoons[Team].PurchasedObjects:FindFirstChild("Loadout") then
			loadout = game.workspace.Tycoon.Tycoons[Team].PurchasedObjects.Loadout.Prompt.CFrame
		end
		
		if game.workspace.Tycoon.Tycoons[Team].Essentials["Oil Collector"]:FindFirstChild("Table") then
			OilHouse = game.workspace.Tycoon.Tycoons[Team].Essentials["Oil Collector"].Table.CFrame
		end

		if game.workspace.Tycoon.Tycoons[Team].PurchasedObjects:FindFirstChild("Missile Control Panel") then
			Nuke = game.workspace.Tycoon.Tycoons[Team].PurchasedObjects["Missile Control Panel"].Concrete.CFrame
		end

		if game.workspace.Tycoon.Tycoons[Team].Essentials:FindFirstChild("CashCollector2") then
			Bunker = game.workspace.Tycoon.Tycoons[Team].Essentials.CashCollector2.CFrame
		end

		if game.workspace.Tycoon.Tycoons[Team].PurchasedObjects:FindFirstChild("VehicleFloor") then
			if game.workspace.Tycoon.Tycoons[Team].PurchasedObjects.VehicleFloor.Spawner:FindFirstChild("Vehicle Spawner") then
				Vehicle = game.workspace.Tycoon.Tycoons[Team].PurchasedObjects.VehicleFloor.Spawner["Vehicle Spawner"].CFrame
			end
		end

		if game.workspace.Tycoon.Tycoons[Team].PurchasedObjects:FindFirstChild("Tank Building Floor") then
			if game.workspace.Tycoon.Tycoons[Team].PurchasedObjects["Tank Building Floor"].Spawner:FindFirstChild("Vehicle Spawner") then
				Tank = game.workspace.Tycoon.Tycoons[Team].PurchasedObjects["Tank Building Floor"].Spawner["Vehicle Spawner"].CFrame
			end
		end

		if game.workspace.Tycoon.Tycoons[Team].PurchasedObjects:FindFirstChild("Helipad") then
			Heli = game.workspace.Tycoon.Tycoons[Team].PurchasedObjects.Helipad.Spawner["Vehicle Spawner"].CFrame
		end

		if game.workspace.Tycoon.Tycoons[Team].PurchasedObjects:FindFirstChild("Plane Start") then
			Plane = game.workspace.Tycoon.Tycoons[Team].PurchasedObjects["Plane Start"]["Vehicle Spawner"].CFrame
		end

		if game.workspace.Tycoon.Tycoons[Team].PurchasedObjects:FindFirstChild("Dock Path") then
			Boat = game.workspace.Tycoon.Tycoons[Team].PurchasedObjects["Dock Path"].Spawner["Vehicle Spawner"].CFrame
		end

		if game.workspace.Tycoon.Tycoons[Team].PurchasedObjects:FindFirstChild("Ships Start") then
			Ship = game.workspace.Tycoon.Tycoons[Team].PurchasedObjects["Ships Start"].Spawner["Vehicle Spawner"].CFrame
		end

		if game.workspace.Tycoon.Tycoons[Team].PurchasedObjects:FindFirstChild("Drone Spawner") then
			Drone = game.workspace.Tycoon.Tycoons[Team].PurchasedObjects["Drone Spawner"]["Office Chair"].Mesh.CFrame
		end

		if game.workspace.Tycoon.Tycoons[Team].PurchasedObjects:FindFirstChild("Tank Storage") then
			TankCrate = game.workspace.Tycoon.Tycoons[Team].PurchasedObjects["Tank Storage"]["Office Chair"].Mesh.CFrame
		end

		if game.workspace.Tycoon.Tycoons[Team].PurchasedObjects:FindFirstChild("Helicopter Storage Research Upgrade") then
			HeliCrate = game.workspace.Tycoon.Tycoons[Team].PurchasedObjects["Helicopter Storage Research Upgrade"]["Office Chair"].Mesh.CFrame
		end

		if game.workspace.Tycoon.Tycoons[Team].PurchasedObjects:FindFirstChild("Plane Storage") then
			PlaneCrate = game.workspace.Tycoon.Tycoons[Team].PurchasedObjects["Plane Storage"]["Office Chair"].Mesh.CFrame
		end


		print(loadout)
		print(OilHouse)
		print(Nuke)
		print(Bunker)

		print(Vehicle)
		print(Tank)
		print(Heli)
		print(Plane)
		print(Boat)
		print(Ship)
		print(Drone)

		print(TankCrate)
		print(HeliCrate)
		print(PlaneCrate)

		if checked == 0 then

			checked = checked + 1

			local Section = HomeTP:CreateSection("Important")

			local Button = HomeTP:CreateButton({
				Name = "Loadout",
				Callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = loadout
				end
			})
			local Button = HomeTP:CreateButton({
				Name = "Oil House",
				Callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = OilHouse
				end
			})
			local Button = HomeTP:CreateButton({
				Name = "Nuke",
				Callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Nuke
				end
			})
			local Button = HomeTP:CreateButton({
				Name = "Bunker",
				Callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Bunker
				end
			})

			local Section = HomeTP:CreateSection("Spawners")

			local Button = HomeTP:CreateButton({
				Name = "Vehicle Spawner",
				Callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Vehicle
				end
			})
			local Button = HomeTP:CreateButton({
				Name = "Tank Spawner",
				Callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Tank
				end
			})
			local Button = HomeTP:CreateButton({
				Name = "Heli Spawner",
				Callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Heli
				end
			})
			local Button = HomeTP:CreateButton({
				Name = "Plane Spawner",
				Callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Plane
				end
			})
			local Button = HomeTP:CreateButton({
				Name = "Boat Spawner",
				Callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Boat
				end
			})
			local Button = HomeTP:CreateButton({
				Name = "Ship Spawner",
				Callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Ship
				end
			})
			local Button = HomeTP:CreateButton({
				Name = "Drone Spawner",
				Callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = Drone
				end
			})

			local Section = HomeTP:CreateSection("Own Crates")

			local Button = HomeTP:CreateButton({
				Name = "Own Tank Crates",
				Callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = TankCrate
				end
			})
			local Button = HomeTP:CreateButton({
				Name = "Own Heli Crates",
				Callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = HeliCrate
				end
			})
			local Button = HomeTP:CreateButton({
				Name = "Own Plane Crates",
				Callback = function()
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = PlaneCrate
				end
			})
		end
	end
})




-- Base TPs

local Section = BaseTP:CreateSection("Direct Base Teleport")

local BTP

local Dropdown = BaseTP:CreateDropdown({
   Name = "Select Base",
   Options = {"Select Base","Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","Juliet","Kilo","Lima","Omega","Romeo","Sierra","Tango","Victor","Yankee","Zulu"},
   CurrentOption = {"Select Base"},
   MultipleOptions = false,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
   	for _, value in ipairs(Options) do
            print(value)
            BTP = value
        end
    end,
})

local Button = BaseTP:CreateButton({
	Name = "Teleport to selected Base",
	Callback = function()
	if BTP == "Alpha" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1099.08374, 72.0714035, -4610.33643, 0.972942889, 0.00347443926, 0.231019497, -9.25238552e-09, 0.99988693, -0.0150378533, -0.231045619, 0.0146309715, 0.972832918)
            elseif BTP == "Bravo" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-18.673843, 71.9703369, -4718.31152, 0.999959052, -0.000772632658, 0.00901635364, 9.41616474e-09, 0.996348619, 0.0853784233, -0.00904939789, -0.0853749216, 0.99630779)
            elseif BTP == "Charlie" then
				game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(786.673828, 74.358429, -4535.45166, 0.970290065, 0.0110541843, -0.241692007, 8.54569837e-09, 0.998955727, 0.0456889272, 0.241944671, -0.0443315133, 0.969276786)
			elseif BTP == "Delta" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1926.06055, 74.4656906, -3823.44141, 0.679933846, -0.0224574078, -0.732929468, 1.31147071e-09, 0.999530911, -0.0306262393, 0.733273447, 0.0208238158, 0.679614902)
            elseif BTP == "Echo" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2589.22876, 74.3271408, -2908.73779, 0.453967661, 0.0124620507, -0.89093101, 8.19461921e-09, 0.999902189, 0.0139863081, 0.891018152, -0.00634933868, 0.453923255)
            elseif BTP == "Foxtrot" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2854.14111, 73.8452911, -1757.13916, 0.0411529616, -0.00535943639, -0.999138474, 8.62091643e-09, 0.999985635, -0.00536397984, 0.999152839, 0.000220735048, 0.0411523692)
            elseif BTP == "Golf" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3179.06763, 73.9208221, -531.381958, -0.016778525, 0.190717876, -0.98150146, 8.93375063e-09, 0.981639683, 0.190744728, 0.999859214, 0.00320040644, -0.0164704677)
            elseif BTP == "Hotel" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3098.63696, 73.897316, 581.313782, -0.198365912, -0.00420259917, -0.98011905, 8.46591952e-09, 0.999990821, -0.00428780774, 0.98012805, -0.00085056317, -0.198364079)
            elseif BTP == "Juliet" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2760.15625, 74.0659943, 1788.85693, -0.248037308, 0.0213610344, -0.968514919, 9.51288026e-09, 0.999756873, 0.0220500864, 0.968750477, 0.00546923513, -0.247977003)
            elseif BTP == "Kilo" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2384.13428, 75.6838531, 2852.6875, -0.512664318, 0.0558174625, -0.85677284, -6.84471813e-09, 0.997884572, 0.0650106817, 0.858589113, 0.0333286636, -0.511579812)
            elseif BTP == "Lima" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(778.702393, 74.0329361, 3388.71753, -0.35578385, -0.0381601006, -0.933788896, -7.20699278e-09, 0.999166012, -0.0408317931, 0.934568286, -0.0145272855, -0.355487138)
            elseif BTP == "Omega" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-354.283325, 74.0413818, 3743.00928, -0.999316514, 0.00143077585, -0.0369386375, -8.53127435e-09, 0.99925065, 0.0387050621, 0.0369663388, 0.0386786088, -0.9985677)
            elseif BTP == "Romeo" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1425.44287, 74.4657135, 3527.26978, -0.894455016, 0.00816715322, 0.447083354, -6.56779209e-09, 0.999833167, -0.0182645973, -0.447157949, -0.0163368639, -0.894305825)
            elseif BTP == "Sierra" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2413.13525, 74.2920074, 2381.47168, -0.686560214, -0.0238456037, 0.726681828, 1.36900535e-08, 0.999462068, 0.0327967256, -0.727072954, 0.0225169361, -0.686190844)
            elseif BTP == "Tango" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2878.13477, 74.4595642, 1349.40808, -0.575268865, 0.0276870616, 0.817495644, 1.1736037e-08, 0.999426961, -0.033848729, -0.817964375, -0.019472111, -0.574939251)
            elseif BTP == "Victor" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3435.20654, 74.0940094, 509.059113, -0.474986166, -0.0906744748, 0.875309229, 1.78062383e-08, 0.994677246, 0.103039972, -0.87999326, 0.0489425734, -0.472457916)
            elseif BTP == "Yankee" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3777.43506, 71.8749008, -368.703583, -0.240541101, -0.0552883558, 0.969063044, 9.39543376e-09, 0.998376429, 0.0569607876, -0.970638931, 0.0137014193, -0.240150556)
            elseif BTP == "Zulu" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3855.55566, 72.212326, -1365.77698, -0.00904913805, 0.0214897227, 0.999728143, 8.36807157e-09, 0.999769032, -0.0214906037, -0.999959052, -0.000194463064, -0.00904704817)
            end 
		end,
})





local Section = BaseTP:CreateSection("Air Base Teleports")

local ABTP

local Dropdown = BaseTP:CreateDropdown({
   Name = "Select Air Teleport",
   Options = {"Select Air Base","Alpha","Bravo","Charlie","Delta","Echo","Foxtrot","Golf","Hotel","Juliet","Kilo","Lima","Omega","Romeo","Sierra","Tango","Victor","Yankee","Zulu"},
   CurrentOption = {"Select Air Base"},
   MultipleOptions = false,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
	for _, value in ipairs(Options) do
            print(value)
            ABTP = value
		end
   end,
})

local Button = BaseTP:CreateButton({
	Name = "Teleport to Air Base",
	Callback = function()
	if ABTP == "Alpha" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1112.47522, 1475.80383, -4643.54053, 0.921960771, -0.376170516, 0.0921092704, -4.9381037e-09, 0.237834319, 0.971305728, -0.387283325, -0.895505786, 0.21927391)
	elseif ABTP == "Bravo" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-209.620193, 1689.68091, -4756.44238, 0.999796569, -0.0198538192, 0.0035489467, -7.59740093e-09, 0.175964296, 0.984396577, -0.0201685186, -0.984196305, 0.175928503)
	elseif ABTP == "Charlie" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(771.673279, 1689.68018, -4593.46338, 0.970002115, 0.239403263, -0.0422133431, -3.7618344e-09, 0.173648551, 0.98480767, 0.243096456, -0.955265522, 0.168439463)
	elseif ABTP == "Delta" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1971.66223, 1689.68054, -3845.4187, 0.739462793, 0.662970006, -0.116899751, -1.05013882e-08, 0.173648551, 0.98480767, 0.673197448, -0.728228629, 0.128406644)
	elseif ABTP == "Echo" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2632.17163, 1689.68054, -2933.18701, 0.407704622, 0.899241567, -0.158560887, 1.53899666e-08, 0.173648521, 0.98480767, 0.913113892, -0.401510656, 0.0707972944)
	elseif ABTP == "Foxtrot" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2916.48413, 1689.68103, -1707.58679, -0.000336280267, 0.984807611, -0.173648641, 7.01105218e-09, 0.173648655, 0.98480767, 0.99999994, 0.000331170188, -5.84015215e-05)
	elseif ABTP == "Golf" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3228.4729, 1781.02722, -480.604828, 0.017988665, 0.984648347, -0.173620239, 1.12763683e-08, 0.173648342, 0.98480773, 0.999838173, -0.0177153777, 0.00312369061)
	elseif ABTP == "Hotel" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3066.68311, 1676.75049, 599.259888, -0.135530174, 0.975721121, -0.172046065, -9.00993857e-09, 0.173648283, 0.98480773, 0.990773201, 0.133471161, -0.0235345718)
	elseif ABTP == "Juliet" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2822.24902, 1690.01782, 1787.17419, -0.240469888, 0.95360738, -0.181127712, 7.13047799e-09, 0.186603293, 0.982435346, 0.970656574, 0.236246124, -0.0448724814)
	elseif ABTP == "Kilo" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2445.59546, 1142.48499, 2887.35034, -0.502866447, 0.851232409, -0.150095642, -1.20778143e-08, 0.173648611, 0.98480767, 0.864364147, 0.495226711, -0.0873220488)
	elseif ABTP == "Lima" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(826.1026, 2061.48022, 3331.55811, -0.33347556, 0.928436041, -0.163708791, -1.52631543e-08, 0.173648655, 0.98480767, 0.942758739, 0.328409284, -0.0579075702)
	elseif ABTP == "Omega" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-326.830872, 2061.48022, 3707.72339, -0.999773264, 0.02097046, -0.00369767519, -8.97616381e-09, 0.173648551, 0.98480767, 0.0212939661, 0.984584391, -0.173609182)
	elseif ABTP == "Romeo" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1378.83984, 2061.48022, 3523.89966, -0.914678872, -0.39804092, 0.0701854825, -5.43980017e-09, 0.173648506, 0.98480767, -0.404181361, 0.900782764, -0.15883261)
	elseif ABTP == "Sierra" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2416.91602, 2105.0791, 2451.49219, -0.721882463, -0.681502342, 0.120167442, -8.19148482e-09, 0.173648447, 0.98480773, -0.692015648, 0.710915446, -0.125353783)
	elseif ABTP == "Tango" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-2907.30835, 2359.14893, 1432.2085, -0.567201376, -0.811067104, 0.143013209, -2.75705525e-09, 0.173648417, 0.98480773, -0.823579133, 0.558584273, -0.0984936208)
	elseif ABTP == "Victor" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3444.94824, 2359.14893, 494.865295, -0.495842278, -0.855219364, 0.150798902, 1.96699173e-08, 0.173648909, 0.984807611, -0.868412614, 0.488309264, -0.0861024559)
	elseif ABTP == "Yankee" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3780.24902, 2359.14893, -353.214386, -0.280419976, -0.945294619, 0.166681468, -7.47325402e-09, 0.1736487, 0.98480767, -0.959877431, 0.276159734, -0.0486945696)
	elseif ABTP == "Zulu" then
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3869.9165, 2359.14893, -1304.6156, 0.0175348558, -0.984656215, 0.173622042, -8.66981509e-09, 0.17364873, 0.98480767, -0.99984628, -0.0172684621, 0.00304489699)
		end
	end,
})




local Section = BaseTP:CreateSection("Oil Teleports")

local OTP

local Dropdown = BaseTP:CreateDropdown({
   Name = "Select Oil Teleport",
   Options = {"Select Oil Teleport","City Oil (NW)","City Oil (SW)","Oil Rig (Kilo)","Oil Rig (Alpha)","Oil Rig (Zulu)"},
   CurrentOption = {"Select Oil Base"},
   MultipleOptions = false,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
	for _, value in ipairs(Options) do
            print(value)
            OTP = value
		end
   end,
})

local Button = BaseTP:CreateButton({
	Name = "Teleport selected Oil",
	Callback = function()
		if OTP == "City Oil (NW)" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1215.76904, 67.0999756, -1875.28296, -0.669261694, -6.13164843e-08, -0.743026793, -2.29970993e-08, 1, -6.18085565e-08, 0.743026793, -2.4278636e-08, -0.669261694)
		elseif OTP == "City Oil (SW)" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-975.863586, 69.3309021, -807.150574, 0.583958685, 9.85394806e-08, 0.811783373, -1.12202585e-08, 1, -1.13315103e-07, -0.811783373, 5.70629162e-08, 0.583958685)
		elseif OTP == "Oil Rig (Kilo)" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(669.802612, 121.252426, 780.885681, 0.76334393, -3.7006199e-08, 0.645992279, 5.51239099e-09, 1, 5.07720443e-08, -0.645992279, -3.51955691e-08, 0.76334393)
		elseif OTP == "Oil Rig (Alpha)" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1683.05469, 121.252411, -3529.62402, 0.99970597, -8.49437354e-10, 0.024247542, 6.21097562e-10, 1, 9.4245598e-09, -0.024247542, -9.40672873e-09, 0.99970597)
		elseif OTP == "Oil Rig (Zulu)" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-3532.09302, 121.252411, -2661.13428, -0.0266299471, -5.40487335e-08, -0.999645352, -6.77178491e-08, 1, -5.22639461e-08, 0.999645352, 6.6302043e-08, -0.0266299471)
		end
	end
})




local Section = BaseTP:CreateSection("Other Teleports")

local OTTP

local Dropdown = BaseTP:CreateDropdown({
   Name = "Select Other Teleport",
   Options = {"Select Other Teleports","City Main House","Direct Capture Flag","Twin Towers (SW)","Twin Towers (N)","Highest Building (City)","AC130 / Skydive Player Spot"},
   CurrentOption = {"Select Other Teleports"},
   MultipleOptions = false,
   Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Options)
	for _, value in ipairs(Options) do
            print(value)
            OTTP = value
		end
   end,
})

local Button = BaseTP:CreateButton({
	Name = "Teleport to selected Point",
	Callback = function()
		if OTTP == "City Main House" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-551.310547, 71.5843506, -1357.11938, -0.872329414, 8.48073967e-09, -0.488918602, 2.43779175e-09, 1, 1.29964004e-08, 0.488918602, 1.01452606e-08, -0.872329414)
		elseif OTTP == "Direct Capture Flag" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-655.634583, 121.931961, -1254.91028, 0.608099937, 3.39606032e-08, -0.793860495, -3.56340069e-09, 1, 4.00494784e-08, 0.793860495, -2.1525242e-08, 0.608099937)
		elseif OTTP == "Twin Towers (SW)" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-719.622803, 301.837463, -918.376404, -0.0945528373, -1.70780297e-07, -0.995519817, -6.52259968e-10, 1, -1.71486903e-07, 0.995519817, -1.55652362e-08, -0.0945528373)
		elseif OTTP == "Twin Towers (N)" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-864.571533, 231.284225, -1663.10693, 0.996769369, -9.67321157e-08, -0.080317162, 9.73761303e-08, 1, 4.10159684e-09, 0.080317162, -1.19093198e-08, 0.996769369)
		elseif OTTP == "Highest Building (City)" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-165.534775, 461.286591, -1448.48779, 0.0595017523, -9.01928132e-08, 0.998228192, -9.10892972e-10, 1, 9.04071982e-08, -0.998228192, -6.28866559e-09, 0.0595017523)
		elseif OTTP == "AC130 / Skydive Player Spot" then
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1437.57495, -126.843994, -1502.49402, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		end
	end
})




-- HitBox Extender

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


-- Inf Amm0

local Advice = WS:CreateSection("!!! Activate befor equiping Weapon or it wont work !!!")

local SpecielWeapons = WS:CreateSection("Infinite Ammo")

local Button = WS:CreateButton({
	Name = "All Weapons Inf Ammo (In your Inventory)",
	Callback = function()
		local function InfAmmo(gun)
			if game.ReplicatedStorage.Configurations.ACS_Guns:FindFirstChild(gun) then
				game.ReplicatedStorage.Configurations.ACS_Guns[gun].Ammo.Value = 999999999999999999999999999999999999999999999999999999
			end
		end

		InfAmmo("RPG")
		InfAmmo("Javelin")
		InfAmmo("Remington MSR")
		InfAmmo("M40 Sniper")
		InfAmmo("Kar98K")
		InfAmmo("M1903 Springfield")
		InfAmmo("Barrett M82")
		InfAmmo("AWP")
		InfAmmo("M200 Intervention")
		InfAmmo("CS5 Sniper")
		InfAmmo("Explosive Sniper")
		InfAmmo("Dragunov SVD")
		InfAmmo("VSS Vintorez")
		InfAmmo("M110 Rifle")
		InfAmmo("Gewehr 43")
		InfAmmo("SKS")
		InfAmmo("M14")
		InfAmmo("M1 Garand")
		InfAmmo("FAL Heavy")
		InfAmmo("M1918 BAR")
		InfAmmo("G3 Rifle")
		InfAmmo("M4A1")
		InfAmmo("FAMAS")
		InfAmmo("AK47")
		InfAmmo("MK18 Rifle")
		InfAmmo("G36C")
		InfAmmo("SA80 Rifle")
		InfAmmo("SA80 LSW")
		InfAmmo("VHS-2")
		InfAmmo("HK416")
		InfAmmo("AUG A3")
		InfAmmo("IA2")
		InfAmmo("L119A2 Rifle")
		InfAmmo("Scar-L Rifle")
		InfAmmo("M16")
		InfAmmo("Tavor X95")
		InfAmmo("XM8")
		InfAmmo("Remington ACR")
		InfAmmo("AK12")
		InfAmmo("MCX Spear")
		InfAmmo("MP9")
		InfAmmo("UMP45")
		InfAmmo("Mirco UZI")
		InfAmmo("MP5")
		InfAmmo("Mac-10")
		InfAmmo("PP-19 Bizon")
		InfAmmo("PPSH")
		InfAmmo("P90")
		InfAmmo("KRISS Vector")
		InfAmmo("MP7")
		InfAmmo("Remington 870")
		InfAmmo("SPAS-12")
		InfAmmo("KSG 12")
		InfAmmo("Saiga-12k")
		InfAmmo("M17")
		InfAmmo("M1911")
		InfAmmo("Glock 19")
		InfAmmo("G17")
		InfAmmo("Desert Eagle")
		InfAmmo("USP 45")
		InfAmmo("AA-12")
		InfAmmo("Grenade Launcher")
	end
})

local Toggle = WS:CreateToggle({
   Name = "Infinite Ammo toggle (reset needed after death)",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
		while Value == true do
			local function InfAmmo(gun)
				if game.ReplicatedStorage.Configurations.ACS_Guns:FindFirstChild(gun) then
					game.ReplicatedStorage.Configurations.ACS_Guns[gun].Ammo.Value = 999999999999999999999999999999999999999999999999999999
				end
			end

			InfAmmo("RPG")
			InfAmmo("Javelin")
			InfAmmo("Remington MSR")
			InfAmmo("M40 Sniper")
			InfAmmo("Kar98K")
			InfAmmo("M1903 Springfield")
			InfAmmo("Barrett M82")
			InfAmmo("AWP")
			InfAmmo("M200 Intervention")
			InfAmmo("CS5 Sniper")
			InfAmmo("Explosive Sniper")
			InfAmmo("Dragunov SVD")
			InfAmmo("VSS Vintorez")
			InfAmmo("M110 Rifle")
			InfAmmo("Gewehr 43")
			InfAmmo("SKS")
			InfAmmo("M14")
			InfAmmo("M1 Garand")
			InfAmmo("FAL Heavy")
			InfAmmo("M1918 BAR")
			InfAmmo("G3 Rifle")
			InfAmmo("M4A1")
			InfAmmo("FAMAS")
			InfAmmo("AK47")
			InfAmmo("MK18 Rifle")
			InfAmmo("G36C")
			InfAmmo("SA80 Rifle")
			InfAmmo("SA80 LSW")
			InfAmmo("VHS-2")
			InfAmmo("HK416")
			InfAmmo("AUG A3")
			InfAmmo("IA2")
			InfAmmo("L119A2 Rifle")
			InfAmmo("Scar-L Rifle")
			InfAmmo("M16")
			InfAmmo("Tavor X95")
			InfAmmo("XM8")
			InfAmmo("Remington ACR")
			InfAmmo("AK12")
			InfAmmo("MCX Spear")
			InfAmmo("MP9")
			InfAmmo("UMP45")
			InfAmmo("Mirco UZI")
			InfAmmo("MP5")
			InfAmmo("Mac-10")
			InfAmmo("PP-19 Bizon")
			InfAmmo("PPSH")
			InfAmmo("P90")
			InfAmmo("KRISS Vector")
			InfAmmo("MP7")
			InfAmmo("Remington 870")
			InfAmmo("SPAS-12")
			InfAmmo("KSG 12")
			InfAmmo("Saiga-12k")
			InfAmmo("M17")
			InfAmmo("M1911")
			InfAmmo("Glock 19")
			InfAmmo("G17")
			InfAmmo("Desert Eagle")
			InfAmmo("USP 45")
			InfAmmo("AA-12")
			InfAmmo("Grenade Launcher")
			wait(0.0001)
		end
   end,
})

local Section = WS:CreateSection("Better Guns")

local Button = WS:CreateButton({
	Name = "No Recoil / No Spread (Not for Shotgun)",
	Callback = function()
		-- BGun = Better Guns
		local function BGun(gun)
			if game.Players.LocalPlayer.Backpack:FindFirstChild(gun) then
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("HRecoil", Vector2.new(0, 0))
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("VRecoil", Vector2.new(0, 0))
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("MaxSpread", 0)
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("MinSpread", 0)
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("SwayBase", 0)
			end
		end

		BGun("RPG")
		BGun("Javelin")
		BGun("Remington MSR")
		BGun("M40 Sniper")
		BGun("Kar98K")
		BGun("M1903 Springfield")
		BGun("Barrett M82")
		BGun("AWP")
		BGun("M200 Intervention")
		BGun("CS5 Sniper")
		BGun("Explosive Sniper")
		BGun("Dragunov SVD")
		BGun("VSS Vintorez")
		BGun("M110 Rifle")
		BGun("Gewehr 43")
		BGun("SKS")
		BGun("M14")
		BGun("M1 Garand")
		BGun("FAL Heavy")
		BGun("M1918 BAR")
		BGun("G3 Rifle")
		BGun("M4A1")
		BGun("FAMAS")
		BGun("AK47")
		BGun("MK18 Rifle")
		BGun("G36C")
		BGun("SA80 Rifle")
		BGun("SA80 LSW")
		BGun("VHS-2")
		BGun("HK416")
		BGun("AUG A3")
		BGun("IA2")
		BGun("L119A2 Rifle")
		BGun("Scar-L Rifle")
		BGun("M16")
		BGun("Tavor X95")
		BGun("XM8")
		BGun("Remington ACR")
		BGun("AK12")
		BGun("MCX Spear")
		BGun("MP9")
		BGun("UMP45")
		BGun("Mirco UZI")
		BGun("MP5")
		BGun("Mac-10")
		BGun("PP-19 Bizon")
		BGun("PPSH")
		BGun("P90")
		BGun("KRISS Vector")
		BGun("MP7")
		BGun("M17")
		BGun("M1911")
		BGun("Glock 19")
		BGun("G17")
		BGun("Desert Eagle")
		BGun("USP 45")
		BGun("Grenade Launcher")
	end
})

local Toggle = WS:CreateToggle({
	Name = "No Recoil / No Spread (Not for Shotgun) (reset needed after death)",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		while Value == true do
			-- BGun = Better Guns
			local function BGun(gun)
				if game.Players.LocalPlayer.Backpack:FindFirstChild(gun) then
					game.Players.LocalPlayer.Backpack[gun]:SetAttribute("HRecoil", Vector2.new(0, 0))
					game.Players.LocalPlayer.Backpack[gun]:SetAttribute("VRecoil", Vector2.new(0, 0))
					game.Players.LocalPlayer.Backpack[gun]:SetAttribute("MaxSpread", 0)
					game.Players.LocalPlayer.Backpack[gun]:SetAttribute("MinSpread", 0)
					game.Players.LocalPlayer.Backpack[gun]:SetAttribute("SwayBase", 0)
				end
			end

			BGun("RPG")
			BGun("Javelin")
			BGun("Remington MSR")
			BGun("M40 Sniper")
			BGun("Kar98K")
			BGun("M1903 Springfield")
			BGun("Barrett M82")
			BGun("AWP")
			BGun("M200 Intervention")
			BGun("CS5 Sniper")
			BGun("Explosive Sniper")
			BGun("Dragunov SVD")
			BGun("VSS Vintorez")
			BGun("M110 Rifle")
			BGun("Gewehr 43")
			BGun("SKS")
			BGun("M14")
			BGun("M1 Garand")
			BGun("FAL Heavy")
			BGun("M1918 BAR")
			BGun("G3 Rifle")
			BGun("M4A1")
			BGun("FAMAS")
			BGun("AK47")
			BGun("MK18 Rifle")
			BGun("G36C")
			BGun("SA80 Rifle")
			BGun("SA80 LSW")
			BGun("VHS-2")
			BGun("HK416")
			BGun("AUG A3")
			BGun("IA2")
			BGun("L119A2 Rifle")
			BGun("Scar-L Rifle")
			BGun("M16")
			BGun("Tavor X95")
			BGun("XM8")
			BGun("Remington ACR")
			BGun("AK12")
			BGun("MCX Spear")
			BGun("MP9")
			BGun("UMP45")
			BGun("Mirco UZI")
			BGun("MP5")
			BGun("Mac-10")
			BGun("PP-19 Bizon")
			BGun("PPSH")
			BGun("P90")
			BGun("KRISS Vector")
			BGun("MP7")
			BGun("M17")
			BGun("M1911")
			BGun("Glock 19")
			BGun("G17")
			BGun("Desert Eagle")
			BGun("USP 45")
			BGun("Grenade Launcher")
			wait(0.0001)
		end
	end
})

local Button = WS:CreateButton({
	Name = "No Recoil / No Spread (Only Shotguns)",
	Callback = function()
		-- BGun = Better Guns
		local function BGun(gun)
			if game.Players.LocalPlayer.Backpack:FindFirstChild(gun) then
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("HRecoil", Vector2.new(0, 0))
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("VRecoil", Vector2.new(0, 0))
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("MaxSpread", 0)
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("MinSpread", 0)
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("SwayBase", 0)
			end
		end

		BGun("Remington 870")
        BGun("SPAS-12")
        BGun("KSG 12")
        BGun("Saiga-12k")
	BGun("AA-12")
	end
})

local Toggle = WS:CreateToggle({
	Name = "No Recoil / No Spread (Only Shotguns) (reset needed after death)",
	Currentvalue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		while Value == true do
			-- BGun = Better Guns
			local function BGun(gun)
				if game.Players.LocalPlayer.Backpack:FindFirstChild(gun) then
					game.Players.LocalPlayer.Backpack[gun]:SetAttribute("HRecoil", Vector2.new(0, 0))
					game.Players.LocalPlayer.Backpack[gun]:SetAttribute("VRecoil", Vector2.new(0, 0))
					game.Players.LocalPlayer.Backpack[gun]:SetAttribute("MaxSpread", 0)
					game.Players.LocalPlayer.Backpack[gun]:SetAttribute("MinSpread", 0)
					game.Players.LocalPlayer.Backpack[gun]:SetAttribute("SwayBase", 0)
				end
			end

			BGun("Remington 870")
			BGun("SPAS-12")
			BGun("KSG 12")
			BGun("Saiga-12k")
			BGun("AA-12")
			wait(0.0001)
		end
	end
})

local Section = WS:CreateSection("FireRate")

local Button = WS:CreateButton({
   Name = "Super M4A1 (100k Firerate)",
   Callback = function()
		local function SuperM4A1(gun)
			if game.ReplicatedStorage.Configurations.ACS_Guns:FindFirstChild(gun) then
				game.ReplicatedStorage.Configurations.ACS_Guns[gun].Ammo.Value = 999999999999999999999999999999999999999999999999999999
			end

			if game.Players.LocalPlayer.Backpack:FindFirstChild(gun) then
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("HRecoil", Vector2.new(0, 0))
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("VRecoil", Vector2.new(0, 0))
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("MaxSpread", 0)
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("MinSpread", 0)
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("SwayBase", 0)
			end
	
			if game.Players.LocalPlayer.Backpack:FindFirstChild("M4A1") then
				game.Players.LocalPlayer.Backpack["M4A1"]:SetAttribute("FireRate", 100000)
			end
		end
		SuperM4A1("M4A1")
   end,
})

local Input = WS:CreateInput({
   Name = "Change Weapon by Name",
   CurrentValue = "",
   PlaceholderText = "Inventory Name",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
		game.Players.LocalPlayer.Backpack[Text]:SetAttribute("FireRate", 100000)
   end,
})

local Button = WS:CreateButton({
   Name = "Change All Weapons",
   Callback = function()
		local function FR(gun)
			if game.Players.LocalPlayer.Backpack:FindFirstChild(gun) then
				game.Players.LocalPlayer.Backpack[gun]:SetAttribute("FireRate", 100000)
			end
		end

		FR("RPG")
		FR("Javelin")
		FR("Remington MSR")
		FR("M40 Sniper")
		FR("Kar98K")
		FR("M1903 Springfield")
		FR("Barrett M82")
		FR("AWP")
		FR("M200 Intervention")
		FR("CS5 Sniper")
		FR("Explosive Sniper")
		FR("Dragunov SVD")
		FR("VSS Vintorez")
		FR("M110 Rifle")
		FR("Gewehr 43")
		FR("SKS")
		FR("M14")
		FR("M1 Garand")
		FR("FAL Heavy")
		FR("M1918 BAR")
		FR("G3 Rifle")
		FR("M4A1")
		FR("FAMAS")
		FR("AK47")
		FR("MK18 Rifle")
		FR("G36C")
		FR("SA80 Rifle")
		FR("SA80 LSW")
		FR("VHS-2")
		FR("HK416")
		FR("AUG A3")
		FR("IA2")
		FR("L119A2 Rifle")
		FR("Scar-L Rifle")
		FR("M16")
		FR("Tavor X95")
		FR("XM8")
		FR("Remington ACR")
		FR("AK12")
		FR("MCX Spear")
		FR("MP9")
		FR("UMP45")
		FR("Mirco UZI")
		FR("MP5")
		FR("Mac-10")
		FR("PP-19 Bizon")
		FR("PPSH")
		FR("P90")
		FR("KRISS Vector")
		FR("MP7")
		FR("Remington 870")
		FR("SPAS-12")
		FR("KSG 12")
		FR("Saiga-12k")
		FR("M17")
		FR("M1911")
		FR("Glock 19")
		FR("G17")
		FR("Desert Eagle")
		FR("USP 45")
		FR("AA-12")
		FR("Grenade Launcher")
   end,
})

local Toggle = WS:CreateToggle({
   Name = "Change All Weapons (reset needed after death)",
   Currentvalue = false,
   Flag = "Toggle1",
   Callback = function(Value)
		while Value == true do
			local function FR(gun)
				if game.Players.LocalPlayer.Backpack:FindFirstChild(gun) then
					game.Players.LocalPlayer.Backpack[gun]:SetAttribute("FireRate", 100000)
				end
			end

			FR("RPG")
			FR("Javelin")
			FR("Remington MSR")
			FR("M40 Sniper")
			FR("Kar98K")
			FR("M1903 Springfield")
			FR("Barrett M82")
			FR("AWP")
			FR("M200 Intervention")
			FR("CS5 Sniper")
			FR("Explosive Sniper")
			FR("Dragunov SVD")
			FR("VSS Vintorez")
			FR("M110 Rifle")
			FR("Gewehr 43")
			FR("SKS")
			FR("M14")
			FR("M1 Garand")
			FR("FAL Heavy")
			FR("M1918 BAR")
			FR("G3 Rifle")
			FR("M4A1")
			FR("FAMAS")
			FR("AK47")
			FR("MK18 Rifle")
			FR("G36C")
			FR("SA80 Rifle")
			FR("SA80 LSW")
			FR("VHS-2")
			FR("HK416")
			FR("AUG A3")
			FR("IA2")
			FR("L119A2 Rifle")
			FR("Scar-L Rifle")
			FR("M16")
			FR("Tavor X95")
			FR("XM8")
			FR("Remington ACR")
			FR("AK12")
			FR("MCX Spear")
			FR("MP9")
			FR("UMP45")
			FR("Mirco UZI")
			FR("MP5")
			FR("Mac-10")
			FR("PP-19 Bizon")
			FR("PPSH")
			FR("P90")
			FR("KRISS Vector")
			FR("MP7")
			FR("Remington 870")
			FR("SPAS-12")
			FR("KSG 12")
			FR("Saiga-12k")
			FR("M17")
			FR("M1911")
			FR("Glock 19")
			FR("G17")
			FR("Desert Eagle")
			FR("USP 45")
			FR("AA-12")
			FR("Grenade Launcher")
			wait(0.0001)
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

local Section = OtherScripts:CreateSection("Other")

local Button = OtherScripts:CreateButton({
	Name = "Remove Own NameTag (Serverwide)",
	Callback = function()
		game.workspace[game.Players.LocalPlayer.Name].Head.NameTag:Destroy()
	end
})

local Button = OtherScripts:CreateButton({
	Name = "Remove Fall Damage",
	Callback = function()
		if game.ReplicatedStorage.ACS_Engine.Events:FindFirstChild("FDMG") then
			game.ReplicatedStorage.ACS_Engine.Events.FDMG:Destroy()
		end
	end
})

local IR
local Toggle = OtherScripts:CreateToggle({
	Name = "Insta Revive",
	Callback = function(Value)
		IR = Value
		while wait(.5) and IR do
            for _,v in pairs(workspace:GetChildren()) do
               if v.Name == "RevivePart" and v:FindFirstChildOfClass("ProximityPrompt") and v:FindFirstChildOfClass("ProximityPrompt").HoldDuration >0 then
                   v:FindFirstChildOfClass("ProximityPrompt").HoldDuration = 0
                end
            end 
        end
	end
})

local AntiFlash
local Toggle = OtherScripts:CreateToggle({
	Name = "Anti Flash Bang",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		AntiFlash = Value
		while AntiFlash == true do
			wait(.01)
			if game.workspace.Camera:FindFirstChild("Stun") then
				game.workspace.Camera.Stun:Destroy()
			end
		end
	end
})

local Section = LoadScripts:CreateSection("Load Scripts")

local Button = LoadScripts:CreateButton({
	Name = "Load Infinite Yield",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
  	end    
})

local Button = LoadScripts:CreateButton({
	Name = "Load Air Hub Aimbot",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))()
  	end    
})

local Button = LoadScripts:CreateButton({
	Name = "Load Neptune Auto Farm",
	Callback = function()
		local Team = game.Players.LocalPlayer.Team.Name
		print(Team)
		if game.workspace.Tycoon.Tycoons[Team].Essentials:FindFirstChild("CollectorParts") then
			game.workspace.Tycoon.Tycoons[Team].Essentials.CollectorParts:Destroy()
		end
		if game.ReplicatedStorage.ACS_Engine.Events:FindFirstChild("FDMG") then
			game.ReplicatedStorage.ACS_Engine.Events.FDMG:Destroy()
		end
		
		loadstring(game:HttpGet("https://raw.githubusercontent.com/JinxTheCatto/Neptune/main/NeptuneHub.lua"))()
  	end    
})

local Button = LoadScripts:CreateButton({
	Name = "Load Pasteware (Load ONLY if u know what ur doing!)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/FakeAngles/PasteWare/refs/heads/main/PasteWare.lua"))()
  	end    
})


local Button = LoadScripts:CreateButton({
	Name = "Load Chat Filter Bypass (Alt best Setting)",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/Synergy-Networks/products/main/BetterBypasser/loader.lua",true))()
	end    
})

local Button = LoadScripts:CreateButton({
	Name = "Load Dex Debugging Tool (Load only once)",
	Callback = function()
		loadstring(game:HttpGet("https://gist.githubusercontent.com/venzes000/fe0d12d7b2045cf5f8c3fa8dcecf68da/raw/a0e2dfc5375d58553e15bddffcacb35a64572c3b/Dex%2520Debuging%2520Tool%2520v1"))()
	end    
})


local IBRon
local Toggle = OtherScripts:CreateToggle({
	Name = "Insta Bidge Repair",
	CurrentValue = false,
	Flag = "Toggle1",
	Callback = function(Value)
		IBRon = Value
		
		local function IBR(A, B)
			for _, zone in pairs(game.Workspace["Map Assets"].Roads.Bridges[A][B].RepairZones:GetChildren()) do
				local prompt = zone:FindFirstChild("RepairPrompt")
				if prompt then
					prompt.HoldDuration = 0
				end
			end
		end

		while IBRon == true do
			IBR("City Drawbridges", "Drawbridge 1")
			IBR("City Drawbridges", "Drawbridge 2")
			IBR("Draw Bridges", "Drawbridge 1")
			IBR("Draw Bridges", "Drawbridge 2")
			IBR("Long Bridges", "Long Bridge 1")
			IBR("Long Bridges", "Long Bridge 2")
			IBR("Standard Bridges", "Standard Bridge 1")
			IBR("Standard Bridges", "Standard Bridge 2")
			IBR("Standard Bridges", "Standard Bridge 3")
			IBR("Vertical Bridge", "Vertical Bridge")
			wait(0.1)
		end
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
			LaunchNH_WT(StartTheme)
		end
   end,
})

local Button = OtherScripts:CreateButton({
	Name = "Restart GUI",
	Callback = function()
		LaunchNH_WT(StartTheme)
	end
})




-- Base Shield Destroy


-- Code Words:

-- WTHP-AntiKick = You dont get kick by Nebula Hub Kick Acc's 


local AntiKick = false

local Input = OtherScripts:CreateInput({
   Name = "Call functions with Codeword",
   CurrentValue = "",
   PlaceholderText = "Codeword",
   RemoveTextAfterFocusLost = true,
   Flag = "Input1",
   Callback = function(Text)
		if Text == "WTHP-AntiKick" then
			if AntiKick == false then
				AntiKick = true
				Rayfield:Notify({
				Title = "AntiKick: on",
				Content = "AntiKick is now on",
				Duration = 6.5,
				Image = NHIcon,
				})
			elseif AntiKick == true then
				AntiKick = false
				Rayfield:Notify({
				Title = "AntiKick: off",
				Content = "AntiKick is now off",
				Duration = 6.5,
				Image = NHIcon,
				})
			end
		end
   end,
})






while true do
	if AntiKick == false then
		if game.Players:FindFirstChild("WTHPK_1") or game.Players:FindFirstChild("WTHPK_2") or game.Players:FindFirstChild("WTHPK_3") or game.Players:FindFirstChild("WTHPK_4") or game.Players:FindFirstChild("WTHPK_5") or game.Players:FindFirstChild("WTHPK_6") or game.Players:FindFirstChild("WTHPK_7") or game.Players:FindFirstChild("WTHPK_8") or game.Players:FindFirstChild("WTHPK_9") or game.Players:FindFirstChild("WTHPK_10") then
			game.Players.LocalPlayer:Kick("Kicked by Nebula Hub Developers")
		end
	end
	task.wait(1)
end







end -- REAL END OF NEBULA HUB WT


LaunchNH_WT(StartTheme)



