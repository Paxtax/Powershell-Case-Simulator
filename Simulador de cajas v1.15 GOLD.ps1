#SIMULADOR CAJAS CSGO® (Derechos reservados por Valve Corp.)
#v1.15 GOLD
#Hecho por: Miguel Prieto Hernández
#Inicio Codigo
#Inicialización check variables
$inventario = New-Object System.Collections.ArrayList
$inventariodef = New-Object System.Collections.ArrayList
$inventariocuchdef = New-Object System.Collections.ArrayList
$loop0 = 0
$loop1 = 0
$loop2 = 0
$loop3 = 0
$loop4 = 1
$invnonmod2 = 0
$invnonmod3 = 0
$numero = 0
$dinero = 500
$editl = -1
$cajasel = ""
$armadef = 0
$menu3 = 0
$menu = @(
             ("Compra/Venta(1), ","Cajas(2), ","Dinero Actual(3), ","Inventario Actual(4), ","Salir del juego(5)")
   )
$cuchillos = @(
             ("Nomad Cuchillo","Skeleton Cuchillo","Survival Cuchillo","Classic Cuchillo")
   )
$cajas = @(
             ("caja1","caja2","caja3","caja4","caja5","caja6","caja7","caja8")
   )
$dincaja='1000','750','650','350','250','125','100','75','50','25','10','5'
$caja1=’AWP | Containment Breach’,’MAC-10 | Stalker’,’SG 553 | Colony IV’,’SSG 08 | Bloodshot’,’Tec-9 | Decimator’,’AK-47 | Rat Rod’,’AUG | Arctic Wolf’,’MP7 | Neon Ply’,’P2000 | Obsidian’,’PP-Bizon | Embargo’,’Dual Berettas | Balance’,’MP5-SD | Acid Wash’
$caja2=’AWP | Lightning Strike’,’AK-47 | Case Hardened’,’Desert Eagle | Hypnotic’,’Glock-18 | Dragon Tatto’,’M4A1-S | Dark Water’,’USP-S | Dark Water’,’SG 553 | Ultraviolet’,’AUG | Wings’,’MP7 | Skulls’
$caja3=’AWP | Wildfire’,’FAMAS | Commemoration’,’MP9 | Hydra’,’AUG | Death by Puppy’,’P90 | Nostalgia’,’MP5-SD | Agent’,’UMP-45 | Plastique’,’P250 | Inferno’,’Five-SeveN | Buddy'
$caja4=’M4A4 | Neo-Noir’,’MP7 | Bloodsport’,’USP-S | Cortex’,’AWP | Mortis’,’AUG | Stymphalian’,’Glock-18 | Moonrise’,’MAG-7 | SWAG-7’,’UMP-45 | Arctic Wolf’,’Nova | Wild Six’,’Negev | Lionfish’,’SG 553 | Aloha’,’R8 Revolver | Grip’
$caja5=’M4A1-S | Hyper Beast’,’MAC-10 | Neon Rider’,’Galil AR | Eco’,’Five-SeveN | Monkey Business’,’FAMAS | Djinn’,’AWP | Worm God’,’MAG-7 | Heat’,’CZ75-Auto | Pole Position’,’UMP-45 | Grand Prix’,’AK-47 | Elite Build’,’Desert Eagle | Bronze Deco’,’P250 | Valence’
$caja6=’P90 | Death by Kitty’,’AK-47 | Red Laminate’,’AWP | BOOM’,’Galil AR | Orange DDPAT’,’P250 | Splash’,’Sawed-Off | Orange DDPAT’,’M4A4 | Faded Zebra’,’MAG-7 | Memento’,’FAMAS | Doomkitty’
$caja7=’M4A4 | Buzz Kill’,’SSG 08 | Dragonfire’,’FAMAS | Mecha Industries’,’P90 | Shallow Grave’,’Sawed-Off | Wasteland Princess’,’USP-S | Cyrex’,’M4A1-S | Flashback’,’Dual Berettas | Royal Consorts’,’Nova | Gila’,’G3SG1 | Stinger’,’Glock-18 | Ironwork’,’MP7 | Cirrus’
$caja8=’CZ75-Auto | Victoria’,’P250 | Undertow’,’CZ75-Auto | The Fuschia Is Now’,’Desert Eagle | Heirloom’,’Five-SeveN | Copper Galaxy’,’CZ75-Auto | Tread Plate’,’Tec-9 | Titanium Bit’,’CZ75-Auto | Crimson Web’,’USP-S | Stainless’,’Glock-18 | Blue Fissure’,’Dual Berettas | Panther’,’P2000 | Red FragCam’
Write-Host "SIMULADOR CAJAS CSGO® (Derechos reservados por Valve Corp.)"
Write-Host "v1.15 GOLD"
Write-Host "Hecho por: Miguel Prieto Hernández"
Read-Host "Presione una tecla para continuar..."
clear
#Inicio Loop Maestro
while($loop0 -eq 0){
#Inicio Loop menu
while($loop2 -eq 0){
$loop3 = 0
Write-Host $menu
$menu2 = Read-Host "Elije el menú (Solo pon el número)"
switch($menu2){
    1 {
    $loop0 = 1
    $loop2 = 1
    $loop4 = 0
    $loop3 = 1
    clear
    }
    2 {
    $loop2 = 1
    $loop0 = 0
    $loop1 = 0
    $loop3 = 0
    clear
    }
    3 {
    Write-Host "Tu dinero actual es:"
    Write-Host $dinero
    Read-Host "Presione una tecla para continuar..."
    clear
    }
    4 {
        if ($inventario.Count -eq 0){
            Write-Host "No tienes nada en el inventario, saliendo al menu principal..."
            Read-Host "Presione una tecla para continuar..."
            clear 
        }else{
        Write-Host "Este es tu inventario"
        Write-Host $inventario
        Read-Host "Presione una tecla para continuar..."
        clear
        }
        }
    5 {
    $loop0 = 1
    $loop1 = 1
    $loop2 = 1
    $loop3 = 1
    $loop4 = 1
    clear
    }
}
}
#Fin loop menu
#Inicio loop compra/venta
while($loop4 -eq 0){
$menu3 = Read-Host "Elije compra(1) o venta(2) o salir al menú(3),(Solo pon el número)"
switch($menu3){
    1 {
     if ($dinero -le 9999){
            Write-Host "No tienes suficiente dinero para comprar un cuchillo, saliendo al menu principal..."
            Read-Host "Presione una tecla para continuar..."
            $loop2 = 0
            $loop1 = 1
            $loop0 = 0
            $loop3 = 1
            $loop4 = 1
            $cuchillotpv = ""
            $cuchillotpvnum = ""
            $defdin2 = ""
            $defdin3 = ""
            clear 
        }else{
    Write-Host "Puedes comprar estos cuchillos (No puedes comprar armas)"
    Write-Host $cuchillos
    $cuchillotpvnum = Read-Host "Cada cuchillo vale 10000 de dinero (Eligelo poniendo el numero empezando por la derecha, o pulsa un numero mayor para salir)"
    $cuchillotpvnum = $cuchillotpvnum - 1
    $cuchillotpv = $cuchillos[$cuchillotpvnum]
    if ($cuchillotpvnum -ge 0 -and $cuchillotpvnum -le 3){
        $dinero = $dinero - 10000
        Write-Host "¡Cuchillo Comprado!"
        [void]$inventario.Add($cuchillotpv)
        [void]$inventariocuchdef.Add($cuchillotpv)  
        Read-Host "Presione una tecla para continuar..."
        $editl = $editl + 2
        clear   
    }elseif ($cuchillotpvnum -ge 4){
        Read-Host "Presione una tecla para continuar..."
        clear 
    }
    }
    }
    2 {
    Write-Host "Puedes vender tanto tus cuchillos como tus armas"
    Write-Host "A continuación, tendras que poner si quieres vender armas o cuchillos"
    $selventa = Read-Host "Elige cuchillos (1) o armas (2)"
    if ($selventa -eq 1){
        if ($inventariocuchdef.Count -eq 0){
            Write-Host "No tienes cuchillos en el inventario, saliendo al menu principal..."
            Read-Host "Presione una tecla para continuar..."
            $loop2 = 0
            $loop1 = 1
            $loop0 = 0
            $loop3 = 1
            $loop4 = 1
            $cuchilloventa = ""
            $cuchillotpv2 = ""
            $defdin2 = ""
            $defdin3 = ""
            clear 
        }else{
        Write-Host "Estos son tus cuchillos"
        Write-Host $inventariocuchdef
        $cuchilloventa = Read-Host "Di que cuchillo quieres vender (Solo pon el número empezando por la derecha)"
        $cuchilloventa = $cuchilloventa - 1
        $cuchillotpv2 = $inventariocuchdef[$cuchilloventa]
        if ($confirmacionarma -eq 1){
            $dinero = $dinero + 10000
            Write-Host "¡Cuchillo Vendido!"
            [void]$inventariocuchdef.RemoveAt($cuchilloventa) 
            [void]$inventario.Remove($cuchillotpv2) 
            Read-Host "Presione una tecla para continuar..."
            clear
        }else{
                Write-Host "No se vendera el arma, volviendo al menú principal, saliendo..."
                Read-Host "Presione una tecla para continuar..."
                $loop2 = 0
                $loop1 = 1
                $loop0 = 0
                $loop3 = 1
                $loop4 = 1
                $armaventa = ""
                $armatpv = ""
                $defdin2 = ""
                $defdin3 = ""
                $cuchilloventa = ""
                $cuchillotpv2 = ""
                clear 
            }

        }
    }else{
        if ($inventariodef.Count -eq 0){
            Write-Host "No tienes armas en el inventario, saliendo al menu principal..."
            Read-Host "Presione una tecla para continuar..."
            $loop2 = 0
            $loop1 = 1
            $loop0 = 0
            $loop3 = 1
            $loop4 = 1
            $armaventa = ""
            $armatpv = ""
            $defdin2 = ""
            $defdin3 = ""
            clear 
        }else{
            Write-Host "Estas son tus armas"
            Write-Host $inventariodef
            $armaventa = Read-Host "Di que arma quieres vender (Solo pon el número empezando por la derecha)"
            $armaventa = $armaventa - 1
            $armatpv = $inventariodef[$armaventa]
            Write-Host $armatpv
            Write-Host "Calculando dinero a cobrar del arma..."
            if ($caja1 -contains $armatpv){
                $defdin2 = [array]::indexof($caja1,$armatpv) 
                $defdin3 = $dincaja[$defdin2]
            }elseif($caja2 -contains $armatpv){
                $defdin2 = [array]::indexof($caja2,$armatpv) 
                $defdin3 = $dincaja[$defdin2]
            }elseif($caja3 -contains $armatpv){
                $defdin2 = [array]::indexof($caja3,$armatpv) 
                $defdin3 = $dincaja[$defdin2]
            }elseif($caja4 -contains $armatpv){
                $defdin2 = [array]::indexof($caja4,$armatpv) 
                $defdin3 = $dincaja[$defdin2]
            }elseif($caja5 -contains $armatpv){
                $defdin2 = [array]::indexof($caja5,$armatpv) 
                $defdin3 = $dincaja[$defdin2]
            }elseif($caja6 -contains $armatpv){
                $defdin2 = [array]::indexof($caja6,$armatpv) 
                $defdin3 = $dincaja[$defdin2]
            }elseif($caja7 -contains $armatpv){
                $defdin2 = [array]::indexof($caja7,$armatpv) 
                $defdin3 = $dincaja[$defdin2]
            }elseif($caja8 -contains $armatpv){
                $defdin2 = [array]::indexof($caja8,$armatpv) 
                $defdin3 = $dincaja[$defdin2]
            }
            $dinero = $dinero + $defdin3
            Write-Host "Se van a cobrar por este arma "$defdin3
            $confirmacionarma = Read-Host "¿Quieres vender este arma? ((1) Sí o (2) No)"
            if ($confirmacionarma -eq 1){
                Write-Host "¡Arma Vendida!"
                [void]$inventariodef.RemoveAt($armaventa) 
                [void]$inventario.Remove($armatpv) 
                Read-Host "Presione una tecla para continuar..."
                clear 
            }else{
                Write-Host "No se vendera el arma, volviendo al menú principal, saliendo..."
                Read-Host "Presione una tecla para continuar..."
                $loop2 = 0
                $loop1 = 1
                $loop0 = 0
                $loop3 = 1
                $loop4 = 1
                $armaventa = ""
                $armatpv = ""
                $defdin2 = ""
                $defdin3 = ""
                clear 
            }
        }
    }
    }
    3 {
    $loop2 = 0
    $loop1 = 1
    $loop0 = 0
    $loop3 = 1
    $loop4 = 1
    clear
    }
}
}
#Fin loop compra/venta
#Inicio loop caja
while($loop1 -eq 0){
  if ($dinero -le 49){
            Write-Host "No tienes suficiente dinero para comprar una caja, saliendo al menu principal..."
            Read-Host "Presione una tecla para continuar..."
            $loop2 = 0
            $loop1 = 1
            $loop0 = 0
            $loop3 = 1
            $loop4 = 1
            $numero = ""
            $cajasel = ""
            $armadef = ""
            clear 
   }else{
Write-Host "Elije la caja que quieras de las mostradas (Coste de abrir una caja: 50):"
Write-Host $cajas
$numero=Read-Host "Dime la caja que quieres (Solo pon el número de la caja)"
$dinero = $dinero - 50
$numero = $numero - 1
$cajasel = $cajas[$numero]
if($cajas -contains $cajasel){
    Write-Host "Caja existente, continuamos..."
    Write-Host "Tu caja seleccionada es:" $cajas[$numero]
    Write-Host "Sacando elemento de la caja..."
    $loop1 = 1
}
else{
     clear
    $loop1 = 0
}
#Inicio randomizador caja
if($cajasel -eq "caja1") {
    $armadef = Get-Random -InputObject $caja1
        Write-Host "¡Has ganado un"$armadef"!"
        [void]$inventario.Add($armadef)
        [void]$inventariodef.Add($armadef) 
}elseif($cajasel -eq "caja2") {
    $armadef = Get-Random -InputObject $caja2
        Write-Host "¡Has ganado un"$armadef"!"
        [void]$inventario.Add($armadef)
        [void]$inventariodef.Add($armadef) 
}elseif($cajasel -eq "caja3") {
    $armadef = Get-Random -InputObject $caja3
        Write-Host "¡Has ganado un"$armadef"!"
        [void]$inventario.Add($armadef)
        [void]$inventariodef.Add($armadef) 
}elseif($cajasel -eq "caja4") {
    $armadef = Get-Random -InputObject $caja4
        Write-Host "¡Has ganado un"$armadef"!"
        [void]$inventario.Add($armadef)
        [void]$inventariodef.Add($armadef) 
}elseif($cajasel -eq "caja5") {
    $armadef = Get-Random -InputObject $caja5
        Write-Host "¡Has ganado un"$armadef"!"
        [void]$inventario.Add($armadef)
        [void]$inventariodef.Add($armadef) 
}elseif($cajasel -eq "caja6") {
    $armadef = Get-Random -InputObject $caja6
        Write-Host "¡Has ganado un"$armadef"!"
        [void]$inventario.Add($armadef)
        [void]$inventariodef.Add($armadef) 
}elseif($cajasel -eq "caja7") {
    $armadef = Get-Random -InputObject $caja7
        Write-Host "¡Has ganado un"$armadef"!"
        [void]$inventario.Add($armadef)
        [void]$inventariodef.Add($armadef) 
}elseif($cajasel -eq "caja8") {
    $armadef = Get-Random -InputObject $caja8
        Write-Host "¡Has ganado un"$armadef"!"
        [void]$inventario.Add($armadef)
        [void]$inventariodef.Add($armadef) 
}
$loop3 = 0
}
}
#Fin randomizador caja
#Incio loop reseteador
While($loop3 -eq 0){
$ex = Read-Host "¿Continuar al menú(1), salir(2), o volver a lanzar caja(3)? (Pon el numero exacto)"
if ($ex -eq "3"){
    $loop1 = 0
    $loop2 = 1
    $loop3 = 1
    $cajasel = ""
    $armadef = ""
    $numero = ""
    clear
    }elseif ($ex -eq "1"){
    $loop1 = 1
    $loop2 = 0
    $loop3 = 1
    $cajasel = ""
    $armadef = ""
    $numero = ""
    clear
}elseif ($ex -eq "2"){
    $loop0 = 1
    $loop3 = 1
    clear
}else{
    Write-Host "Por favor, escriba una opción correcta"
    Read-Host "Presione una tecla para continuar..."
    clear
    clear
}
}
#Fin loop reseteador
}
#Fin loop maestro