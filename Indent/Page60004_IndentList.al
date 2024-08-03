page 60004 "Indent List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Indent Header";
    Editable = false;
    CardPageId = Indent;

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("Document No."; Rec."Document No.")
                {

                }
                field(Description; Rec.Description)
                {

                }
                field(Document_Date; Rec.Document_Date)
                {

                }
                field(Status; Rec.Status)
                {
                    Editable = false;
                }
                field(UserID; Rec."User ID")
                {

                }
            }
        }
    }







}