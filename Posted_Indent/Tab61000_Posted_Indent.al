table 61000 "Posted Indent Header"
{
    Caption = 'Indent Header';
    DataClassification = ToBeClassified;
    LookupPageId = "Indent List";
    DrillDownPageId = "Indent List";

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; Document_Date; Date)
        {
            Caption = 'Document_Date';
            Editable = false;
        }
        field(4; Status; Option)
        {
            OptionMembers = Open,Released;
            Caption = 'Status';
            Editable = false;
        }
        field(5; "User ID"; Code[50])
        {
            Caption = 'UserID';
            Editable = false;
        }
    }
    keys
    {
        key(PK; "Document No.")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    var
    begin
        "User ID" := UserId();
        Document_Date := today;
    end;

    trigger OnDelete()
    var
        IndentLine: Record "Indent Line";
    begin
        IndentLine.Reset;
        IndentLine.setrange("Document No.", Rec."Document No.");
        if IndentLine.Findset then
            IndentLine.DeleteAll();
    end;
}
