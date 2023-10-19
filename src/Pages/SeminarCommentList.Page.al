
page 51207 "Seminar Comment List"
{
    DataCaptionFields = "No.";
    Editable = false;
    LinksAllowed = false;
    PageType = List;
    SourceTable = "Seminar Comment Line";

    layout
    {
        area(content)
        {
            repeater(Control1000000001)
            {
                ShowCaption = false;
                field("No."; Rec."No.")
                {
                }
                field(Date; Rec.Date)
                {
                }
                field(Comment; Rec.Comment)
                {
                }
                field("Code"; Rec.Code)
                {
                    Visible = false;
                }
            }
        }
    }

    actions
    {
    }
}

