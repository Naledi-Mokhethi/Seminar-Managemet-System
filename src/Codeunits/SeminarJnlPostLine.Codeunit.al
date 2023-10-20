codeunit 51201 "Seminar Jnl.-Post Line"
{
    TableNo = "Seminar Journal Line";
    trigger OnRun()
    begin
        RunWithCheck(Rec);
    end;

    var
        SemianrJnlLine: Record "Seminar Journal Line";
        SeminarLedgerEntry: Record "Seminar Ledger Entry";
        SeminarRegister: Record "Seminar Register";
        SeminarJnlCheckLine: Codeunit "Seminar Jnl.-Check Line";
        NextEntryNo: Integer;

    local procedure RunWithCheck(var SeminarJnlLine2: Record "Seminar Journal Line")
    begin
        SemianrJnlLine.Copy(SeminarJnlLine2);
        Code();
        SeminarJnlLine2 := SemianrJnlLine;
    end;

    local procedure Code()
    var
        myInt: Integer;
    begin
        if SemianrJnlLine.EmptyLine() then
            exit;

        SeminarJnlCheckLine.RunCheck(SemianrJnlLine);

        if NextEntryNo = 0 then begin
            SeminarLedgerEntry.LockTable();
            If SeminarLedgerEntry.FindLast() then
                NextEntryNo := SeminarLedgerEntry."Entry No";
            NextEntryNo := NextEntryNo + 1;
        end;
        if SemianrJnlLine."Document Date" = 0D then
            SemianrJnlLine."Document Date" := SemianrJnlLine."Posting Date";

        if SeminarRegister."No." = 0 then begin
            SeminarRegister.LockTable();
            ;
            if (Not SeminarRegister.FindLast()) Or (SeminarRegister."To Entry No." <> 0)
           then begin
                SeminarRegister.Init();
                ;
                SeminarRegister."No." := SeminarRegister."No." + 1;
                SeminarRegister."From Entry No." := NextEntryNo;
                SeminarRegister."To Entry No." := NextEntryNo;
                SeminarRegister."Creation Date" := Today;
                SeminarRegister."Source Code" := SemianrJnlLine."Source Code";
                SeminarRegister."Journal Batch Name" := SemianrJnlLine."Journal Batch Name";
                SeminarRegister."User ID" := UserId;
                SeminarRegister.Insert();
            end;
        end;
        SeminarRegister."To Entry No." := NextEntryNo;
        SeminarRegister.Modify();
        SeminarLedgerEntry.Init();
        ;
        SeminarLedgerEntry."Seminar No." := SemianrJnlLine."Seminar No.";
        SeminarLedgerEntry."Posting Date" := SemianrJnlLine."Posting Date";
        SeminarLedgerEntry."Document Date" := SemianrJnlLine."Document Date";
        SeminarLedgerEntry."Entry Type" := SemianrJnlLine."Entry Type";
        SeminarLedgerEntry."Document No." := SemianrJnlLine."Document No.";
        SeminarLedgerEntry.Description := SemianrJnlLine.Description;
        SeminarLedgerEntry."Bill-to Customer No." := SemianrJnlLine."Bill-to Customer No.";
        SeminarLedgerEntry."Charge Type" := SemianrJnlLine."Charge Type";
        SeminarLedgerEntry.Type := SemianrJnlLine.Type;
        SeminarLedgerEntry.Quantity := SemianrJnlLine.Quantity;
        SeminarLedgerEntry."Unit Price" := SemianrJnlLine."Unit Price";
        SeminarLedgerEntry."Total Price" := SemianrJnlLine."Total Price";
        SeminarLedgerEntry."Participant Contact No." := SemianrJnlLine."Participant Contact No.";
        SeminarLedgerEntry."Participant Name" := SemianrJnlLine."Participant Name";
        SeminarLedgerEntry.Chargeable := SemianrJnlLine.Chargeable;
        SeminarLedgerEntry."Room Resource No." := SemianrJnlLine."Room Resource No.";
        SeminarLedgerEntry."Instructor Resource No." := SemianrJnlLine."Instructor Resource No.";
        SeminarLedgerEntry."Starting Date" := SemianrJnlLine."Starting Date";
        SeminarLedgerEntry."Seminar Registration No." := SemianrJnlLine."Seminar Registration No.";
        SeminarLedgerEntry."Res. Ledger Entry No." := SemianrJnlLine."Res. Ledger Entry No.";
        SeminarLedgerEntry."Source Type" := SemianrJnlLine."Source Type";
        SeminarLedgerEntry."Source No." := SemianrJnlLine."Source No.";
        SeminarLedgerEntry."Journal Batch Name" := SemianrJnlLine."Journal Batch Name";
        SeminarLedgerEntry."Source Code" := SemianrJnlLine."Source Code";
        SeminarLedgerEntry."Reason Code" := SemianrJnlLine."Reason Code";
        SeminarLedgerEntry."No. Series" := SemianrJnlLine."Posting No. Series";
        SeminarLedgerEntry."User ID" := UserId;
        SeminarLedgerEntry."Entry No" := NextEntryNo;
        SeminarLedgerEntry.Insert();
        NextEntryNo := NextEntryNo + 1;

    end;
}