if workspace:FindFirstChild("Stand Script Running") then
	
	return
	
end

local CoreGui
local RunService = game:GetService("RunService")

if RunService:IsStudio() then
	
	CoreGui = game.StarterGui
	
else
	
	CoreGui = game.CoreGui
	
end

local ScriptRunning = Instance.new("Part")

ScriptRunning.Parent = CoreGui
ScriptRunning.Name = "Stand Script Running"

print("V-0.0.2 [IN-DEV]")

local Player = game:GetService("Players").LocalPlayer
local Character = Player.Character

if not Character then
	
	ScriptRunning:Destroy()
	
	return
	
end

if not _G.Player then

	_G.Player = "SnowEr1or"

end

if RunService:IsStudio() then

	_G.Player = "Weakest Dummy"

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
	
	ScriptRunning:Destroy()

	return

end

local TargetHumanoidRootPart = Target:WaitForChild("HumanoidRootPart")
local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")

local Debounce = false

local NormalOffset = CFrame.new(-3, 1.5, 3)
local TargetPart = TargetHumanoidRootPart

local Offset = NormalOffset

local Connection = RunService.Heartbeat:Connect(function()

	Character:PivotTo(TargetPart.CFrame * Offset)

end)

local function UseAbility(Name)

	local Tool = Player.Backpack:FindFirstChild(Name)

	if Tool then

		Tool.Parent = Character

		Tool.Parent = Player.Backpack

	end

end

local Chatted = TargetPlayer.Chatted:Connect(function(Message)

	if Debounce then

		return

	end
	
	Message = string.split(Message, " ")
	Message[1] = string.lower(Message[1])
	
	local Moves = {1, 2, 3, 4}
	local Waits = {[1] = 1; [2] = 2; [3] = 0.8}
	
	local function CustomWait()
		
		task.wait(Waits[tonumber(Message[1])])
		
	end

	if Message[1] == "1" then

		Debounce = true

		Offset = CFrame.new(0, 0.5, -5)

		UseAbility("Normal Punch")

		CustomWait(Message[1])

		Offset = NormalOffset

		Debounce = false

	end

	if Message[1] == "2" then

		Debounce = true

		Offset = CFrame.new(0, 0.5, -5)

		UseAbility("Consecutive Punches")

		CustomWait(Message[1])

		Offset = NormalOffset

		Debounce = false

	end
	
	if Message[1] == "3" then

		Debounce = true

		Offset = CFrame.new(0, 0.5, -5)

		UseAbility("Shove")

		CustomWait(Message[1])

		Offset = NormalOffset

		Debounce = false

	end
	
	if Message[1] == "!target" and Message[2] and table.find(Moves, tonumber(Message[2])) and Message[3] then
		
		Debounce = true
		
		local Target = table.concat(Message, " ", 3)
		
		if Target then
			
			Target = workspace:FindFirstChild(Target)
			
			if Target then
				
				local ChosenHumanoidRootPart = Target:FindFirstChild("HumanoidRootPart")
				
				if ChosenHumanoidRootPart then
					
					Offset = CFrame.new(0, 0, 3.5)
					TargetPart = ChosenHumanoidRootPart
					
					if Message[1] == "1" then
						
						UseAbility("Normal Punch")
						
					end
					
					if Message[1] == "2" then

						UseAbility("Consecutive Punches")

					end
					
					if Message[1] == "3" then

						UseAbility("Shove")

					end
					
					CustomWait(Message[1])
					
				end
				
			end
			
		end
		
		Offset = NormalOffset
		TargetPart = TargetHumanoidRootPart
		
		Debounce = false
		
	end

end)

while Character.Parent and Target.Parent do

	task.wait()

end

Connection:Disconnect()
Chatted:Disconnect()

ScriptRunning.Parent = nil
