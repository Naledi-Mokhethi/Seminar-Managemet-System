page 51210 "Seminar Details FactBox"
{
    Caption = 'Seminar Details';
    PageType = CardPart;
    SourceTable = Seminar;

    layout
    {
        area(content)
        {
            field("No."; Rec."No.")
            {
            }
            field(Name; Rec.Name)
            {
            }
            field("Seminar Duration"; Rec."Seminar Duration")
            {
            }
            field("Minimum Participants"; Rec."Minimum Participants")
            {
            }
            field("Maximum Participants"; Rec."Maximum Participants")
            {
            }
            field("Seminar Price"; Rec."Seminar Price")
            {
            }
        }
    }

    actions
    {
    }
}