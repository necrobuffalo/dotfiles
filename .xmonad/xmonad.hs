import Graphics.X11.ExtraTypes.XF86

import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.Script
import XMonad.Hooks.UrgencyHook

import XMonad.Layout.ResizableTile

myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full)
  where
    tiled = ResizableTall 1 (3/100) (1/2) []

myUrgencyHook = SpawnUrgencyHook "notify-send \'Bell in session.\'"

myManageHook = composeAll
    [ manageDocks <+> manageHook defaultConfig
    , className =? "Firefox" --> doShift "2"
    ]

main = xmonad =<< dzen (withUrgencyHook myUrgencyHook (myConfig))

myConfig = defaultConfig
        { modMask               = mod4Mask
        , terminal              = "urxvt"
        , normalBorderColor     = "dim grey"
        , focusedBorderColor    = "dodger blue" -- originally #27a343
        , layoutHook            = myLayout
        , manageHook            = myManageHook
        , startupHook           = execScriptHook "startup"
        } `additionalKeys`
        [ ((mod4Mask, xK_z), sendMessage MirrorShrink)
        , ((mod4Mask, xK_a), sendMessage MirrorExpand)
        , ((mod4Mask .|. shiftMask, xK_z), spawn "dm-tool lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((0, xF86XK_AudioLowerVolume), spawn "pactl set-sink-volume 1 -5%")
        , ((0, xF86XK_AudioRaiseVolume), spawn "pactl set-sink-volume 1 +5%")
        , ((0, xF86XK_AudioMute), spawn "pactl set-sink-mute 1 toggle")
        , ((mod4Mask .|. shiftMask, xK_b), spawn "firefox")
        , ((mod4Mask, xK_p), spawn "dmenu_run -fn 'Droid Sans' -nb black -nf grey -sb grey -sf black")
        ]
