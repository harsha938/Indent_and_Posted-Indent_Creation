codeunit 60001 "Post Indent"
{
    TableNo = "Indent Header";
    trigger OnRun()


    begin

        if not confirm(StrSubstNo(PostIndentConfirm, rec."Document No."), false) then
            exit;


        PostedIndentHeader.init;
        PostedIndentHeader.TransferFields(Rec);
        PostedIndentHeader.insert;

        IndentLine.Reset;
        IndentLine.setrange("Document No.", Rec."Document No.");
        if IndentLine.Findset then
            repeat
                PostedIndentLine.init;
                PostedIndentLine.TransferFields(IndentLine);
                PostedIndentLine.insert;
                IndentLine.Delete();

            until IndentLine.Next() = 0;

        Message(PostedMsg, Rec."Document No.");
        Rec.Delete();
    end;

    var

        PostedIndentHeader: Record "Posted Indent Header";
        IndentLine: Record "Indent Line";
        PostedIndentLine: Record "Posted Indent Line";

        PostedMsg: Label 'Document %1 Posted Successfully';
        PostIndentConfirm: Label 'Do you want post Indent %1?';

}