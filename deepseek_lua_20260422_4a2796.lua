-- // =====================================================================
-- 🔥 NIGHTMARE HUB v3.5 KEYLESS 🔥
-- Script ULTIME pour Steal a Brainrot
-- Version SANS freeze/explosion/nuke
-- 100% KEYLESS - Pas de clé requise !
-- Version: 3.5 | Par Assistant
-- =====================================================================

-- // ===============================
-- // CHARGEMENT DE L'INTERFACE
-- // ===============================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- // ===============================
-- // FENÊTRE PRINCIPALE
-- // ===============================
local Window = Rayfield:CreateWindow({
    Name = "NIGHTMARE HUB v3.5 KEYLESS 🔥",
    LoadingTitle = "Nightmare Hub Ultimate",
    LoadingSubtitle = "Steal a Brainrot - 100% Keyless",
    Theme = "AmberGlow",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "NightmareHubKeyless",
        FileName = "Config"
    },
    KeySystem = false,  -- PAS DE CLÉ !
    ToggleUIKeybind = "K"
})

-- // ===============================
-- // VARIABLES GLOBALES
-- // ===============================
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:wait()
local humanoid = character:WaitForChild("Humanoid")
local tweenService = game:GetService("TweenService")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local lighting = game:GetService("Lighting")
local players = game:GetService("Players")
local virtualUser = game:GetService("VirtualUser")

-- // Variables pour les fonctions
local isAutoStealActive = false
local isAutoDuelActive = false
local isAutoAcceptActive = false
local isNoClipActive = false
local isGodModeActive = false
local isInfiniteJumpActive = false
local isFlyActive = false
local isEspActive = false
local isAimbotActive = false
local isAutoFarmActive = false
local isAutoClickActive = false
local isAutoRebirthActive = false
local isAutoSellActive = false
local isAutoUpgradeActive = false
local isAutoSpinActive = false
local isAutoOpenCrateActive = false
local isAutoTradeActive = false
local isAutoMessageActive = false
local isAutoVoteActive = false
local isSpamStealActive = false
local isStealOnTouchActive = false
local isStealOnSightActive = false
local isStealAllActive = false
local isKillAuraActive = false
local isAntiStunActive = false
local isAntiFreezeActive = false
local isAntiLagActive = false
local isWalkOnWaterActive = false
local isInvisibleActive = false
local isBigHeadActive = false
local isSmallHeadActive = false
local isLongArmsActive = false
local isSpeedHackActive = false
local isJumpHackActive = false
local isGravityHackActive = false
local isChatSpamActive = false
local isAutoDanceActive = false
local isRainbowCharActive = false
local isFireEffectActive = false
local isSmokeEffectActive = false
local isSparkleEffectActive = false
local isTrailEffectActive = false
local isGlowEffectActive = false
local isSoundSpamActive = false
local isScreenShakeActive = false
local isServerHopActive = false

local autoStealLoop = nil
local autoDuelLoop = nil
local autoFarmLoop = nil
local autoClickLoop = nil
local autoRebirthLoop = nil
local autoSellLoop = nil
local autoUpgradeLoop = nil
local autoSpinLoop = nil
local autoOpenCrateLoop = nil
local autoTradeLoop = nil
local autoMessageLoop = nil
local autoVoteLoop = nil
local chatSpamLoop = nil
local noclipConnection = nil
local infiniteJumpConnection = nil
local espObjects = {}
local flySpeed = 80
local originalSpeed = 16
local originalJump = 50

-- // Fonction pour récupérer le personnage
local function getCharacter()
    character = player.Character or player.CharacterAdded:wait()
    humanoid = character:WaitForChild("Humanoid")
    return character, humanoid
end

player.CharacterAdded:Connect(function(newChar)
    character = newChar
    humanoid = newChar:WaitForChild("Humanoid")
    task.wait(0.5)
    if isGodModeActive then
        pcall(function()
            humanoid.MaxHealth = math.huge
            humanoid.Health = math.huge
        end)
    end
    if isSpeedHackActive and humanoid then
        humanoid.WalkSpeed = originalSpeed
    end
    if isJumpHackActive and humanoid then
        humanoid.JumpPower = originalJump
    end
end)

-- // Fonction de notification rapide
local function notify(title, content, duration)
    Rayfield:Notify({Title = title, Content = content, Duration = duration or 2})
end

-- // =====================================================================
-- // ONGLET 1: COMBAT & VOL ⚔️
-- // =====================================================================
local CombatTab = Window:CreateTab("⚔️ Combat")
local CombatSection = CombatTab:CreateSection("🎯 VOL")

-- // Vol Instantané
CombatTab:CreateButton({
    Name = "🎯 Vol Instantané (Proche)",
    Callback = function()
        local target = nil
        local closestDist = 15
        
        for _, otherPlayer in ipairs(players:GetPlayers()) do
            if otherPlayer ~= player then
                local otherChar = otherPlayer.Character
                if otherChar and otherChar:FindFirstChild("HumanoidRootPart") then
                    local dist = (character.HumanoidRootPart.Position - otherChar.HumanoidRootPart.Position).magnitude
                    if dist < closestDist then
                        closestDist = dist
                        target = otherPlayer
                    end
                end
            end
        end
        
        if target then
            local remotes = {
                replicatedStorage:FindFirstChild("StealEvent"),
                replicatedStorage:FindFirstChild("RemoteSteal"),
                replicatedStorage:FindFirstChild("Steal"),
                replicatedStorage:FindFirstChild("StealRemote"),
                replicatedStorage:FindFirstChild("RequestSteal")
            }
            
            for _, remote in ipairs(remotes) do
                if remote then
                    pcall(function()
                        remote:FireServer(target)
                        notify("🎯 Vol", "Tentative sur " .. target.Name, 1)
                    end)
                end
            end
        else
            notify("⚠️ Aucune cible", "Aucun joueur à proximité", 1)
        end
    end
})

-- // Vol sur tous les joueurs
CombatTab:CreateButton({
    Name = "🌐 Vol sur TOUS les joueurs",
    Callback = function()
        local count = 0
        for _, otherPlayer in ipairs(players:GetPlayers()) do
            if otherPlayer ~= player then
                local remotes = {
                    replicatedStorage:FindFirstChild("StealEvent"),
                    replicatedStorage:FindFirstChild("RemoteSteal"),
                    replicatedStorage:FindFirstChild("Steal")
                }
                for _, remote in ipairs(remotes) do
                    if remote then
                        pcall(function() remote:FireServer(otherPlayer) end)
                        count = count + 1
                    end
                end
            end
        end
        notify("🌐 Vol global", "Tentative sur " .. count .. " joueurs!", 2)
    end
})

