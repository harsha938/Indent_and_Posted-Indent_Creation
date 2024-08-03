pageextension 60001 IndentRoleCenter extends 9006
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
        addafter("Transfer Orders")
        {
            action(Indent)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Indent';
                Image = Account;
                RunObject = Page "Indent List";
                ToolTip = 'Indent process';
            }

            action(PostedIndent)
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Posted Indent';
                Image = Account;
                RunObject = Page "posted Indent List";
                ToolTip = 'Posted Indent process';
            }
        }
    }
    var
        myInt: Integer;
}