import           XMonad
import           XMonad.Hooks.DynamicLog  (xmobar)
import           XMonad.Hooks.UrgencyHook
import           XMonad.Util.EZConfig

main :: IO ()
main = xmonad =<< xmobar myConfig


myConfig :: XConfig (Choose Tall (Choose (Mirror Tall) Full))
myConfig = defaultConfig
      { borderWidth        = 1
      , terminal           = "urxvtc"
      , normalBorderColor  = "#FDF4C1"
      , focusedBorderColor = "#0D6678"
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
         ,("M-s m", spawn "urxvtc -e ncmpcpp")
         ,("M-s w", spawn "urxvtc -e ~/Scripts/weather.fish")
         ,("M-s e", spawn "emacsclient -c")
         ]