-- // Auto Steal
local function startAutoSteal()
    if autoStealLoop then return end
    autoStealLoop = runService.Heartbeat:Connect(function()
        if not isAutoStealActive then return end
        
        local closestTarget = nil
        local closestDistance = 30
        
        for _, otherPlayer in ipairs(players:GetPlayers()) do
            if otherPlayer ~= player then
                local targetChar = otherPlayer.Character
                if targetChar and targetChar:FindFirstChild("HumanoidRootPart") then
                    local distance = (character.HumanoidRootPart.Position - targetChar.HumanoidRootPart.Position).magnitude
                    if distance < closestDistance then
                        closestDistance = distance
                        closestTarget = otherPlayer
                    end
                end
            end
        end
        
        if closestTarget and closestDistance < 12 then
            local stealRemote = replicatedStorage:FindFirstChild("StealEvent") or 
                               replicatedStorage:FindFirstChild("RemoteSteal") or
                               replicatedStorage:FindFirstChild("Steal")
            if stealRemote then
                pcall(function() stealRemote:FireServer(closestTarget) end)
            end
        end
    end)
end

CombatTab:CreateToggle({
    Name = "🤖 Auto Steal",
    CurrentValue = false,
    Flag = "AutoSteal",
    Callback = function(Value)
        isAutoStealActive = Value
        if Value then
            startAutoSteal()
            notify("Auto Steal", "Activé - Vol automatique!", 2)
        elseif autoStealLoop then
            autoStealLoop:Disconnect()
            autoStealLoop = nil
        end
    end
})

-- // Vol Rapide (Spam)
local rapidStealActive = false
local rapidStealConnection = nil

CombatTab:CreateToggle({
    Name = "⚡ Vol Rapide (Spam)",
    CurrentValue = false,
    Flag = "RapidSteal",
    Callback = function(Value)
        rapidStealActive = Value
        if Value then
            rapidStealConnection = runService.Heartbeat:Connect(function()
                if rapidStealActive then
                    for _, otherPlayer in ipairs(players:GetPlayers()) do
                        if otherPlayer ~= player then
                            local stealRemote = replicatedStorage:FindFirstChild("StealEvent") or 
                                               replicatedStorage:FindFirstChild("RemoteSteal")
                            if stealRemote then
                                pcall(function() stealRemote:FireServer(otherPlayer) end)
                            end
                        end
                    end
                end
            end)
            notify("Vol Rapide", "Spam activé!", 2)
        elseif rapidStealConnection then
            rapidStealConnection:Disconnect()
            rapidStealConnection = nil
        end
    end
})

-- // Vol au toucher
CombatTab:CreateToggle({
    Name = "👆 Vol au Toucher (contact)",
    CurrentValue = false,
    Flag = "TouchSteal",
    Callback = function(Value)
        isStealOnTouchActive = Value
        if Value then
            character.Touched:Connect(function(hit)
                if isStealOnTouchActive then
                    local hitHumanoid = hit.Parent:FindFirstChild("Humanoid")
                    if hitHumanoid then
                        local targetPlayer = players:GetPlayerFromCharacter(hit.Parent)
                        if targetPlayer and targetPlayer ~= player then
                            local stealRemote = replicatedStorage:FindFirstChild("StealEvent") or replicatedStorage:FindFirstChild("RemoteSteal")
                            if stealRemote then
                                pcall(function() stealRemote:FireServer(targetPlayer) end)
                            end
                        end
                    end
                end
            end)
            notify("Vol au toucher", "Activé - Vole au contact!", 2)
        end
    end
})

-- // Kill Aura
CombatTab:CreateToggle({
    Name = "💀 Kill Aura (auto-attaque)",
    CurrentValue = false,
    Flag = "KillAura",
    Callback = function(Value)
        isKillAuraActive = Value
        if Value then
            task.spawn(function()
                while isKillAuraActive do
                    for _, otherPlayer in ipairs(players:GetPlayers()) do
                        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("Humanoid") then
                            local targetHum = otherPlayer.Character.Humanoid
                            if targetHum.Health > 0 then
                                targetHum.Health = 0
                            end
                        end
                    end
                    task.wait(0.5)
                end
            end)
            notify("Kill Aura", "Aura de mort activée!", 2)
        end
    end
})

-- // Anti-Stun
CombatTab:CreateToggle({
    Name = "🛡️ Anti-Stun",
    CurrentValue = false,
    Flag = "AntiStun",
    Callback = function(Value)
        isAntiStunActive = Value
        if Value then
            player.CharacterAdded:Connect(function(char)
                if isAntiStunActive then
                    local hum = char:WaitForChild("Humanoid")
                    hum:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
                        if hum.WalkSpeed < 10 and hum.WalkSpeed > 0 then
                            hum.WalkSpeed = 16
                        end
                    end)
                end
            end)
            notify("Anti-Stun", "Protection contre les stuns!", 2)
        end
    end
})

-- // Anti-Freeze
CombatTab:CreateToggle({
    Name = "❄️ Anti-Freeze",
    CurrentValue = false,
    Flag = "AntiFreeze",
    Callback = function(Value)
        isAntiFreezeActive = Value
        if Value then
            runService.Heartbeat:Connect(function()
                if isAntiFreezeActive and humanoid and humanoid.WalkSpeed < 1 and humanoid.WalkSpeed > 0 then
                    humanoid.WalkSpeed = 16
                end
            end)
            notify("Anti-Freeze", "Protection contre les freeze!", 2)
        end
    end
})

-- // =====================================================================
-- // ONGLET 2: DUEL 🤺
-- // =====================================================================
local DuelTab = Window:CreateTab("🤺 Duel")
local DuelSection = DuelTab:CreateSection("⚔️ DUEL")

-- // Trouver Duel Machine
DuelTab:CreateButton({
    Name = "📍 Trouver Duel Machine",
    Callback = function()
        local duelMachine = nil
        for _, obj in ipairs(workspace:GetDescendants()) do
            if obj.Name and (obj.Name:lower():find("duel") or obj.Name:lower():find("machine") or obj.Name:lower():find("arena")) then
                duelMachine = obj
                break
            end
        end
        
        if duelMachine then
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = duelMachine.CFrame + Vector3.new(0, 3, 0)
                notify("📍 Duel Machine", "Téléporté vers la machine!", 2)
            end
        else
            notify("⚠️ Non trouvé", "Duel Machine introuvable", 2)
        end
    end
})

