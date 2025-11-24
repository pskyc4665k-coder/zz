local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Frostyxnns Roblox script",
   Icon = 129863717183669, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Made by ZeroDay",
   LoadingSubtitle = "/Frostyxnn",
   ShowText = "rayfield temp", -- for mobile users to unhide rayfield, change if you'd like
   Theme = "DarkBlue", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = true, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = true, -- Create a custom folder for your hub/game
      FileName = "roblox script by frostyxnn"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "2C5fh8mzMh", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local STab = Window:CreateTab("Safety", 4483362458) -- Title, Image
local Section = STab:CreateSection("Safety/Main")

local MTab = Window:CreateTab("Movement", 4483362458) -- Title, Image
local Section = MTab:CreateSection("Movement Tab")

local ATab = Window:CreateTab("Aim/Pvp", 4483362458) -- Title, Image
local Section = ATab:CreateSection("Aim and Pvp Tab")

local TTab = Window:CreateTab("Trolling", 4483362458) -- Title, Image
local Section = TTab:CreateSection("Trolling Tab")

local OTab = Window:CreateTab("GUI HUB", 4483362458) -- Title, Image
local Section = OTab:CreateSection("Script loader for other games")




local Button = MTab:CreateButton({
   Name = "Fly (X) ",
   Callback = function()
Rayfield:Notify({
   Title = "Fly activated",
   Content = "Press X to fly",
   Duration = 6.5,
   Image = 4483362458,
})

  local flybutton = "x"
local flyspeed = 200
local controls = {
	front = "w",
	back = "s",
	right = "d",
	left = "a",
	up = " ",
	down = "q"
}

-- Configs

local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
local runservice = game:GetService("RunService")

local flycontrol = {F = 0, R = 0, B = 0, L = 0, U = 0, D = 0}
local flying = false

local function fly()
	local character = player.Character
	if not character then return end
	local hrp = character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	if not humanoid then return end
	
	flying = true
	
	local bv = Instance.new("BodyVelocity")
	local bg = Instance.new("BodyGyro")
	bv.MaxForce = Vector3.new(9e4, 9e4, 9e4)
	bg.CFrame = hrp.CFrame
	bg.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
	bg.P = 9e4
	bv.Parent = hrp
	bg.Parent = hrp
	
	for i, child in pairs(character:GetDescendants()) do
		if child:IsA("BasePart") then
			coroutine.wrap(function()
				local con = nil
				con = runservice.Stepped:Connect(function()
					if not flying then
						con:Disconnect()
						child.CanCollide = true
					end
					child.CanCollide = false
				end)
			end)()
		end
	end
	
	local con = nil
	con = runservice.Stepped:Connect(function()
		if not flying then
			con:Disconnect()
			bv:Destroy()
			bg:Destroy()
		end
		
		humanoid.PlatformStand = true
		bv.Velocity = (workspace.Camera.CoordinateFrame.LookVector * ((flycontrol.F - flycontrol.B) * flyspeed)) + (workspace.CurrentCamera.CoordinateFrame.RightVector * ((flycontrol.R - flycontrol.L) * flyspeed)) + (workspace.CurrentCamera.CoordinateFrame.UpVector * ((flycontrol.U - flycontrol.D) * flyspeed))
		bg.CFrame = workspace.Camera.CoordinateFrame
	end)
	
	repeat wait() until not flying
	
	while humanoid.PlatformStand == true do
		humanoid.PlatformStand = false
		task.wait()
	end
end

mouse.KeyDown:Connect(function(key)
	
	if key:lower() == flybutton then
		if flying then
			flying = false
		else
			fly()
		end
	elseif key:lower() == controls.front then
		flycontrol.F = 1
	elseif key:lower() == controls.back then
		flycontrol.B = 1
	elseif key:lower() == controls.right then
		flycontrol.R = 1
	elseif key:lower() == controls.left then
		flycontrol.L = 1
	elseif key:lower() == controls.up then
		flycontrol.U = 1
	elseif key:lower() == controls.down then
		flycontrol.D = 1
	end
end)

mouse.KeyUp:Connect(function(key)
	if key:lower() == controls.front then
		flycontrol.F = 0
	elseif key:lower() == controls.back then
		flycontrol.B = 0
	elseif key:lower() == controls.right then
		flycontrol.R = 0
	elseif key:lower() == controls.left then
		flycontrol.L = 0
	elseif key:lower() == controls.up then
		flycontrol.U = 0
	elseif key:lower() == controls.down then
		flycontrol.D = 0
	end
end)

player.CharacterAdded:Connect(function()
	flying = false
end)
   end,
})

