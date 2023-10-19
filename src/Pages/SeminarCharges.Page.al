page 51208 "Seminar Charges"
{


    AutoSplitKey = true;
    Caption = 'Seminar Charges';
    PageType = List;
    SourceTable = "Seminar Charge";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                }
                field(Description; Rec.Description)
                {
                }
                field(Quantity; Rec.Quantity)
                {
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("Total Price"; Rec."Total Price")
                {
                }
                field("To Invoice"; Rec."To Invoice")
                {
                }
            }
        }
    }

    actions
    {
    }
}