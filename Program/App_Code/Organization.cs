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

    public string OrgName { get => orgName; set => orgName = value; }
    public int AddressID { get => addressID; set => addressID = value; }
    public DateTime LastUpdated { get => lastUpdated; set => lastUpdated = value; }
    public string LastUpdatedBy { get => lastUpdatedBy; set => lastUpdatedBy = value; }
}
