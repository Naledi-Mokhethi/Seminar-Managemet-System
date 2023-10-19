tableextension 51200 "My Resource" extends Resource
{
    fields
    {

        field(12345701; "Internal/External"; Enum "Internal/External")
        {
            Caption = 'Internal or External';

        }
        field(123456702; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants Number';
        }
        field(123456703; "Quantity Per Day"; Decimal)
        {
            Caption = 'Quantity Per Day';
        }

    }

    var
        myInt: Integer;
}