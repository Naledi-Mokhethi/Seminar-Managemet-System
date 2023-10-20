codeunit 51200 "Seminar Jnl.-Check Line"
{
    TableNo = "Seminar Journal Line";

    trigger OnRun()
    begin
        RunCheck(Rec);
    end;

    var
        GLSetup: Record "General Ledger Setup";
        UserSetup: Record "User Setup";
        AllowPostingFrom: Date;
        AllowPostingTo: Date;
        Text000: Label 'Cannot be a closing date';
        Text001: Label 'Is not within your range of allowed posting dates';

    procedure RunCheck(var SemJnlLine: Record "Seminar Journal Line")
    begin
        if SemJnlLine.EmptyLine() then
            exit;
        SemJnlLine.TestField("Posting Date");
        SemJnlLine.TestField("Instructor Resource No.");
        SemJnlLine.TestField("Seminar No.");

        case SemJnlLine."Charge Type" of
            SemJnlLine."Charge Type"::Instructor:
                SemJnlLine.TestField("Instructor Resource No.");
            SemJnlLine."Charge Type"::Room:
                SemJnlLine.TestField("Room Resource No.");
            SemJnlLine."Charge Type"::Participant:
                SemJnlLine.TestField("Participant Contact No.");
        end;
        if SemJnlLine.Chargeable then
            SemJnlLine.TestField("Bill-to Customer No.");

        if SemJnlLine."Posting Date" = ClosingDate(SemJnlLine."Posting Date") then
        SemJnlLine.FieldError("Posting Date", Text000);

        if (AllowPostingFrom = 0D) and (AllowPostingTo =0D) then begin
            if UserId <> '' then
            if UserSetup.Get(UserId) then begin
                AllowPostingFrom := UserSetup."Allow Posting From";
                AllowPostingTo := UserSetup."Allow Posting To"
            end;

            if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                GLSetup.Get();
                AllowPostingFrom := GLSetup."Allow Posting From";
                AllowPostingTo := GLSetup."Allow Posting To";
            end;

            if AllowPostingTo = 0D then 
            AllowPostingTo := 99991231D;
        end;

        If (SemJnlLine."Posting Date" < AllowPostingFrom) or (SemJnlLine."Posting Date" > AllowPostingTo)
        then
        SemJnlLine.FieldError("Posting Date", Text001);

        if(SemJnlLine."Document Date" <> 0D) then 
        if(SemJnlLine."Document Date" = ClosingDate(SemJnlLine."Document Date")) then 
        SemJnlLine.FieldError(SemJnlLine."Document Date",Text000);
    end;
}