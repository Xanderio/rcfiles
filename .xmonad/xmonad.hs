import           XMonad
import           XMonad.Hooks.DynamicLog  (xmobar)
import           XMonad.Hooks.UrgencyHook
import           XMonad.Util.EZConfig

main :: IO ()
main = xmonad =<< xmobar myConfig


myConfig :: XConfig (Choose Tall (Choose (Mirror Tall) Full))
myConfig = defaultConfig
 { borderWidth        = 1
 , terminal           = "alacritty"
 , normalBorderColor  = "#81a1c1"
 , focusedBorderColor = "#d08770"
 , modMask            = mod4Mask
 , focusFollowsMouse  = False
 }
      `additionalKeysP` myKeys


myKeys :: [(String, X ())]
myKeys = [("M-<F2>", spawn "slock")
         ,("<XF86AudioLowerVolume>", spawn "mixer vol -5")
         ,("<XF86AudioRaiseVolume>", spawn "mixer vol +5")
         ,("<XF86AudioPlay>", spawn "mpc toggle")
         ,("<XF86AudioStop>", spawn "mpc stop")
         ,("<XF86AudioNext>", spawn "mpc next")
         ,("<XF86AudioPrev>", spawn "mpc prev")
         ,("M-s m", spawn "alacritty -e ncmpcpp")
         ,("M-s j", spawn "alacritty -e jackline")
         ,("M-s w", spawn "alacritty -e ~/Scripts/weather.fish")
         ,("M-s r", spawn "pkill -USR1 redshift")
         ]

