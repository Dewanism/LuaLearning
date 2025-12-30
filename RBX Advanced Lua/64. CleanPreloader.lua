local Sound = game.Workspace.Music
local ContentProvider = game:GetService("ContentProvider")

ContentProvider:PreloadAsync(Sound)
Sound:Play()
