query 50100 OpenEntriesCustomer
{
    Caption = 'Open Entries Customer';
    QueryType = Normal;
    UsageCategory = ReportsAndAnalysis;

    elements
    {
        dataitem(DataItemName; "Cust. Ledger Entry")
        {
            DataItemTableFilter = "Document Type" = const(Invoice);

            column(CustomerNo; "Customer No.") { }
            column(CustomerName; "Customer Name") { }
            column(DocumentNo; "Document No.") { }
            column(DocumentDate; "Document Date") { }
            column(DueDate; "Due Date")
            {
                Method = Month;
            }
            column(AmountLCY; "Amount (LCY)") { }
            column(RemainingAmtLCY; "Remaining Amt. (LCY)")
            {
                Caption = 'Remaining Amt 1';
                ReverseSign = true;
            }
            filter(Date_Filter; "Date Filter") { }

            column(Document_Type; "Document Type") { }
            dataitem(Cust__Ledger_Entry2; "Cust. Ledger Entry")
            {
                DataItemLink = "Entry No." = DataItemName."Entry No.";
                SqlJoinType = InnerJoin;
                column(RemainingAmtLCY2; "Remaining Amt. (LCY)")
                {
                    Caption = 'Remaining Amt 2';
                    ReverseSign = true;
                }
                filter(Date_Filter2; "Date Filter") { }
                dataitem(Cust__Ledger_Entry3; "Cust. Ledger Entry")
                {
                    DataItemLink = "Entry No." = DataItemName."Entry No.";
                    SqlJoinType = InnerJoin;
                    column(RemainingAmtLCY3; "Remaining Amt. (LCY)")
                    {
                        Caption = 'Remaining Amt 3';
                        ReverseSign = true;
                    }
                    filter(Date_Filter3; "Date Filter") { }
                }
            }
        }
    }


    trigger OnBeforeOpen()
    begin
        SetRange(Date_Filter, 20230101D, 20230131D);
        SetRange(Date_Filter2, 20230201D, 20230228D);
        SetRange(Date_Filter3, 20230301D, 20230331D);
    end;
}