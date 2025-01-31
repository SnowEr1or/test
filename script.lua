print("V-0.0.1 [IN-DEV]")

local RunService = game:GetService("RunService")

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character

if not _G.Player then
	
	_G.Player = "SnowEr1or"
	
end

if RunService:IsStudio() then
	
	_G.Player = "Rig"
	
end

local Target = nil
local TargetPlayer: Player? = game:GetService("Players"):FindFirstChild(_G.Player)

if workspace:FindFirstChild("Live") then
	
	Target = workspace.Live:FindFirstChild(_G.Player)
	
else
	
	Target = workspace:FindFirstChild(_G.Player)
	
end

if (not Target or not TargetPlayer) and not RunService:IsStudio() then
	
	print("Can't find player.")
	
	return
	
end

local TargetHumanoidRootPart = Target:WaitForChild("Torso")
local HumanoidRootPart = Character:WaitForChild("Torso")

local Debounce = false

local NormalOffset = CFrame.new(-3, 1.5, 3)
local Offset = NormalOffset

local Connection = RunService.Heartbeat:Connect(function()
	
	Character:PivotTo(TargetHumanoidRootPart.CFrame * Offset)
	
end)

local Chatted = TargetPlayer.Chatted:Connect(function(Message)
	
	if Debounce then
		
		return
		
	end
	
	Message = string.lower(Message)
	
	if Message == "1" then
		
		Debounce = true
		
		Offset = CFrame.new(0, 0.5, -5)
		
		task.wait(1)
		
		Offset = NormalOffset
		
		Debounce = false
		
	end
	
end)

while Character.Parent and Target.Parent do
	
	task.wait()
	
end

Connection:Disconnect()
Chatted:Disconnect()
