# ----------- MelonLoader IL2CPP (net6) -----------
dotnet build src/UnityExplorer.sln -c Release_ML_Cpp_net6
$Path = "Release\UnityExplorer.MelonLoader.IL2CPP.net6preview"
# ILRepack
lib/ILRepack.exe /target:library /lib:lib/net6 /lib:lib/unhollowed /lib:$Path /internalize /out:$Path/UnityExplorer.ML.IL2CPP.net6preview.dll $Path/UnityExplorer.ML.IL2CPP.net6preview.dll $Path/mcs.dll 
# (cleanup and move files)
Remove-Item $Path/UnityExplorer.ML.IL2CPP.net6preview.deps.json
Remove-Item $Path/Tomlet.dll
Remove-Item $Path/mcs.dll
Remove-Item $Path/Iced.dll
Remove-Item $Path/UnhollowerBaseLib.dll
New-Item -Path "$Path" -Name "Mods" -ItemType "directory" -Force
Move-Item -Path $Path/UnityExplorer.ML.IL2CPP.net6preview.dll -Destination $Path/Mods -Force
New-Item -Path "$Path" -Name "UserLibs" -ItemType "directory" -Force
Move-Item -Path $Path/UniverseLib.IL2CPP.Unhollower.dll -Destination $Path/UserLibs -Force
# (create zip archive)
Remove-Item $Path/../UnityExplorer.MelonLoader.IL2CPP.net6preview.zip -ErrorAction SilentlyContinue
7z a $Path/../UnityExplorer.MelonLoader.IL2CPP.net6preview.zip .\$Path\*

# ----------- MelonLoader IL2CPP (net472) -----------
dotnet build src/UnityExplorer.sln -c Release_ML_Cpp_net472
$Path = "Release/UnityExplorer.MelonLoader.IL2CPP"
# ILRepack
lib/ILRepack.exe /target:library /lib:lib/net472 /lib:lib/net35 /lib:lib/unhollowed /lib:$Path /internalize /out:$Path/UnityExplorer.ML.IL2CPP.dll $Path/UnityExplorer.ML.IL2CPP.dll $Path/mcs.dll 
# (cleanup and move files)
Remove-Item $Path/Tomlet.dll
Remove-Item $Path/mcs.dll
Remove-Item $Path/Iced.dll
Remove-Item $Path/UnhollowerBaseLib.dll
New-Item -Path "$Path" -Name "Mods" -ItemType "directory" -Force
Move-Item -Path $Path/UnityExplorer.ML.IL2CPP.dll -Destination $Path/Mods -Force
New-Item -Path "$Path" -Name "UserLibs" -ItemType "directory" -Force
Move-Item -Path $Path/UniverseLib.IL2CPP.Unhollower.dll -Destination $Path/UserLibs -Force
# (create zip archive)
Remove-Item $Path/../UnityExplorer.MelonLoader.IL2CPP.zip -ErrorAction SilentlyContinue
7z a $Path/../UnityExplorer.MelonLoader.IL2CPP.zip .\$Path\*

# ----------- MelonLoader Mono -----------
dotnet build src/UnityExplorer.sln -c Release_ML_Mono
$Path = "Release/UnityExplorer.MelonLoader.Mono"
# ILRepack
lib/ILRepack.exe /target:library /lib:lib/net35 /lib:$Path /internalize /out:$Path/UnityExplorer.ML.Mono.dll $Path/UnityExplorer.ML.Mono.dll $Path/mcs.dll 
# (cleanup and move files)
Remove-Item $Path/Tomlet.dll
Remove-Item $Path/mcs.dll
New-Item -Path "$Path" -Name "Mods" -ItemType "directory" -Force
Move-Item -Path $Path/UnityExplorer.ML.Mono.dll -Destination $Path/Mods -Force
New-Item -Path "$Path" -Name "UserLibs" -ItemType "directory" -Force
Move-Item -Path $Path/UniverseLib.Mono.dll -Destination $Path/UserLibs -Force
# (create zip archive)
Remove-Item $Path/../UnityExplorer.MelonLoader.Mono.zip -ErrorAction SilentlyContinue
7z a $Path/../UnityExplorer.MelonLoader.Mono.zip .\$Path\*

