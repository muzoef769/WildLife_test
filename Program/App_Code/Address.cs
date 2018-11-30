using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Payment
/// </summary>
public class Address
{
    //Attributes
    private int addressID;
    private string streetName, city, county, country, state, zipCode;
    private string type;
    private DateTime lastUpdated;
    private string lastUpdatedBy;

    //Address constructor - OG constructor Will made
    //public Address(int addressID, string streetName, string city, string county, string zipCode, DateTime lastUpdated, string lastUpdatedBy)
    //{
    //    setAddressID(addressID);
    //    setStreetName(streetName);
    //    setCity(city);
    //    setCounty(county);
    //    setZipCode(zipCode);
    //    setLastUpdated(lastUpdated);
    //    setLastUpdatedBy(lastUpdatedBy);
    //}

    public Address(string streetName, string state, string city, string county, string country, string zipCode, string type, DateTime lastUpdated, string lastUpdatedBy)
    {
        setStreetName(streetName);
        setState(state);
        setCity(city);
        setCounty(county);
        setCountry(country);
        setZipCode(zipCode);
        setAddressType(type);
        setLastUpdated(lastUpdated);
        setLastUpdatedBy(lastUpdatedBy);
    }
    public Address(int addressID, string streetName, string state, string city, string county, string country, string zipCode, DateTime lastUpdated, string lastUpdatedBy)
    {
        setAddressID(addressID);
        setStreetName(streetName);
        setState(state);
        setCity(city);
        setCounty(county);
        setCountry(country);
        setZipCode(zipCode);
        setLastUpdated(lastUpdated);
        setLastUpdatedBy(lastUpdatedBy);
    }

    //Getters
    public int getAddressID()
    {
        return this.addressID;
    }
    public string getStreetName()
    {
        return this.streetName;
    }

    public string getState()
    {
        return this.state;
    }
    public string getCity()
    {
        return this.city;
    }
    public string getCounty()
    {
        return this.county;
    }
    public string getCountry()
    {
        return this.country;
    }
    public string getZipCode()
    {
        return this.zipCode;
    }
    public string getAddressType()
    {
        return this.type;
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
    public void setAddressID(int x)
    {
        this.addressID = x;
    }
    public void setStreetName(string x)
    {
        this.streetName = x;
    }

    public void setState(string x)
    {
        this.state = x;
    }
    public void setCity(string x)
    {
        this.city = x;
    }
    public void setCounty(string x)
    {
        this.county = x;
    }
    public void setCountry(string x)
    {
        this.country = x;
    }
    public void setZipCode(string x)
    {
        this.zipCode = x;
    }
    public void setAddressType(string x)
    {
        this.type = x;
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