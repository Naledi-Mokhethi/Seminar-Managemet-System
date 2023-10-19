table 51202 "Seminar Setup"
{
    Caption = 'Seminar Setup';
    

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';

        }
        field(2; "Seminar Nos"; Code[10])
        {
            Caption = 'Seminar Nos';
            TableRelation = "No. Series";
        }
        field(3; "Seminar Registration Nos."; Code[10])
        {
            Caption = 'Seminar Registration Nos';
            TableRelation = "No. Series";
        }
        field(4; "Posted Seminar Reg. Nos"; Code[10])
        {
            Caption = 'Posted Seminar Reg. Nos';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key("Pk."; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

}