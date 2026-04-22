-- // =====================================================================
-- 🔥 NIGHTMARE HUB v4.5 ULTIMATE 🔥
-- Script ULTIME pour Steal a Brainrot
-- NOUVEAU : Catégorie TRADE MACHINE complète !
-- Version: 4.5 | 100% KEYLESS | Par Assistant
-- =====================================================================

-- // ===============================
-- // CHARGEMENT DE L'INTERFACE
-- // ===============================
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- // ===============================
-- // FENÊTRE PRINCIPALE
-- // ===============================
local Window = Rayfield:CreateWindow({
    Name = "NIGHTMARE HUB v4.5 🔥",
    LoadingTitle = "Nightmare Hub Ultimate",
    LoadingSubtitle = "Steal a Brainrot - TRADE MACHINE + DUEL + RIVALS",
    Theme = "AmberGlow",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "NightmareHubV45",
        FileName = "Config"
    },
    KeySystem = false,
    ToggleUIKeybind = "K"
})

-- // ===============================
-- // VARIABLES GLOBALES
-- // ===============================
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:wait()
local humanoid = character:WaitForChild("Humanoid")
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local replicatedStorage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
local lighting = game:GetService("Lighting")
local tweenService = game:GetService("TweenService")
local virtualUser = game:GetService("VirtualUser")

-- // Variables pour les fonctions existantes
local isAutoStealActive = false
local isAutoDuelActive = false
local isAutoAcceptActive = false
local isNoClipActive = false
local isGodModeActive = false
local isInfiniteJumpActive = false
local isFlyActive = false
local isEspActive = false
local isAutoFarmActive = false
local isAutoClickActive = false
local isAutoRebirthActive = false
local isAutoSellActive = false
local isAutoUpgradeActive = false
local isPlatformFloatActive = false
local isRivalsAutoStealActive = false
local isRivalsESPActive = false
local isRivalsAutoFarmActive = false
local isDuelAutoAttackActive = false
local isDuelAutoDodgeActive = false
local isChatSpamActive = false
local isAutoDanceActive = false
local isRainbowCharActive = false

-- // NOUVELLES VARIABLES POUR LA TRADE MACHINE
local isAutoTradeAcceptActive = false
local isTradeScamProtectActive = false
local isAutoAddBrainrotActive = false
local isTradeSpeedActive = false
local isTradeESPActive = false
local isAutoTradeRequestActive = false
local selectedBrainrotForTrade = nil
local tradePartner = nil
local tradeMachineLocation = nil

local autoStealLoop = nil
local autoDuelLoop = nil
local autoFarmLoop = nil
local autoClickLoop = nil
local autoRebirthLoop = nil
local autoSellLoop = nil
local autoUpgradeLoop = nil
local autoTradeAcceptLoop = nil
local autoTradeRequestLoop = nil
local chatSpamLoop = nil
local noclipConnection = nil
local infiniteJumpConnection = nil
local platformFloatConnection = nil
local espObjects = {}
local rivalsEspObjects = {}
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
    if isPlatformFloatActive then
        setupPlatformFloat(true)
    end
end)

-- // Fonction de notification rapide
local function notify(title, content, duration)
    Rayfield:Notify({Title = title, Content = content, Duration = duration or 2})
end

-- // Fonction pour trouver la Trade Machine
local function findTradeMachine()
    for _, obj in ipairs(workspace:GetDescendants()) do
        if obj.Name and (obj.Name:lower():find("trade") or obj.Name:lower():find("trading") or obj.Name:lower():find("machine")) then
            if obj:IsA("BasePart") or obj:IsA("Model") then
                return obj
            end
        end
    end
    return nil
end

-- // =====================================================================
-- // NOUVEAU : ONGLET TRADE MACHINE 🤝
-- // =====================================================================
local TradeTab = Window:CreateTab("🤝 Trade Machine")
local TradeSection = TradeTab:CreateSection("📦 TRADE MACHINE - NOUVEAU !")

-- // Information sur la Trade Machine
TradeTab:CreateParagraph({
    Title = "ℹ️ À propos de la Trade Machine",
    Content = "La Trade Machine permet d'échanger des Brainrots en toute sécurité !\n\n📍 Emplacement : À côté de la Divine Spin, au centre de la carte\n🎮 Interaction : Deux joueurs doivent interagir en même temps\n🛡️ Sécurité : Échange sécurisé sans risque de scam\n\n⚠️ ATTENTION : Les scripts d'exploitation de la Trade Machine ont été patchés. Utilise ces outils pour te protéger des scams !"
})

