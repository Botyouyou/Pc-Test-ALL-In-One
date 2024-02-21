Set objShell = WScript.CreateObject("WScript.Shell")
Set objShortcut = objShell.CreateShortcut(objShell.SpecialFolders("Desktop") & "\User Files.lnk")
objShortcut.TargetPath = objShell.SpecialFolders("Desktop")
objShortcut.Save
