using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AssignUser
/// </summary>
public class AssignUser
{
    private int assignUserID;
    private int userID;
    private int newProgramID;

    private DateTime lastUpdated;
    private string lastUpdatedBy;
    public AssignUser(int assignUserID, int userID, int newProgram, DateTime lastUpdated, string lastUpdatedBy)
    {
        setAssignUserID(assignUserID);
        setUserID(userID);
        setNewProgramID(newProgramID);
        setLastUpdated(lastUpdated);
        setLastUpdatedBy(lastUpdatedBy);
    }
    //Getters
    public int getAssignUserID()
    {
        return this.assignUserID;
    }
    public int getUserID()
    {
        return this.userID;
    }
    public int getNewProgramID()
    {
        return this.newProgramID;
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
    public void setAssignUserID(int x)
    {
        this.assignUserID = x;
    }
    public void setUserID(int x)
    {
        this.userID = x;
    }
    public void setNewProgramID(int x)
    {
        this.newProgramID = x;
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