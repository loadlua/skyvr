-- sky vr
local global = getgenv()

if global.options.hatcollision then
	loadstring(game:HttpGet("https://raw.githubusercontent.com/loadlua/skyvr/main/SkyVRHatdrop.lua"))()
	return
end

local loader = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local ImageLabel = Instance.new("ImageLabel")
local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
local loader_2 = Instance.new("ImageLabel")
local UICorner = Instance.new("UICorner")
local t = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")
local UICorner_3 = Instance.new("UICorner")
local errorr = Instance.new("TextLabel")
do
	loader.Name = "loader"
	loader.Parent = game.CoreGui
	loader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	Frame.Parent = loader
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 1.000
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
	Frame.Size = UDim2.new(0.0824402273, 0, 0.163132131, 0)
	ImageLabel.Parent = Frame
	ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ImageLabel.BackgroundTransparency = 1.000
	ImageLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ImageLabel.BorderSizePixel = 0
	ImageLabel.Position = UDim2.new(-0.932431638, 0, -1.4126755, 0)
	ImageLabel.Size = UDim2.new(2.86000013, 0, 2.8599999, 0)
	ImageLabel.Image = "http://www.roblox.com/asset/?id=17137351841"
	UIAspectRatioConstraint.Parent = Frame
	UIAspectRatioConstraint.AspectRatio = 0.988
	loader_2.Name = "loader"
	loader_2.Parent = Frame
	loader_2.BackgroundColor3 = Color3.fromRGB(148, 148, 148)
	loader_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	loader_2.BorderSizePixel = 0
	loader_2.Position = UDim2.new(-0.25999999, 0, 0.899999976, 0)
	loader_2.Size = UDim2.new(1.5, 0, 0.230000004, 0)
	loader_2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
	loader_2.ImageTransparency = 1.000
	UICorner.CornerRadius = UDim.new(1, 100000)
	UICorner.Parent = loader_2
	t.Name = "t"
	t.Parent = loader_2
	t.BackgroundColor3 = Color3.fromRGB(0, 255, 102)
	t.BorderColor3 = Color3.fromRGB(0, 0, 0)
	t.BorderSizePixel = 0
	t.Size = UDim2.new(1, 0, 1, 0)
	t.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
	t.ImageTransparency = 1.000
	UICorner_2.CornerRadius = UDim.new(1, 100000)
	UICorner_2.Parent = t
	TextLabel.Parent = loader_2
	TextLabel.BackgroundColor3 = Color3.fromRGB(126, 126, 126)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.Font = Enum.Font.TitilliumWeb
	TextLabel.Text = "Ready!"
	TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true
	UICorner_3.CornerRadius = UDim.new(1, 100000)
	UICorner_3.Parent = TextLabel
	errorr.Name = "error"
	errorr.Parent = Frame
	errorr.BackgroundColor3 = Color3.fromRGB(126, 126, 126)
	errorr.BackgroundTransparency = 1.000
	errorr.BorderColor3 = Color3.fromRGB(0, 0, 0)
	errorr.BorderSizePixel = 0
	errorr.Position = UDim2.new(-1.07771266, 0, 0.74733454, 0)
	errorr.Size = UDim2.new(3.15542507, 0, 0.524423599, 0)
	errorr.Visible = false
	errorr.Font = Enum.Font.Unknown
	errorr.Text = "VR is required for this script"
	errorr.TextColor3 = Color3.fromRGB(255, 20, 20)
	errorr.TextScaled = true
	errorr.TextSize = 14.000
	errorr.TextStrokeTransparency = 0.000
	errorr.TextWrapped = true
end

TextLabel.Text = "Loading..."
t:TweenSize(UDim2.new(0,0,1,0),nil,Enum.EasingStyle.Linear,0)
wait(0.01)
t:TweenSize(UDim2.new(0.3,0,1,0),nil,Enum.EasingStyle.Linear,0.8)
wait(0.81)
if not game:GetService("UserInputService").VREnabled then
	errorr.Visible = true
	t.Parent.Visible = false
	wait(5)
	loader:Destroy()
	return
