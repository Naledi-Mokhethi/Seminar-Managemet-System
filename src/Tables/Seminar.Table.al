table 51203 "Seminar"
{
    DataClassification = ToBeClassified;
    Caption = 'Seminar';

    fields
    {

        field(1; "No."; Code[20])
        {
            Caption = 'Primary Key';
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    SeminarSetup.Get();
                    NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Name"; Text[50])
        {
            Caption = 'Name';
            trigger OnValidate()
            begin
                if ("Search Name" = UpperCase(xRec.Name)) OR ("Search Name" = '') then begin
                    "Search Name" := Name;
                end;
            end;
        }
        field(3; "Seminar Duration"; Decimal)
        {
            Caption = 'Seminar Duration';
        }
        field(4; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';
        }
        field(5; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Paticipants';
        }
        field(6; "Search Name"; Code[50])
        {
            Caption = 'Search Name';
        }
        field(7; Blocked; Boolean)
        {
            Caption = 'Blocked';
        }
        field(8; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            Editable = false;
        }
        field(9; Comment; Boolean)
        {
            Caption = 'Comment';
            Editable = false;
            CalcFormula = Exist("Comment Line" WHERE("Table Name" = CONST(Seminar),
                                                      "No." = FIELD("No.")));
            FieldClass = FlowField;
        }
        field(10; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;
        }
        field(11; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
            trigger OnValidate()
            begin
                if xRec."Gen. Prod. Posting Group" <> "Gen. Prod. Posting Group" then begin
                    if GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup, "VAT. Prod Posting Group") then begin
                        Validate("VAT. Prod Posting Group", GenProdPostingGroup."Def. VAT Prod. Posting Group");
                    end;
                end;
            end;
        }
        field(12; "VAT. Prod Posting Group"; Code[10])
        {
            Caption = 'VAT. Prod Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(13; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
        }

    }


    keys
    {
        key("Pk."; "No.")
        {
            Clustered = true;
        }
        key("Search Name"; "Search Name")
        {

        }
    }
    var
        SeminarSetup: Record "Seminar Setup";
        CommentLine: Record "Comment Line";
        Seminar: Record "Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit "NoSeriesManagement";


    trigger OnInsert()
    begin
        if "No." = '' then begin
            SeminarSetup.Get();
            SeminarSetup.TestField("Seminar Nos");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos", xRec."No. Series", 0D, "No.", "No. Series");
        end;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
    end;

    trigger OnDelete()
    begin
        CommentLine.Reset();
        CommentLine.SetRange("Table Name", CommentLine."Table Name"::Seminar);
        CommentLine.SetRange("No.", "No.");
        CommentLine.DeleteAll();
    end;

    trigger OnRename()
    begin
        "Last Date Modified" := Today;
    end;

    procedure AssistEdit(): Boolean
    begin
        begin
            Seminar := Rec;
            SeminarSetup.Get();
            SeminarSetup.TestField("Seminar Nos");
            if NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos", xRec."No. Series", "No. Series") then begin
                NoSeriesMgt.SetSeries("No.");
                Rec := Seminar;
                exit(true);
            end;
        end;
    end;
}