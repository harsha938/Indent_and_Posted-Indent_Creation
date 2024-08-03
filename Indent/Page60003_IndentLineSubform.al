page 60003 "Indent Line Subform"
{
    PageType = ListPart;
    SourceTable = "Indent Line";
    ApplicationArea = All;
    AutoSplitKey = true;

    layout
    {
        area(content)
        {
            repeater(Group)
            {

                field("Type"; Rec.Type)
                {
                }
                field("No."; Rec."No.")
                {
                }
                field("Quantity"; Rec.Qty)
                {
                }
                field("Unit Price"; Rec."Unit Price")
                {
                }
                field("Amount"; Rec.Amount)
                {
                }
            }
        }
    }
}