end
if getgenv().skyVRversion ~= '2.0.0' then
	errorr.Text = "Please update your script loader!"
	errorr.Visible = true
	t.Parent.Visible = false
	wait(5)
	loader:Destroy()
	return
end
t:TweenSize(UDim2.new(1,0,1,0),nil,Enum.EasingStyle.Linear,0.1)
wait(0.06)

local plr = game.Players.LocalPlayer
local input = game:GetService("UserInputService")

local function createpart(size, name,h)
	local Part = Instance.new("Part")
	if h and global.options.outlinesEnabled then 
		local SelectionBox = Instance.new("SelectionBox")
		SelectionBox.Adornee = Part
		SelectionBox.LineThickness = 0.05
		SelectionBox.Parent = Part
	end
	Part.Parent = workspace
	Part.CFrame = plr.Character.HumanoidRootPart.CFrame
	Part.Size = size
	Part.Transparency = 1
	Part.CanCollide = false
	Part.Anchored = true
	Part.Name = name
	return Part
end

local lefthandpart = createpart(Vector3.new(2,1,1), "moveRH",true)
local righthandpart = createpart(Vector3.new(2,1,1), "moveRH",true)
local headpart = createpart(Vector3.new(1,1,1), "moveH",false)
local lefttoypart = createpart(Vector3.new(1,1,1), "LToy",true)
local righttoypart =  createpart(Vector3.new(1,1,1), "RToy",true)
local thirdpersonpart = createpart(Vector3.new(1,1,1), "thirdpersonpart",false)
local thirdperson = false
local lefttoyenable = false
local righttoyenable = false
local lfirst = true
local rfirst = true
local ltoypos = CFrame.new(1.15,0,0) * CFrame.Angles(0,math.rad(180),0)
local rtoypos = CFrame.new(1.15,0,0) * CFrame.Angles(0,math.rad(0),0)

