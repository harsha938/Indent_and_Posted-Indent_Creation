page 61003 "Posted Indent Line Subform"
{
    PageType = ListPart;
    SourceTable = "Posted Indent Line";
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
