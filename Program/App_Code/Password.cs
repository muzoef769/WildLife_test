using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Password
/// </summary>
public class Password
{
    //Attributes
    private int userID;
    private string userName, passwordHash;

    //these are not in the create statements - do we need them here?

    private DateTime lastUpdated;
    private string lastUpdatedBy;


    //Password Constructor
    public Password(int userID, string userName, string passwordHash, string lastUpdatedBy)
    {
        setUserID(userID);
        setUserName(userName);
        setPasswordHash(passwordHash);
        setLastUpdated(DateTime.Today);
        //setLastUpdatedBy(lastUpdatedBy);
    }

    public Password(int userID, string userName, string passwordHash)
    {
        setUserID(userID);
        setUserName(userName);
        setPasswordHash(passwordHash);

    }

    //Getters
    public int getUserID()
    {
        return this.userID;
    }
    public string getUserName()
    {
        return this.userName;
    }
    public string getPasswordHash()
    {
        return this.passwordHash;
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
    public void setUserID(int x)
    {
        this.userID = x;
    }
    public void setUserName(string x)
    {
        this.userName = x;
    }
    public void setPasswordHash(string x)
    {
        this.passwordHash = x;
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