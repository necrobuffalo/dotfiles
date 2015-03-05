import XMonad
import XMonad.Util.Run(spawnPipe)
import XMonad.Util.EZConfig(additionalKeys)

main = do
    xmonad $ defaultConfig
        { modMask               = mod4Mask
        , terminal              = "urxvt"
        , normalBorderColor     = "grey"
        , focusedBorderColor    = "dim grey" -- originally #27a343
        } `additionalKeys`
        [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
        , ((controlMask, xK_Print), spawn "sleep 0.2; scrot -s")
        , ((0, xK_Print), spawn "scrot")
        , ((mod4Mask .|. shiftMask, xK_b), spawn "firefox-developer")
        , ((mod4Mask, xK_p), spawn "dmenu_run -fn 'Source Sans Pro' -nb black -nf grey -sb grey -sf black")
        ]