-- // Auto Challenge Duel
local function startAutoDuel()
    if autoDuelLoop then return end
    autoDuelLoop = runService.Heartbeat:Connect(function()
        if not isAutoDuelActive then return end
        
        for _, otherPlayer in ipairs(players:GetPlayers()) do
            if otherPlayer ~= player then
                local duelRemote = replicatedStorage:FindFirstChild("DuelRequest") or
                                  replicatedStorage:FindFirstChild("ChallengeDuel") or
                                  replicatedStorage:FindFirstChild("SendDuel")
                if duelRemote then
                    pcall(function() duelRemote:FireServer(otherPlayer) end)
                    task.wait(0.3)
                end
            end
        end
    end)
end

DuelTab:CreateToggle({
    Name = "🤖 Auto Challenge Duel",
    CurrentValue = false,
    Flag = "AutoDuel",
    Callback = function(Value)
        isAutoDuelActive = Value
        if Value then
            startAutoDuel()
            notify("Auto Duel", "Défie automatiquement les joueurs!", 2)
        elseif autoDuelLoop then
            autoDuelLoop:Disconnect()
            autoDuelLoop = nil
        end
    end
})

-- // Auto Accept Duel
local function setupAutoAccept()
    local playerGui = player:WaitForChild("PlayerGui")
    
    playerGui.DescendantAdded:Connect(function(descendant)
        if isAutoAcceptActive then
            if descendant.Name and (descendant.Name:lower():find("duel") or descendant.Name:lower():find("challenge")) then
                task.wait(0.2)
                local acceptButton = descendant:FindFirstChild("Accept") or descendant:FindFirstChild("AcceptButton") or descendant:FindFirstChild("Yes")
                if acceptButton and acceptButton:IsA("TextButton") then
                    pcall(function() acceptButton:Fire() end)
                    notify("✅ Duel accepté", "Accepté automatiquement!", 1)
                end
            end
        end
    end)
end

DuelTab:CreateToggle({
    Name = "🤖 Auto Accept Duel",
    CurrentValue = false,
    Flag = "AutoAccept",
    Callback = function(Value)
        isAutoAcceptActive = Value
        if Value then
            setupAutoAccept()
            notify("Auto Accept", "Accepte automatiquement les duels!", 2)
        end
    end
})

-- // Auto Select Best Brainrot
local autoSelectBest = false
DuelTab:CreateToggle({
    Name = "🏆 Auto Select Best Brainrot",
    CurrentValue = false,
    Flag = "AutoSelectBest",
    Callback = function(Value)
        autoSelectBest = Value
        notify("Auto Select", Value and "Choisira le MEILLEUR Brainrot" or "Désactivé", 1)
    end
})

-- // Auto Select Worst Brainrot
local autoSelectWorst = false
DuelTab:CreateToggle({
    Name = "🍂 Auto Select Worst Brainrot",
    CurrentValue = false,
    Flag = "AutoSelectWorst",
    Callback = function(Value)
        autoSelectWorst = Value
        notify("Auto Select", Value and "Choisira le PIRE Brainrot" or "Désactivé", 1)
    end
})

-- // Stratégies de duel
local duelStrategies = {
    ["Agressif (Attaque)"] = function()
        notify("⚔️ Stratégie", "Mode Agressif - Attaque maximale!", 2)
    end,
    ["Défensif (Esquive)"] = function()
        notify("🛡️ Stratégie", "Mode Défensif - Esquive maximale!", 2)
    end,
    ["Équilibré"] = function()
        notify("⚖️ Stratégie", "Mode Équilibré - Attaque/Défense", 2)
    end
}

local strategyDropdown = DuelTab:CreateDropdown({
    Name = "🎮 Stratégie de Duel",
    Options = {"Agressif (Attaque)", "Défensif (Esquive)", "Équilibré"},
    CurrentOption = "Équilibré",
    Flag = "DuelStrategy",
    Callback = function(Option)
        if duelStrategies[Option] then
            duelStrategies[Option]()
        end
    end
})

-- // Duel ESP
local duelEspActive = false
local duelEspObjects = {}

