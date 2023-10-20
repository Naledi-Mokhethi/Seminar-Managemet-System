page 51200 "Seminar Ledger Entries"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seminar Ledger Entry";
    Editable = false;
    Caption = 'Seminar Ledger Entries';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Posting Date';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Document No.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Document Date';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Entry No.';
                }
                field("Semianr No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Seminar No';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Description';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Bill-to Customer No.';
                }
                field("Charge Type"; Rec."Charge Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Charge Type';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    ToolTip = 'Type';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Quantity';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Unit Price';
                }
                field("Total Price"; Rec."Total Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'Total Price';
                }
                field(Chargeable; Rec.Chargeable)
                {
                    ApplicationArea = All;
                    ToolTip = 'Chargeable';
                }
                field("Participant Contact No."; Rec."Participant Contact No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Participant Contact No.';
                }
                field("Participant Name"; Rec."Participant Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Participant Name';
                }
                field("Instructor Resource No."; Rec."Instructor Resource No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Instructor Resource No.';
                }
                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Room Resource No.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Starting Date';
                }
                field("Seminar Registration No."; Rec."Seminar Registration No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Seminar Registration No.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Entry No';
                }
            }
        }
        area(factboxes)
        {

            systempart(Links; Links)
            {
            }
            systempart(Notes; Notes)
            {
            }
            
        }
    }

    actions
    {

    }

    var
        myInt: Integer;
}