local Button = MTab:CreateButton({
   Name = "Slower Fly (X) ",
   Callback = function()
Rayfield:Notify({
   Title = "Slower Fly activated",
   Content = "Press X to fly",
   Duration = 6.5,
   Image = 4483362458,
})

  local flybutton = "x"
local flyspeed = 80
local controls = {
	front = "w",
	back = "s",
	right = "d",
	left = "a",
	up = " ",
	down = "q"
}

-- Configs

local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
local runservice = game:GetService("RunService")

local flycontrol = {F = 0, R = 0, B = 0, L = 0, U = 0, D = 0}
local flying = false

local function fly()
	local character = player.Character
	if not character then return end
	local hrp = character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	if not humanoid then return end
	
	flying = true
	
	local bv = Instance.new("BodyVelocity")
	local bg = Instance.new("BodyGyro")
	bv.MaxForce = Vector3.new(9e4, 9e4, 9e4)
	bg.CFrame = hrp.CFrame
	bg.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
	bg.P = 9e4
	bv.Parent = hrp
	bg.Parent = hrp
	
	for i, child in pairs(character:GetDescendants()) do
		if child:IsA("BasePart") then
			coroutine.wrap(function()
				local con = nil
				con = runservice.Stepped:Connect(function()
					if not flying then
						con:Disconnect()
						child.CanCollide = true
					end
					child.CanCollide = false
				end)
			end)()
		end
	end
	
	local con = nil
	con = runservice.Stepped:Connect(function()
		if not flying then
			con:Disconnect()
			bv:Destroy()
			bg:Destroy()
		end
		
		humanoid.PlatformStand = true
		bv.Velocity = (workspace.Camera.CoordinateFrame.LookVector * ((flycontrol.F - flycontrol.B) * flyspeed)) + (workspace.CurrentCamera.CoordinateFrame.RightVector * ((flycontrol.R - flycontrol.L) * flyspeed)) + (workspace.CurrentCamera.CoordinateFrame.UpVector * ((flycontrol.U - flycontrol.D) * flyspeed))
		bg.CFrame = workspace.Camera.CoordinateFrame
	end)
	
	repeat wait() until not flying
	
	while humanoid.PlatformStand == true do
		humanoid.PlatformStand = false
		task.wait()
	end
end

mouse.KeyDown:Connect(function(key)
	
	if key:lower() == flybutton then
		if flying then
			flying = false
		else
			fly()
		end
	elseif key:lower() == controls.front then
		flycontrol.F = 1
	elseif key:lower() == controls.back then
		flycontrol.B = 1
	elseif key:lower() == controls.right then
		flycontrol.R = 1
	elseif key:lower() == controls.left then
		flycontrol.L = 1
	elseif key:lower() == controls.up then
		flycontrol.U = 1
	elseif key:lower() == controls.down then
		flycontrol.D = 1
	end
end)

mouse.KeyUp:Connect(function(key)
	if key:lower() == controls.front then
		flycontrol.F = 0
	elseif key:lower() == controls.back then
		flycontrol.B = 0
	elseif key:lower() == controls.right then
		flycontrol.R = 0
	elseif key:lower() == controls.left then
		flycontrol.L = 0
	elseif key:lower() == controls.up then
		flycontrol.U = 0
	elseif key:lower() == controls.down then
		flycontrol.D = 0
	end
end)

player.CharacterAdded:Connect(function()
	flying = false
end)
   end,
})

