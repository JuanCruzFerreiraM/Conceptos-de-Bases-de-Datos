
Program generador1;

Type 

    reg_mast =   Record
        cod :   Integer;
        nom_vul,nom_cien,descrip,zona:   string[25];
        altura:   real
    End;

    arch_mast =   file Of reg_mast;


Var 
    archivo:   arch_mast;
    reg1,reg2,reg3,reg4,reg5,reg6,reg7:   reg_mast;
Begin
    Assign(archivo,'original');
    Rewrite(archivo);
    reg1.cod := 1;
    reg1.nom_vul := 'Nombre1';
    reg1.nom_cien := 'NombreCientifico1';
    reg1.descrip := 'Descripcion1';
    reg1.zona := 'Zona1';
    reg1.altura := 1.0;

    reg2.cod := 2;
    reg2.nom_vul := 'Nombre2';
    reg2.nom_cien := 'NombreCientifico2';
    reg2.descrip := 'Descripcion2';
    reg2.zona := 'Zona2';
    reg2.altura := 2.0;

    reg3.cod := 3;
    reg3.nom_vul := 'Nombre3';
    reg3.nom_cien := 'NombreCientifico3';
    reg3.descrip := 'Descripcion3';
    reg3.zona := 'Zona3';
    reg3.altura := 3.0;

    reg4.cod := 4;
    reg4.nom_vul := 'Nombre4';
    reg4.nom_cien := 'NombreCientifico4';
    reg4.descrip := 'Descripcion4';
    reg4.zona := 'Zona4';
    reg4.altura := 4.0;

    reg5.cod := 5;
    reg5.nom_vul := 'Nombre5';
    reg5.nom_cien := 'NombreCientifico5';
    reg5.descrip := 'Descripcion5';
    reg5.zona := 'Zona5';
    reg5.altura := 5.0;

    reg6.cod := 6;
    reg6.nom_vul := 'Nombre6';
    reg6.nom_cien := 'NombreCientifico6';
    reg6.descrip := 'Descripcion6';
    reg6.zona := 'Zona6';
    reg6.altura := 6.0;

    reg7.cod := 7;
    reg7.nom_vul := 'Nombre7';
    reg7.nom_cien := 'NombreCientifico7';
    reg7.descrip := 'Descripcion7';
    reg7.zona := 'Zona7';
    reg7.altura := 7.0;

    Write(archivo, reg1);
    Write(archivo, reg2);
    Write(archivo, reg3);
    Write(archivo, reg4);
    Write(archivo, reg5);
    Write(archivo, reg6);
    Write(archivo, reg7);

    Close(archivo);
End.
