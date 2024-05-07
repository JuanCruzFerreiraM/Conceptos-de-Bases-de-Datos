Program generador5;

Type 
    reg =   Record
        partido:   string;
        localidad:   string;
        barrio:   string;
        cant_n:   integer;
        cant_a:   integer;
    End;

    arch =   file Of reg;
    arr =  array[1..3] of reg;

Var 
    partido1: arr;
    partido2: arr;
    partido3: arr; 
    informe: arch;
    i: integer;

Begin
    Assign(informe, 'informe');
    Rewrite(informe);
    // Fill partido1 array
    partido1[1].partido := 'Partido A';
    partido1[1].localidad := 'Localidad A1';
    partido1[1].barrio := 'Barrio A1';
    partido1[1].cant_n := 10;
    partido1[1].cant_a := 5;

    partido1[2].partido := 'Partido A';
    partido1[2].localidad := 'Localidad A1';
    partido1[2].barrio := 'Barrio A2';
    partido1[2].cant_n := 8;
    partido1[2].cant_a := 3;

    partido1[3].partido := 'Partido A';
    partido1[3].localidad := 'Localidad A3';
    partido1[3].barrio := 'Barrio A3';
    partido1[3].cant_n := 12;
    partido1[3].cant_a := 7;

    // Fill partido2 array
    partido2[1].partido := 'Partido B';
    partido2[1].localidad := 'Localidad B1';
    partido2[1].barrio := 'Barrio B1';
    partido2[1].cant_n := 6;
    partido2[1].cant_a := 2;

    partido2[2].partido := 'Partido B';
    partido2[2].localidad := 'Localidad B2';
    partido2[2].barrio := 'Barrio B2';
    partido2[2].cant_n := 9;
    partido2[2].cant_a := 4;

    partido2[3].partido := 'Partido B';
    partido2[3].localidad := 'Localidad B3';
    partido2[3].barrio := 'Barrio B3';
    partido2[3].cant_n := 7;
    partido2[3].cant_a := 3;

    // Fill partido3 array
    partido3[1].partido := 'Partido C';
    partido3[1].localidad := 'Localidad C1';
    partido3[1].barrio := 'Barrio C1';
    partido3[1].cant_n := 15;
    partido3[1].cant_a := 8;

    partido3[2].partido := 'Partido C';
    partido3[2].localidad := 'Localidad C2';
    partido3[2].barrio := 'Barrio C2';
    partido3[2].cant_n := 11;
    partido3[2].cant_a := 6;

    partido3[3].partido := 'Partido C';
    partido3[3].localidad := 'Localidad C3';
    partido3[3].barrio := 'Barrio C3';
    partido3[3].cant_n := 13;
    partido3[3].cant_a := 7;

    // Write arrays to the informe file
    for i:= 1 to 3 do
        Write(informe, partido1[i]);
    for i:= 1 to 3 do
        Write(informe, partido2[i]);
    for i:= 1 to 3 do
        Write(informe, partido3[i]);
                
    Close(informe);


End.