function findMeshID(char,id)
	id = string.match(id,"%d+")
	for i,v in char:GetChildren() do
		if v:IsA("Accessory") then
			local handle = v.Handle

			if handle:IsA("MeshPart") then
				local pooped = string.match(handle.MeshId,"%d+")
				if string.find(handle.MeshId,'assetdelivery') then
					pooped=string.match(string.sub(handle.MeshId,37,#handle.MeshId),"%d+")
				end
				if id == pooped then
					return v
				end
			else
				local mesh = handle:FindFirstChildOfClass("SpecialMesh")
				local pooped = string.match(mesh.MeshId,"%d+")
				if string.find(mesh.MeshId,'assetdelivery') then
					pooped=string.match(string.sub(mesh.MeshId,37,#mesh.MeshId),"%d+")
				end
				if id == pooped then
					return v
				end
			end
		end
	end

	return nil
end

local function FEScript(char)		
	local function Align(Part1,Part0,CFrameOffset) 
		local AlignPos = Instance.new('AlignPosition', Part1);
		AlignPos.Parent.CanCollide = false;
		AlignPos.ApplyAtCenterOfMass = true;
		AlignPos.MaxForce = 67752;
		AlignPos.MaxVelocity = math.huge/9e110;
		AlignPos.ReactionForceEnabled = false;
		AlignPos.Responsiveness = 200;
		AlignPos.RigidityEnabled = false;
		local AlignOri = Instance.new('AlignOrientation', Part1);
		AlignOri.MaxAngularVelocity = math.huge/9e110;
		AlignOri.MaxTorque = 67752;
		AlignOri.PrimaryAxisOnly = false;
		AlignOri.ReactionTorqueEnabled = false;
		AlignOri.Responsiveness = 200;
		AlignOri.RigidityEnabled = false;
		local AttachmentA=Instance.new('Attachment',Part1);
		local AttachmentB=Instance.new('Attachment',Part0);
		AttachmentB.CFrame = AttachmentB.CFrame * CFrameOffset
		AlignPos.Attachment0 = AttachmentA;
		AlignPos.Attachment1 = AttachmentB;
		AlignOri.Attachment0 = AttachmentA;
		AlignOri.Attachment1 = AttachmentB;
		return {AttachmentB,AlignOri,AlignPos}
	end
	if not char:FindFirstChild(global.left) and string.sub(global.left,0,7) ~= "meshid:" then
		errorr.Text = "Cannot find accessory '"..global.left.."' (left)"
		errorr.Visible = true
		t.Parent.Visible = false
		task.delay(5,function()
			loader:Destroy()
		end)
		error("Cannot find accessory '"..global.left.."' (left)")
	end
	if string.sub(global.left,0,7) == "meshid:" then
		if findMeshID(char,string.sub(global.left,7,#global.left)) == nil then
			errorr.Text = "Cannot find accessory '"..global.left.."' (left)"
			errorr.Visible = true
			t.Parent.Visible = false
			task.delay(5,function()
				loader:Destroy()
			end)
			error("Cannot find accessory '"..global.left.."' (left)")
		end
	end
	if not char:FindFirstChild(global.right) and string.sub(global.right,0,7) ~= "meshid:" then 
		errorr.Text = "Cannot find accessory '"..global.right.."' (right)"
		errorr.Visible = true
		t.Parent.Visible = false
		task.delay(5,function()
			loader:Destroy()
		end)
		error("Cannot find accessory '"..global.right.."' (right)")
	end
	if string.sub(global.right,0,7) == "meshid:" then
		if findMeshID(char,string.sub(global.right,7,#global.right)) == nil then
			errorr.Text = "Cannot find accessory '"..global.right.."' (right)"
			errorr.Visible = true
			t.Parent.Visible = false
			task.delay(5,function()
				loader:Destroy()
			end)
			error("Cannot find accessory '"..global.right.."' (right)")
		end
	end
	for i,v in global.headhats do
		if not char:FindFirstChild(i) and string.sub(i,0,7) ~= "meshid:" then 
			errorr.Text = "Cannot find accessory '"..i.."' (headhat)"
			errorr.Visible = true
			t.Parent.Visible = false
			task.delay(5,function()
				loader:Destroy()
			end)
			error("Cannot find accessory '"..i.."' (headhat)")
		end
		if string.sub(i,0,7) == "meshid:" then
			if findMeshID(char,string.sub(i,7,#i)) == nil then
				errorr.Text = "Cannot find accessory '"..i.."' (right)"
				errorr.Visible = true
				t.Parent.Visible = false
				task.delay(5,function()
					loader:Destroy()
				end)
				error("Cannot find accessory '"..i.."' (right)")
			end
		end
	end
	if not char:FindFirstChild(global.options.rightToy) and string.sub(global.options.rightToy,0,7) ~= "meshid:" then 
		if not global.options.rightToy == "" then 
			errorr.Text = "Cannot find accessory '"..global.options.rightToy.."' (rightToy)"
			errorr.Visible = true
			t.Parent.Visible = false
			task.delay(5,function()
				loader:Destroy()
			end)
			error("Cannot find accessory '"..global.options.rightToy.."' (rightToy)")
		end
	end
	if string.sub(global.options.rightToy,0,7) == "meshid:" then
		if findMeshID(char,string.sub(global.options.rightToy,7,#global.options.rightToy)) == nil then
			errorr.Text = "Cannot find accessory '"..global.options.rightToy.."' (rightToy)"
			errorr.Visible = true
			t.Parent.Visible = false
			task.delay(5,function()
				loader:Destroy()
			end)
			error("Cannot find accessory '"..global.options.rightToy.."' (rightToy)")
		end
	end
	if not char:FindFirstChild(global.options.leftToy) and string.sub(global.options.leftToy,0,7) ~= "meshid:" then 
		if not global.options.leftToy == "" then 
			errorr.Text = "Cannot find accessory '"..global.options.leftToy.."' (leftToy)"
			errorr.Visible = true
			t.Parent.Visible = false
			task.delay(5,function()
				loader:Destroy()
			end)
			error("Cannot find accessory '"..global.options.leftToy.."' (leftToy)")
		end
	end
	if string.sub(global.options.leftToy,0,7) == "meshid:" then
		if findMeshID(char,string.sub(global.options.leftToy,7,#global.options.leftToy)) == nil then
			errorr.Text = "Cannot find accessory '"..global.options.leftToy.."' (leftToy)"
			errorr.Visible = true
			t.Parent.Visible = false
			task.delay(5,function()
				loader:Destroy()
			end)
			error("Cannot find accessory '"..global.options.leftToy.."' (leftToy)")
		end
	end
	pcall(function()
		if string.sub(global.left,0,7) == "meshid:" then
			local leftallign = Align(findMeshID(char,string.sub(global.left,7,#global.left)).Handle,lefthandpart,CFrame.new())
			return
		end
		local leftallign = Align(char[global.left].Handle,lefthandpart,CFrame.new())
	end)
	pcall(function()
		if string.sub(global.right,0,7) == "meshid:" then
			local rightallign = Align(findMeshID(char,string.sub(global.right,7,#global.right)).Handle,righthandpart,CFrame.new())
			return
		end
		local rightallign = Align(char[global.right].Handle,righthandpart,CFrame.new())
	end) 
    pcall(function()
        if global.options.leftToy == "" then return end
		if string.sub(global.options.leftToy,0,7) == "meshid:" then
			local rightallign = Align(findMeshID(char,string.sub(global.options.leftToy,7,#global.options.leftToy)).Handle,lefttoypart,CFrame.new())
			return
		end
		local rightallign = Align(char[global.options.leftToy].Handle,lefttoypart,CFrame.new())
	end)
	pcall(function()
        if global.options.rightToy == "" or global.options.rightToy == nil then return end
		if string.sub(global.options.rightToy,0,7) == "meshid:" then
			local rightallign = Align(findMeshID(char,string.sub(global.options.rightToy,7,#global.options.rightToy)).Handle,righttoypart,CFrame.new())
			return
		end
		local rightallign = Align(char[global.options.rightToy].Handle,righttoypart,CFrame.new())
	end)
	for i,v in global.headhats do
		pcall(function()
			local hatname = i
			if string.sub(hatname,0,7) == "meshid:" then
				local offset = v
				local hat = findMeshID(char,string.sub(hatname,7,#hatname))
				local headallign = Align(hat.Handle,headpart,offset)
				hat.Handle.Transparency = global.options.HeadHatTransparency
				return
			end
			local offset = v
			local headallign = Align(char[hatname].Handle,headpart,offset)
            char[i].Handle.Transparency = global.options.HeadHatTransparency
		end)
	end
end


do
	for i,v in ipairs(plr.Character.HumanoidRootPart:GetChildren()) do
		if v:IsA("Sound") then
			v.Volume = 0
		end
	end
	if plr.Character:FindFirstChild("Head") then
		plr.Character.Head:Destroy()
	end
	plr.Character.Humanoid.Health = 0
	game:GetService("RunService").PostSimulation:connect(function()
		for i,v in ipairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
			if v:IsA("BasePart") and v.Name ~="HumanoidRootPart" then 
					v.Velocity = global.options.NetVelocity
			end
		end
	end)
	FEScript(plr.Character)
	plr.CharacterAdded:Connect(function(char)

		local hrp = char:WaitForChild("HumanoidRootPart")
		local head = char:WaitForChild("Head")
		local hum = char:FindFirstChildOfClass("Humanoid")
		local continueTping = true
		coroutine.wrap(function()
			while continueTping do
				task.wait()
				hrp.CFrame = headpart.CFrame
			end
		end)()

		
		task.wait(0.25)	
		continueTping = false
		for i,v in ipairs(hrp:GetChildren()) do
			if v:IsA("Sound") then
				v.Volume = 0
			end
		end
		if head then
			head:Destroy()
		end
		hum.Health = 0

		FEScript(char)
	end)
end

TextLabel.Text = "Ready!"
task.delay(5,function()
	loader:Destroy()
end)

-- vr handler starts here
coroutine.wrap(function()
	local cam = workspace.CurrentCamera
	cam:GetPropertyChangedSignal("CFrame"):Connect(function()
		cam.CameraType = "Scriptable"
		cam.HeadScale = global.options.headscale
	end)
end)()
local cam = workspace.CurrentCamera

cam.CameraType = "Scriptable"
cam.HeadScale = global.options.headscale

game:GetService("StarterGui"):SetCore("VREnableControllerModels", false)

input.UserCFrameChanged:connect(function(part,move)
	cam.CameraType = "Scriptable"
	cam.HeadScale = global.options.headscale
    pcall(function()
    	if part == Enum.UserCFrame.Head then
    		headpart.CFrame = cam.CFrame*(CFrame.new(move.p*(cam.HeadScale-1))*move)
			thirdpersonpart.CFrame = cam.CFrame * (CFrame.new(move.p*(cam.HeadScale-1))*move) * CFrame.new(0,0,-10) * CFrame.Angles(math.rad(180),0,math.rad(180))
    	elseif part == Enum.UserCFrame.LeftHand then
    		lefthandpart.CFrame = cam.CFrame*(CFrame.new(move.p*(cam.HeadScale-1))*move*CFrame.Angles(math.rad(global.options.lefthandrotoffset.X),math.rad(global.options.lefthandrotoffset.Y),math.rad(global.options.lefthandrotoffset.Z)))
    	    if lefttoyenable then
                lefttoypart.CFrame = lefthandpart.CFrame * ltoypos
            end
        elseif part == Enum.UserCFrame.RightHand then
    		righthandpart.CFrame = cam.CFrame*(CFrame.new(move.p*(cam.HeadScale-1))*move*CFrame.Angles(math.rad(global.options.righthandrotoffset.X),math.rad(global.options.righthandrotoffset.Y),math.rad(global.options.righthandrotoffset.Z)))
    	    if righttoyenable then
                righttoypart.CFrame = righthandpart.CFrame * rtoypos
            end
		end
    end)	
end)

input.InputBegan:connect(function(key)
	if key.KeyCode == global.options.thirdPersonButtonToggle then
		thirdperson = not thirdperson -- disabled?
	end
	if key.KeyCode == Enum.KeyCode.ButtonR1 then
		R1down = true
	end
    if key.KeyCode == global.options.leftToyBind then
		if not lfirst then
			ltoypos = lefttoypart.CFrame:ToObjectSpace(lefthandpart.CFrame):Inverse()
		end
		lfirst = false
        lefttoyenable = not lefttoyenable
    end
	if key.KeyCode == global.options.rightToyBind then
		if not rfirst then
			rtoypos = righttoypart.CFrame:ToObjectSpace(righthandpart.CFrame):Inverse()
		end
		rfirst = false
        righttoyenable = not righttoyenable
    end
end)

input.InputEnded:connect(function(key)
	if key.KeyCode == Enum.KeyCode.ButtonR1 then
		R1down = false
	end
end)

game:GetService("RunService").RenderStepped:connect(function()
	-- righthandpart.CFrame*CFrame.Angles(-math.rad(global.options.righthandrotoffset.X),-math.rad(global.options.righthandrotoffset.Y),math.rad(180-global.options.righthandrotoffset.X))
	if R1down then
		cam.CFrame = cam.CFrame:Lerp(cam.CoordinateFrame + (righthandpart.CFrame * CFrame.Angles(math.rad(global.options.controllerRotationOffset.X),math.rad(global.options.controllerRotationOffset.Y),math.rad(global.options.controllerRotationOffset.Z))).LookVector * cam.HeadScale/2, 0.5)
	end
end)
