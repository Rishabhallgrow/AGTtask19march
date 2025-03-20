report 50109 AGTrepo20march
{
    DefaultLayout = RDLC;
    RDLCLayout = './2purchaseordercustom.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Purchase header2';


    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {

            column(BuyfromVendorName_PurchaseHeader; "Buy-from Vendor Name")
            {
            }
            column(BuyfromVendorNo_PurchaseHeader; "Buy-from Vendor No.")
            {
            }
            column(PaytoCountryRegionCode_PurchaseHeader; "Pay-to Country/Region Code")
            {
            }
            column(PaytoName_PurchaseHeader; "Pay-to Name")
            {
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

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }


    var
        myInt: Integer;
}