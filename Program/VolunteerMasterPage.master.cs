using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class VolunteerMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Session_Start(object sender, EventArgs e)
    {
        Session["Username"] = "";
        Session["UserFullName"] = "";
    }
    protected void Clear_Session(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("Default.aspx", true);
    }
}