local Button = MTab:CreateButton({
   Name = "Faster Fly (X) ",
   Callback = function()
Rayfield:Notify({
   Title = "Faster Fly activated",
   Content = "Press X to fly",
   Duration = 6.5,
   Image = 4483362458,
})

  local flybutton = "x"
local flyspeed = 350
local controls = {
	front = "w",
	back = "s",
	right = "d",
	left = "a",
	up = " ",
	down = "q"
}

-- Configs

local player = game:GetService("Players").LocalPlayer
local mouse = player:GetMouse()
local runservice = game:GetService("RunService")

local flycontrol = {F = 0, R = 0, B = 0, L = 0, U = 0, D = 0}
local flying = false

local function fly()
	local character = player.Character
	if not character then return end
	local hrp = character:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	local humanoid = character:FindFirstChildWhichIsA("Humanoid")
	if not humanoid then return end
	
	flying = true
	
	local bv = Instance.new("BodyVelocity")
	local bg = Instance.new("BodyGyro")
	bv.MaxForce = Vector3.new(9e4, 9e4, 9e4)
	bg.CFrame = hrp.CFrame
	bg.MaxTorque = Vector3.new(9e4, 9e4, 9e4)
	bg.P = 9e4
	bv.Parent = hrp
	bg.Parent = hrp
	
	for i, child in pairs(character:GetDescendants()) do
		if child:IsA("BasePart") then
			coroutine.wrap(function()
				local con = nil
				con = runservice.Stepped:Connect(function()
					if not flying then
						con:Disconnect()
						child.CanCollide = true
					end
					child.CanCollide = false
				end)
			end)()
		end
	end
	
	local con = nil
	con = runservice.Stepped:Connect(function()
		if not flying then
			con:Disconnect()
			bv:Destroy()
			bg:Destroy()
		end
		
		humanoid.PlatformStand = true
		bv.Velocity = (workspace.Camera.CoordinateFrame.LookVector * ((flycontrol.F - flycontrol.B) * flyspeed)) + (workspace.CurrentCamera.CoordinateFrame.RightVector * ((flycontrol.R - flycontrol.L) * flyspeed)) + (workspace.CurrentCamera.CoordinateFrame.UpVector * ((flycontrol.U - flycontrol.D) * flyspeed))
		bg.CFrame = workspace.Camera.CoordinateFrame
	end)
	
	repeat wait() until not flying
	
	while humanoid.PlatformStand == true do
		humanoid.PlatformStand = false
		task.wait()
	end
end

mouse.KeyDown:Connect(function(key)
	
	if key:lower() == flybutton then
		if flying then
			flying = false
		else
			fly()
		end
	elseif key:lower() == controls.front then
		flycontrol.F = 1
	elseif key:lower() == controls.back then
		flycontrol.B = 1
	elseif key:lower() == controls.right then
		flycontrol.R = 1
	elseif key:lower() == controls.left then
		flycontrol.L = 1
	elseif key:lower() == controls.up then
		flycontrol.U = 1
	elseif key:lower() == controls.down then
		flycontrol.D = 1
	end
end)

mouse.KeyUp:Connect(function(key)
	if key:lower() == controls.front then
		flycontrol.F = 0
	elseif key:lower() == controls.back then
		flycontrol.B = 0
	elseif key:lower() == controls.right then
		flycontrol.R = 0
	elseif key:lower() == controls.left then
		flycontrol.L = 0
	elseif key:lower() == controls.up then
		flycontrol.U = 0
	elseif key:lower() == controls.down then
		flycontrol.D = 0
	end
end)

player.CharacterAdded:Connect(function()
	flying = false
end)
   end,
})

local Button = ATab:CreateButton({
   Name = "Aimbot",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/Aimbot-V2/main/Resources/Scripts/Raw%20Main.lua"))()
   end,    
 })

 local Button = TTab:CreateButton({
   Name = "Fling gui",
   Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/K1LAS1K/Ultimate-Fling-GUI/main/flingscript.lua"))()
   end,
})

