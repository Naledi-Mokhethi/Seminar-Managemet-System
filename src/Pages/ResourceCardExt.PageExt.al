pageextension 51201 "My Resource Card Ext" extends "Resource Card"
{

    layout
    {
        addlast(General)
        {
            field("Internal/External"; Rec."Internal/External")
            {
                ApplicationArea = All;
                Caption = 'Internal or External';
                ToolTip = 'Indicates whether the semenar is internal or extrenal';
            }

        }
        addafter("Personal Data")
        {
            group(Room)
            {
                field("Participants No."; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    Caption = 'Maximum Participants';
                    ToolTip = 'Indicates the maximum number of participants';
                }
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}