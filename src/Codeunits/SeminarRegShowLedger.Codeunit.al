codeunit 51202 "Seminar Reg.-Show Ledger Entry"
{
    TableNo = "Seminar Register";
    trigger OnRun()
    begin
        SeminarLedgerEntry.SETRANGE(SeminarLedgerEntry."Entry No", Rec."From Entry No.", Rec."To Entry No.");
        Page.Run(Page::"Seminar Ledger Entries", SeminarLedgerEntry);
    end;

    var
        SeminarLedgerEntry: Record "Seminar Ledger Entry";
}