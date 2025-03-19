report 50148 AGTTask19march
{
    DefaultLayout = RDLC;
    RDLCLayout = './1purchaseordercustom.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Purchase header';

    dataset
    {
        dataitem(Integer; Integer)
        {
            DataItemTableView = SORTING(Number);
            column(Number; Number)
            {
            }
            dataitem("Purchase Header"; "Purchase Header")
            {
                DataItemTableView = WHERE("Document Type" = CONST(Order));
                RequestFilterFields = "No.";

                column(BuyfromVendorName_PurchaseHeader; "Buy-from Vendor Name") { }
                column(BuyfromVendorNo_PurchaseHeader; "Buy-from Vendor No.") { }
                column(PaytoName_PurchaseHeader; "Pay-to Name") { }
                column(BuyfromContact_PurchaseHeader; "Buy-from Contact") { }
                column(No_PurchaseHeader; "No.") { }

                dataitem("Purchase Line"; "Purchase Line")
                {
                    DataItemLink = "Document No." = field("No."), "Document Type" = field("Document Type");

                    column(BuyfromVendorNo_PurchaseLine; "Buy-from Vendor No.") { }
                    column(DocumentType_PurchaseLine; "Document Type") { }
                    column(No_PurchaseLine; "No.") { }
                    column(QuantityBase_PurchaseLine; "Quantity (Base)") { }
                    column(VendorItemNo_PurchaseLine; "Vendor Item No.") { }
                }
            }
            trigger OnPreDataItem()
            begin
                SetFilter(Number, '%1..%2', 1, UserInputrp);
            end;
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