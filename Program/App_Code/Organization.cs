using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Organization
/// </summary>
public class Organization
{
    //Attributes
    private int orgID;
    private string orgName;
    private int addressID;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    public Organization(string orgName, int addressID, DateTime lastUpdated, string lastUpdatedBy)
    {
        this.OrgName = orgName;
        this.AddressID = addressID;
        this.LastUpdated = lastUpdated;
        this.LastUpdatedBy = lastUpdatedBy;
    }

    public Organization(int orgID, string orgName, DateTime lastUpdated, string lastUpdatedBy)
    {
        this.OrgID = orgID;
        this.OrgName = orgName;
        this.LastUpdated = lastUpdated;
        this.LastUpdatedBy = lastUpdatedBy;
    }


    public int getOrgID()
    {
        return this.orgID;
    }
    public string getOrgName()
    {
        return this.orgName;
    }

    public DateTime getLastUpdated()
    {
        return this.lastUpdated;
    }
    public string getLastUpdatedBy()
    {
        return this.lastUpdatedBy;
    }

    public void setOrgID(int x)
    {
        this.orgID = x;
    }
    public void getOrgName(string x)
    {
        this.orgName = x;
    }

    public void getLastUpdated(DateTime x)
    {
        this.lastUpdated = x;
    }
    public void getLastUpdatedBy(string x)
    {
        this.lastUpdatedBy = x;
    }


    public int OrgID { get => orgID; set => orgID = value; }
    public string OrgName { get => orgName; set => orgName = value; }
    public int AddressID { get => addressID; set => addressID = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}
