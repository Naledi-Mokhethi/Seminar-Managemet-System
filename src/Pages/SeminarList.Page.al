page 51203 "Seminar List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;
    SourceTable = Seminar;
    CardPageId = "Seminar Card";

    layout
    {
        area(Content)
        {
            repeater(Seminar)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                }
                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                }
                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Duration';
                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Price';
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    Caption = 'Gen. Prod. Posting Group';
                }
                field("VAT Prod. Posting Group"; Rec."VAT. Prod Posting Group")
                {
                    ApplicationArea = All;
                    Caption = 'VAT Prod. Posting Group';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control16; Links)
            {
                ApplicationArea = All;
            }
            systempart(Control17; Notes)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Seminar")
            {
                Caption = '&Seminar';
                action("Co&mments")
                {
                    ApplicationArea = All;
                    ToolTip = 'Show the comments for the Seminar.';
                    Caption = 'Comments';
                    Image = Comment;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Seminar),
                                  "No." = FIELD("No.");
                }
            }
        }
    }

    var
        myInt: Integer;
}