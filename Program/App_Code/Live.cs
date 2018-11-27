using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


public class Live
{
    //Attributes
    private int programID;
    private string locationType;

	public Live(int programID, string locationType)
	{
        setProgramID(programID);
        setLocationType(locationType);
	}

    //Setters
    public void setProgramID(int programID)
    {
        this.programID = programID;
    }
    public void setLocationType(string locationType)
    {
        this.locationType = locationType;
    }

    //Getters

    public int getProgramID()
    {
        return this.programID;
    }

    public string getLocationType()
    {
        return this.locationType;
    }

}