local Button = MTab:CreateButton({
   Name = "Speed boost",
   Callback = function()
  -- Variables
local speedValue = 16 -- Default speed value
 
-- Create GUI
local gui = Instance.new("ScreenGui")
gui.Name = "Speedboost"
gui.Parent = game.Players.LocalPlayer.PlayerGui
 
local frame = Instance.new("Frame")
frame.Name = "SpeedFrame"
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0, 10, 0, 10)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = gui
 
local speedLabel = Instance.new("TextLabel")
speedLabel.Name = "SpeedLabel"
speedLabel.Size = UDim2.new(0, 180, 0, 30)
speedLabel.Position = UDim2.new(0, 10, 0, 10)
speedLabel.BackgroundColor3 = Color3.new(0, 0, 0)
speedLabel.TextColor3 = Color3.new(1, 1, 1)
speedLabel.TextSize = 18
speedLabel.Text = "Speed: " .. speedValue
speedLabel.Parent = frame
 
local decreaseButton = Instance.new("TextButton")
decreaseButton.Name = "DecreaseButton"
decreaseButton.Size = UDim2.new(0, 50, 0, 30)
decreaseButton.Position = UDim2.new(0, 10, 0, 50)
decreaseButton.BackgroundColor3 = Color3.new(0, 1, 0)
decreaseButton.TextColor3 = Color3.new(1, 1, 1)
decreaseButton.TextSize = 14
decreaseButton.Text = "-"
decreaseButton.Parent = frame
 
local increaseButton = Instance.new("TextButton")
increaseButton.Name = "IncreaseButton"
increaseButton.Size = UDim2.new(0, 50, 0, 30)
increaseButton.Position = UDim2.new(0, 140, 0, 50)
increaseButton.BackgroundColor3 = Color3.new(0, 1, 0)
increaseButton.TextColor3 = Color3.new(1, 1, 1)
increaseButton.TextSize = 14
increaseButton.Text = "+"
increaseButton.Parent = frame
 
-- Functions
local function updateSpeedLabel()
    speedLabel.Text = "Speed: " .. speedValue
end
 
local function decreaseSpeed()
    if speedValue > 1 then
        speedValue = speedValue - 1
        updateSpeedLabel()
    end
end
 
local function increaseSpeed()
    speedValue = speedValue + 1
    updateSpeedLabel()
end
 
local function onDecreaseButtonClicked()
    decreaseSpeed()
end
 
local function onIncreaseButtonClicked()
    increaseSpeed()
end
 
-- Event connections
decreaseButton.MouseButton1Click:Connect(onDecreaseButtonClicked)
increaseButton.MouseButton1Click:Connect(onIncreaseButtonClicked)
 
-- Main loop
while true do
    -- Modify the speed of the character (you need to replace this with the appropriate code for your specific game)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speedValue
    wait(0.1) -- Adjust the wait time as desired
end
   end,
})

local Button = MTab:CreateButton({
   Name = "Infinite Jump",
   Callback = function()
local Player = game:GetService'Players'.LocalPlayer;
local UIS = game:GetService'UserInputService';

_G.JumpHeight = 50;

function Action(Object, Function) if Object ~= nil then Function(Object); end end

UIS.InputBegan:connect(function(UserInput)
    if UserInput.UserInputType == Enum.UserInputType.Keyboard and UserInput.KeyCode == Enum.KeyCode.Space then
        Action(Player.Character.Humanoid, function(self)
            if self:GetState() == Enum.HumanoidStateType.Jumping or self:GetState() == Enum.HumanoidStateType.Freefall then
                Action(self.Parent.HumanoidRootPart, function(self)
                    self.Velocity = Vector3.new(0, _G.JumpHeight, 0);
                end)
            end
        end)
    end
end)
   end,
})

