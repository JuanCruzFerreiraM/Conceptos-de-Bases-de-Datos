
Program generador;


Const 
    amount =   10;

Type 
    reg_det =   Record
        cod:   integer;
        date:   string;
        days_requested:   integer;
    End;

    reg_master =   Record
        cod:   integer;
        name:   string;
        surname:   string;
        birthdate:   string;
        address:   string;
        phoneNumber:   string;
        vactationDays:   integer;
    End;

    file_det =   file Of reg_det;
    file_master =   file Of reg_master;

    array_file_d =   array[1..amount] Of file_det;

Var 
    master:   file_master;
    arr_det:   array_file_d;
    i:   integer;
    emp1,emp2,emp3,emp4,emp5,emp6:   reg_master;
    det:   reg_det;
Begin
    Assign(master, 'master');
    Rewrite(master);
    Assign(arr_det[1], 'det1');
    Rewrite(arr_det[1]);
    Assign(arr_det[2], 'det2');
    Rewrite(arr_det[2]);
    Assign(arr_det[3], 'det3');
    Rewrite(arr_det[3]);
    Assign(arr_det[4], 'det4');
    Rewrite(arr_det[4]);
    Assign(arr_det[5], 'det5');
    Rewrite(arr_det[5]);
    Assign(arr_det[6], 'det6');
    Rewrite(arr_det[6]);
    Assign(arr_det[7], 'det7');
    Rewrite(arr_det[7]);
    Assign(arr_det[8], 'det8');
    Rewrite(arr_det[8]);
    Assign(arr_det[9], 'det9');
    Rewrite(arr_det[9]);
    Assign(arr_det[10], 'det10');
    Rewrite(arr_det[10]);
    //Se puede hacer con un  loop for pero no me funciona sysutil.
    
    // Generar registros para emp1 a emp6
    emp1.cod := 1;
    emp1.name := 'John';
    emp1.surname := 'Doe';
    emp1.birthdate := '1990-01-01';
    emp1.address := '123 Main St';
    emp1.phoneNumber := '555-1234';
    emp1.vactationDays := 20;
    Write(master, emp1);

    emp2.cod := 2;
    emp2.name := 'Jane';
    emp2.surname := 'Smith';
    emp2.birthdate := '1995-02-15';
    emp2.address := '456 Elm St';
    emp2.phoneNumber := '555-5678';
    emp2.vactationDays := 15;
    Write(master, emp2);

    emp3.cod := 3;
    emp3.name := 'Michael';
    emp3.surname := 'Johnson';
    emp3.birthdate := '1988-07-10';
    emp3.address := '789 Oak St';
    emp3.phoneNumber := '555-9012';
    emp3.vactationDays := 25;
    Write(master, emp3);

    emp4.cod := 4;
    emp4.name := 'Emily';
    emp4.surname := 'Brown';
    emp4.birthdate := '1992-04-20';
    emp4.address := '321 Pine St';
    emp4.phoneNumber := '555-3456';
    emp4.vactationDays := 18;
    Write(master, emp4);

    emp5.cod := 5;
    emp5.name := 'David';
    emp5.surname := 'Wilson';
    emp5.birthdate := '1991-09-05';
    emp5.address := '654 Cedar St';
    emp5.phoneNumber := '555-7890';
    emp5.vactationDays := 22;
    Write(master, emp5);

    emp6.cod := 6;
    emp6.name := 'Olivia';
    emp6.surname := 'Taylor';
    emp6.birthdate := '1993-12-25';
    emp6.address := '987 Maple St';
    emp6.phoneNumber := '555-2345';
    emp6.vactationDays := 40;
    Write(master, emp6);

    det.cod := 1;
    det.date := '2020-01-01';
    det.days_requested := 5;
    Write(arr_det[1], det);

    det.date := '2020-02-01';
    det.days_requested := 10;
    Write(arr_det[2], det);

    det.date := '2020-03-01';
    det.days_requested := 2;
    Write(arr_det[3], det);

    det.date := '2020-04-01';
    det.days_requested := 1;
    Write(arr_det[10], det);

    det.cod := 2;
    det.date := '2020-04-01';
    det.days_requested := 7;
    Write(arr_det[1], det);

    det.date := '2020-05-01';
    det.days_requested := 3;
    Write(arr_det[3], det);

    det.date := '2020-06-01';
    det.days_requested := 4;
    Write(arr_det[5], det);

    det.cod := 3;
    det.date := '2020-07-01';
    det.days_requested := 6;
    Write(arr_det[2], det);

    det.date := '2020-08-01';
    det.days_requested := 8;
    Write(arr_det[4], det);

    det.date := '2020-09-01';
    det.days_requested := 9;
    Write(arr_det[6], det);

    det.cod := 4;
    det.date := '2020-10-01';
    det.days_requested := 10;
    Write(arr_det[3], det);

    det.date := '2020-11-01';
    det.days_requested := 5;
    Write(arr_det[5], det);

    det.date := '2020-12-01';
    det.days_requested := 3;
    Write(arr_det[7], det);

    det.cod := 5;
    det.date := '2020-01-01';
    det.days_requested := 2;
    Write(arr_det[4], det);

    det.date := '2020-02-01';
    det.days_requested := 3;
    Write(arr_det[6], det);

    det.date := '2020-03-01';
    det.days_requested := 4;
    Write(arr_det[8], det);

    det.cod := 6;
    det.date := '2020-04-01';
    det.days_requested := 5;
    Write(arr_det[5], det);

    det.date := '2020-05-01';
    det.days_requested := 6;
    Write(arr_det[7], det);

    det.date := '2020-06-01';
    det.days_requested := 7;
    Write(arr_det[9], det);

    Close(master);
    For i := 1 To amount Do
        Close(arr_det[i]);
    
End.
