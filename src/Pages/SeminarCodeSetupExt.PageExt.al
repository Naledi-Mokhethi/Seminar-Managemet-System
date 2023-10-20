pageextension 51202 "Seminar Extention" extends "Source Code Setup"
{
    layout
    {
        addlast(General)
        {
            field(Seminar; Rec.Seminar)
            {
                ApplicationArea = All;
                ToolTip = 'Seminar';
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