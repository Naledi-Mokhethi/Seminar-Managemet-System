page 51209 "Seminar Registration"
{
    Caption = 'Seminar Registration';
    PageType = Card;
    SourceTable = "Seminar Registration Header";
    UsageCategory = Documents;


    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {

                    trigger OnAssistEdit()
                    begin
                        IF Rec.AssistEdit(xRec) THEN
                            CurrPage.UPDATE;
                    end;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                }
                field("Seminar No."; Rec."Seminar No.")
                {
                }
                field("Seminar Name"; Rec."Seminar Name")
                {
                }
                field("Instructor Resource No."; Rec."Instructor Resource No.")
                {
                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                }
                field("Posting Date"; Rec."Posting Date")
                {
                }
                field("Document Date"; Rec."Document Date")
                {
                }
                field(Status; Rec.Status)
                {
                }
                field(Duration; Rec.Duration)
                {
                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                }
            }
            part(SeminarRegistrationLines; "Seminar Registration Subform")
            {
                SubPageLink = "Document No." = field("No.");
            }
            group("Seminar Room")
            {
                field("Room Resource No."; Rec."Room Resource No.")
                {
                }
                field("Room Name"; Rec."Room Name")
                {
                }
                field("Room Address"; Rec."Room Address")
                {
                }
                field("Room Address 2"; Rec."Room Address 2")
                {
                }
                field("Room Post Code"; Rec."Room Post Code")
                {
                }
                field("Room City"; Rec."Room City")
                {
                }
                field("Room Country/Reg. Code"; Rec."Room Country/Reg. Code")
                {
                }
                field("Room County"; Rec."Room County")
                {
                }

            }

            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                }
            }
        }
        area(factboxes)
        {
            part(CustomerDetails; "Customer Details FactBox")
            {
                Provider = SeminarRegistrationLines;
                SubPageLink = "No." = field("Bill-to Customer No.");
            }
            part(SeminarDetails; "Seminar Details FactBox")
            {
                SubPageLink = "No." = field("Seminar No.");
            }
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
            group("Seminar Registration")
            {
                Caption = 'Seminar Registration';
                action("Co&mments")
                {
                    Caption = 'Comments';
                    Image = Comment;
                    RunObject = Page "Seminar Comment Sheet";
                    RunPageLink = "No." = FIELD("No.");
                    RunPageView = WHERE("Document Type" = CONST("Seminar Registration"));
                }
                action("&Charges")
                {
                    Caption = 'Charges';
                    Image = Costs;
                    RunObject = Page "Seminar Charges";
                    RunPageLink = "No." = FIELD("No.");
                }
            }
            group(Posting)
            {
                Caption = 'Posting';
                action("Post")
                {
                    Caption = 'Post';
                    Image = PostDocument;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Codeunit "Seminar-Post (Yes/No)";
                    ShortCutKey = 'F9';
                }
            }
        }
    }
}