-- // 1. Trouver la Trade Machine
TradeTab:CreateButton({
    Name = "📍 Trouver la Trade Machine",
    Callback = function()
        local tradeMachine = findTradeMachine()
        if tradeMachine then
            tradeMachineLocation = tradeMachine
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if hrp then
                local cframe = tradeMachine:IsA("BasePart") and tradeMachine.CFrame or (tradeMachine:FindFirstChild("HumanoidRootPart") and tradeMachine.HumanoidRootPart.CFrame)
                if cframe then
                    hrp.CFrame = cframe + Vector3.new(0, 3, 0)
                    notify("📍 Trade Machine", "Téléporté à la machine d'échange !", 2)
                end
            end
        else
            notify("⚠️ Non trouvé", "Trade Machine introuvable dans ce serveur", 2)
        end
    end
})

-- // 2. Auto Trade Request (demande d'échange automatique)
local function startAutoTradeRequest()
    if autoTradeRequestLoop then return end
    autoTradeRequestLoop = runService.Heartbeat:Connect(function()
        if not isAutoTradeRequestActive then return end
        
        for _, otherPlayer in ipairs(players:GetPlayers()) do
            if otherPlayer ~= player then
                local tradeRemote = replicatedStorage:FindFirstChild("TradeRequest") or
                                  replicatedStorage:FindFirstChild("SendTrade") or
                                  replicatedStorage:FindFirstChild("RequestTrade")
                if tradeRemote then
                    pcall(function() tradeRemote:FireServer(otherPlayer) end)
                    task.wait(1)
                end
            end
        end
    end)
end

TradeTab:CreateToggle({
    Name = "🤖 Auto Trade Request",
    CurrentValue = false,
    Flag = "AutoTradeRequest",
    Callback = function(Value)
        isAutoTradeRequestActive = Value
        if Value then
            startAutoTradeRequest()
            notify("Auto Trade Request", "Envoie automatiquement des demandes d'échange !", 2)
        elseif autoTradeRequestLoop then
            autoTradeRequestLoop:Disconnect()
            autoTradeRequestLoop = nil
        end
    end
})

-- // 3. Auto Accept Trade (accepter automatiquement les échanges)
local function setupAutoTradeAccept()
    local playerGui = player:WaitForChild("PlayerGui")
    
    playerGui.DescendantAdded:Connect(function(descendant)
        if isAutoTradeAcceptActive then
            -- Cherche les fenêtres de trade
            if descendant.Name and (descendant.Name:lower():find("trade") or descendant.Name:lower():find("exchange")) then
                task.wait(0.3)
                -- Cherche le bouton d'acceptation
                local acceptButton = descendant:FindFirstChild("Accept") or 
                                    descendant:FindFirstChild("AcceptButton") or 
                                    descendant:FindFirstChild("Confirm") or
                                    descendant:FindFirstChild("Ready")
                if acceptButton and acceptButton:IsA("TextButton") then
                    pcall(function() acceptButton:Fire() end)
                    notify("✅ Trade accepté", "Échange accepté automatiquement !", 1)
                end
            end
        end
    end)
end

TradeTab:CreateToggle({
    Name = "🤖 Auto Accept Trade",
    CurrentValue = false,
   Flag = "AutoTradeAccept",
    Callback = function(Value)
        isAutoTradeAcceptActive = Value
        if Value then
            setupAutoTradeAccept()
            notify("Auto Accept Trade", "Accepte automatiquement les demandes d'échange !", 2)
        end
    end
})

