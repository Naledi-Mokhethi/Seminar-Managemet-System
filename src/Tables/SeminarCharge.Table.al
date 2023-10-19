table 51207 "Seminar Charge"
{
    Caption = 'Seminar Charge';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            NotBlank = true;
            TableRelation = "Seminar Registration Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; Type; Enum SeminarChargeType)
        {
            Caption = 'Type';


            trigger OnValidate()
            begin
                IF Type <> xRec.Type THEN BEGIN
                    Description := '';
                END;
            end;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = IF (Type = CONST(Resource)) Resource ELSE
            IF (Type = CONST("G/L Account")) "G/L Account";

            trigger OnValidate()
            begin
                CASE Type OF
                    Type::Resource:
                        BEGIN
                            Resource.GET("No.");
                            Resource.TESTFIELD(Blocked, FALSE);
                            Resource.TESTFIELD("Gen. Prod. Posting Group");
                            Description := Resource.Name;
                            "Gen. Prod. Posting Group" := Resource."Gen. Prod. Posting Group";
                            "VAT Prod. Posting Group" := Resource."VAT Prod. Posting Group";
                            "Unit of Measure Code" := Resource."Base Unit of Measure";
                            "Unit Price" := Resource."Unit Price";
                        END;
                    Type::"G/L Account":
                        BEGIN
                            GLAccount.GET("No.");
                            GLAccount.CheckGLAcc();
                            GLAccount.TESTFIELD("Direct Posting", TRUE);
                            Description := GLAccount.Name;
                            "Gen. Prod. Posting Group" := GLAccount."Gen. Bus. Posting Group";
                            "VAT Prod. Posting Group" := GLAccount."VAT Bus. Posting Group";
                        END;
                END;
            end;
        }
        field(5; Description; Text[50])
        {
            Caption = 'Description';
        }
        field(6; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0 : 5;

            trigger OnValidate()
            begin
                "Total Price" := ROUND("Unit Price" * Quantity, 0.01);
            end;
        }
        field(7; "Unit Price"; Decimal)
        {
            AutoFormatType = 2;
            Caption = 'Unit Price';
            MinValue = 0;

            trigger OnValidate()
            begin
                "Total Price" := ROUND("Unit Price" * Quantity, 0.01);
            end;
        }
        field(8; "Total Price"; Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Total Price';
            Editable = false;
        }
        field(9; "To Invoice"; Boolean)
        {
            Caption = 'To Invoice';
            InitValue = true;
        }
        field(10; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            TableRelation = Customer;
        }
        field(11; "Unit of Measure Code"; Code[10])
        {
            Caption = 'Unit of Measure Code';
            TableRelation = IF (Type = CONST(Resource)) "Resource Unit of Measure" where("Resource No." = field("No.")) else
            "Unit of Measure";

            trigger OnValidate()
            begin
                CASE Type OF
                    Type::Resource:
                        BEGIN
                            Resource.GET("No.");
                            if "Unit of Measure Code" = '' THEN begin
                                "Unit of Measure Code" := Resource."Base Unit of Measure";
                            end;
                            ResourceUofM.GET("No.", "Unit of Measure Code");
                            "Qty. per Unit of Measure" := ResourceUofM."Qty. per Unit of Measure";
                            "Total Price" := ROUND(Resource."Unit Price" * "Qty. per Unit of Measure");
                        END;
                    Type::"G/L Account":
                        BEGIN
                            "Qty. per Unit of Measure" := 1;
                        END;
                END;
                IF CurrFieldNo = FIELDNO("Unit of Measure Code") THEN BEGIN
                    VALIDATE("Unit Price");
                END;
            end;
        }
        field(12; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group";
        }
        field(13; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group";
        }
        field(14; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';
        }
        field(15; Registered; Boolean)
        {
            Caption = 'Registered';
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TESTFIELD(Registered, FALSE);
    end;

    trigger OnInsert()
    begin
        SeminarRegistrationHeader.GET("Document No.");
    end;

    var
        GLAccount: Record "G/L Account";
        Resource: Record Resource;
        ResourceUofM: Record "Resource Unit of Measure";
        SeminarRegistrationHeader: Record "Seminar Registration Header";
}