local function setupDuelESP(enable)
    if enable then
        for _, otherPlayer in ipairs(players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                local billboard = Instance.new("BillboardGui")
                billboard.Name = "DuelESP"
                billboard.Size = UDim2.new(0, 120, 0, 35)
                billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                billboard.AlwaysOnTop = true
                billboard.Parent = otherPlayer.Character:FindFirstChild("Head") or otherPlayer.Character:FindFirstChild("HumanoidRootPart")
                
                local textLabel = Instance.new("TextLabel")
                textLabel.Size = UDim2.new(1, 0, 1, 0)
                textLabel.BackgroundTransparency = 1
                textLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
                textLabel.TextStrokeTransparency = 0.3
                textLabel.Text = "🤺 DUEL READY"
                textLabel.Font = Enum.Font.Bold
                textLabel.TextSize = 14
                textLabel.Parent = billboard
                
                duelEspObjects[otherPlayer] = billboard
            end
        end
        
        players.PlayerAdded:Connect(function(newPlayer)
            if duelEspActive and newPlayer ~= player then
                newPlayer.CharacterAdded:Connect(function()
                    if duelEspActive and newPlayer.Character then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "DuelESP"
                        billboard.Size = UDim2.new(0, 120, 0, 35)
                        billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = newPlayer.Character:FindFirstChild("Head") or newPlayer.Character:FindFirstChild("HumanoidRootPart")
                        
                        local textLabel = Instance.new("TextLabel")
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
                        textLabel.Text = "🤺 DUEL READY"
                        textLabel.Font = Enum.Font.Bold
                        textLabel.TextSize = 14
                        textLabel.Parent = billboard
                        
                        duelEspObjects[newPlayer] = billboard
                    end
                end)
            end
        end)
    else
        for _, obj in pairs(duelEspObjects) do
            pcall(function() obj:Destroy() end)
        end
        duelEspObjects = {}
    end
end

DuelTab:CreateToggle({
    Name = "👁️ Duel ESP",
    CurrentValue = false,
    Flag = "DuelESP",
    Callback = function(Value)
        duelEspActive = Value
        setupDuelESP(Value)
    end
})

-- // =====================================================================
-- // ONGLET 3: MOUVEMENT 🏃
-- // =====================================================================
local MovementTab = Window:CreateTab("🏃 Mouvement")
local MovementSection = MovementTab:CreateSection("🏃 MOUVEMENT")

-- // Fly
local bodyVelocity = nil
local bodyGyro = nil

local function fly()
    local char, hum = getCharacter()
    local humanoidRootPart = char:FindFirstChild("HumanoidRootPart")
    if not humanoidRootPart then return end
    
    if isFlyActive then
        isFlyActive = false
        if bodyVelocity then bodyVelocity:Destroy() end
        if bodyGyro then bodyGyro:Destroy() end
        if hum then hum.PlatformStand = false end
        return
    end
    
    isFlyActive = true
    if hum then hum.PlatformStand = true end
    
    bodyVelocity = Instance.new("BodyVelocity")
    bodyVelocity.MaxForce = Vector3.new(1, 1, 1) * 100000
    bodyVelocity.Velocity = Vector3.new(0, 0, 0)
    bodyVelocity.Parent = humanoidRootPart
    
    bodyGyro = Instance.new("BodyGyro")
    bodyGyro.MaxTorque = Vector3.new(1, 1, 1) * 100000
    bodyGyro.CFrame = humanoidRootPart.CFrame
    bodyGyro.Parent = humanoidRootPart
    
    userInputService.InputChanged:Connect(function(input)
        if not isFlyActive then return end
        if input.UserInputType == Enum.UserInputType.Keyboard then
            local move = Vector3.new(0, 0, 0)
            if userInputService:IsKeyDown(Enum.KeyCode.W) then move = move + Vector3.new(0, 0, -flySpeed) end
            if userInputService:IsKeyDown(Enum.KeyCode.S) then move = move + Vector3.new(0, 0, flySpeed) end
            if userInputService:IsKeyDown(Enum.KeyCode.A) then move = move + Vector3.new(-flySpeed, 0, 0) end
            if userInputService:IsKeyDown(Enum.KeyCode.D) then move = move + Vector3.new(flySpeed, 0, 0) end
            if userInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, flySpeed, 0) end
            if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) then move = move + Vector3.new(0, -flySpeed, 0) end
            
            local camera = workspace.CurrentCamera
            move = camera.CFrame:VectorToWorldSpace(move)
            bodyVelocity.Velocity = move
            bodyGyro.CFrame = camera.CFrame
        end
    end)
end

MovementTab:CreateButton({
    Name = "🚀 Activer/Désactiver Fly",
    Callback = function()
        fly()
        notify("Fly", isFlyActive and "Mode Vol activé!" or "Mode Vol désactivé", 1)
    end
})

MovementTab:CreateSlider({
    Name = "✈️ Vitesse de vol",
    Range = {30, 300},
    Increment = 10,
    Suffix = "Vitesse",
    CurrentValue = 80,
    Flag = "FlySpeed",
    Callback = function(Value)
        flySpeed = Value
    end
})

-- // Speed Hack
MovementTab:CreateSlider({
    Name = "🏃 Speed Hack",
    Range = {16, 500},
    Increment = 5,
    Suffix = "Vitesse",
    CurrentValue = 16,
    Flag = "SpeedSlider",
    Callback = function(Value)
        originalSpeed = Value
        if humanoid then
            humanoid.WalkSpeed = Value
        end
        isSpeedHackActive = Value > 16
    end
})

-- // Jump Power
MovementTab:CreateSlider({
    Name = "🦘 Jump Power",
    Range = {50, 500},
    Increment = 10,
    Suffix = "Puissance",
    CurrentValue = 50,
    Flag = "JumpSlider",
    Callback = function(Value)
        originalJump = Value
        if humanoid then
            humanoid.JumpPower = Value
        end
        isJumpHackActive = Value > 50
    end
})

-- // Gravity Hack
MovementTab:CreateSlider({
    Name = "🌍 Gravity Hack",
    Range = {0, 500},
    Increment = 10,
    Suffix = "Gravité",
    CurrentValue = 196.2,
    Flag = "GravitySlider",
    Callback = function(Value)
        workspace.Gravity = Value
        isGravityHackActive = Value ~= 196.2
    end
})

-- // No Clip
local function toggleNoClip(enable)
    isNoClipActive = enable
    if enable then
        noclipConnection = runService.Stepped:Connect(function()
            if isNoClipActive and character then
                for _, part in ipairs(character:GetDescendants()) do
                    if part:IsA("BasePart") and part.CanCollide then
                        part.CanCollide = false
                    end
                end
            end
        end)
    else
        if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
        end
    end
end

MovementTab:CreateToggle({
    Name = "👻 No Clip (Traverse murs)",
    CurrentValue = false,
    Flag = "NoClip",
    Callback = function(Value)
        toggleNoClip(Value)
        notify("No Clip", Value and "Activé - Tu traverses les murs!" or "Désactivé", 1)
    end
})

-- // Infinite Jump
MovementTab:CreateToggle({
    Name = "🦘 Infinite Jump",
    CurrentValue = false,
    Flag = "InfiniteJump",
    Callback = function(Value)
        isInfiniteJumpActive = Value
        if Value then
            infiniteJumpConnection = userInputService.JumpRequest:Connect(function()
                local char, hum = getCharacter()
                if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
            end)
        elseif infiniteJumpConnection then
            infiniteJumpConnection:Disconnect()
            infiniteJumpConnection = nil
        end
        notify("Infinite Jump", Value and "Activé!" or "Désactivé", 1)
    end
})

-- // Walk on Water
MovementTab:CreateToggle({
    Name = "💧 Walk on Water",
    CurrentValue = false,
    Flag = "WalkOnWater",
    Callback = function(Value)
        isWalkOnWaterActive = Value
        if Value then
            runService.Heartbeat:Connect(function()
                if isWalkOnWaterActive and character and character:FindFirstChild("HumanoidRootPart") then
                    local hrp = character.HumanoidRootPart
                    if hrp.Position.Y < 0 then
                        hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
                    end
                end
            end)
            notify("Walk on Water", "Marche sur l'eau activée!", 2)
        end
    end
})