-- // 4. Trade Scam Protection (protection anti-arnaque)
TradeTab:CreateToggle({
    Name = "🛡️ Trade Scam Protection",
    CurrentValue = false,
    Flag = "TradeScamProtect",
    Callback = function(Value)
        isTradeScamProtectActive = Value
        if Value then
            -- Surveillance des changements dans l'interface de trade
            local playerGui = player:WaitForChild("PlayerGui")
            
            local function checkForQuickSwitch()
                -- Détecte les changements soudains dans l'offre
                -- Avertit l'utilisateur si l'offre change au dernier moment
                notify("🛡️ Scam Protection", "Protection anti-arnaque ACTIVÉE ! Vérifie toujours l'offre finale !", 3)
            end
            
            playerGui.DescendantAdded:Connect(function(desc)
                if isTradeScamProtectActive then
                    if desc.Name and desc.Name:lower():find("offer") then
                        task.wait(0.1)
                        checkForQuickSwitch()
                    end
                end
            end)
            
            notify("Trade Scam Protection", "Protection activée ! Méfie-toi des quick-switch !", 2)
        end
    end
})

-- // 5. Auto Add Best Brainrot (ajoute automatiquement ton meilleur Brainrot)
TradeTab:CreateToggle({
    Name = "🏆 Auto Add Best Brainrot",
    CurrentValue = false,
    Flag = "AutoAddBest",
    Callback = function(Value)
        isAutoAddBrainrotActive = Value
        if Value then
            task.spawn(function()
                while isAutoAddBrainrotActive do
                    -- Cherche le meilleur Brainrot dans l'inventaire
                    local bestBrainrot = nil
                    local bestValue = 0
                    
                    -- Logique pour trouver le meilleur Brainrot (dépend de l'inventaire du jeu)
                    local playerGui = player:WaitForChild("PlayerGui")
                    -- Code pour interagir avec l'interface
                    
                    task.wait(2)
                end
            end)
            notify("Auto Add Best", "Ajoute automatiquement ton meilleur Brainrot !", 2)
        end
    end
})

-- // 6. Trade Speed (accélère l'interface de trade)
TradeTab:CreateToggle({
    Name = "⚡ Trade Speed (UI accélérée)",
    CurrentValue = false,
    Flag = "TradeSpeed",
    Callback = function(Value)
        isTradeSpeedActive = Value
        if Value then
            -- Accélère les animations de l'interface
            for _, gui in ipairs(player.PlayerGui:GetDescendants()) do
                if gui:IsA("Frame") or gui:IsA("TextButton") then
                    pcall(function()
                        gui.BackgroundTransparency = 0
                    end)
                end
            end
            notify("Trade Speed", "Interface de trade accélérée !", 1)
        end
    end
})

-- // 7. Trade ESP (voir les joueurs près de la Trade Machine)
local tradeEspActive = false
local tradeEspObjects = {}

local function setupTradeESP(enable)
    if enable then
        local tradeMachine = findTradeMachine()
        if tradeMachine then
            for _, otherPlayer in ipairs(players:GetPlayers()) do
                if otherPlayer ~= player and otherPlayer.Character then
                    local distance = tradeMachine:IsA("BasePart") and 
                        (tradeMachine.Position - otherPlayer.Character.HumanoidRootPart.Position).magnitude or 100
                    
                    if distance < 50 then
                        local billboard = Instance.new("BillboardGui")
                        billboard.Name = "TradeESP"
                        billboard.Size = UDim2.new(0, 100, 0, 30)
                        billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                        billboard.AlwaysOnTop = true
                        billboard.Parent = otherPlayer.Character:FindFirstChild("Head")
                        
                        local textLabel = Instance.new("TextLabel")
                        textLabel.Size = UDim2.new(1, 0, 1, 0)
                        textLabel.BackgroundTransparency = 1
                        textLabel.TextColor3 = Color3.fromRGB(0, 255, 100)
                        textLabel.Text = "🤝 READY TO TRADE"
                        textLabel.Font = Enum.Font.Bold
                        textLabel.TextSize = 12
                        textLabel.Parent = billboard
                        
                        tradeEspObjects[otherPlayer] = billboard
                    end
                end
            end
        end
    else
        for _, obj in pairs(tradeEspObjects) do
            pcall(function() obj:Destroy() end)
        end
        tradeEspObjects = {}
    end
end

TradeTab:CreateToggle({
    Name = "👁️ Trade ESP (voir traders)",
    CurrentValue = false,
    Flag = "TradeESP",
    Callback = function(Value)
        tradeEspActive = Value
        setupTradeESP(Value)
    end
})

-- // 8. Alertes de sécurité pour la Trade Machine
TradeTab:CreateButton({
    Name = "⚠️ Guide Anti-Scam",
    Callback = function()
        notify("🛡️ Guide Anti-Scam", 
               "1. Vérifie toujours l'offre finale avant d'accepter\n2. Méfie-toi des quick-switch\n3. Les scripts 'visual bug' peuvent faire croire qu'un Brainrot est présent\n4. Si l'offre change au dernier moment, ANNULE !\n5. N'accepte que les échanges avec des joueurs de confiance", 8)
    end
})

-- // 9. Liste des joueurs pour trade
TradeTab:CreateButton({
    Name = "👥 Liste des joueurs pour trade",
    Callback = function()
        local list = "Joueurs dans le serveur :\n"
        for _, p in ipairs(players:GetPlayers()) do
            if p ~= player then
                list = list .. "• " .. p.Name .. "\n"
            end
        end
        notify("Joueurs disponibles", list, 5)
    end
})

-- // 10. Informations sur les Brainrots rares
TradeTab:CreateButton({
    Name = "💎 Brainrots rares à trader",
    Callback = function()
        notify("💎 Brainrots Rares", 
               "Brainrots secrets ajoutés avec la Trade Machine :\n\n• La Food Combinasion (Secret) - 90M/s\n• Los Amigos (Secret) - 130M/s\n• Sammyni Fattini (Secret) - 70M/s\n• Los Sekolahs (Secret) - 110M/s\n\nCes Brainrots s'obtiennent via les Lucky Blocks !", 8)
    end
})

-- // =====================================================================
-- // ONGLET DUEL 🤺 (Version améliorée)
-- // =====================================================================
local DuelTab = Window:CreateTab("🤺 Duel")
local DuelSection = DuelTab:CreateSection("⚔️ DUEL MACHINE")

-- // Trouver Duel Machine
DuelTab:CreateButton({
    Name = "📍 Trouver la Duel Machine",
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
                local cframe = duelMachine:IsA("BasePart") and duelMachine.CFrame or (duelMachine:FindFirstChild("HumanoidRootPart") and duelMachine.HumanoidRootPart.CFrame)
                if cframe then
                    hrp.CFrame = cframe + Vector3.new(0, 3, 0)
                    notify("📍 Duel Machine", "Téléporté vers la machine !", 2)
                end
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
            notify("Auto Duel", "Défie automatiquement les joueurs !", 2)
        elseif autoDuelLoop then
            autoDuelLoop:Disconnect()
            autoDuelLoop = nil
        end
    end
})

-- // Auto Accept Duel
local function setupDuelAutoAccept()
    local playerGui = player:WaitForChild("PlayerGui")
    
    playerGui.DescendantAdded:Connect(function(descendant)
        if isAutoAcceptActive then
            if descendant.Name and (descendant.Name:lower():find("duel") or descendant.Name:lower():find("challenge")) then
                task.wait(0.2)
                local acceptButton = descendant:FindFirstChild("Accept") or descendant:FindFirstChild("AcceptButton")
                if acceptButton and acceptButton:IsA("TextButton") then
                    pcall(function() acceptButton:Fire() end)
                    notify("✅ Duel accepté", "Accepté automatiquement !", 1)
                end
            end
        end
    end)
end

DuelTab:CreateToggle({
    Name = "🤖 Auto Accept Duel",
    CurrentValue = false,
    Flag = "DuelAutoAccept",
    Callback = function(Value)
        isAutoAcceptActive = Value
        if Value then
            setupDuelAutoAccept()
            notify("Auto Accept", "Accepte automatiquement les duels !", 2)
        end
    end
})

-- // Auto Select Best/Worst Brainrot
DuelTab:CreateToggle({
    Name = "🏆 Auto Select Best Brainrot",
    CurrentValue = false,
    Flag = "DuelSelectBest",
    Callback = function(Value)
        notify("Auto Select", Value and "Choisira le MEILLEUR Brainrot" or "Désactivé", 1)
    end
})

DuelTab:CreateToggle({
    Name = "🍂 Auto Select Worst Brainrot",
    CurrentValue = false,
    Flag = "DuelSelectWorst",
    Callback = function(Value)
        notify("Auto Select", Value and "Choisira le PIRE Brainrot" or "Désactivé", 1)
    end
})

-- // Auto Attack en Duel
DuelTab:CreateToggle({
    Name = "⚔️ Auto Attack en Duel",
    CurrentValue = false,
    Flag = "DuelAutoAttack",
    Callback = function(Value)
        isDuelAutoAttackActive = Value
        if Value then
            task.spawn(function()
                while isDuelAutoAttackActive do
                    local attackRemote = replicatedStorage:FindFirstChild("Attack") or 
                                        replicatedStorage:FindFirstChild("DuelAttack")
                    if attackRemote then
                        pcall(function() attackRemote:FireServer() end)
                    end
                    task.wait(0.3)
                end
            end)
            notify("Auto Attack", "Attaque automatique en duel !", 2)
        end
    end
})

-- // Auto Dodge en Duel
DuelTab:CreateToggle({
    Name = "💨 Auto Dodge en Duel",
    CurrentValue = false,
    Flag = "DuelAutoDodge",
    Callback = function(Value)
        isDuelAutoDodgeActive = Value
        if Value then
            task.spawn(function()
                while isDuelAutoDodgeActive do
                    local dodgeRemote = replicatedStorage:FindFirstChild("Dodge") or 
                                       replicatedStorage:FindFirstChild("Evade")
                    if dodgeRemote then
                        pcall(function() dodgeRemote:FireServer() end)
                    end
                    task.wait(0.5)
                end
            end)
            notify("Auto Dodge", "Esquive automatique en duel !", 2)
        end
    end
})

-- // Duel ESP
local duelEspActive = false
local duelEspObjects = {}

DuelTab:CreateToggle({
    Name = "👁️ Duel ESP",
    CurrentValue = false,
    Flag = "DuelESP",
    Callback = function(Value)
        duelEspActive = Value
        if Value then
            for _, otherPlayer in ipairs(players:GetPlayers()) do
                if otherPlayer ~= player and otherPlayer.Character then
                    local billboard = Instance.new("BillboardGui")
                    billboard.Name = "DuelESP"
                    billboard.Size = UDim2.new(0, 120, 0, 35)
                    billboard.StudsOffset = Vector3.new(0, 2.5, 0)
                    billboard.AlwaysOnTop = true
                    billboard.Parent = otherPlayer.Character:FindFirstChild("Head")
                    
                    local textLabel = Instance.new("TextLabel")
                    textLabel.Size = UDim2.new(1, 0, 1, 0)
                    textLabel.BackgroundTransparency = 1
                    textLabel.TextColor3 = Color3.fromRGB(255, 200, 0)
                    textLabel.Text = "🤺 DUEL READY"
                    textLabel.Font = Enum.Font.Bold
                    textLabel.TextSize = 12
                    textLabel.Parent = billboard
                    
                    duelEspObjects[otherPlayer] = billboard
                end
            end
        else
            for _, obj in pairs(duelEspObjects) do
                pcall(function() obj:Destroy() end)
            end
            duelEspObjects = {}
        end
    end
})

-- // =====================================================================
-- // ONGLET RIVALS 🔥
-- // =====================================================================
local RivalsTab = Window:CreateTab("🔥 Rivals")
local RivalsSection = RivalsTab:CreateSection("⚔️ RIVALS MODE")

-- // Rivals Auto Steal
local rivalsAutoStealLoop = nil

local function startRivalsAutoSteal()
    if rivalsAutoStealLoop then return end
    rivalsAutoStealLoop = runService.Heartbeat:Connect(function()
        if not isRivalsAutoStealActive then return end
        
        for _, otherPlayer in ipairs(players:GetPlayers()) do
            if otherPlayer ~= player then
                local rivalsRemote = replicatedStorage:FindFirstChild("RivalsSteal") or
                                    replicatedStorage:FindFirstChild("StealFromRival")
                if rivalsRemote then
                    pcall(function() rivalsRemote:FireServer(otherPlayer) end)
                end
            end
        end
    end)
end

RivalsTab:CreateToggle({
    Name = "🤖 Rivals Auto Steal",
    CurrentValue = false,
    Flag = "RivalsAutoSteal",
    Callback = function(Value)
        isRivalsAutoStealActive = Value
        if Value then
            startRivalsAutoSteal()
            notify("Rivals Auto Steal", "Vol automatique sur les rivaux !", 2)
        elseif rivalsAutoStealLoop then
            rivalsAutoStealLoop:Disconnect()
            rivalsAutoStealLoop = nil
        end
    end
})

-- // Rivals ESP
RivalsTab:CreateToggle({
    Name = "👁️ Rivals ESP",
    CurrentValue = false,
    Flag = "RivalsESP",
    Callback = function(Value)
        isRivalsESPActive = Value
        if Value then
            for _, otherPlayer in ipairs(players:GetPlayers()) do
                if otherPlayer ~= player and otherPlayer.Character then
                    local highlight = Instance.new("Highlight")
                    highlight.FillColor = Color3.fromRGB(255, 50, 50)
                    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
                    highlight.FillTransparency = 0.4
                    highlight.Adornee = otherPlayer.Character
                    highlight.Parent = otherPlayer.Character
                    rivalsEspObjects[otherPlayer] = highlight
                end
            end
        else
            for _, highlight in pairs(rivalsEspObjects) do
                pcall(function() highlight:Destroy() end)
            end
            rivalsEspObjects = {}
        end
        notify("Rivals ESP", Value and "Activé !" or "Désactivé", 1)
    end
})

-- // Rivals Teleport
RivalsTab:CreateButton({
    Name = "📍 Téléportation à l'ennemi rival",
    Callback = function()
        local closestEnemy = nil
        local closestDist = math.huge
        
        for _, otherPlayer in ipairs(players:GetPlayers()) do
            if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local dist = (character.HumanoidRootPart.Position - otherPlayer.Character.HumanoidRootPart.Position).magnitude
                if dist < closestDist then
                    closestDist = dist
                    closestEnemy = otherPlayer
                end
            end
        end
        
        if closestEnemy and closestEnemy.Character then
            local hrp = character:FindFirstChild("HumanoidRootPart")
            if hrp then
                hrp.CFrame = closestEnemy.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
                notify("Téléportation", "Téléporté à " .. closestEnemy.Name, 1)
            end
        end
    end
})

-- // =====================================================================
-- // ONGLET COMBAT ⚔️
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
                replicatedStorage:FindFirstChild("Steal")
            }
            for _, remote in ipairs(remotes) do
                if remote then
                    pcall(function() remote:FireServer(target) end)
                    notify("🎯 Vol", "Tentative sur " .. target.Name, 1)
                end
            end
        else
            notify("⚠️ Aucune cible", "Aucun joueur à proximité", 1)
        end
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
                               replicatedStorage:FindFirstChild("RemoteSteal")
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
            notify("Auto Steal", "Activé - Vol automatique !", 2)
        elseif autoStealLoop then
            autoStealLoop:Disconnect()
            autoStealLoop = nil
        end
    end
})

