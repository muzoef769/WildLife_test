using System;
using System.Data;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Text;
using System.Web.Configuration;

public partial class PasswordReset : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnPass_Click(object sender, EventArgs e)
    {
        using (SqlConnection connection = new SqlConnection(WebConfigurationManager.ConnectionStrings["connString"].ConnectionString))
        {
            SqlCommand cmd = new SqlCommand("[dbo].[spResetPassword]", connection);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter paramUserName = new SqlParameter("@UserName", txtUserName.Text);
            cmd.Parameters.Add(paramUserName);

            connection.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                if (Convert.ToBoolean(reader["ReturnCode"]))
                {
                    SendPasswordResetEmail(reader["Email"].ToString(), txtUserName.Text, reader["UniqueId"].ToString());
                    lblMessage.Text = "An email with instructions to reset your password is sent to your email.";
                }
                else
                {
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Text = "UserName not found!";
                }
            }
        }
    }
    protected void SendPasswordResetEmail(string ToEmail, string UserName, string UniqueId)
    {
        MailMessage mailMessage = new MailMessage("YourGmail@gmail.com", ToEmail);

        StringBuilder emailBody = new StringBuilder();

        emailBody.Append("Dear " + UserName + ", <br /><br />");
        emailBody.Append("Please click on the following link to reset your password.");
        emailBody.Append("<br /><br />");
        emailBody.Append("http://localhost:55158//ChangePassword.aspx?uid=" + UniqueId);

        mailMessage.IsBodyHtml = true;

        mailMessage.Body = emailBody.ToString();
        mailMessage.Subject = "Reset Password";
        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);

        client.UseDefaultCredentials = false;
        client.Credentials = new System.Net.NetworkCredential()
        {
            UserName = "KandBConsulting484@gmail.com",
            Password = "#CIS484#wildlife"

        };

        client.EnableSsl = true;
        client.Send(mailMessage);
    }

    protected void btnHome_Click(object sender, EventArgs e)
    {
        Server.Transfer("Default.aspx",false);
    }
}