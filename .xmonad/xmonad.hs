--
-- .xmonad/xmonad.hs
--

-- インポート
import XMonad
import XMonad.Hooks.DynamicLog

------------------------------------------------------------------------
-- こまごました設定

-- ターミナルの指定
myTerminal      = "mlterm"

-- modキーをWindowsに
myModMask       = mod1Mask

-- ワークスペース
myWorkspaces = ["1:work","2:web"] ++ map show [3..9]

------------------------------------------------------------------------
-- xmobarの設定

-- Command to launch the bar.
myBar = "xmobar"

-- 表示の指定
myPP = xmobarPP { ppCurrent = xmobarColor "#429942" "" . wrap "<" ">" }

-- Keybinding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)

------------------------------------------------------------------------
-- 設定の実行

-- 実行
main = xmonad =<< statusBar myBar myPP toggleStrutsKey myConfig

-- 設定(上書きしなければデフォルトの値が用いられる)
myConfig = defaultConfig {
        terminal           = myTerminal,
        modMask            = myModMask,
        workspaces         = myWorkspaces
    }