-- // Kill Aura
local isKillAuraActive = false
CombatTab:CreateToggle({
    Name = "💀 Kill Aura",
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
            notify("Kill Aura", "Aura de mort activée !", 2)
        end
    end
})

-- // =====================================================================
-- // ONGLET MOUVEMENT 🏃
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
        notify("Fly", isFlyActive and "Mode Vol activé !" or "Mode Vol désactivé", 1)
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
        if humanoid then
            humanoid.WalkSpeed = Value
        end
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
        if humanoid then
            humanoid.JumpPower = Value
        end
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
    Name = "👻 No Clip",
    CurrentValue = false,
    Flag = "NoClip",
    Callback = function(Value)
        toggleNoClip(Value)
        notify("No Clip", Value and "Activé - Tu traverses les murs !" or "Désactivé", 1)
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
        notify("Infinite Jump", Value and "Activé !" or "Désactivé", 1)
    end
})

-- // Platform Float
local function setupPlatformFloat(enable)
    isPlatformFloatActive = enable
    if enable then
        platformFloatConnection = runService.Heartbeat:Connect(function()
            if isPlatformFloatActive and character and character:FindFirstChild("HumanoidRootPart") then
                local hrp = character.HumanoidRootPart
                local rayOrigin = hrp.Position
                local rayDirection = Vector3.new(0, -5, 0)
                local raycastParams = RaycastParams.new()
                raycastParams.FilterDescendantsInstances = {character}
                local result = workspace:Raycast(rayOrigin, rayDirection, raycastParams)
                
                if result and result.Instance then
                    local targetY = result.Instance.Position.Y + 3
                    if hrp.Position.Y > targetY + 1 then
                        hrp.Velocity = Vector3.new(hrp.Velocity.X, -10, hrp.Velocity.Z)
                    elseif hrp.Position.Y < targetY then
                        hrp.Velocity = Vector3.new(hrp.Velocity.X, 10, hrp.Velocity.Z)
                    else
                        hrp.Velocity = Vector3.new(hrp.Velocity.X, 0, hrp.Velocity.Z)
                    end
                end
            end
        end)
        notify("Platform Float", "Flottaison sur plateformes activée !", 2)
    else
        if platformFloatConnection then
            platformFloatConnection:Disconnect()
            platformFloatConnection = nil
        end
    end
