page 51204 "Seminar Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = None;
    SourceTable = Seminar;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Caption = 'No.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit() then
                            CurrPage.Update();
                    end;
                }
                field("Name"; Rec.Name)
                {
                    ApplicationArea = All;
                    Caption = 'Name';
                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ApplicationArea = All;
                    Caption = 'Minimum Participants';
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    Caption = 'Maximum Participants';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                    Caption = 'Search Name';
                }
                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Duration';
                }
                field("Blocked"; Rec.Blocked)
                {
                    ApplicationArea = All;
                    Caption = 'Blocked';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                    Caption = 'Last Date Modified';
                }

            }
            group(Invoicing)
            {
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
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Price';
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

}