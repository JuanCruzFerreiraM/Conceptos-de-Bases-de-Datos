program generador4;
Const 
    CANTIDAD = 3;
Type

    reg_det =   Record
        cod:   integer;
        nombre:   string;
        genero:   string;
        director:   string;
        duracion:   real;
        fecha:   string;
        cant_asis:   integer;
    End;

    arch_det =   file Of reg_det;

    array_arch_d =   array[1..CANTIDAD] Of arch_det;


Var
    peli1,peli2,peli3,peli4:   reg_det;
    arreglo:  array_arch_d;
    i: integer;
Begin
    Assign(arreglo[1],'detalle1');
    Assign(arreglo[2],'detalle2');
    Assign(arreglo[3],'detalle3');
    Rewrite(arreglo[1]);
    Rewrite(arreglo[2]);
    Rewrite(arreglo[3]);

    // Generate records for peli1
    peli1.cod := 1;
    peli1.nombre := 'Pelicula 1';
    peli1.genero := 'Accion';
    peli1.director := 'John Smith';
    peli1.duracion := 120.5;
    peli1.fecha := '2022-01-01';
    peli1.cant_asis := 100;

    Write(arreglo[1],peli1);

    peli1.fecha := '2022-01-02';
    peli1.cant_asis := 200;

    Write(arreglo[1],peli1);

    peli1.cant_asis := 300;

    Write(arreglo[2],peli1);

    // Generate records for peli2
    peli2.cod := 2;
    peli2.nombre := 'Pelicula 2';
    peli2.genero := 'Comedia';
    peli2.director := 'Jane Johnson';
    peli2.duracion := 90.0;
    peli2.fecha := '2022-02-15';
    peli2.cant_asis := 150;
   
    Write(arreglo[2],peli2);

    peli2.cant_asis := 250;

    Write(arreglo[3],peli2);

    // Generate records for peli3
    peli3.cod := 3;
    peli3.nombre := 'Pelicula 3';
    peli3.genero := 'Drama';
    peli3.director := 'Michael Brown';
    peli3.duracion := 105.75;
    peli3.fecha := '2022-03-30';
    peli3.cant_asis := 80;
   
    Write(arreglo[3],peli3);

    peli3.cant_asis := 180;

    Write(arreglo[2],peli3);

    // Generate records for peli4
    peli4.cod := 4;
    peli4.nombre := 'Pelicula 4';
    peli4.genero := 'Suspenso';
    peli4.director := 'Emily Davis';
    peli4.duracion := 150.25;
    peli4.fecha := '2022-04-10';
    peli4.cant_asis := 120;

    Write(arreglo[1],peli4);

    peli4.cant_asis := 220;

    Write(arreglo[3],peli4);

    for i :=1to CANTIDAD do
    begin
        Close(arreglo[i]);
    end; 

End.