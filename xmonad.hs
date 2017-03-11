module Main (main) where

import XMonad
import XMonad.Actions.UpdatePointer

import qualified Data.Map as M
import Graphics.X11.ExtraTypes.XF86
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)

-- java swift stupidity hack
import XMonad.Hooks.SetWMName

-- needed by CopyWindows bindings
import qualified XMonad.StackSet as W
import XMonad.Actions.CopyWindow

-- XMobar
import XMonad.Util.Run(spawnPipe)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import System.IO
import XMonad.Util.EZConfig(additionalKeys)

import XMonad.Util.Paste
import XMonad.Layout.Tabbed

-- https://github.com/fancypantalons/XMonad-Config/blob/master/xmonad.hs
roleName :: Query String
roleName = stringProperty "WM_WINDOW_ROLE"

alternateBinds bind w =
  let translatedProgs = ["URxvt"] in do
    c <- runQuery className w
    let toTranslate = any (== c) translatedProgs
    -- Unfortunately pasteSelection only supports ASCII
    -- If we simply use xdotool to send a middle click, it doens't always work depending on the position of the mouse pointer
    case toTranslate of
         True  | bind == "ctrlBackspace" -> sendKey controlMask xK_w
               | bind == "kill-line" -> sendKey controlMask xK_k
               | bind == "backward-kill-line" -> sendKey controlMask xK_u
         False | bind == "ctrlBackspace" -> sendKey controlMask xK_BackSpace
         -- Making a selection one character to right and only then full line ensures we kill next line if at the end of current line.
               | bind == "kill-line" -> sequence_ [sendKey  shiftMask xK_Right, sendKey shiftMask xK_End, sendKey noModMask xK_Delete]
               | bind == "backward-kill-line" -> sequence_ [sendKey shiftMask xK_Left, sendKey shiftMask xK_Home, sendKey noModMask xK_BackSpace]

