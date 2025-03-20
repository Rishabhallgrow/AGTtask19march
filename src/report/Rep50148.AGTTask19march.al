report 50148 AGTTask19march
{
    DefaultLayout = RDLC;
    RDLCLayout = './1purchaseordercustom.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Purchase header';

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = WHERE("Document Type" = CONST(Order));
            RequestFilterFields = "No.";



            dataitem("Purchase Line"; "Purchase Line")
            {
                DataItemLink = "Document No." = field("No."), "Document Type" = field("Document Type");
                dataitem(Integer; Integer)
                {

                    DataItemTableView = SORTING(Number);
                    column(Number; Number) { }
                    column(BuyfromVendorName_PurchaseHeader; "Purchase Header"."Buy-from Vendor Name") { }
                    column(BuyfromVendorNo_PurchaseHeader; "Purchase Header"."Buy-from Vendor No.") { }
                    column(PaytoName_PurchaseHeader; "Purchase Header"."Pay-to Name") { }
                    column(BuyfromContact_PurchaseHeader; "Purchase Header"."Buy-from Contact") { }
                    column(No_PurchaseHeader; "Purchase Header"."No.") { }
                    column(BuyfromVendorNo_PurchaseLine; "Purchase Line"."Buy-from Vendor No.") { }
                    column(DocumentType_PurchaseLine; "Purchase Line"."Document Type") { }
                    column(No_PurchaseLine; "Purchase Line"."No.") { }
                    column(QuantityBase_PurchaseLine; "Purchase Line"."Quantity (Base)") { }
                    column(VendorItemNo_PurchaseLine; "Purchase Line"."Vendor Item No.") { }
                    trigger OnPreDataItem()
                    begin
                        SetFilter(Number, '%1..%2', 1, UserInputrp);
                    end;
                }
            }
        }
    }

    requestpage
    {
        AboutTitle = 'Teaching tip title';
        AboutText = 'Teaching tip content';
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(UserInputrp; UserInputrp)
                    {
                        ApplicationArea = All;
                        Caption = 'Enter Upper Range for No.';
                    }
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {
                    Caption = 'Run Report';
                }
            }
        }
    }

    var
        UserInputrp: Integer;
}