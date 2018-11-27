using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Payment
/// </summary>
public class Payment
{
    //Attributes
    private int payID, orgID, invoiceID;
    private string type;
    private DateTime dateCompleted;

    private DateTime lastUpdated;
    private string lastUpdatedBy;
    //Payment constructor
    public Payment(int payID, int orgID, int invoiceID, double payAmount, string payType, DateTime dateCompleted, DateTime lastUpdated, string lastUpdatedBy)
    {
        setPayID(payID);
        setOrgID(orgID);
        setInvoiceID(invoiceID);
        setPayType(payType);
        setDateCompleted(dateCompleted);
        setLastUpdated(lastUpdated);
        setLastUpdatedBy(lastUpdatedBy);
    }

    //Getters
    public int getPayID()
    {
        return this.payID;
    }
    public int getOrgID()
    {
        return this.orgID;
    }
    public int getInvoiceID()
    {
        return this.invoiceID;
    }

    public string getPayType()
    {
        return this.type;
    }
    public DateTime getDateCompleted()
    {
        return this.dateCompleted;
    }
    public DateTime getLastUpdated()
    {
        return this.lastUpdated;
    }
    public string getLastUpdatedBy()
    {
        return this.lastUpdatedBy;
    }

    //Setters
    public void setPayID(int x)
    {
        this.payID = x;
    }
    public void setOrgID(int x)
    {
        this.orgID = x;
    }
    public void setInvoiceID(int x)
    {
        this.invoiceID = x;
    }
    public void setPayType(string x)
    {
        this.type = x;
    }
    public void setDateCompleted(DateTime x)
    {
        this.dateCompleted = x;
    }
    public void setLastUpdated(DateTime x)
    {
        this.lastUpdated = x;
    }
    public void setLastUpdatedBy(string x)
    {
        this.lastUpdatedBy = x;
    }
}