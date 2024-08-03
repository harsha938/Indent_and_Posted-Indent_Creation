report 61001 "Posted Indent"
{

    Caption = 'Posted Indent';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = LayoutName;



    dataset
    {
        dataitem(IndentHeader; "Posted Indent Header")
        {
            column(Document_No_; "Document No.")
            {
                IncludeCaption = true;

            }

            column(Description; Description)
            {
                IncludeCaption = true;

            }
            column(User_ID; "User ID")
            {

            }
            column(Document_Date; Document_Date)
            {
                IncludeCaption = true;

            }

            dataitem(IndentLine; "Posted Indent Line")
            {
                DataItemLink = "Document No." = field("Document No.");
                DataItemLinkReference = IndentHeader;
                DataItemTableView = sorting("Document No.", "Line No.");

                column(Qty; Qty)
                {
                    IncludeCaption = true;

                }

                column(Amount; Amount)
                {
                    IncludeCaption = true;

                }
                column(Unit_Price; "Unit Price")
                {
                    IncludeCaption = true;

                }
                column(Line_No_; "Line No.")
                {
                    IncludeCaption = true;

                }

                column(No_; "No.")
                {
                    IncludeCaption = true;

                }

                column(Type; Type)
                {
                    IncludeCaption = true;

                }



            }
        }
    }

    requestpage
    {

        layout
        {

        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'Posted Indent.rdl';
        }
    }

    var
        myInt: Integer;
}
