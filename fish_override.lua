-- Fish Override Script
-- Premere "G" per attivare/disattivare il menu
-- Scegli un pesce dal menu per pescarlo sempre
-- Clicca il pulsante "Ripristina Casualità" per riattivare la pesca casuale

local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")

-- Lista dei pesci disponibili (puoi aggiungerne altri)
local fishList = {
    "Obsidian Swordfish",
    "Glacierfish",
    "Captain’s Goldfish",
    "Lego Fish",
    "Ancient Megalodon",
    "Pond Emperor",
    "Volcanic Geode"
}

-- Variabili
local selectedFish = nil
local overrideEnabled = false
local screenGui = nil

-- Funzione per creare la GUI
local function createGUI()
    if screenGui then screenGui:Destroy() end
    screenGui = Instance.new("ScreenGui", CoreGui)
    screenGui.Name = "FishOverrideGui"

    local frame = Instance.new("Frame", screenGui)
    frame.Position = UDim2.new(0.3, 0, 0.3, 0)
    frame.Size = UDim2.new(0, 300, 0, 200)
    frame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    frame.BorderSizePixel = 0

    local title = Instance.new("TextLabel", frame)
    title.Size = UDim2.new(1, 0, 0, 40)
    title.Text = "🎣 Seleziona un pesce"
    title.BackgroundTransparency = 1
    title.TextColor3 = Color3.new(1, 1, 1)
    title.Font = Enum.Font.GothamBold
    title.TextSize = 20

    local dropdown = Instance.new("TextButton", frame)
    dropdown.Position = UDim2.new(0, 10, 0, 50)
    dropdown.Size = UDim2.new(1, -20, 0, 40)
    dropdown.Text = "🔽 Scegli un pesce"
    dropdown.TextSize = 18
    dropdown.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    dropdown.TextColor3 = Color3.new(1, 1, 1)

    local listFrame = Instance.new("Frame", frame)
    listFrame.Position = UDim2.new(0, 10, 0, 90)
    listFrame.Size = UDim2.new(1, -20, 0, 100)
    listFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    listFrame.Visible = false
    listFrame.ClipsDescendants = true

    for i, fish in ipairs(fishList) do
        local button = Instance.new("TextButton", listFrame)
        button.Position = UDim2.new(0, 0, 0, (i - 1) * 25)
        button.Size = UDim2.new(1, 0, 0, 25)
        button.Text = fish
        button.TextColor3 = Color3.new(1, 1, 1)
        button.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
        button.MouseButton1Click:Connect(function()
            selectedFish = fish
            dropdown.Text = "🎯 " .. fish
            listFrame.Visible = false
            print("Override attivo: " .. fish)
        end)
    end

    dropdown.MouseButton1Click:Connect(function()
        listFrame.Visible = not listFrame.Visible
    end)

    local resetButton = Instance.new("TextButton", frame)
    resetButton.Position = UDim2.new(0, 10, 1, -40)
    resetButton.Size = UDim2.new(1, -20, 0, 30)
    resetButton.Text = "🔄 Ripristina casualità"
    resetButton.BackgroundColor3 = Color3.fromRGB(70, 20, 20)
    resetButton.TextColor3 = Color3.new(1, 1, 1)
    resetButton.MouseButton1Click:Connect(function()
        selectedFish = nil
        print("Pesca casuale riattivata.")
    end)
end

-- Toggle con il tasto G
UserInputService.InputBegan:Connect(function(input, gameProcessed)
    if gameProcessed then return end
    if input.KeyCode == Enum.KeyCode.G then
        overrideEnabled = not overrideEnabled
        if overrideEnabled then
            createGUI()
            print("Fish Override ATTIVATO")
        else
            if screenGui then screenGui:Destroy() end
            print("Fish Override DISATTIVATO")
        end
    end
end)

-- Hook nella funzione di pesca
-- Nota: Questo è un esempio generico. Devi adattarlo allo specifico evento/funzione che determina il pesce nel tuo gioco.
local function overrideFish(originalFish)
    if selectedFish then
        return selectedFish
    else
        return originalFish
    end
end

-- Simulazione della pesca (solo a scopo illustrativo)
-- Rimuovi o sostituisci con l'hook corretto nella tua esperienza Roblox
while true do
    wait(5)
    if overrideEnabled then
        print("Hai pescato: " .. (selectedFish or "casuale"))
    end
end