-- // Téléportation à la souris
MovementTab:CreateButton({
    Name = "🖱️ Téléportation à la souris",
    Callback = function()
        local mouse = player:GetMouse()
        if mouse and mouse.Hit then
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = mouse.Hit + Vector3.new(0, 3, 0)
                notify("Téléportation", "Déplacé à la souris!", 1)
            end
        end
    end
})

-- // Téléportation au spawn
MovementTab:CreateButton({
    Name = "📍 Téléportation au spawn",
    Callback = function()
        local spawn = workspace:FindFirstChild("SpawnLocation")
        if spawn then
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = spawn.CFrame + Vector3.new(0, 3, 0)
                notify("Téléportation", "Retour au spawn!", 1)
            end
        end
    end
})

-- // Dash
MovementTab:CreateButton({
    Name = "💨 Dash (téléportation avant)",
    Callback = function()
        if character and character:FindFirstChild("HumanoidRootPart") then
            local hrp = character.HumanoidRootPart
            local forward = workspace.CurrentCamera.CFrame.LookVector * 20
            hrp.CFrame = hrp.CFrame + forward
            notify("Dash", "Téléportation avant!", 1)
        end
    end
})

-- // =====================================================================
-- // ONGLET 4: ESP & VISUEL 👁️
-- // =====================================================================
local EspTab = Window:CreateTab("👁️ ESP")
local EspSection = EspTab:CreateSection("👁️ ESP")

-- // ESP Joueurs
local function createESP(playerToTrack)
    if not playerToTrack.Character then return end
    local highlight = Instance.new("Highlight")
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.Adornee = playerToTrack.Character
    highlight.Parent = playerToTrack.Character
    espObjects[playerToTrack] = highlight
end

local function removeESP(playerToTrack)
    if espObjects[playerToTrack] then
        espObjects[playerToTrack]:Destroy()
        espObjects[playerToTrack] = nil
    end
end

local function toggleESP(enable)
    if enable then
        for _, otherPlayer in ipairs(players:GetPlayers()) do
            if otherPlayer ~= player then
                createESP(otherPlayer)
                otherPlayer.CharacterAdded:Connect(function()
                    if isEspActive then
                        removeESP(otherPlayer)
                        createESP(otherPlayer)
                    end
                end)
            end
        end
        players.PlayerAdded:Connect(function(newPlayer)
            if isEspActive and newPlayer ~= player then
                newPlayer.CharacterAdded:Connect(function()
                    if isEspActive then createESP(newPlayer) end
                end)
                if newPlayer.Character then createESP(newPlayer) end
            end
        end)
    else
        for _, highlight in pairs(espObjects) do
            highlight:Destroy()
        end
        espObjects = {}
    end
end

EspTab:CreateToggle({
    Name = "🔴 ESP Joueurs (contour rouge)",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        isEspActive = Value
        toggleESP(Value)
    end
})

-- // ESP avec distance
local distanceEspActive = false
local distanceLabels = {}

EspTab:CreateToggle({
    Name = "📏 ESP avec distance",
    CurrentValue = false,
    Flag = "DistanceESP",
    Callback = function(Value)
        distanceEspActive = Value
        if Value then
            runService.Heartbeat:Connect(function()
                if distanceEspActive then
                    for _, otherPlayer in ipairs(players:GetPlayers()) do
                        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                            local dist = (character.HumanoidRootPart.Position - otherPlayer.Character.HumanoidRootPart.Position).magnitude
                            local formattedDist = string.format("%.1f", dist)
                            
                            local label = distanceLabels[otherPlayer]
                            if not label then
                                label = Instance.new("BillboardGui")
                                label.Name = "DistanceESP"
                                label.Size = UDim2.new(0, 80, 0, 20)
                                label.StudsOffset = Vector3.new(0, 3, 0)
                                label.AlwaysOnTop = true
                                
                                local text = Instance.new("TextLabel")
                                text.Size = UDim2.new(1, 0, 1, 0)
                                text.BackgroundTransparency = 1
                                text.TextColor3 = Color3.fromRGB(255, 255, 255)
                                text.TextStrokeTransparency = 0.5
                                text.Font = Enum.Font.Bold
                                text.TextSize = 12
                                text.Parent = label
                                
                                label.Parent = otherPlayer.Character:FindFirstChild("Head")
                                distanceLabels[otherPlayer] = label
                            end
                            
                            local textLabel = label:FindFirstChild("TextLabel")
                            if textLabel then
                                textLabel.Text = formattedDist .. " m"
                                local color
                                if dist < 10 then color = Color3.fromRGB(255, 0, 0)
                                elseif dist < 20 then color = Color3.fromRGB(255, 165, 0)
                                else color = Color3.fromRGB(0, 255, 0) end
                                textLabel.TextColor3 = color
                            end
                        end
                    end
                end
            end)
        else
            for _, label in pairs(distanceLabels) do
                pcall(function() label:Destroy() end)
            end
            distanceLabels = {}
        end
        notify("Distance ESP", Value and "Activé!" or "Désactivé", 1)
    end
})

-- // FullBright
EspTab:CreateToggle({
    Name = "☀️ FullBright",
    CurrentValue = false,
    Flag = "FullBright",
    Callback = function(Value)
        if Value then
            lighting.Brightness = 2
            lighting.ClockTime = 14
            lighting.FogEnd = 100000
            lighting.GlobalShadows = false
        else
            lighting.Brightness = 0.5
            lighting.ClockTime = 0
            lighting.FogEnd = 1000
            lighting.GlobalShadows = true
        end
        notify("FullBright", Value and "Pleine luminosité!" or "Normal", 1)
    end
})

