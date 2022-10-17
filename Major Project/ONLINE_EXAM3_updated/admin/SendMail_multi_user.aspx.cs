using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Threading.Tasks;
public partial class SendMail_multi_user : System.Web.UI.Page
{
    connection con = new connection();
    protected void Page_Load(object sender, EventArgs e)
    {
        Random rnd = new Random();
      int otp=  rnd.Next(123456);
      txtotp.Text = otp.ToString();
      if (!this.IsPostBack)
      {
          try
          {
              con.open_connection();
              string q = "select emailid,fname from registration";
              DataTable dt = new DataTable();
              SqlDataAdapter dp = new SqlDataAdapter(q, con.con_pass());
              dp.Fill(dt);
              if (dt.Rows.Count > 0)
              {
                  GridView1.DataSource = dt;
                  GridView1.DataBind();

              }
              con.close_connection();
          }
          catch (Exception ex)
          {
          }
      }
    }
    protected void SendBulkEmail(object sender, EventArgs e)
    {
       
        //Create a temporary DataTable
        DataTable dtCustomers = new DataTable();
        dtCustomers.Columns.AddRange(new DataColumn[2] { new DataColumn("fname", typeof(string)),
                        new DataColumn("Email",typeof(string)) });

        //Copy the Checked Rows to DataTable
        foreach (GridViewRow row in GridView1.Rows)
        {
            if ((row.FindControl("chkSelect") as CheckBox).Checked)
            {
                dtCustomers.Rows.Add(row.Cells[2].Text, (row.FindControl("lnkEmail") as HyperLink).Text);
            }
        }

        string subject = "You All Are Notified By Teacher to Give Test";
        string body = "OTP: " + txtotp.Text + "<br />" + "Send  By :" + Session["emailID"].ToString() + "<br />" + "Description :" + txtdesc.Text;

        //Using Parallel Multi-Threading send multiple bulk email.
        Parallel.ForEach(dtCustomers.AsEnumerable(), row =>
        {
            SendEmail(row["Email"].ToString(), subject, string.Format(body, row["fname"]));
        });
        con.open_connection();
        string st = "insert into getExam values('"+Session["emailID"]+"','"+txtotp.Text+"') ";
        SqlCommand cmd = new SqlCommand(st,con.con_pass());
        cmd.ExecuteNonQuery();
        con.close_connection();
    }
    private bool SendEmail(string recipient, string subject, string body)
    {

        MailMessage mm = new MailMessage("sender@gmail.com", recipient);
        mm.Subject = subject;
        mm.Body = body;
        mm.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.EnableSsl = true;
        NetworkCredential NetworkCred = new NetworkCredential();
        NetworkCred.UserName = "trymeapdtc2013@gmail.com";
        NetworkCred.Password = "apdtc@123";
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = 587;
        smtp.Send(mm);
        return true;
    }
}