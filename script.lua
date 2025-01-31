local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character

if not _G.Player then
	
	_G.Player = "SnowEr1or"
	
end

local Target = workspace.Live:FindFirstChild(_G.Player)

local TargetHumanoidRootPart = Target:WaitForChild("HumanoidRootPart")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local Offset = CFrame.new(-3, 1.5, 3)

local Weld = Instance.new("WeldConstraint")

Weld.Parent = Character

Character:PivotTo(TargetHumanoidRootPart.CFrame * Offset)

Weld.Part0 = HumanoidRootPart
Weld.Part1 = TargetHumanoidRootPart