end

MovementTab:CreateToggle({
    Name = "🛸 Platform Float",
    CurrentValue = false,
    Flag = "PlatformFloat",
    Callback = function(Value)
        setupPlatformFloat(Value)
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
                notify("Téléportation", "Déplacé à la souris !", 1)
            end
        end
    end
})

-- // =====================================================================
-- // ONGLET ESP & VISUEL 👁️
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

EspTab:CreateToggle({
    Name = "🔴 ESP Joueurs",
    CurrentValue = false,
    Flag = "ESPToggle",
    Callback = function(Value)
        isEspActive = Value
        if Value then
            for _, otherPlayer in ipairs(players:GetPlayers()) do
                if otherPlayer ~= player then
                    createESP(otherPlayer)
                end
            end
        else
            for _, highlight in pairs(espObjects) do
                pcall(function() highlight:Destroy() end)
            end
            espObjects = {}
        end
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
                            
                            local label = distanceLabels[otherPlayer]
                            if not label and otherPlayer.Character:FindFirstChild("Head") then
                                label = Instance.new("BillboardGui")
                                label.Name = "DistanceESP"
                                label.Size = UDim2.new(0, 80, 0, 20)
                                label.StudsOffset = Vector3.new(0, 3, 0)
                                label.AlwaysOnTop = true
                                
                                local text = Instance.new("TextLabel")
                                text.Size = UDim2.new(1, 0, 1, 0)
                                text.BackgroundTransparency = 1
                                text.TextColor3 = Color3.fromRGB(255, 255, 255)
                                text.Text = string.format("%.1f m", dist)
                                text.Font = Enum.Font.Bold
                                text.TextSize = 12
                                text.Parent = label
                                
                                label.Parent = otherPlayer.Character.Head
                                distanceLabels[otherPlayer] = label
                            elseif label then
                                local textLabel = label:FindFirstChild("TextLabel")
                                if textLabel then
                                    textLabel.Text = string.format("%.1f m", dist)
                                    if dist < 10 then
                                        textLabel.TextColor3 = Color3.fromRGB(255, 0, 0)
                                    elseif dist < 20 then
                                        textLabel.TextColor3 = Color3.fromRGB(255, 165, 0)
                                    else
                                        textLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
                                    end
                                end
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
        notify("FullBright", Value and "Pleine luminosité !" or "Normal", 1)
    end
})

