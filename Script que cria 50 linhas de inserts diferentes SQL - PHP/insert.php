<?php
    $array_prods = array("Kingston", "Samsung", "Positivo", "HP", "Maxtor", "Seagate", "IBM", "WDigital", "Fujitsu", "Toshiba");
    $array_carac = array("100 GB, Sata III", "200 GB, Sata III", "300 GB, Sata III", "400 GB, Sata III", "500 GB, Sata III");
    $array_vc    = array(149.90, 229.99, 250.00, 355.99, 400.00);
    $array_vv    = array(249.90, 329.99, 350.00, 455.99, 500.00);

    $file = fopen("comandos.txt", "w") or die ("Unable to open file!");
    foreach( $array_prods as $item ){
        for($i = 0 ; $i < 5 ; $i++){
            $txt  = "INSERT INTO PRODUTO (PRO_NOME, PRO_VALOR_COMPRA, PRO_VALOR_VENDA, PRO_QUANTIDADE) values ('$item $array_carac[$i]', $array_vc[$i], $array_vv[$i]);\n";
            fwrite($file, $txt);
        }
    }
    fclose($file);
?>