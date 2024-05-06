Program generador3;

Const 
    cantidad =   2;

Type 
    reg_d =   Record
        cod:   integer;
        numero:   integer;
        cant_vend:   integer;
    End;

    reg_m =   Record
        cod:   integer;
        numero:   integer;
        descp:   string;
        precio_unidad:   real;
        color:   string;
        stock:   integer;
        stock_min:   integer;
    End;

    archivo_detalle =   file Of reg_d;
    archivo_maestro =   file Of reg_m;

    arr_arch_d =   array[1..cantidad] Of archivo_detalle;

Var 
    arr_d:   arr_arch_d;
    master:   archivo_maestro;
    calz1,calz2,calz3:   reg_m;
    det:   reg_d;

Begin
    Assign(master, 'maestro');
    Rewrite(master);
    Assign(arr_d[1], 'detalle1');
    Rewrite(arr_d[1]);
    Assign(arr_d[2], 'detalle2');
    Rewrite(arr_d[2]);

    calz1.cod := 1;
    calz1.numero := 41;
    calz1.descp := 'Zapatillas deportivas';
    calz1.precio_unidad := 59.99;
    calz1.color := 'Negro';
    calz1.stock := 50;
    calz1.stock_min := 10;
    
    Write(master,calz1);

    calz1.numero := 42;
    calz1.stock := 30;
    calz1.stock_min := 5;

    Write(master,calz1);

    calz2.cod := 2;
    calz2.numero := 30;
    calz2.descp := 'Botas de cuero';
    calz2.precio_unidad := 129.99;
    calz2.color := 'Marrón';
    calz2.stock := 30;
    calz2.stock_min := 5;

    calz3.cod := 3;
    calz3.numero := 29;
    calz3.descp := 'Sandalias de playa';
    calz3.precio_unidad := 19.99;
    calz3.color := 'Azul';
    calz3.stock := 100;
    calz3.stock_min := 20;

    
    Write(master,calz2);
    Write(master, calz3);
    
    det.cod:= 1;
    det.numero := 42;
    det.cant_vend := 30;
    Write(arr_d[1], det);

    det.cod := 3;
    det.numero := 29;
    det.cant_vend := 30;
    Write(arr_d[1], det);
    
    det.cod := 1;
    det.numero := 41;
    det.cant_vend := 0;
    Write(arr_d[2], det);

    det.cod := 2;
    det.numero := 30;
    det.cant_vend := 25;
    Write(arr_d[2], det);

    det.cod := 3;
    det.numero := 29;
    det.cant_vend := 60;
    Write(arr_d[2], det);




End.