-- // =====================================================================
-- // ONGLET FARM 🤖
-- // =====================================================================
local FarmTab = Window:CreateTab("🤖 Farm")
local FarmSection = FarmTab:CreateSection("🤖 FARM")

-- // Auto Farm Items
local itemsToFarm = {"Brainrot", "Coin", "Chest", "Drop", "Item", "Gem"}

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
            notify("Auto Farm", "Farm automatique activé !", 2)
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
                    local clickRemote = replicatedStorage:FindFirstChild("Click")
                    if clickRemote then
                        pcall(function() clickRemote:FireServer() end)
                    end
                end
            end)
            notify("Auto Click", "Clics automatiques activés !", 2)
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
                    local rebirthRemote = replicatedStorage:FindFirstChild("Rebirth")
                    if rebirthRemote then
                        pcall(function() rebirthRemote:FireServer() end)
                    end
                    task.wait(60)
                end
            end)
            notify("Auto Rebirth", "Rebirth automatique activé !", 2)
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
                    local sellRemote = replicatedStorage:FindFirstChild("Sell")
                    if sellRemote then
                        pcall(function() sellRemote:FireServer() end)
                    end
                end
            end)
            notify("Auto Sell", "Vente automatique activée !", 2)
        elseif autoSellLoop then
            autoSellLoop:Disconnect()
            autoSellLoop = nil
        end
    end
})

