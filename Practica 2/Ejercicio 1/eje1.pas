
Program eje1;

Const N =   10;

Type 

    employeeSlave =   Record
        code:   integer;
        date:   string;
        //formateamos el string ? estilo dd/mm/aaaa
        daysAsked:   integer;
    End;

    employeeMaster =   Record
        code:   integer;
        name:   string;
        surname:   string;
        phoneNumber:   string;
        birthDate:   string;
        amountOfChildren:   integer;
        amountOfVDays:   integer;
    End;

    arrayOfEmployeeSlave =   Array [1..N] Of employeeSlave;
    fileOfEmployeeMaster =   file Of employee_master;
    fileOfEmployeeSlave =   file Of employeeSlave;

Procedure updateMasterFile(Var masterFile: fileOfEmployeeMaster; employeeFiles: arrayOfEmployeeSlave);

Var 
    masterReg:   employeeMaster;
    slaveReg:   employeeSlave;
    i:   Integer;
Begin
    Reset(masterFile);
    For i:= 1 To N Do
        Reset(employeeFiles[i]);
    For i:= 1 To N Do
        Begin
            While (Not)
             
            Read(masterFile, masterReg);
            Read(employeeFiles[i], slaveReg);


        End;
