page 61002 "Posted Indent"
{
    PageType = Document;
    SourceTable = "Posted Indent Header";
    ApplicationArea = All;
    Editable = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(Header)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("Description"; Rec.Description)
                {
                }
                field("Document Date"; Rec.Document_Date)
                {
                }
                field("Status"; Rec.Status)
                {
                }
                field("User ID"; Rec."User ID")
                {
                }
            }

            group("Line")
            {
                part(PostedIndentLines; "Posted Indent Line Subform")
                {
                    SubPageLink = "Document No." = field("Document No.");
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            group(print)
            {
                action(IndentPrint)
                {
                    ApplicationArea = All;
                    Caption = 'Print';
                    PromotedCategory = Report;
                    Promoted = true;
                    trigger OnAction()
                    var
                        PostedIndentHeader: Record "Posted Indent Header";
                    begin
                        PostedIndentHeader.reset;
                        PostedIndentHeader.SetRange("Document No.", Rec."Document No.");
                        if PostedIndentHeader.findfirst then
                            Report.Run(61001, true, false, PostedIndentHeader);
                    end;
                }

            }
        }
    }
    var
    local procedure IndentStatusOpen()
    var
        IndentHeader: Record "Posted Indent header";
    begin
        if not confirm(StrSubstNo(IndentConfirm, rec."Document No."), false) then
            exit;

        // IndentHeader.Reset;
        IndentHeader.setrange("Document No.", Rec."Document No.");
        if IndentHeader.Findfirst() then begin
            IndentHeader.Status := IndentHeader.Status::Open;

            IndentHeader.Modify();

        end;

    end;

    local procedure IndentStatusRelease()
    var

        IndentHeader: Record "Posted Indent header";
    begin
        if not confirm(StrSubstNo(IndentConfirm, rec."Document No."), false) then
            exit;

        // IndentHeader.Reset;
        IndentHeader.setrange("Document No.", Rec."Document No.");
        if IndentHeader.Findfirst() then begin
            IndentHeader.Status := IndentHeader.Status::Released;

            IndentHeader.Modify();

        end;

    end;

    var

        IndentConfirm: Label 'Do you want change status %1?';


}