local Button = ATab:CreateButton({
   Name = "Hitbox expander",
   Callback = function()
  -- Function to create GUI
local function createHitboxGui()
    -- Check if GUI already exists and remove it to avoid duplicates
    if game.Players.LocalPlayer.PlayerGui:FindFirstChild("HitboxGui") then
        game.Players.LocalPlayer.PlayerGui:FindFirstChild("HitboxGui"):Destroy()
    end

    -- Create GUI
    local ScreenGui = Instance.new("ScreenGui")
    ScreenGui.Name = "HitboxGui"
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

    local Frame = Instance.new("Frame")
    Frame.Parent = ScreenGui
    Frame.Size = UDim2.new(0, 200, 0, 100)
    Frame.Position = UDim2.new(0, 10, 1, -110)
    Frame.AnchorPoint = Vector2.new(0, 1)
    Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)  -- Dark gray background
    Frame.BorderSizePixel = 0
    Frame.BackgroundTransparency = 0.2
    Frame.Active = true

    local TextBox = Instance.new("TextBox")
    TextBox.Parent = Frame
    TextBox.Size = UDim2.new(1, -10, 0.4, -5)
    TextBox.Position = UDim2.new(0, 5, 0, 5)
    TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  -- White background
    TextBox.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Black text
    TextBox.Text = "Enter hitbox size"
    TextBox.ClearTextOnFocus = true

    local TeamButton = Instance.new("TextButton")
    TeamButton.Parent = Frame
    TeamButton.Size = UDim2.new(1, -10, 0.4, -5)
    TeamButton.Position = UDim2.new(0, 5, 0.5, 5)
    TeamButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)  -- Darker gray background
    TeamButton.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White text
    TeamButton.Text = "Toggle Team Check"

    local TextLabel = Instance.new("TextLabel")
    TextLabel.Parent = Frame
    TextLabel.Size = UDim2.new(1, -10, 0.2, -5)
    TextLabel.Position = UDim2.new(0, 5, 0.9, 5)
    TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)  -- White background
    TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)  -- Black text
    TextLabel.Text = "Hitbox Size: 1"
    TextLabel.TextScaled = true

    -- Handle Input
    local hitboxSize = 1
    local teamCheck = false

    TextBox.FocusLost:Connect(function(enterPressed)
        if enterPressed then
            local inputText = TextBox.Text
            local inputNumber = tonumber(inputText)
            if inputNumber then
                hitboxSize = inputNumber
                TextLabel.Text = "Hitbox Size: " .. hitboxSize

                -- Function to apply hitbox changes
                local function applyHitbox(player)
                    if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                        if not teamCheck or (teamCheck and player.Team ~= game.Players.LocalPlayer.Team) then
                            local hitbox = player.Character.HumanoidRootPart
                            hitbox.Size = Vector3.new(hitboxSize, hitboxSize, hitboxSize)
                            hitbox.Transparency = 0.75
                            hitbox.CanCollide = false

                            -- Add a visualizer
                            if not hitbox:FindFirstChild("HitboxVisualizer") then
                                local hitboxVisualizer = Instance.new("SelectionBox")
                                hitboxVisualizer.Name = "HitboxVisualizer"
                                hitboxVisualizer.Adornee = hitbox
                                hitboxVisualizer.Parent = hitbox
                            end
                        end
                    end
                end

                -- Apply hitbox changes to all current players
                for _, player in pairs(game.Players:GetPlayers()) do
                    applyHitbox(player)
                    -- Reapply hitbox changes on respawn
                    player.CharacterAdded:Connect(function()
                        wait(1) -- Optional: Wait for the character to load
                        applyHitbox(player)
                    end)
                end

                -- Reapply hitbox changes for new players joining the game
                game.Players.PlayerAdded:Connect(function(player)
                    player.CharacterAdded:Connect(function()
                        wait(1) -- Optional: Wait for the character to load
                        applyHitbox(player)
                    end)
                end)
            else
                TextLabel.Text = "Invalid number"
            end
            TextBox.Text = ""
        end
    end)

    -- Toggle team check
    TeamButton.MouseButton1Click:Connect(function()
        teamCheck = not teamCheck
        TeamButton.Text = teamCheck and "Team Check: ON" or "Team Check: OFF"
    end)
end

-- Initialize GUI on script load
createHitboxGui()

-- Recreate GUI when the player's character is added (handles respawns)
game.Players.LocalPlayer.CharacterAdded:Connect(function()
    wait(1) -- Optional: Wait for the character to load
    createHitboxGui()
end)
   end,
})

