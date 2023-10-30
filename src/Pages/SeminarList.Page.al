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
            repeater(Group)
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
            group("Seminar")
            {
                Caption = 'Seminar';
                action("Comments")
                {
                    ApplicationArea = All;
                    ToolTip = 'Show the Comments for the Current Seminar';
                    Caption = 'Comments';
                    Image = Comment;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = Const(Seminar),
                                  "No." = Field("No.");
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger Entries")
                {
                    ApplicationArea = All;
                    Caption = 'Ledger Entries';
                    Image = WarrantyLedger;
                    RunObject = Page "Seminar Ledger Entries";
                    RunPageLink = "Seminar No." = field("No.");
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                }
            }
            group(Registration)
            {
                Image = SalesInvoice;
                action(Registrations)
                {
                    RunObject = page "Seminar Registration List";
                    RunPageLink = "Seminar No." = field("No.");
                    Image = Timesheet;
                    ToolTip = 'View all the registrations for this seminar.';
                }
            }
        }
        area(Creation)
        {
            action(NewSeminarReg)
            {
                AccessByPermission = TableData "Seminar Registration Header" = RIM;
                ApplicationArea = All;
                Caption = 'Seminar Registration';
                Image = NewTimesheet;
                RunObject = Page "Seminar Registration";
                RunPageLink = "Seminar No." = field("No.");
                RunPageMode = Create;
                ToolTip = 'Offer items or services to a customer.';
            }
        }
        area(Promoted)
        {
            group(Category_Category4)
            {
                Caption = 'New Document';

                actionref(NewSeminarReg_Promoted; NewSeminarReg)
                {
                }
            }
            group(Category_Category5)
            {
                Caption = 'Seminar';

                actionref(LedgerEntries_Promoted; "Ledger Entries")
                {
                }
                actionref(SeminarRegistrations_Promoted; Registrations)
                {
                }
            }
        }
    }


    var
        myInt: Integer;
}