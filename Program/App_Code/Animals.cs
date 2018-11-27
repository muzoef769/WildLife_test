using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Animal
/// </summary>
public class Animals
{
    //Attributes
    //private int ID; //changed ID  to animalID
    private int animalID;
    private string Species;
    private string ScientificName;
    private string AnimalName;
    private string AnimalType; //This value will either be 'B' for bird, 'M' for Mammal, or 'R' for Reptile ------- changed to string
    //private DateTime dateAdded;   removed dateAdded
    //private int age               removed age
    private string Status;
    //added species, scientificname to match DB
    private DateTime LastUpdated;
    private string LastUpdatedBy;
    Animals[] animalArray = new Animals[4];
    private string Image;

    public Animals(string species, string scientificName, string AnimalName, string AnimalType, string Status, DateTime lastUpdated, string lastUpdatedBy)
    {
        
        
        setSpecies(species);
        setScientificName(scientificName);
        setAnimalName(AnimalName);
        setAnimalType(AnimalType);
        setStatus(Status);
        setLastUpdated(lastUpdated);
        setLastUpdatedBy(lastUpdatedBy);
    }

    public Animals(string species, string scientificName, string AnimalName, string AnimalType, string Status, DateTime lastUpdated, string lastUpdatedBy, string Image)
    {

        setSpecies(species);
        setScientificName(scientificName);
        setAnimalName(AnimalName);
        setAnimalType(AnimalType);
        setStatus(Status);
        setLastUpdated(lastUpdated);
        setLastUpdatedBy(lastUpdatedBy);
        setImage(Image);
    }










    public Animals(int ID, string name, string species, string scientificName, string type, string status)
    {
        setAnimalID(ID);
        setAnimalName(name);
        setSpecies(species);
        setScientificName(scientificName);
        setAnimalType(type);
        setStatus(status);
        setLastUpdated(DateTime.Today);
        setLastUpdatedBy("Raina");
    }

    //Getters
    public int getAnimalID()
    {
        return this.animalID;
    }
    public string getAnimalName()
    {
        return this.AnimalName;
    }

    public string getSpecies()
    {
        return this.Species;
    }

    public string getScientificName()
    {
        return this.ScientificName;
    }

    public string getAnimalType()
    {
        return this.AnimalType;
    }

    public DateTime getLastUpdated()
    {
        return this.LastUpdated;
    }
    public string getLastUpdatedBy()
    {
        return this.LastUpdatedBy;
    }

    //Setters
    public void setAnimalID(int x)
    {
        this.animalID = x;
    }
    public void setAnimalType(string x)
    {
        this.AnimalType = x;
    }

    public void setSpecies(string x)
    {
        this.Species = x;
    }

    public void setScientificName(string x)
    {
        this.ScientificName = x;
    }

    //public void setAnimalAge(int x)
    //{
    //    this.age = x;
    //}

    public void setAnimalName(string x)
    {
        this.AnimalName = x;
    }

    //public void setAnimalDateAdded(DateTime x)
    //{
    //    this.dateAdded = x;
    //}

    public void setLastUpdated(DateTime x)
    {
        this.LastUpdated = x;
    }
    public void setLastUpdatedBy(string x)
    {
        this.LastUpdatedBy = x;
    }
    public string getStatus()
    {
        return this.Status;
    }
    public void setStatus(string status)
    {
        this.Status = status;
    }
    public void setImage(string x)
    {
        this.Image = x;
    }
    public string getImage()
    {
        return this.Image;
    }

}