main :: IO ()
main = do
  xmproc <- spawnPipe "/usr/bin/xmobar ~/.xmobarrc"
  xmonad $ defaultConfig{
     keys = myKeys <+> keys defaultConfig
    , terminal = "urxvt"
        , workspaces = ["Aw", "Rw", "Sw" , "Td", "Dd", "Hm", "Np", "E", "L", "O", "Ä"]
    , modMask = mod4Mask
    , manageHook = myManageHook <+> manageHook defaultConfig
    , layoutHook = avoidStruts  $  layoutHook defaultConfig ||| simpleTabbed
    , startupHook = setWMName "LG3D"
    , logHook = dynamicLogWithPP xmobarPP
                         { ppOutput = hPutStrLn xmproc
                         , ppTitle = xmobarColor "green" "" . shorten 50
                         }
                         >> updatePointer (Relative 0.99 0)
    } `additionalKeys`
    [ ((mod4Mask .|. shiftMask, xK_z), spawn "xscreensaver-command -lock")
    , ((mod4Mask, xK_b), sendMessage ToggleStruts)
    , ((mod4Mask, xK_k), spawn "~/bin/pomodoro-stop")
    , ((mod4Mask, xK_v), spawn "~/bin/pomodoro-interrupt")
    , ((0, xF86XK_MonBrightnessUp), spawn "sudo /usr/local/sbin/backlight up")
    , ((0, xF86XK_MonBrightnessDown), spawn "sudo /usr/local/sbin/backlight down")
    , ((0, xF86XK_Launch1), spawn "sudo /usr/local/sbin/backlight toggle")
    , ((0, xF86XK_Launch3), spawn "/usr/local/sbin/cpufreq_toggle_osd")
    , ((mod4Mask, xK_j     ), sendMessage Shrink)
    , ((mod4Mask, xK_y     ), sendMessage Expand)
    , ((mod4Mask, xK_u     ), windows W.focusDown  )
    , ((mod4Mask, xK_l     ), windows W.focusUp  )
    , ((mod4Mask, xK_f     ), withFocused $ windows . W.sink) -- unfloat/flatten
    , ((mod3Mask, xK_f     ), withFocused (alternateBinds "ctrlBackspace")  )
    , ((mod3Mask, xK_p     ), sendKey controlMask xK_Delete  )
-- selection (shift) versions of navigation
    , ((mod3Mask .|. shiftMask , xK_n     ), sendKey shiftMask xK_Left  )
    , ((mod3Mask .|. shiftMask , xK_y     ), sendKey shiftMask xK_Right  )
    , ((mod3Mask .|. shiftMask, xK_h     ), sendKey shiftMask xK_Home  )
    , ((mod3Mask .|. mod5Mask .|. shiftMask, xK_h     ), sendKey shiftMask xK_End  )

-- select a page
    , ((mod3Mask .|. mod5Mask .|. shiftMask, xK_u     ), sendKey shiftMask xK_Page_Up  )
    , ((mod3Mask .|. mod5Mask .|. shiftMask, xK_e     ), sendKey shiftMask xK_Page_Down  )
-- TODO: for chrome add ctrl to this to move tabs around

-- select lines
    , ((mod3Mask .|. shiftMask, xK_u     ), sendKey shiftMask xK_Up  )
    , ((mod3Mask .|. shiftMask, xK_e     ), sendKey shiftMask xK_Down  )

-- select lines
    , ((mod3Mask .|. mod1Mask, xK_u     ), sequence_ [sendKey noModMask xK_Up, sendKey noModMask xK_Up, sendKey noModMask xK_Up, sendKey noModMask xK_Up])
    , ((mod3Mask .|. mod1Mask, xK_e     ), sequence_ [sendKey noModMask xK_Down, sendKey noModMask xK_Down, sendKey noModMask xK_Down, sendKey noModMask xK_Down])

-- select to end/start of document from here
    , ((mod3Mask .|. shiftMask , xK_k     ), sendKey (controlMask .|. shiftMask) xK_Home  )
    , ((mod3Mask .|. mod5Mask.|. shiftMask , xK_k     ), sendKey (controlMask .|. shiftMask) xK_End  )

    -- floating layer support
    , ((mod4Mask,               xK_g     ), withFocused $ windows . W.sink) -- %! Push window back into tiling
-- kill-line macros
   , ((mod3Mask, xK_d     ), withFocused (alternateBinds "kill-line"))
   , ((mod3Mask .|. mod5Mask, xK_d     ), withFocused (alternateBinds "backward-kill-line"))
-- back/forward word
    , ((mod3Mask, xK_l     ), sendKey controlMask xK_Left  )
    , ((mod3Mask, xK_y     ), sendKey controlMask xK_Right  )
    , ((mod3Mask .|. shiftMask , xK_l     ), sendKey (controlMask .|. shiftMask) xK_Left  )
    , ((mod3Mask .|. shiftMask , xK_y     ), sendKey (controlMask .|. shiftMask) xK_Right  )
-- up/down paragraph
    , ((mod3Mask .|. mod5Mask, xK_l     ), sendKey controlMask xK_Up  )
    , ((mod3Mask .|. mod5Mask, xK_y     ), sendKey controlMask xK_Down  )
    , ((mod3Mask .|. mod5Mask .|. shiftMask, xK_l     ), sendKey (controlMask .|. shiftMask) xK_Up  )
    , ((mod3Mask .|. mod5Mask .|. shiftMask, xK_y     ), sendKey (controlMask .|. shiftMask) xK_Down  )
-- start/end of document
    , ((mod3Mask, xK_k     ), sendKey controlMask xK_Home  )
    , ((mod3Mask .|. mod5Mask, xK_k     ), sendKey controlMask xK_End  )
    , ((controlMask, xK_i     ), sendKey noModMask xK_Tab  )
    , ((controlMask .|. shiftMask, xK_i     ), sendKey shiftMask xK_Tab  )

-- misc
--    , ((mod3Mask, xK_semicolon     ), sendKey controlMask xK_c  )
--    , ((mod3Mask, xK_o     ), sendKey controlMask xK_v  )
    ]

-- for whatever reason altgr-. was set to send ctrl-x... I don't see the reason.
--     , ((mod3Mask, xK_period     ), sendKey controlMask xK_x  )

-- for whatever reason altgr-. was set to send ctrl-x... I don't see the reason.


myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
             [
                ((m .|. modm, k), windows $ f i)
               | (i, k) <- zip (XMonad.workspaces conf) workspaceKeys
               , (f, m) <- [(W.view, 0), (W.shift, shiftMask), (copy, shiftMask .|. controlMask)]
             ]
             where workspaceKeys = [xK_a, xK_r, xK_s, xK_t, xK_d, xK_h, xK_n, xK_e, xK_i, xK_o, xK_adiaeresis]

myManageHook = composeAll
   [ className =? "Thunderbird" --> doShift "Hm"
   , title =? "password-private"      --> doShift "Np"
   , title =? "password-kifi"      --> doShift "Np"
   , className =? "URxvt"      --> doShift "Dd"
   , className =? "Emacs"  --> doShift "Td"
   , manageDocks
   ]
   <+> (isFullscreen --> doFullFloat)
