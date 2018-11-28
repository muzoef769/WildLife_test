using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Drawing;
using System.Threading.Tasks;

public partial class ChangePassword : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            txtMessage.ForeColor = Color.Transparent;


        }

        if (!IsPostBack)
        {
            if (!IsPasswordResetLinkValid())
            {
                txtMessage.ForeColor = Color.White;
                txtMessage.Text = "Password Reset link has expired or is invalid";
            }
        }
    }


        
 

    protected void ChangeResetPassword(object sender, EventArgs e)
    {
        if (ChangePasswords())
        {
            txtMessage.ForeColor = Color.White;
            txtMessage.Text = "Password Changed Successfully";
            Response.AddHeader("REFRESH", "3;URL=Default.aspx");
        }
        else
        {
            txtMessage.ForeColor = Color.White;
            txtMessage.Text = "Password Reset link has expired or is invalid";
        }
    }
    private bool ChangePasswords()
    {
        List<SqlParameter> paramList = new List<SqlParameter>()
        {
            new SqlParameter()
            {
                ParameterName = "@GUID",
                Value = Request.QueryString["uid"]
            },
            new SqlParameter()
            {
                ParameterName = "@Password",
                Value = PasswordHash.HashPassword(txtConfirmPass.Text)
            }
        };

        return ExecuteSP("spChangePassword", paramList);
    }
    private bool ExecuteSP(string SPName, List<SqlParameter> SPParamters)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            SqlCommand command = new SqlCommand(SPName, connection);
            command.CommandType = CommandType.StoredProcedure;

            foreach (SqlParameter parameter in SPParamters)
            {
                command.Parameters.Add(parameter);
            }
            connection.Open();
            return Convert.ToBoolean(command.ExecuteScalar());
        }
    }
    private bool IsPasswordResetLinkValid()
    {
        List<SqlParameter> paramList = new List<SqlParameter>()
        {
            new SqlParameter()
            {
                ParameterName = "@GUID",
                Value = Request.QueryString["uid"]
            }
        };

        return ExecuteSP("spIsPasswordResetLinkValid", paramList);
    }

    protected void btnReturn_Click(object sender, EventArgs e)
    {
        Server.Transfer("Default.aspx", false);
    }
}