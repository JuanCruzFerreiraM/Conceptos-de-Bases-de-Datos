
Program generador2;


Type 

    cds =   Record
        cod_author:   integer;
        name:   string;
        record_name:   string;
        genre:   string;
        amount_sell:   integer;
    End;

    cds_file =   file Of cds;


Var 
    fileCds:   cds_file;
    cds1,cds2,cds3,cds4:   cds;
Begin
    Assign(fileCds,'cds');
    Rewrite(fileCds);
    //Autor 1
    cds1.cod_author := 1;
    cds1.name := 'John Smith';
    cds1.record_name := 'Greatest Hits';
    cds1.genre := 'Pop';
    cds1.amount_sell := 100;
    
    Write(fileCds, cds1);

    cds1.record_name := 'Love Songs';
    cds1.amount_sell := 150;

    Write(fileCds, cds1);
    
    cds1.record_name := 'Dance Party';
    cds1.genre := 'Rock';
    cds1.amount_sell := 200;
    
    Write(fileCds, cds1);

    cds1.record_name := 'Symphony No. 9';
    cds1.genre := 'Rock';
    cds1.amount_sell := 600;
    
    Write(fileCds, cds1);

    //Autor 2
    cds2.cod_author := 2;
    cds2.name := 'Emily Johnson';
    cds2.record_name := 'Rock Revolution';
    cds2.genre := 'Rock';
    cds2.amount_sell := 200;

    Write(fileCds, cds2);

    cds2.record_name := 'Acoustic Sessions';
    cds2.amount_sell := 250;

    Write(fileCds, cds2);

    cds2.record_name := 'Heavy Metal';
    cds2.genre := 'Pop';
    cds2.amount_sell := 300;

    Write(fileCds, cds2);

    cds2.record_name := 'Guitar Solo';
    cds2.genre := 'Pop';
    cds2.amount_sell := 700;

    Write(fileCds, cds2);

    //Autor 3
    cds3.cod_author := 3;
    cds3.name := 'Michael Davis';
    cds3.record_name := 'Smooth Jazz';
    cds3.genre := 'Jazz';
    cds3.amount_sell := 300;

    Write(fileCds, cds3);
    
    cds3.record_name := 'Saxophone Serenade';
    cds3.amount_sell := 350;

    Write(fileCds, cds3);
   
    cds3.record_name := 'Trumpet Tango';
    cds3.genre := 'Tango';
    cds3.amount_sell := 400;

    Write(fileCds, cds3);
    
    cds3.record_name := 'Piano Concerto';
    cds3.genre := 'Tango';
    cds3.amount_sell := 800;

    Write(fileCds, cds3);
   
    //Autor 4
    cds4.cod_author := 4;
    cds4.name := 'Sophia Thompson';
    cds4.record_name := 'Classical Symphony';
    cds4.genre := 'Classical';
    cds4.amount_sell := 400;

    Write(fileCds, cds4);

    cds4.record_name := 'Piano Sonata';
    cds4.amount_sell := 450;
    
    Write(fileCds, cds4);
    
    cds4.record_name := 'Violin Concerto';
    cds4.genre := 'Jazz';
    cds4.amount_sell := 500;

    Write(fileCds, cds4);

    cds4.record_name := 'Jazz Jam';
    cds4.genre := 'Jazz';
    cds4.amount_sell := 900;

    Write(fileCds, cds4);

    Close(fileCds);
End.
