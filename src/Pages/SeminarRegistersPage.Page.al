page 51201 "Seminar Registers"
{
    ApplicationArea = All;
    Caption = 'Seminar Registers';
    PageType = List;
    SourceTable = "Seminar Register";
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field("Source Code"; Rec."Source Code")
                {
                    ToolTip = 'Specifies the value of the Source Code field.';
                }
                field("Journal Batch Name"; Rec."Journal Batch Name")
                {
                    ToolTip = 'Specifies the value of the Journal Batch Name field.';
                }
                field("From Entry No."; Rec."From Entry No.")
                {
                    ToolTip = 'Specifies the value of the From Entry No. field.';
                }
                field("To Entry No."; Rec."To Entry No.")
                {
                    ToolTip = 'Specifies the value of the To Entry No. field.';
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
        area(navigation)
        {
            group("&Register")
            {
                Caption = '&Register';
                Image = Register;
                action("Seminar Ledger")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Seminar Ledger';
                    Image = WarrantyLedger;
                    RunObject = Codeunit "Seminar Reg.-Show Ledger Entry";
                    ToolTip = 'View the ledger entries for the Seminar.';
                }
            }
        }
    }
}
