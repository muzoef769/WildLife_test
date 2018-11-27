using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Contact
/// </summary>
/// 
//changed name from teacher to contact
public class Contact
{
    private int ID;
    private string firstName;
    private string lastName;
    private string email;
    private string primaryPhone;
    private string secondaryPhone;
    private int orgID;

    private DateTime lastUpdated;
    private string lastUpdatedBy;

    //Constructor w/BOTH phone numbers
    public Contact(string firstName, string lastName, string contactEmail, string primaryPhone, string secondaryPhone, int orgID, DateTime lastUpdated, string lastUpdatedBy)
    {
        setFirstName(firstName);
        setLastName(lastName);
        setContactEmail(contactEmail);
        setPrimaryPhone(primaryPhone);
        setSecondaryPhone(secondaryPhone);
        setOrgID(orgID);
        setLastUpdated(lastUpdated);
        setLastUpdatedBy(lastUpdatedBy);
    }
    //Constructor w/ONE phone number
    public Contact(int ID, string firstName, string lastName, string contactEmail, string primaryPhone, string secondaryPhone, int orgID, DateTime lastUpdated, string lastUpdatedBy)
    {
        setContactID(ID);
        setFirstName(firstName);
        setLastName(lastName);
        setContactEmail(contactEmail);
        setPrimaryPhone(primaryPhone);
        setLastUpdated(lastUpdated);
        setLastUpdatedBy(lastUpdatedBy);
    }

    //Getters
    public int getContactID()
    {
        return this.ID;
    }
    public string getFirstName()
    {
        return this.firstName;
    }
    public string getLastName()
    {
        return this.lastName;
    }
    public string getEmailName()
    {
        return this.email;
    }
    public string getPrimaryNumber()
    {
        return this.primaryPhone;
    }
    public string getSecondaryNumber()
    {
        return this.secondaryPhone;
    }
    public int getOrgID()
    {
        return this.orgID;
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
    public void setContactID(int x)
    {
        this.ID = x;
    }
    public void setFirstName(string x)
    {
        this.firstName = x;
    }
    public void setLastName(string x)
    {
        this.lastName = x;
    }
    public void setContactEmail(string x)
    {
        this.email = x;
    }
    public void setPrimaryPhone(string x)
    {
        this.primaryPhone = x;
    }
    public void setSecondaryPhone(string x)
    {
        this.secondaryPhone = x;
    }
    public void setOrgID(int x)
    {
        this.orgID = x;
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