using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AssignAnimal
/// </summary>
public class AssignAnimal
{
    private int assignAnimalID;
    private int animalID;
    private int newProgramID;

    private DateTime lastUpdated;
    private string lastUpdatedBy;
    public AssignAnimal(int assignAnimalID, int animalID, int newProgram, DateTime lastUpdated, string lastUpdatedBy)
    {
        setAssignAnimalID(assignAnimalID);
        setAnimalID(animalID);
        setNewProgramID(newProgramID);
        setLastUpdated(lastUpdated);
        setLastUpdatedBy(lastUpdatedBy);
    }
    //Getters
    public int getAssignAnimalID()
    {
        return this.assignAnimalID;
    }
    public int getAnimalID()
    {
        return this.animalID;
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
    public void setAssignAnimalID(int x)
    {
        this.assignAnimalID = x;
    }
    public void setAnimalID(int x)
    {
        this.animalID = x;
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