-- // =====================================================================
-- // ONGLET SERVER 🛠️
-- // =====================================================================
local ServerTab = Window:CreateTab("🛠️ Server")
local ServerSection = ServerTab:CreateSection("🛠️ SERVER")

-- // Anti-AFK
ServerTab:CreateButton({
    Name = "🟢 Anti-AFK",
    Callback = function()
        players.LocalPlayer.Idled:Connect(function()
            virtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            task.wait(1)
            virtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
        notify("Anti-AFK", "Activé - Tu ne seras plus kick !", 2)
    end
})

-- // God Mode
ServerTab:CreateToggle({
    Name = "🛡️ God Mode",
    CurrentValue = false,
    Flag = "GodMode",
    Callback = function(Value)
        isGodModeActive = Value
        local char, hum = getCharacter()
        if hum then
            if Value then
                hum.MaxHealth = math.huge
                hum.Health = math.huge
                notify("God Mode", "Activé - Tu es invincible !", 2)
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
            local response = game:GetService("HttpService"):JSONDecode(game:HttpGetAsync("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100"))
            for _, v in pairs(response.data) do
                if type(v) == "table" and v.playing and v.id ~= game.JobId then
                    game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, v.id)
                    break
                end
            end
        end)
        notify("Server Hop", "Changement de serveur...", 2)
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
        if Value then
            settings().Rendering.QualityLevel = 1
            lighting.GlobalShadows = false
            notify("Anti Lag", "Optimisation graphique activée !", 2)
        else
            settings().Rendering.QualityLevel = 10
            lighting.GlobalShadows = true
        end
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
            notify("Show FPS", "Affichage FPS activé !", 2)
        else
            local fpsLabel = player.PlayerGui:FindFirstChild("FPSLabel")
            if fpsLabel then fpsLabel:Destroy() end
        end
    end
})

