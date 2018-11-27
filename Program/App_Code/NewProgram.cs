using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for NewProgram
/// </summary>
public class NewProgram
{
    public static double baseCost = 0;
    public static List<NewProgram> programList = new List<NewProgram>();
    public static int btnCount;
    private double prgCost;
    private int newProgramID, programID, addressID, numKids, numAdults, totalPeople, totalMileage;
    private DateTime timeSlot, dateCompleted;
    private string ageLevel, status, miscNotes, locationType;
    private DateTime lastUpdated;
    private string lastUpdatedBy;
    public NewProgram(int kids, int adults, int people, string ageLevel, int mileage, string status,
        DateTime timeSlot, DateTime dateCompleted, string notes, string locationType, int programID,
        int addressID, DateTime lastUpdated, string lastUpdatedBy)
    {

        setNumKids(kids);
        setNumAdults(adults);
        setTotalPeople(people);
        setAgeLevel(ageLevel);
        setMileage(mileage);
        setProgramStatus(status);
        setTimeSlot(timeSlot);
        setDateCompleted(dateCompleted);
        setMiscNotes(notes);
        setLocationType(locationType);


        setProgramID(programID);
        setAddressID(addressID);
        setLastUpdated(lastUpdated);
        setLastUpdatedBy(lastUpdatedBy);
    }

    public NewProgram(int kids, int adults, int people, string ageLevel, string status,
       DateTime timeSlot, DateTime dateCompleted, string notes, string locationType, int programID,
       DateTime lastUpdated, string lastUpdatedBy, double prgCost)
    {

        setNumKids(kids);
        setNumAdults(adults);
        setTotalPeople(people);
        setAgeLevel(ageLevel);
        setProgramStatus(status);
        setTimeSlot(timeSlot);
        setDateCompleted(dateCompleted);
        setMiscNotes(notes);
        setLocationType(locationType);
        setProgramID(programID);
        setLastUpdated(lastUpdated);
        setLastUpdatedBy(lastUpdatedBy);
        setPrgCost(prgCost);
    }





    //Getters

    public double getPrgCost()
    {
        return this.prgCost;
    }
    public void setPrgCost(double x)
    {
        this.prgCost = x;
    }
    public int getNewProgramID()
    {
        return this.newProgramID;
    }
    public int getProgramID()
    {
        return this.programID;
    }
    public int getNumKids()
    {
        return this.numKids;
    }
    public int getNumAdults()
    {
        return this.numAdults;
    }
    public int getTotalPeople()
    {
        return this.totalPeople;
    }
    public string getAgeLevel()
    {
        return this.ageLevel;
    }
    public int getTotalMileage()
    {
        return this.totalMileage;
    }
    public string getMiscNotes()
    {
        return this.miscNotes;
    }

    public string getLocationType()
    {
        return this.locationType;
    }
    public DateTime getTimeSlot()
    {
        return this.timeSlot;
    }
    public DateTime getDateCompleted()
    {
        return this.dateCompleted;
    }
    public string getProgramStatus()
    {
        return this.status;
    }
    public int getAddressID()
    {
        return this.addressID;
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
    public void setNewProgramID(int x)
    {
        this.newProgramID = x;
    }
    public void setProgramID(int x)
    {
        this.programID = x;
    }
    public void setNumKids(int x)
    {
        this.numKids = x;
    }
    public void setAddressID(int x)
    {
        this.addressID = x;
    }
    public void setNumAdults(int x)
    {
        this.numAdults = x;
    }
    public void setAgeLevel(string x)
    {
        this.ageLevel = x;
    }
    public void setTotalPeople(int x)
    {
        this.totalPeople = x;
    }
    public void setMileage(int x)
    {
        this.totalMileage = x;
    }
    public void setMiscNotes(string x)
    {
        this.miscNotes = x;
    }
    public void setLocationType(string x)
    {
        this.locationType = x;
    }
    public void setProgramStatus(string x)
    {
        this.status = x;
    }

    public void setTimeSlot(DateTime x)
    {
        this.timeSlot = x;
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