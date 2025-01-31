print("V-0.0.1 [IN-DEV]")

local RunService = game:GetService("RunService")

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character

if not _G.Player then
	
	_G.Player = "SnowEr1or"
	
end

local Target = workspace.Live:FindFirstChild(_G.Player)

if not Target then
	
	print("Can't find player.")
	
end

local TargetHumanoidRootPart = Target:WaitForChild("Torso")
local HumanoidRootPart = Character:WaitForChild("Torso")

local Offset = CFrame.new(-3, 1.5, 3)

local Connection = RunService.Heartbeat:Connect(function()
	
	Character:PivotTo(TargetHumanoidRootPart.CFrame * Offset)
	
end)

while Character.Parent and Target.Parent do
	
	task.wait()
	
end

Connection:Disconnect()
