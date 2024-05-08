program generador6;

Type 
    reg_det = record 
        cod: integer;
        fecha: string;
        monto: real;
    end;

    arch_det = file of reg_det;


Var
    mozo1, mozo2, mozo3: reg_det;
    detalle: arch_det;
begin
  Assign(detalle,'detalle.dat');
  Rewrite(detalle);

  // Registro para mozo 1
  mozo1.cod := 1;
  mozo1.fecha := '2022-01-01';
  mozo1.monto := 100.0;
  Write(detalle, mozo1);

  mozo1.fecha := '2022-01-02';
    mozo1.monto := 200.0;
    Write(detalle, mozo1);

    mozo1.fecha := '2022-01-03';
    mozo1.monto := 300.0;
    Write(detalle, mozo1);

  // Registro para mozo 2
  mozo2.cod := 2;
  mozo2.fecha := '2022-01-02';
  mozo2.monto := 200.0;
  Write(detalle, mozo2);

    mozo2.fecha := '2022-01-03';
    mozo2.monto := 300.0;
    Write(detalle, mozo2);

   mozo2.fecha := '2022-01-04';
    mozo2.monto := 400.0;
    Write(detalle, mozo2);


  // Registro para mozo 3
  mozo3.cod := 3;
  mozo3.fecha := '2022-01-03';
  mozo3.monto := 300.0;
  Write(detalle, mozo3);

    mozo3.fecha := '2022-01-04';
    mozo3.monto := 400.0;
    Write(detalle, mozo3);

    mozo3.fecha := '2022-01-05';
    mozo3.monto := 500.0;
    Write(detalle, mozo3);

Close (detalle);
end.