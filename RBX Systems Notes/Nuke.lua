-- Services
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local SoundService = game:GetService("SoundService")

-- Nuke part
local part = script.Parent
part.Anchored = true
part.CanCollide = false

-- ================= AUDIO =================
local function createSound(id, volume, looped)
	local sound = Instance.new("Sound")
	sound.SoundId = "rbxassetid://" .. id
	sound.Volume = volume
	sound.Looped = looped or false
	sound.RollOffMaxDistance = 5000
	sound.Parent = part
	return sound
end

-- Replace IDs with ones you like
local sirenSound = createSound(9067330158, 2, true) -- warning siren
local explosionSound = createSound(138186576, 5, false) -- explosion
local geigerSound = createSound(17541330396, 1.5, true) -- geiger clicks
local sicknessSound = createSound(8009568774, 1, true) -- radiation sickness hum

-- ================= SETTINGS =================
local NUKE_DELAY = 3

local BLAST_TWEEN_TIME = 10
local BLAST_SIZE = Vector3.new(2048, 2048, 2048)

local DETONATE_AFTER = 0.5

local FALLOUT_DURATION = 45
local FALLOUT_RADIUS = 900
local TICK = 1

local RAD_GAIN_PER_TICK = 8
local RAD_LOSS_PER_TICK = 3
local RAD_MAX = 100

local SICK_AT = 40
local SEVERE_AT = 70
local KILL_AT = 100

local DAMAGE_SICK = 2
local DAMAGE_SEVERE = 6

-- ================= TWEEN =================
local tweenInfo = TweenInfo.new(BLAST_TWEEN_TIME, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)

local goals = { Size = BLAST_SIZE }
local nukeTween = TweenService:Create(part, tweenInfo, goals)

-- ================= HELPERS =================
local function getHumanoidAndRoot(character)
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	local root = character:FindFirstChild("HumanoidRootPart")
	return humanoid, root
end

local function withinRadius(root, center, radius)
	return (root.Position - center).Magnitude <= radius
end

local function setRadiation(player, value)
	player:SetAttribute("Radiation", math.clamp(value, 0, RAD_MAX))
end

local function getRadiation(player)
	return player:GetAttribute("Radiation") or 0
end

-- ================= NUKE DAMAGE =================
local function detonateInstantKill()
	local blastRadius = part.Size.X / 2
	local center = part.Position

	for _, player in ipairs(Players:GetPlayers()) do
		local character = player.Character
		if character then
			local humanoid, root = getHumanoidAndRoot(character)
			if humanoid and root and withinRadius(root, center, blastRadius) then
				humanoid.Health = 0
			end
		end
	end
end

-- ================= FALLOUT =================
local falloutRunning = false

local function runFallout()
	if falloutRunning then
		return
	end
	falloutRunning = true

	geigerSound:Play()

	local center = part.Position
	local endTime = os.clock() + FALLOUT_DURATION

	while os.clock() < endTime do
		for _, player in ipairs(Players:GetPlayers()) do
			local character = player.Character
			if character then
				local humanoid, root = getHumanoidAndRoot(character)
				if humanoid and root and humanoid.Health > 0 then
					local rad = getRadiation(player)

					if withinRadius(root, center, FALLOUT_RADIUS) then
						rad += RAD_GAIN_PER_TICK
					else
						rad -= RAD_LOSS_PER_TICK
					end

					setRadiation(player, rad)

					if rad >= KILL_AT then
						humanoid.Health = 0
					elseif rad >= SEVERE_AT then
						sicknessSound:Play()
						humanoid:TakeDamage(DAMAGE_SEVERE)
					elseif rad >= SICK_AT then
						sicknessSound:Play()
						humanoid:TakeDamage(DAMAGE_SICK)
					end
				end
			end
		end

		task.wait(TICK)
	end

	geigerSound:Stop()
	sicknessSound:Stop()
	falloutRunning = false
end

-- ================= FIRE NUKE =================
sirenSound:Play()

task.wait(NUKE_DELAY)

sirenSound:Stop()
explosionSound:Play()
nukeTween:Play()

task.delay(DETONATE_AFTER, function()
	detonateInstantKill()
	runFallout()
end)