local Button = ATab:CreateButton({
   Name = "Esp",
   Callback = function()


-- Wait for important services to be ready
repeat task.wait() until game:IsLoaded()

local a=string.char
local b=game:GetService(a(80,108,97,121,101,114,115))
local c=game:GetService(a(82,117,110,83,101,114,118,105,99,101))
local d=game:GetService(a(83,116,97,114,116,101,114,71,117,105))
local e=game:GetService(a(85,115,101,114,73,110,112,117,116,83,101,114,118,105,99,101))

local f=b.LocalPlayer
local g=true
local h=true
local i=Color3.fromRGB(0,0,255)
local j=Color3.fromRGB(255,0,0)

local nameMode = "displayname" -- Default name mode

local function k(l,m,n)
    d:SetCore(a(83,101,110,100,78,111,116,105,102,105,99,97,116,105,111,110), {Title=l, Text=m, Duration=n or 3})
end

k(a(83,121,115,116,101,109,32,78,111,116,105,102,105,99,97,116,105,111,110),"Author: SynX2025",5)

local function o(p)
    return h and p.TeamColor.Color or ((f.TeamColor == p.TeamColor) and i or j)
end

local function q(r, s)
    if not r:IsDescendantOf(workspace) then return end
    local t = r:FindFirstChild(a(71,101,116,82,101,97,108))
    if not t then
        t = Instance.new(a(72,105,103,104,108,105,103,104,116))
        t.Name = a(71,101,116,82,101,97,108)
        t.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        t.Parent = r
    end
    t.FillColor = s
    t.OutlineColor = s
    t.Enabled = g
end

local function u(v)
    local w = v.Character
    if not w then return end
    local x = w:FindFirstChild(a(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) or w:FindFirstChild(a(84,111,114,115,111)) or w:FindFirstChild(a(85,112,112,101,114,84,111,114,115,111))
    if not x then return end
    local y = x:FindFirstChild(a(66,111,120,69,83,80))
    if not y then
        y = Instance.new(a(66,111,120,72,97,110,100,108,101,65,100,111,114,110,109,101,110,116))
        y.Name = a(66,111,120,69,83,80)
        y.Size = Vector3.new(2,3,2)
        y.Adornee = x
        y.AlwaysOnTop = true
        y.ZIndex = 5
        y.Transparency = 0.5
        y.Parent = x
    end
    y.Color3 = o(v)
    y.Visible = g
end

local function z(v)
    local w = v.Character
    if not w or not w:FindFirstChild(a(72,101,97,100)) then return end
    local A = w.Head
    local B = A:FindFirstChild(a(78,97,109,101,69,83,80))
    if not B then
        B = Instance.new(a(66,105,108,108,98,111,97,114,100,71,117,105))
        B.Name = a(78,97,109,101,69,83,80)
        B.Size = UDim2.new(0,200,0,50)
        B.AlwaysOnTop = true
        local C = Instance.new(a(84,101,120,116,76,97,98,101,108))
        C.Name = a(78,97,109,101,76,97,98,101,108)
        C.BackgroundTransparency = 1
        C.Size = UDim2.new(1,0,1,0)
        C.Font = Enum.Font.SourceSansBold
        C.TextSize = 16
        C.TextStrokeTransparency = 0.5
        C.Parent = B
        B.Parent = A
    end
    local C = B:FindFirstChild(a(78,97,109,101,76,97,98,101,108))
    if C then
        local D = 0
        if f.Character and f.Character:FindFirstChild(a(72,117,109,97,110,111,105,100,82,111,111,116,80,97,114,116)) then
            D = (f.Character.HumanoidRootPart.Position - A.Position).magnitude
        end

        local nameText = v.DisplayName
        if nameMode == "username" then
            nameText = v.Name
        elseif nameMode == "both" then
            nameText = string.format("%s (%s)", v.DisplayName, v.Name)
        end

        C.Text = string.format("%s [%dm]", nameText, math.floor(D))
        C.TextColor3 = o(v)
        C.Visible = g
        B.StudsOffset = Vector3.new(0, 2 + math.clamp(D/50, 0, 5), 0)
    end
end

local function E()
    for F,G in ipairs(b:GetPlayers()) do
        if G ~= f and G.Character then
            q(G.Character, o(G))
            z(G)
            u(G)
        end
    end
end

e.InputBegan:Connect(function(H, I)
    if H.KeyCode == Enum.KeyCode.RightBracket and not I then
        g = not g
        k(a(83,121,115,116,101,109,32,78,111,116,105,102,105,99,97,116,105,111,110), g and a(69,83,80,32,69,110,97,98,108,101,100) or a(69,83,80,32,68,105,115,97,98,108,101,100))
    elseif H.KeyCode == Enum.KeyCode.LeftBracket and not I then
        -- Cycle Name ESP modes
        if nameMode == "displayname" then
            nameMode = "username"
        elseif nameMode == "username" then
            nameMode = "both"
        else
            nameMode = "displayname"
        end
        k(a(83,121,115,116,101,109,32,78,111,116,105,102,105,99,97,116,105,111,110), "Name ESP mode: "..nameMode)
    end
end)

local function J(K)
    repeat task.wait() until K:FindFirstChild(a(72,117,109,97,110,111,105,100)) and K:FindFirstChild(a(72,101,97,100))
    E()
end

b.PlayerAdded:Connect(function(L)
    if L and L.CharacterAdded then
        L.CharacterAdded:Connect(J)
    end
end)

for F,G in ipairs(b:GetPlayers()) do
    if G ~= f and G.CharacterAdded then
        G.CharacterAdded:Connect(J)
    end
end

c.Heartbeat:Connect(E)

k(a(83,121,115,116,101,109,32,78,111,116,105,102,105,99,97,116,105,111,110), a(69,83,80,32,119,105,116,104,32,67,104,97,109,115,44,32,66,111,120,101,115,44,32,78,97,109,101,44,32,97,110,100,32,68,105,115,116,97,110,99,101,32,68,105,115,112,108,97,121,32,105,115,32,110,111,119,32,97,99,116,105,118,101,46,32,80,114,101,115,115,32,93,32,116,111,32,116,111,103,103,108,101,32,97,110,100,32,91,32,116,111,32,114,101,108,111,97,100,46))
   end,
})

local Button = STab:CreateButton({
   Name = "Leave Game",
   Callback = function()
game.Players.LocalPlayer:Kick("Kicked By Frostyxnns Roblox Exploit")
   end,    
 })

local Button = STab:CreateButton({
   Name = "Anti ban and anti afk",
   Callback = function()
loadstring(game:HttpGet("https://pastefy.app/bvmTbruZ/raw"))()
   end,    
 })

local Button = OTab:CreateButton({
   Name = "Natural Disaster gui",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/2dgeneralspam1/scripts-and-stuff/master/scripts/LoadstringUjHI6RQpz2o8", true))()
   end,    
 })

local Button = OTab:CreateButton({
   Name = "Murder Mystery gui",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/vwSaraa/LunarHub/main/mm2"))()
   end,    
 })

local Button = OTab:CreateButton({
   Name = "Brookhaven gui",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/TheDarkoneMarcillisePex/Other-Scripts/main/Brook%20Haven%20Gui'))()
   end,    
 })

local Button = OTab:CreateButton({
   Name = "Adoptme gui",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/svge1pn/AutoFarm/refs/heads/main/SavageScriptz'))()
   end,    
 })

local Button = OTab:CreateButton({
   Name = "Work at A pizza place gui",
   Callback = function()
loadstring(game:HttpGet('https://raw.githubusercontent.com/Hm5011/hussain/refs/heads/main/Work%20at%20a%20pizza%20place'))()
   end,    
 })

local Button = OTab:CreateButton({
   Name = "MiamiStreetz Gui",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/Seriously56/Scripts/refs/heads/main/Miami%20Streetz", true))()
   end,    
 })

local Button = OTab:CreateButton({
   Name = "StrongestBattleGrounds Gui",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/ArchIsDead/Arch-Vault/refs/heads/main/&R4-Lock.lua"))()
   end,    
 })

local Button = OTab:CreateButton({
   Name = "99Nights Gui",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/FoxnameHub.lua"))()
   end,    
 })

local Button = OTab:CreateButton({
   Name = "Chat Spam Gui",
   Callback = function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/herbetsmith34-netizen/chat-spammer/refs/heads/main/spam%20script",true))()
   end,    
 })








