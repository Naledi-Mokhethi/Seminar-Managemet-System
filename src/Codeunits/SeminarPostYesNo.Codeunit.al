codeunit 51205 "Seminar-Post (Yes/No)"
{
    // CSD1.00 - 2013-04-05 - D. E. Veloper
    //   Chapter 4 - Lab 5
    //     - Created new codeunit

    TableNo = 51206;

    trigger OnRun()
    begin
        SeminarRegHeader.COPY(Rec);
        Code();
        Rec := SeminarRegHeader;
    end;

    var
        SeminarRegHeader: Record "Seminar Registration Header";
        SeminarPost: Codeunit "Seminar-Post";
        Text001: Label 'Do you want to post the Registration?';

    local procedure "Code"()
    begin
        IF NOT CONFIRM(Text001, FALSE) THEN
            EXIT;
        SeminarPost.Run(SeminarRegHeader);
        COMMIT();
    end;
}

