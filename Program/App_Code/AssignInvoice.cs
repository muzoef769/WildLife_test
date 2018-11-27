using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AssignInvoice
/// </summary>
public class AssignInvoice
{
    private int InvoiceID;
    private int NewProgramID;
    private DateTime LastUpdated;
    private string LastUpdatedBy;

    public AssignInvoice(int invoiceID, int newProgramID,
        DateTime lastUpdated, string lastUpdatedBy)
    {
        InvoiceID = invoiceID;
        NewProgramID = newProgramID;
        LastUpdated = lastUpdated;
        LastUpdatedBy = lastUpdatedBy;
    }

    public int InvoiceID1 { get => InvoiceID; set => InvoiceID = value; }
    public int NewProgramID1 { get => NewProgramID; set => NewProgramID = value; }
    public DateTime LastUpdated1 { get => LastUpdated; set => LastUpdated = value; }
    public string LastUpdatedBy1 { get => LastUpdatedBy; set => LastUpdatedBy = value; }
}