using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class Users
{
    //Attributes
    private int userID;
    private string userName, firstName, lastName, userStatus;
    private string userType;
    private DateTime lastUpdated;
    private string lastUpdatedBy;
    private string email;
    public static string USER_NAME;

    //User constructor
    public Users(int userID, string userName, string firstName, string lastName, string userType, DateTime lastUpdated, string lastUpdatedBy, string email)
    {
        setUserID(userID);
        setUserName(userName);
        setFirstName(firstName);
        setLastName(lastName);
        setUserType(userType);
        setLastUpdated(lastUpdated);
        setLastUpdatedBy(lastUpdatedBy);
        setEmail(email);
    }
    public Users(string userName, string firstName, string lastName, string userType, string userStatus, DateTime lastUpdated, string lastUpdatedBy, string email)
    {

        setUserName(userName);
        setFirstName(firstName);
        setLastName(lastName);
        setUserType(userType);
        setStatus(userStatus);
        setLastUpdated(lastUpdated);
        setLastUpdatedBy(lastUpdatedBy);
        setEmail(email);
    }

    //Getters
    public int getUserID()
    {
        return this.userID;
    }
    public string getEmail()
    {
        return this.email;
    }
    public string getUserName()
    {
        return this.userName;
    }
    public string getFirstName()
    {
        return this.firstName;
    }
    public string getLastName()
    {
        return this.lastName;
    }
    public string getUserType()
    {
        return this.userType;
    }
    public string getStatus()
    {
        return this.userStatus;
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
    public void setEmail(string x)
    {
        this.email = x;
    }
    public void setUserName(string x)
    {
        this.userName = x;
    }
    public void setFirstName(string x)
    {
        this.firstName = x;
    }
    public void setLastName(string x)
    {
        this.lastName = x;
    }
    public void setUserType(string x)
    {
        this.userType = x;
    }
    public void setStatus(string x)
    {
        this.userStatus = x;
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