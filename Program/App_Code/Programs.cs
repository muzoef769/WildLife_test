using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Programs
/// </summary>
public class Programs
{
    private int ProgramID;
    private string ProgramName;
    private string ProgramType;
    private int ProgramCost;
    private int Capacity;
    private DateTime LastUpdated;
    private string LastUpdatedBy;

    public Programs(string programName,string programType,
        int programCost, int capacity,
        DateTime lastUpdated, string lastUpdatedBy)
    {
        ProgramName = programName;
        ProgramType = programType;
        ProgramCost = programCost;
        Capacity = capacity;
        LastUpdated = lastUpdated;
        LastUpdatedBy = lastUpdatedBy;
    }

    public Programs(int programID, string programName,
        string programType, int programCost,int capacity,
        DateTime lastUpdated, string lastUpdatedBy)
    {
        ProgramID = programID;
        ProgramName = programName;
        ProgramType = programType;
        ProgramCost = programCost;
        Capacity = capacity;
        LastUpdated = lastUpdated;
        LastUpdatedBy = lastUpdatedBy;
    }

    public int ProgramID1 { get => ProgramID; set => ProgramID = value; }
    public string ProgramName1 { get => ProgramName; set => ProgramName = value; }
    public string ProgramType1 { get => ProgramType; set => ProgramType = value; }
    public int ProgramCost1 { get => ProgramCost; set => ProgramCost = value; }
    public int Capacity1 { get => Capacity; set => Capacity = value; }
    public DateTime LastUpdated1 { get => LastUpdated; set => LastUpdated = value; }
    public string LastUpdatedBy1 { get => LastUpdatedBy; set => LastUpdatedBy = value; }
}