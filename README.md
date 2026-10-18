# TÉO HUB CORE 2026

Modular starter repository with a single `main.lua` loader.

## Files
- `main.lua`: loads modules from this repository's `main` branch.
- `modules/config.lua`: shared defaults.
- `modules/status.lua`: status label.
- `modules/ui.lua`: basic toggle UI.
- `modules/core.lua`: integration point for feature logic.

## Set up on GitHub
1. Create `Teo-Hub-Core-2026` under `teoscrvn-glitch`.
2. Set it to **Public** if you want raw files to be downloadable without authentication.
3. Upload `main.lua`, `README.md`, and the whole `modules/` folder without changing paths.
4. Commit to branch `main`.
5. Verify the raw URL opens:
   `https://raw.githubusercontent.com/teoscrvn-glitch/Teo-Hub-Core-2026/main/main.lua`

## Loader URL
```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/teoscrvn-glitch/Teo-Hub-Core-2026/main/main.lua"))()
```

## Status
This is a **starter scaffold**, not a complete port of the original TÉO HUB CORE script. It currently has a loader, status label and UI toggles; the AutoFarm, quest, fruit and shopping logic has not been integrated or tested. Toggles do not yet execute those features.

Review every remote file before executing it. Public repository code is visible and can be copied; a loader does not make source code private.