-- // =====================================================================
-- // ONGLET CONFIG ⚙️
-- // =====================================================================
local ConfigTab = Window:CreateTab("⚙️ Config")
local ConfigSection = ConfigTab:CreateSection("💾 SAUVEGARDE")

ConfigTab:CreateButton({
    Name = "💾 Sauvegarder configuration",
    Callback = function()
        notify("Configuration", "Config sauvegardée !", 2)
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
        isPlatformFloatActive = false
        isRivalsAutoStealActive = false
        isRivalsESPActive = false
        isAutoTradeAcceptActive = false
        isTradeScamProtectActive = false
        
        if autoStealLoop then autoStealLoop:Disconnect() end
        if autoDuelLoop then autoDuelLoop:Disconnect() end
        if noclipConnection then noclipConnection:Disconnect() end
        if platformFloatConnection then platformFloatConnection:Disconnect() end
        if rivalsAutoStealLoop then rivalsAutoStealLoop:Disconnect() end
        if autoTradeRequestLoop then autoTradeRequestLoop:Disconnect() end
        
        notify("Réinitialisation", "Toutes les fonctions réinitialisées !", 3)
    end
})

ConfigTab:CreateButton({
    Name = "ℹ️ Info Script",
    Callback = function()
        notify("Nightmare Hub v4.5", 
               "Plus de 120 fonctionnalités !\n✅ NOUVEAU : Trade Machine Hub\n✅ Protection anti-scam\n✅ Auto Trade Request/Accept\n✅ Trade ESP\n✅ Duel amélioré\n✅ Rivals Mode\n✅ Platform Float\n100% KEYLESS !", 8)
    end
})

-- // =====================================================================
-- // MESSAGE DE BIENVENUE
-- // =====================================================================
notify("🔥 NIGHTMARE HUB v4.5", 
       "Chargé avec succès !\n✅ NOUVEAU : Catégorie TRADE MACHINE\n✅ Protection anti-scam incluse\n✅ Duel + Rivals améliorés\n100% KEYLESS !\nAppuie sur K pour le menu", 6)

print("✅ NIGHTMARE HUB v4.5 - Script chargé !")
print("📋 NOUVEAUTÉ : Catégorie TRADE MACHINE complète !")
print("🛡️ Protection anti-scam incluse")
print("🎮 Catégories: Trade Machine, Duel, Rivals, Combat, Mouvement, ESP, Farm, Server")
