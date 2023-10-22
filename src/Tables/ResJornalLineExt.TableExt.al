tableextension 51203 "Res. Journal Line" extends "Res. Journal Line"
{
    fields
    {
        field(51200; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = Seminar;
        }
        field(51201; "Seminar Registration No."; Code[20])
        {
            Caption = 'Seminar Registration No.';
            TableRelation = "Posted Seminar Reg. Header";
        }
    }

    var
        myInt: Integer;
}