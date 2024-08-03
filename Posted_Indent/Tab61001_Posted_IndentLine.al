table 61001 "Posted Indent Line"
{
    Caption = 'Posted Indent Line';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }

        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(12; Type; Option)
        {
            OptionCaption = ',Item,"G/L Account"';
            OptionMembers = " ",Item,"G/L Account";
            Caption = 'Type';
        }

        field(15; "No."; Code[20])
        {
            Caption = 'No.';
            TableRelation = if (Type = const(" ")) "Standard Text"
            else
            if (Type = const("G/L Account")) "G/L Account" where("Direct Posting" = const(true), "Account Type" = const(Posting), Blocked = const(false))
            else
            if (Type = const(Item)) item;
        }
        field(22; Qty; Decimal)
        {
            Caption = 'Qty';
            trigger OnValidate()
            var

            begin

                Amount := Qty * "Unit Price";

            end;
        }
        field(23; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            trigger OnValidate()
            var

            begin

                Amount := Qty * "Unit Price";

            end;
        }
        field(26; Amount; Decimal)
        {
            Caption = 'Amount';
            Editable = false;

        }

    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
