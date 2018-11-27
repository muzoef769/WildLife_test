using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

public class Online
{
    //Attributes
    private int programID;
    private string onlineType;

    public Online(int programID, string onlineType)
    {
        this.programID = programID;
        this.onlineType = onlineType;
    }

    public int ProgramID { get => programID; set => programID = value; }
    public string OnlineType { get => onlineType; set => onlineType = value; }
}
