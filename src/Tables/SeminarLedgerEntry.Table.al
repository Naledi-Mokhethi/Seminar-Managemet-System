// CSD1.00 - 2023-10-18 - B. During
//   Chapter 4 - Lab 1 
//   Continues on chapter 5
//     - Created new table

table 51201 "Seminar Ledger Entry"
{
    Caption = 'Seminar Ledger Entry';
    LookupPageId = "Seminar Ledger Entries";
    DrillDownPageId = "Seminar Ledger Entries";

    fields
    {
        field(1; "Entry No"; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = Seminar;
        }
        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }
        field(4; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(5; "Entry Type"; enum "Seminar Journal Entry Type")
        {
            Caption = 'Entry Type';
        }
        field(6; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(7; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(8; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            TableRelation = Customer;
        }
        field(9; "Charge Type"; Enum "Seminar Journal Line Type")
        {
            Caption = 'Charge Type';
        }
        field(10; Type; Enum "SeminarChargeType")
        {
            Caption = 'Type';
        }
        field(11; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;
        }
        field(12; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
        }
        field(13; "Total Price"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Price';
        }
        field(14; "Participant Contact No."; Code[20])
        {
            Caption = 'Participant Contact No.';
            TableRelation = Contact;
        }
        field(15; "Participant Name"; Text[50])
        {
            Caption = 'Participant Name';
        }
        field(16; Chargeable; Boolean)
        {
            Caption = 'Chargeable';
            InitValue = true;
        }
        field(17; "Room Resource No."; Code[20])
        {
            Caption = 'Room Resource No.';
            TableRelation = Resource WHERE(Type = CONST(Machine));
        }
        field(18; "Instructor Resource No."; Code[20])
        {
            Caption = 'Instructor Resource No.';
            TableRelation = Resource WHERE(Type = CONST(Person));
        }
        field(19; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
        }
        field(20; "Seminar Registration No."; Code[20])
        {
            Caption = 'Seminar Registration No.';
        }
        field(21; "Res. Ledger Entry No."; Integer)
        {
            Caption = 'Res. Ledger Entry No.';
            TableRelation = "Res. Ledger Entry";
        }
        field(22; "Source Type"; enum "Seminar Source Type")
        {
            Caption = 'Source Type';
        }
        field(23; "Source No."; Code[20])
        {
            Caption = 'Source No.';
            TableRelation = IF ("Source Type" = CONST(Seminar)) Seminar;
        }
        field(24; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
        field(25; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            Editable = false;
            TableRelation = "Source Code";
        }
        field(26; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code";
        }
        field(27; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series";
        }
        field(28; "User ID"; Code[20])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";
            DataClassification = EndUserIdentifiableInformation;
            ValidateTableRelation = false;
        }
    }

    keys
    {
        key(PK; "Entry No")
        {
            Clustered = true;
        }
        key("Key2"; "Document No.", "Posting Date")
        {

        }
    }

    fieldgroups
    {
    }

}

