Set objShell = WScript.CreateObject("WScript.Shell")
Set objShortcut = objShell.CreateShortcut(objShell.SpecialFolders("Desktop") & "\Control Panel.lnk")
objShortcut.TargetPath = "control"
objShortcut.Save
