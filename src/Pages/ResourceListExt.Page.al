pageextension 51200 "My Resource List" extends "Resource List"
{
    layout
    {
        addafter(Name)
        {
            field("Internal/External"; Rec."Internal/External")
            {
                ApplicationArea = All;
                Caption = 'Internal or External';
                ToolTip = 'Indicates whether the semenar is internal or external';
            }
            field("Participants No."; Rec."Maximum Participants")
            {
                ApplicationArea = All;
                Caption = 'Maximum Participants';
                ToolTip = 'Indicates the maximum Number of Participants ;';
            }
        }
    }
    trigger OnOpenPage()
    var
        ShowType: Boolean;
        ShowMaxParticipants: Boolean;
    begin
        Rec.FilterGroup(3);
        ShowType := Rec.GetFilter(Type) = '';
        ShowMaxParticipants := REc.GetFilter(Type) = Format(Rec.Type::Machine);
        Rec.FilterGroup(0);
    end;

}