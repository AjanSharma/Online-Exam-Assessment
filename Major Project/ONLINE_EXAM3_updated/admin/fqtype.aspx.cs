using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class fqtype : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string DB = DropDownList1.SelectedValue.ToString();
        Response.Redirect("add_final_question_DB.aspx?DB_Name=" + DB + "");
    }
}