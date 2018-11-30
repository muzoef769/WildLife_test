using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
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
                    SendPasswordResetEmail(reader["Email"].ToString(), HttpUtility.HtmlEncode(txtUserName.Text), reader["UniqueId"].ToString());
                    txtMessage.Text = "An email with instructions to reset your password has been sent to your email.";
                    txtMessage.ForeColor = Color.White;
                }
                else
                {
                    txtMessage.ForeColor = System.Drawing.Color.White;
                    txtMessage.Text = "UserName not found!";
                }
            }
        }
    }
    protected void SendPasswordResetEmail(string ToEmail, string UserName, string UniqueId)
    {
        MailMessage mailMessage = new MailMessage("YourGmail@gmail.com", ToEmail);

        StringBuilder emailBody = new StringBuilder();

        emailBody.Append("Dear " + HttpUtility.HtmlEncode(UserName) + ", <br /><br />");
        emailBody.Append("Please click on the following link to reset your password.");
        emailBody.Append("<br /><br />");
        emailBody.Append("http://wildlife-site-test.us-east-1.elasticbeanstalk.com//ChangePassword.aspx?uid=" + HttpUtility.HtmlEncode(UniqueId));

        mailMessage.IsBodyHtml = true;

        mailMessage.Body = HttpUtility.HtmlEncode(emailBody.ToString());
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