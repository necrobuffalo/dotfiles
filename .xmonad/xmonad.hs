import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.ManageDocks
import XMonad.Layout.ResizableTile

myLayout = avoidStruts (tiled ||| Mirror tiled ||| Full)
  where
    tiled = ResizableTall 1 (3/100) (1/2) []

myUrgencyHook = SpawnUrgencyHook "notify-send \'Bell in session.\'"

myManageHook = composeAll
    [ manageDocks <+> manageHook defaultConfig
    , className =? "Chrome" --> doShift "2"
    ]

main = do
    xmonad $ withUrgencyHook myUrgencyHook
        $ defaultConfig
        { modMask               = mod4Mask
        , terminal              = "urxvt"
        , normalBorderColor     = "dim grey"
        , focusedBorderColor    = "dodger blue" -- originally #27a343
        , layoutHook            = myLayout
        , manageHook            = myManageHook
        } `additionalKeys`
        [ ((mod4Mask, xK_z), sendMessage MirrorShrink)
        , ((mod4Mask, xK_a), sendMessage MirrorExpand)
        , ((mod4Mask .|. shiftMask, xK_z), spawn "gnome-screensaver-command -l")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((mod4Mask .|. shiftMask, xK_b), spawn "google-chrome-stable")
        , ((mod4Mask, xK_p), spawn "dmenu_run -fn 'Source Sans Pro' -nb black -nf grey -sb grey -sf black")
        ]