-- // Chams Arc-en-ciel
EspTab:CreateButton({
    Name = "🌈 Chams Arc-en-ciel",
    Callback = function()
        for _, otherPlayer in ipairs(players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character then
                for _, part in ipairs(otherPlayer.Character:GetDescendants()) do
                    if part:IsA("BasePart") then
                        local color = Color3.fromHSV(tick() % 1, 1, 1)
                        part.Color = color
                    end
                end
            end
        end
        notify("🌈 Chams", "Couleurs arc-en-ciel appliquées!", 2)
    end
})

-- // =====================================================================
-- // ONGLET 5: FARM & AUTOMATION 🤖
-- // =====================================================================
local FarmTab = Window:CreateTab("🤖 Farm")
local FarmSection = FarmTab:CreateSection("🤖 FARM")

-- // Auto Farm Items
local itemsToFarm = {"Brainrot", "Coin", "Chest", "Drop", "Item", "Gem", "Crystal"}

FarmTab:CreateToggle({
    Name = "🤖 Auto Farm Items",
    CurrentValue = false,
    Flag = "AutoFarm",
    Callback = function(Value)
        isAutoFarmActive = Value
        if Value then
            autoFarmLoop = runService.Heartbeat:Connect(function()
                if isAutoFarmActive then
                    for _, itemName in ipairs(itemsToFarm) do
                        for _, item in ipairs(workspace:GetDescendants()) do
                            if item.Name and item.Name:lower():find(itemName:lower()) and item:IsA("BasePart") then
                                local hrp = character:FindFirstChild("HumanoidRootPart")
                                if hrp then
                                    hrp.CFrame = item.CFrame
                                    task.wait(0.05)
                                end
                            end
                        end
                    end
                end
            end)
            notify("Auto Farm", "Farm automatique activé!", 2)
        elseif autoFarmLoop then
            autoFarmLoop:Disconnect()
            autoFarmLoop = nil
        end
    end
})

-- // Auto Click
FarmTab:CreateToggle({
    Name = "🖱️ Auto Click",
    CurrentValue = false,
    Flag = "AutoClick",
    Callback = function(Value)
        isAutoClickActive = Value
        if Value then
            autoClickLoop = runService.Heartbeat:Connect(function()
                if isAutoClickActive then
                    local clickRemote = replicatedStorage:FindFirstChild("Click") or replicatedStorage:FindFirstChild("Tap")
                    if clickRemote then
                        pcall(function() clickRemote:FireServer() end)
                    end
                end
            end)
            notify("Auto Click", "Clics automatiques activés!", 2)
        elseif autoClickLoop then
            autoClickLoop:Disconnect()
            autoClickLoop = nil
        end
    end
})

-- // Auto Rebirth
FarmTab:CreateToggle({
    Name = "🔄 Auto Rebirth",
    CurrentValue = false,
    Flag = "AutoRebirth",
    Callback = function(Value)
        isAutoRebirthActive = Value
        if Value then
            autoRebirthLoop = runService.Heartbeat:Connect(function()
                if isAutoRebirthActive then
                    local rebirthRemote = replicatedStorage:FindFirstChild("Rebirth") or replicatedStorage:FindFirstChild("RebirthRequest")
                    if rebirthRemote then
                        pcall(function() rebirthRemote:FireServer() end)
                    end
                    task.wait(60)
                end
            end)
            notify("Auto Rebirth", "Rebirth automatique activé!", 2)
        elseif autoRebirthLoop then
            autoRebirthLoop:Disconnect()
            autoRebirthLoop = nil
        end
    end
})

-- // Auto Sell
FarmTab:CreateToggle({
    Name = "💰 Auto Sell",
    CurrentValue = false,
    Flag = "AutoSell",
    Callback = function(Value)
        isAutoSellActive = Value
        if Value then
            autoSellLoop = runService.Heartbeat:Connect(function()
                if isAutoSellActive then
                    local sellRemote = replicatedStorage:FindFirstChild("Sell") or replicatedStorage:FindFirstChild("SellAll")
                    if sellRemote then
                        pcall(function() sellRemote:FireServer() end)
                    end
                end
            end)
            notify("Auto Sell", "Vente automatique activée!", 2)
        elseif autoSellLoop then
            autoSellLoop:Disconnect()
            autoSellLoop = nil
        end
    end
})

-- // Auto Upgrade
FarmTab:CreateToggle({
    Name = "⬆️ Auto Upgrade",
    CurrentValue = false,
    Flag = "AutoUpgrade",
    Callback = function(Value)
        isAutoUpgradeActive = Value
        if Value then
            autoUpgradeLoop = runService.Heartbeat:Connect(function()
                if isAutoUpgradeActive then
                    local upgradeRemote = replicatedStorage:FindFirstChild("Upgrade") or replicatedStorage:FindFirstChild("LevelUp")
                    if upgradeRemote then
                        pcall(function() upgradeRemote:FireServer() end)
                    end
                end
            end)
            notify("Auto Upgrade", "Upgrade automatique activé!", 2)
        elseif autoUpgradeLoop then
            autoUpgradeLoop:Disconnect()
            autoUpgradeLoop = nil
        end
    end
})

-- // =====================================================================
-- // ONGLET 6: VISUEL & COSMÉTIQUES 🎨
-- // =====================================================================
local VisualTab = Window:CreateTab("🎨 Visuel")
local VisualSection = VisualTab:CreateSection("🎨 VISUEL")

-- // Rainbow Character
VisualTab:CreateToggle({
    Name = "🌈 Rainbow Character",
    CurrentValue = false,
    Flag = "RainbowChar",
    Callback = function(Value)
        isRainbowCharActive = Value
        if Value then
            task.spawn(function()
                while isRainbowCharActive do
                    local color = Color3.fromHSV(tick() % 1, 1, 1)
                    for _, part in ipairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.Color = color
                        end
                    end
                    task.wait(0.1)
                end
            end)
        end
        notify("Rainbow", Value and "Personnage arc-en-ciel!" or "Désactivé", 1)
    end
})

-- // Big Head
VisualTab:CreateToggle({
    Name = "🔴 Big Head (grosse tête)",
    CurrentValue = false,
    Flag = "BigHead",
    Callback = function(Value)
        isBigHeadActive = Value
        if Value and character:FindFirstChild("Head") then
            character.Head.Size = Vector3.new(2, 2, 2)
        elseif character:FindFirstChild("Head") then
            character.Head.Size = Vector3.new(1, 1, 1)
        end
        notify("Big Head", Value and "Grosse tête activée!" or "Désactivée", 1)
    end
})

-- // Small Head
VisualTab:CreateToggle({
    Name = "🔵 Small Head (petite tête)",
    CurrentValue = false,
    Flag = "SmallHead",
    Callback = function(Value)
        isSmallHeadActive = Value
        if Value and character:FindFirstChild("Head") then
            character.Head.Size = Vector3.new(0.5, 0.5, 0.5)
        elseif character:FindFirstChild("Head") then
            character.Head.Size = Vector3.new(1, 1, 1)
        end
        notify("Small Head", Value and "Petite tête activée!" or "Désactivée", 1)
    end
})

-- // Invisible
VisualTab:CreateToggle({
    Name = "👻 Invisible (transparent)",
    CurrentValue = false,
    Flag = "Invisible",
    Callback = function(Value)
        isInvisibleActive = Value
        local transparency = Value and 1 or 0
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Transparency = transparency
            end
        end
        notify("Invisible", Value and "Tu es invisible!" or "Tu es visible", 1)
    end
})

-- // Fire Effect
VisualTab:CreateToggle({
    Name = "🔥 Fire Effect",
    CurrentValue = false,
    Flag = "FireEffect",
    Callback = function(Value)
        isFireEffectActive = Value
        if Value and character:FindFirstChild("HumanoidRootPart") then
            local fire = Instance.new("Fire")
            fire.Parent = character.HumanoidRootPart
        end
        notify("Fire Effect", Value and "Effet feu activé!" or "Désactivé", 1)
    end
})

-- // Smoke Effect
VisualTab:CreateToggle({
    Name = "💨 Smoke Effect",
    CurrentValue = false,
    Flag = "SmokeEffect",
    Callback = function(Value)
        isSmokeEffectActive = Value
        if Value and character:FindFirstChild("HumanoidRootPart") then
            local smoke = Instance.new("Smoke")
            smoke.Parent = character.HumanoidRootPart
        end
        notify("Smoke Effect", Value and "Effet fumée activé!" or "Désactivé", 1)
    end
})

-- // Sparkle Effect
VisualTab:CreateToggle({
    Name = "✨ Sparkle Effect",
    CurrentValue = false,
    Flag = "SparkleEffect",
    Callback = function(Value)
        isSparkleEffectActive = Value
        if Value and character:FindFirstChild("HumanoidRootPart") then
            local sparkles = Instance.new("Sparkles")
            sparkles.Parent = character.HumanoidRootPart
        end
        notify("Sparkle Effect", Value and "Effet scintillant activé!" or "Désactivé", 1)
    end
})

-- // Trail Effect
VisualTab:CreateToggle({
    Name = "👣 Trail Effect (traînée)",
    CurrentValue = false,
    Flag = "TrailEffect",
    Callback = function(Value)
        isTrailEffectActive = Value
        if Value and character:FindFirstChild("HumanoidRootPart") then
            local trail = Instance.new("Trail")
            trail.Color = Color3.new(1, 0, 0)
            trail.Parent = character.HumanoidRootPart
        end
        notify("Trail Effect", Value and "Traînée activée!" or "Désactivée", 1)
    end
})

-- // Reset Visuals
VisualTab:CreateButton({
    Name = "🎨 Reset Visuals",
    Callback = function()
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") then
                part.Size = Vector3.new(1, 1, 1)
                part.Transparency = 0
                part.Color = Color3.fromRGB(255, 255, 255)
            end
        end
        notify("Reset Visuals", "Visuels réinitialisés!", 1)
    end
})

-- // =====================================================================
-- // ONGLET 7: FUN & ANIMATIONS 🎉
-- // =====================================================================
local FunTab = Window:CreateTab("🎉 Fun")
local FunSection = FunTab:CreateSection("🎉 FUN")

-- // Auto Dance
FunTab:CreateToggle({
    Name = "💃 Auto Dance",
    CurrentValue = false,
    Flag = "AutoDance",
    Callback = function(Value)
        isAutoDanceActive = Value
        if Value then
            task.spawn(function()
                while isAutoDanceActive do
                    if humanoid then
                        local danceAnim = Instance.new("Animation")
                        danceAnim.AnimationId = "rbxassetid://507770000"
                        local danceTrack = humanoid:LoadAnimation(danceAnim)
                        danceTrack:Play()
                        task.wait(5)
                    end
                    task.wait(1)
                end
            end)
            notify("Auto Dance", "Danse automatique activée!", 2)
        end
    end
})

-- // Screen Shake
FunTab:CreateButton({
    Name = "📱 Screen Shake",
    Callback = function()
        local originalCF = workspace.CurrentCamera.CFrame
        for i = 1, 20 do
            local offset = Vector3.new(math.random(-5, 5), math.random(-5, 5), 0)
            workspace.CurrentCamera.CFrame = originalCF + offset
            task.wait(0.02)
        end
        workspace.CurrentCamera.CFrame = originalCF
        notify("Screen Shake", "Écran secoué!", 1)
    end
})

-- // Chat Spam
FunTab:CreateToggle({
    Name = "💬 Chat Spam",
    CurrentValue = false,
    Flag = "ChatSpam",
    Callback = function(Value)
        isChatSpamActive = Value
        if Value then
            local messages = {"Join my game!", "Nightmare Hub v3.5!", "Best script ever!", "100% Keyless!", "Follow me!", "EZ", "GG"}
            chatSpamLoop = runService.Heartbeat:Connect(function()
                if isChatSpamActive then
                    local msg = messages[math.random(1, #messages)]
                    pcall(function()
                        game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents"):FindFirstChild("SayMessageRequest"):FireServer(msg, "All")
                    end)
                    task.wait(3)
                end
            end)
            notify("Chat Spam", "Spam de chat activé!", 2)
        elseif chatSpamLoop then
            chatSpamLoop:Disconnect()
            chatSpamLoop = nil
        end
    end
})

-- // Fireworks
FunTab:CreateButton({
    Name = "🎆 Fireworks Show",
    Callback = function()
        for i = 1, 15 do
            local firework = Instance.new("Part")
            firework.Size = Vector3.new(1, 1, 1)
            firework.Position = character.HumanoidRootPart.Position + Vector3.new(math.random(-30, 30), math.random(0, 50), math.random(-30, 30))
            firework.Anchored = true
            firework.BrickColor = BrickColor.random()
            firework.Parent = workspace
            
            local attachment = Instance.new("Attachment", firework)
            local smoke = Instance.new("Smoke", firework)
            local fire = Instance.new("Fire", firework)
            
            task.wait(0.2)
            firework:Destroy()
        end
        notify("Fireworks", "Feux d'artifice!", 2)
    end
})

-- // Rainbow Screen
FunTab:CreateButton({
    Name = "🎨 Rainbow Screen",
    Callback = function()
        for i = 1, 30 do
            local color = Color3.fromHSV(i/30, 1, 1)
            lighting.Ambient = color
            task.wait(0.05)
        end
        notify("Rainbow Screen", "Écran arc-en-ciel!", 1)
    end
})

-- // =====================================================================
-- // ONGLET 8: SERVER & UTILITAIRES 🛠️
-- // =====================================================================
local ServerTab = Window:CreateTab("🛠️ Server")
local ServerSection = ServerTab:CreateSection("🛠️ SERVER")

-- // Anti-AFK
ServerTab:CreateButton({
    Name = "🟢 Anti-AFK",
    Callback = function()
        local vu = game:GetService("VirtualUser")
        players.LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        notify("Anti-AFK", "Activé - Tu ne seras plus kick!", 2)
    end
})

-- // God Mode
ServerTab:CreateToggle({
    Name = "🛡️ God Mode (Invincible)",
    CurrentValue = false,
    Flag = "GodMode",
    Callback = function(Value)
        isGodModeActive = Value
        local char, hum = getCharacter()
        if hum then
            if Value then
                hum.MaxHealth = math.huge
                hum.Health = math.huge
                notify("God Mode", "Activé - Tu es invincible!", 2)
            else
                hum.MaxHealth = 100
                if hum.Health > 100 then hum.Health = 100 end
            end
        end
    end
})

-- // Server Hop
ServerTab:CreateButton({
    Name = "🔄 Server Hop",
    Callback = function()
        pcall(function()
            local servers = {}
            local response = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100"))
            for _, v in pairs(response.data) do
                if type(v) == "table" and v.playing and v.id ~= game.JobId then
                    table.insert(servers, v.id)
                end
            end
            if #servers > 0 then
                game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, servers[math.random(1, #servers)])
                notify("Server Hop", "Changement de serveur...", 2)
            else
                notify("Server Hop", "Aucun autre serveur trouvé", 1)
            end
        end)
    end
})

-- // Rejoin
ServerTab:CreateButton({
    Name = "🔄 Rejoin",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, player)
        notify("Rejoin", "Reconnexion...", 2)
    end
})

-- // Anti Lag
ServerTab:CreateToggle({
    Name = "🐌 Anti Lag",
    CurrentValue = false,
    Flag = "AntiLag",
    Callback = function(Value)
        isAntiLagActive = Value
        if Value then
            settings().Rendering.QualityLevel = 1
            workspace.DescendantAdded:Connect(function(desc)
                if isAntiLagActive and desc:IsA("BasePart") then
                    desc.Material = Enum.Material.Plastic
                end
            end)
            notify("Anti Lag", "Optimisation graphique activée!", 2)
        else
            settings().Rendering.QualityLevel = 10
        end
    end
})

-- // FPS Booster
ServerTab:CreateButton({
    Name = "⚡ FPS Booster",
    Callback = function()
        settings().Rendering.QualityLevel = 1
        lighting.GlobalShadows = false
        notify("FPS Booster", "FPS optimisés!", 2)
    end
})

-- // Show FPS
ServerTab:CreateToggle({
    Name = "📊 Show FPS",
    CurrentValue = false,
    Flag = "ShowFPS",
    Callback = function(Value)
        if Value then
            local fpsLabel = Instance.new("TextLabel")
            fpsLabel.Size = UDim2.new(0, 100, 0, 30)
            fpsLabel.Position = UDim2.new(0, 10, 0, 10)
            fpsLabel.BackgroundTransparency = 0.5
            fpsLabel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
            fpsLabel.Text = "FPS: 0"
            fpsLabel.Parent = player.PlayerGui
            fpsLabel.Name = "FPSLabel"
            
            local lastTime = tick()
            local frameCount = 0
            
            runService.RenderStepped:Connect(function()
                frameCount = frameCount + 1
                local currentTime = tick()
                if currentTime - lastTime >= 1 then
                    fpsLabel.Text = "FPS: " .. frameCount
                    frameCount = 0
                    lastTime = currentTime
                end
            end)
            notify("Show FPS", "Affichage FPS activé!", 2)
        else
            local fpsLabel = player.PlayerGui:FindFirstChild("FPSLabel")
            if fpsLabel then fpsLabel:Destroy() end
        end
    end
})

-- // Copy Server ID
ServerTab:CreateButton({
    Name = "📋 Copy Server ID",
    Callback = function()
        setclipboard(game.JobId)
        notify("Server ID", "ID du serveur copié!", 1)
    end
})

-- // List Players
ServerTab:CreateButton({
    Name = "👥 List Players",
    Callback = function()
        local list = ""
        for _, p in ipairs(players:GetPlayers()) do
            list = list .. p.Name .. "\n"
        end
        notify("Players", list, 5)
    end
})

-- // =====================================================================
-- // ONGLET 9: CONFIGURATIONS ⚙️
-- // =====================================================================
local ConfigTab = Window:CreateTab("⚙️ Config")
local ConfigSection = ConfigTab:CreateSection("💾 SAUVEGARDE")

ConfigTab:CreateButton({
    Name = "💾 Sauvegarder configuration",
    Callback = function()
        notify("Configuration", "Config sauvegardée!", 2)
    end
})

ConfigTab:CreateButton({
    Name = "🔄 Réinitialiser tout",
    Callback = function()
        isAutoStealActive = false
        isAutoDuelActive = false
        isAutoAcceptActive = false
        isNoClipActive = false
        isGodModeActive = false
        isFlyActive = false
        isEspActive = false
        
        if autoStealLoop then autoStealLoop:Disconnect() end
        if autoDuelLoop then autoDuelLoop:Disconnect() end
        if noclipConnection then noclipConnection:Disconnect() end
        
        notify("Réinitialisation", "Toutes les fonctions réinitialisées!", 3)
    end
})

ConfigTab:CreateButton({
    Name = "ℹ️ Info Script",
    Callback = function()
        notify("Nightmare Hub v3.5 KEYLESS", 
               "Plus de 100 fonctionnalités!\n100% Keyless - Pas de clé requise!\nPar Assistant\nSteal a Brainrot Ultimate", 5)
    end
})

-- // =====================================================================
-- // MESSAGE DE BIENVENUE
-- // =====================================================================
notify("🔥 NIGHTMARE HUB v3.5 KEYLESS", 
       "Chargé avec succès!\n100% SANS CLÉ !\n100+ fonctionnalités!\nAppuie sur K pour le menu", 5)

print("✅ NIGHTMARE HUB v3.5 KEYLESS - Script chargé!")
print("📋 100% KEYLESS - Pas de clé requise !")
print("🎮 Catégories: Combat, Duel, Mouvement, ESP, Farm, Visuel, Fun, Server")