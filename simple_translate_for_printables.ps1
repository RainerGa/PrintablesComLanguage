# *****************************************************************************************************************
# Simple Skript for automatically translate text in 4 Language with standard informations
# Text will be used for printables models
#
# Version          Date           Description
# 1.0              04.11.2023     First Version
# *****************************************************************************************************************

# Functions
# *************
function Test-MrParameter {

    param (
        [String]$translateText,
        [String]$lang
    )

    $Uri = “https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=$($lang)&dt=t&q=$translateText”
    $Response = Invoke-RestMethod -Uri $Uri -Method Get

    $result = $Response[0].SyncRoot | foreach { $_[0] }
    $result

}

# Variables
# *************

$Text = “Hierbei handelt es sich um einen Eiskratzer. Der Eiskratzer hat eine Gummilippe um auch leichteres Eis und Schnee schnell zu entfernen. Als Gummilippe habe ich das Filament von Filatech FilaFlex40 verwendet. Viel Spaß bei Eis und Schnee :-)”
$Text = $Text +"\nWie üblich können alle Maße im FreeCAD leicht verändert werden."
$eng = ""
$fr = ""
$cz = ""



# Main Program
# ****************

write-host "**Description Language:** DE, ENG, FR, CZ"
write-host "**Configurable:** YES"
write-host "**CAD Program: FreeCAD**"
write-host ""
write-host "# DE"
write-host $Text
write-host ""
write-host "# ENG"
Test-MrParameter -translateText $Text -lang "eng"
write-host ""
write-host "# FR"
Test-MrParameter -translateText $Text -lang "fr"
write-host ""
write-host "# cz"
Test-MrParameter -translateText $Text -lang "cz"
write-host "" 