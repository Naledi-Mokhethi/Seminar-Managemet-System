// CSD1.00 - 2023-10-18 - B. During
//   Chapter 4 - Lab 3
//     - Created new page

page 51212 "Posted Seminar Registration"
{


    Caption = 'Seminar Registration';
    Editable = false;
    PageType = Document;
    SourceTable = "Posted Seminar Reg. Header";
    ApplicationArea = All;
    UsageCategory = History;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Seminar No."; Rec."Seminar No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Seminar Name"; Rec."Seminar Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Instructor Resource No."; Rec."Instructor Resource No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Instructor Name"; Rec."Instructor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
            }
            part(SeminarRegistrationLines; "Posted Seminar Reg. Subform")
            {
                SubPageLink = "Document No." = FIELD("No.");
                ApplicationArea = All;
            }
            group("Seminar Room")
            {
                field("Room Resource No."; Rec."Room Resource No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Room Name"; Rec."Room Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Room Address"; Rec."Room Address")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Room Address 2"; Rec."Room Address 2")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Room Post Code"; Rec."Room Post Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Room City"; Rec."Room City")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Room Country/Reg. Code"; Rec."Room Country/Reg. Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Room County"; Rec."Room County")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
            }
            group(Invoicing)
            {
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("VAT Prod. Posting Group"; Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                    ToolTip = 'The Quantity per Day.';
                }
            }
        }
        area(factboxes)
        {
            part(SeminarDetailsFactbox; "Seminar Details FactBox")
            {
                SubPageLink = "No." = FIELD("Seminar No.");
                ApplicationArea = All;
            }
            part(CustomerDetailsFactBox; "Customer Details FactBox")
            {
                Provider = SeminarRegistrationLines;
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                ApplicationArea = All;
            }
            systempart(Links; Links)
            {
                ApplicationArea = All;
            }
            systempart(Notes; Notes)
            {
                ApplicationArea = All;
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
                action("Comments")
                {
                    Caption = 'Comments';
                    Image = Comment;
                    RunObject = Page "Seminar Comment Sheet";
                    RunPageLink = "No." = FIELD("No.");
                    RunPageView = WHERE("Document Type" = CONST("Posted Seminar Registration"));
                    ApplicationArea = All;
                    ToolTip = 'Comments';
                }
                action("Charges")
                {
                    Caption = 'Charges';
                    Image = Costs;
                    RunObject = Page "Posted Seminar Charges";
                    RunPageLink = "Document No." = FIELD("No.");
                    ApplicationArea = All;
                    ToolTip = 'Comments';
                }
                action("Navigate")
                {
                    Caption = '&Find Entries';
                    Image = Navigate;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Find Emteries and documents that exist in the selected document';

                    trigger OnAction()
                    begin
                        Navigate.SetDoc(Rec."Posting Date", rec."No.");
                        Navigate.Run();
                    end;
                }

            }

        }
        //  area(Promoted)
        // {
        //     group(Category_Process)
        //     {
        //         actionref(Navigate_Promoted; Navigate)
        //         {
        //         }
        //     }
        // }
    }
    var
        Navigate: Page Navigate;
}

