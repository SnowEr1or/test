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

local Enabled = true

local Offset = NormalOffset

local Connection = RunService.Heartbeat:Connect(function()
	
	if not Enabled then
		
		return
		
	end

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
	local Waits = {[1] = 1; [2] = 2; [3] = 0.8; [4] = 1;}

	local function CustomWait(Num)

		task.wait(Waits[tonumber(Num)])

	end

	local function M1(Amount)

		Amount = math.clamp(Amount, 1, 4)

		local Communicate = Character:FindFirstChild("Communicate")

		if Communicate then

			for _ = 1, Amount do

				Communicate:FireServer({Goal = "LeftClick"})

				task.wait()

				Communicate:FireServer({Goal = "LeftClickRelease"})

				task.wait(0.6)

			end

		end

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

	if Message[1] == "4" then

		Debounce = true

		Offset = CFrame.new(0, 0.5, -5)

		UseAbility("Uppercut")

		CustomWait(Message[1])

		Offset = NormalOffset

		Debounce = false

	end

	if Message[1] == "!target" and Message[2] and table.find(Moves, tonumber(Message[2])) and Message[3] then

		Debounce = true

		local Target = table.concat(Message, " ", 3)

		if Target then

			Target = workspace.Live:FindFirstChild(Target)

			if Target then

				local ChosenHumanoidRootPart = Target:FindFirstChild("HumanoidRootPart")

				if ChosenHumanoidRootPart then

					Offset = CFrame.new(0, 0, 3.5)
					TargetPart = ChosenHumanoidRootPart

					if Message[2] == "1" then

						UseAbility("Normal Punch")

					end

					if Message[2] == "2" then

						UseAbility("Consecutive Punches")

					end

					if Message[2] == "3" then

						UseAbility("Shove")

					end

					if Message[2] == "4" then

						UseAbility("Uppercut")

					end

					CustomWait(Message[2])

				end

			end

		end

		Offset = NormalOffset
		TargetPart = TargetHumanoidRootPart

		Debounce = false

	end

	if Message[1] == "!combo" and Message[2] then

		Debounce = true

		local Target = table.concat(Message, " ", 2)

		if Target then

			Target = workspace.Live:FindFirstChild(Target)

			if Target then

				local ChosenHumanoidRootPart = Target:FindFirstChild("HumanoidRootPart")

				if ChosenHumanoidRootPart then

					Offset = CFrame.new(0, 0, 3.5)
					TargetPart = ChosenHumanoidRootPart

				else

					Offset = CFrame.new(0, 0, 3.5)

				end

			else

				Offset = CFrame.new(0, 0, 3.5)

			end

			M1(3)

			UseAbility("Consecutive Punches")

			repeat task.wait() until Character.Humanoid.WalkSpeed < 12
			repeat task.wait() until Character.Humanoid.WalkSpeed > 12

			UseAbility("Normal Punch")

			CustomWait(1)

		end

		Offset = NormalOffset
		TargetPart = TargetHumanoidRootPart

		Debounce = false

	end

	if Message[1] == "!fling" and Message[2] then

		Debounce = true

		local Target = table.concat(Message, " ", 2)

		if Target then

			Target = workspace.Live:FindFirstChild(Target)

			if Target then

				local ChosenHumanoidRootPart = Target:FindFirstChild("HumanoidRootPart")
				local ChosenHumanoid = Target:FindFirstChild("Humanoid")

				if ChosenHumanoidRootPart and ChosenHumanoid then

					Offset = CFrame.new(0, 0, 0)
					TargetPart = ChosenHumanoidRootPart

					for _, Part in Character:GetDescendants() do

						if Part and Part:IsA("BasePart") then

							Part.CustomPhysicalProperties = PhysicalProperties.new(math.huge, 0.3, 0.5)

						end

					end

					local Angular = Instance.new("BodyAngularVelocity")

					Angular.Parent = HumanoidRootPart

					Angular.AngularVelocity = Vector3.new(0, 99999 ,0)
					Angular.MaxTorque = Vector3.new(0, math.huge ,0)
					Angular.P = math.huge

					task.spawn(function()

						while Angular.Parent do

							Angular.AngularVelocity = Vector3.new(0, 99999 ,0)

							task.wait(0.2)

							Angular.AngularVelocity = Vector3.new(0, 0, 0)

							task.wait(0.1)

						end

					end)

					repeat task.wait() until not Target.Parent or ChosenHumanoidRootPart.Position.Y > 999 or ChosenHumanoid.Health < 1

					Angular:Destroy()

					for _, Part in Character:GetDescendants() do

						if Part and Part:IsA("BasePart") then

							Part.CustomPhysicalProperties = PhysicalProperties.new(0.7, 0.3, 0.5)

						end

					end

					for _, Part in Character:GetDescendants() do

						if Part and Part:IsA("BasePart") then

							Part.AssemblyLinearVelocity = Vector3.zero

						end

					end

				end

			end

		end

		Offset = NormalOffset
		TargetPart = TargetHumanoidRootPart

		Debounce = false

	end

	if Message[1] == "!ult" and Message[2] and table.find(Moves, tonumber(Message[2])) and Message[3] then

		Debounce = true

		local Target = table.concat(Message, " ", 3)

		if Target then

			Target = workspace.Live:FindFirstChild(Target)

			if Target then

				local ChosenHumanoidRootPart = Target:FindFirstChild("HumanoidRootPart")

				if ChosenHumanoidRootPart then
					
					Offset = CFrame.new(0, 0, 3.5)
					TargetPart = ChosenHumanoidRootPart

					if Message[2] == "4" then

						UseAbility("Omni Directional Punch")

					end
					
					local LastTick = tick()

					repeat task.wait() until Character:FindFirstChild("Freeze")
					repeat task.wait() until not Character:FindFirstChild("Freeze") or tick() - LastTick > 3
					
					Enabled = false
					
					if workspace.CurrentCamera.CameraType == Enum.CameraType.Custom then
						
						repeat task.wait() until workspace.CurrentCamera.CameraType == Enum.CameraType.Custom
						
					end

				end

			end

		end

		Offset = NormalOffset
		TargetPart = TargetHumanoidRootPart

		Debounce = false
		Enabled = true

	end

end)

while Character.Parent and Target.Parent do

	task.wait()

	if Target:FindFirstChild("Freeze") and not Debounce then

		Debounce = true

		task.spawn(function()

			Offset = CFrame.new(0, 30, 0)

			repeat

				task.wait()

			until not Target:FindFirstChild("Freeze")

			Offset = NormalOffset

			Debounce = false

		end)

	end

end

Connection:Disconnect()
Chatted:Disconnect()

ScriptRunning.Parent = nil
