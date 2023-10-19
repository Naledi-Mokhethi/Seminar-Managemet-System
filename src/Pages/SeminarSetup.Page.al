page 51202 "Seminar Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Seminar Setup";

    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                field("Seminar Nos"; Rec."Seminar Nos")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Nos';
                }
                field("Seminar Registration Nos"; Rec."Seminar Registration Nos.")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Registration Nos';
                }
                field("Posted Seminar Registration Nos"; Rec."Posted Seminar Reg. Nos")
                {
                    ApplicationArea = All;
                    Caption = 'Posted Seminar Registration Nos';
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {

            }
        }
    }

    var
        myInt: Integer;

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.FindFirst() then begin
            Rec.Init();
            Rec.Insert();
        end;
        if Rec."Seminar Nos" = '' then
            CheckSeminarSetUp();
    end;

    local procedure CheckSeminarSetUp()
    var
        MyNotification: Notification;
    begin
        MyNotification.Message('Your Setup is empty');
        MyNotification.Scope := NotificationScope::LocalScope;
        MyNotification.Send();
    end;
}