# ----------- BepInEx IL2CPP -----------
dotnet build src/UnityExplorer.sln -c Release_BIE_Cpp
$Path = "Release/UnityExplorer.BepInEx.IL2CPP"
# ILRepack
lib/ILRepack.exe /target:library /lib:lib/net472 /lib:lib/unhollowed /lib:$Path /internalize /out:$Path/UnityExplorer.BIE.IL2CPP.dll $Path/UnityExplorer.BIE.IL2CPP.dll $Path/mcs.dll $Path/Tomlet.dll
# (cleanup and move files)
Remove-Item $Path/Tomlet.dll
Remove-Item $Path/mcs.dll
Remove-Item $Path/Iced.dll
Remove-Item $Path/UnhollowerBaseLib.dll
New-Item -Path "$Path" -Name "plugins" -ItemType "directory" -Force
New-Item -Path "$Path" -Name "plugins/sinai-dev-UnityExplorer" -ItemType "directory" -Force
Move-Item -Path $Path/UnityExplorer.BIE.IL2CPP.dll -Destination $Path/plugins/sinai-dev-UnityExplorer -Force
Move-Item -Path $Path/UniverseLib.IL2CPP.Unhollower.dll -Destination $Path/plugins/sinai-dev-UnityExplorer -Force
# (create zip archive)
Remove-Item $Path/../UnityExplorer.BepInEx.IL2CPP.zip -ErrorAction SilentlyContinue
7z a $Path/../UnityExplorer.BepInEx.IL2CPP.zip .\$Path\*

# ----------- BepInEx IL2CPP CoreCLR -----------
dotnet build src/UnityExplorer.sln -c Release_BIE_CoreCLR
$Path = "Release/UnityExplorer.BepInEx.IL2CPP.CoreCLR"
# ILRepack
lib/ILRepack.exe /target:library /lib:lib/net472 /lib:lib/net6/ /lib:lib/interop/ /lib:$Path /internalize /out:$Path/UnityExplorer.BIE.IL2CPP.CoreCLR.dll $Path/UnityExplorer.BIE.IL2CPP.CoreCLR.dll $Path/mcs.dll $Path/Tomlet.dll
# (cleanup and move files)
Remove-Item $Path/Tomlet.dll
Remove-Item $Path/mcs.dll
Remove-Item $Path/Iced.dll
Remove-Item $Path/Il2CppInterop.Common.dll
Remove-Item $Path/Il2CppInterop.Runtime.dll
Remove-Item $Path/Microsoft.Extensions.Logging.Abstractions.dll
Remove-Item $Path/UnityExplorer.BIE.IL2CPP.CoreCLR.deps.json
New-Item -Path "$Path" -Name "plugins" -ItemType "directory" -Force
New-Item -Path "$Path" -Name "plugins/sinai-dev-UnityExplorer" -ItemType "directory" -Force
Move-Item -Path $Path/UnityExplorer.BIE.IL2CPP.CoreCLR.dll -Destination $Path/plugins/sinai-dev-UnityExplorer -Force
Move-Item -Path $Path/UniverseLib.IL2CPP.Interop.dll -Destination $Path/plugins/sinai-dev-UnityExplorer -Force
# (create zip archive)
Remove-Item $Path/../UnityExplorer.BepInEx.IL2CPP.CoreCLR.zip -ErrorAction SilentlyContinue
7z a $Path/../UnityExplorer.BepInEx.IL2CPP.CoreCLR.zip .\$Path\*

# ----------- BepInEx 5 Mono -----------
dotnet build src/UnityExplorer.sln -c Release_BIE5_Mono
$Path = "Release/UnityExplorer.BepInEx5.Mono"
# ILRepack
lib/ILRepack.exe /target:library /lib:lib/net35 /lib:$Path /internalize /out:$Path/UnityExplorer.BIE5.Mono.dll $Path/UnityExplorer.BIE5.Mono.dll $Path/mcs.dll $Path/Tomlet.dll
# (cleanup and move files)
Remove-Item $Path/Tomlet.dll
Remove-Item $Path/mcs.dll
New-Item -Path "$Path" -Name "plugins" -ItemType "directory" -Force
New-Item -Path "$Path" -Name "plugins/sinai-dev-UnityExplorer" -ItemType "directory" -Force
Move-Item -Path $Path/UnityExplorer.BIE5.Mono.dll -Destination $Path/plugins/sinai-dev-UnityExplorer -Force
Move-Item -Path $Path/UniverseLib.Mono.dll -Destination $Path/plugins/sinai-dev-UnityExplorer -Force
# (create zip archive)
Remove-Item $Path/../UnityExplorer.BepInEx5.Mono.zip -ErrorAction SilentlyContinue
7z a $Path/../UnityExplorer.BepInEx5.Mono.zip .\$Path\*
