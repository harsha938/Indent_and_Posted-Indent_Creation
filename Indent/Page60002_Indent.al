page 60002 "Indent"
{
    PageType = Document;
    SourceTable = "Indent Header";
    ApplicationArea = All;

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
                part(IndentLines; "Indent Line Subform")
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

            group(Indent)
            {
                caption = 'Indent';
                action(Open)
                {
                    ApplicationArea = All;
                    Caption = 'Open';
                    PromotedCategory = Process;
                    Promoted = true;
                    trigger OnAction()
                    begin
                        IndentStatusopen();
                    end;
                }
                action(Released)
                {
                    ApplicationArea = All;
                    PromotedCategory = Process;
                    Promoted = true;

                    trigger OnAction()
                    begin
                        IndentStatusRelease();
                    end;
                }

            }

            group(Post)
            {

                action(IndentPost)
                {

                    ApplicationArea = All;
                    Caption = 'Post';
                    PromotedCategory = Process;
                    Promoted = true;

                    trigger OnAction()
                    var
                        IndentCu: Codeunit "Post Indent";
                    begin
                        Clear(IndentCu);
                        IndentCu.run(Rec);

                    end;
                }

            }

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
                        IndentHeader: Record "Indent Header";
                    begin
                        IndentHeader.reset;
                        IndentHeader.SetRange("Document No.", Rec."Document No.");
                        if IndentHeader.findfirst then
                            Report.Run(60001, true, false, IndentHeader);
                    end;
                }

            }
        }
    }

    var


    local procedure IndentStatusOpen()
    var

        IndentHeader: Record "Indent header";
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

        IndentHeader: Record "Indent header";
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
