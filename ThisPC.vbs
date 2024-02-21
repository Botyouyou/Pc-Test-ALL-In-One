Set objShell = WScript.CreateObject("WScript.Shell")
Set objShortcut = objShell.CreateShortcut(objShell.SpecialFolders("Desktop") & "\This PC.lnk")
objShortcut.TargetPath = "::{20D04FE0-3AEA-1069-A2D8-08002B30309D}"
objShortcut.Save