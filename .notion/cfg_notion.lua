--
-- Notion main configuration file
--
-- This file only includes some settings that are rather frequently altered.
-- The rest of the settings are in cfg_notioncore.lua and individual modules'
-- configuration files (cfg_modulename.lua). 
--
-- When any binding and other customisations that you want are minor, it is 
-- recommended that you include them in a copy of this file in ~/.notion/.
-- Simply create or copy the relevant settings at the end of this file (from
-- the other files), recalling that a key can be unbound by passing 'nil' 
-- (without the quotes) as the callback. For more information, please see 
-- the Notion configuration manual available from the Notion Web page.
--

-- Set default modifiers. Alt should usually be mapped to Mod1 on
-- XFree86-based systems. The flying window keys are probably Mod3
-- or Mod4; see the output of 'xmodmap'.
--META="Mod1+"
--ALTMETA=""

-- Terminal emulator
--XTERM="xterm"

-- Some basic settings
ioncore.set{
    -- Maximum delay between clicks in milliseconds to be considered a
    -- double click.
    --dblclick_delay=250,

    -- For keyboard resize, time (in milliseconds) to wait after latest
    -- key press before automatically leaving resize mode (and doing
    -- the resize in case of non-opaque move).
    --kbresize_delay=1500,

    -- Opaque resize?
    --opaque_resize=false,

    -- Movement commands warp the pointer to frames instead of just
    -- changing focus. Enabled by default.
    --warp=true,
    
    -- Switch frames to display newly mapped windows
    --switchto=true,
    
    -- Default index for windows in frames: one of 'last', 'next' (for
    -- after current), or 'next-act' (for after current and anything with
    -- activity right after it).
    --frame_default_index='next',
    
    -- Auto-unsqueeze transients/menus/queries.
    --unsqueeze=true,
    
    -- Display notification tooltips for activity on hidden workspace.
    --screen_notify=true,
}


-- Load default settings. The file cfg_defaults loads all the files
-- commented out below, except mod_dock. If you do not want to load
-- something, comment out this line, and uncomment the lines corresponding
-- the the modules or configuration files that you want, below.
-- The modules' configuration files correspond to the names of the 
-- modules with 'mod' replaced by 'cfg'.
dopath("cfg_defaults")

-- Load configuration of the Notion 'core'. Most bindings are here.
--dopath("cfg_notioncore")

-- Load some kludges to make apps behave better.
--dopath("cfg_kludges")

-- Define some layouts. 
--dopath("cfg_layouts")

-- Load some modules. Bindings and other configuration specific to modules
-- are in the files cfg_modulename.lua.
--dopath("mod_query")
--dopath("mod_menu")
--dopath("mod_tiling")
--dopath("mod_dock")
--dopath("mod_sp")
--dopath("mod_statusbar")

--
-- Common customisations
--

-- Uncommenting the following lines should get you plain-old-menus instead
-- of query-menus.

--defbindings("WScreen", {
--    kpress(ALTMETA.."F12", "mod_menu.menu(_, _sub, 'mainmenu', {big=true})"),
--})
--
--defbindings("WMPlex.toplevel", {
--    kpress(META.."M", "mod_menu.menu(_, _sub, 'ctxmenu')"),
--})

function next_wrap()
        scr = ioncore.goto_next_screen()
        if obj_is(scr, "WRootWin") then
                ioncore.goto_nth_screen(0)
        end
end

function prev_wrap() 
        scr = ioncore.goto_prev_screen()
        if obj_is(scr, "WRootWin") then
                ioncore.goto_nth_screen(-1)
        end
end

-- Caution: these may break the default bindings.
--UP="Up" ; DOWN="Down" ; LEFT="Left" ; RIGHT="Right"
UP="K" ; DOWN="J" ; LEFT="H" ; RIGHT="L"
-- UP="W" ; DOWN="S" ; LEFT="A" ; RIGHT="D"

defbindings("WScreen", {
    kpress(MOD1..UP, "next_wrap()"),
    kpress(MOD1..DOWN, "prev_wrap()"),
    bdoc("Raise/Lower Sound."),
    kpress("AnyModifier+XF86AudioRaiseVolume", "ioncore.exec_on(_, 'amixer -c 0 set Master 2%+ unmute && ~/.wmii/bin/volume ')"),
    kpress("AnyModifier+XF86AudioLowerVolume", "ioncore.exec_on(_, 'amixer -c 0 set Master 2%- unmute && ~/.wmii/bin/volume ')"),
    kpress("AnyModifier+XF86AudioMute", "ioncore.exec_on(_, 'amixer -c 0 set Master toggle')"),
    bdoc("TP function Keys."),
    kpress("AnyModifier+XF86AudioPlay", "ioncore.exec_on(_, 'echo p > ~/.config/pianobar/ctl')"),
    kpress("AnyModifier+XF86AudioStop", "ioncore.exec_on(_, 'echo q > ~/.config/pianobar/ctl')"),
    kpress("AnyModifier+XF86AudioPrev", "ioncore.exec_on(_, 'echo n > ~/.config/pianobar/ctl')"),
    kpress("AnyModifier+XF86AudioNext", "ioncore.exec_on(_, 'echo n > ~/.config/pianobar/ctl')"),
    kpress("AnyModifier+XF86Display", "ioncore.exec_on(_, 'dock_video'), ioncore.restart()"),
    kpress("AnyModifier+XF86ScreenSaver", "ioncore.exec_on(_, 'gnome-screensaver-command --lock')"),
    kpress("AnyModifier+XF86Sleep", "ioncore.exec_on(_, '/usr/sbin/pm-suspend')"),
    bdoc("Application Hotkeys"),
    kpress("Mod4+w", "ioncore.exec_on(_, 'google-chrome')"), 
    kpress("Mod4+c", "ioncore.exec_on(_, 'xterm -e mcabber')"), 
    kpress("Mod4+i", "ioncore.exec_on(_, 'wicd-gtk --no-tray')"), 
    kpress("Mod4+p", "ioncore.exec_on(_, 'echo 3|pianobar')"), 
    } )
defbindings("WFrame", {
    kpress(MOD1..LEFT.."+Shift", "WFrame.dec_index(_, _sub)", "_sub:non-nil"),
    kpress(MOD1..RIGHT.."+Shift", "WFrame.inc_index(_, _sub)", "_sub:non-nil"),
    kpress(MOD1..LEFT, "WFrame.switch_prev(_)"),
    kpress(MOD1..RIGHT, "WFrame.switch_next(_)"), })
defbindings("WTiling", {
    kpress(MOD1..UP.."+Control", "WTiling.goto_dir(_, 'above')"),
    kpress(MOD1..DOWN.."+Control", "WTiling.goto_dir(_, 'below')"),
    kpress(MOD1..LEFT.."+Control", "WTiling.goto_dir(_, 'left')"),
    kpress(MOD1..RIGHT.."+Control", "WTiling.goto_dir(_, 'right')"), })
