// CSD1.00 - 2023-10-18 - B. During
//   Chapter 4 - Lab 1
//     - Created new table

table 51200 "Seminar Register"
{
    Caption = 'Seminar Register';

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }
        field(2; "From Entry No."; Integer)
        {
            Caption = 'From Entry No.';
            TableRelation = "Seminar Ledger Entry";
        }
        field(3; "To Entry No."; Integer)
        {
            Caption = 'To Entry No.';
            TableRelation = "Seminar Ledger Entry";
        }
        field(4; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }
        field(5; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
        field(6; "User ID"; Code[20])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";
            //This property is currently not supported
            //TestTableRelation = false;

            // The LookupUserID function no longer exists, find a replacement for this
            // TODO
            // trigger OnLookup()
            // var
            //     UserMgt: Codeunit "User Management";
            // begin
            //     UserMgt.LookupUserID("User ID");
            // end;

        }
            field(7; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(Key2; "Creation Date")
        {
        }
        key(Key3; "Source Code", "Journal Batch Name", "Creation Date")
        {
        }
    }

    fieldgroups
    {
    }
}

