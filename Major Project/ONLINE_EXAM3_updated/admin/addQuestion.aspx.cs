using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class addQuestion : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {
        string s1 = DropDownList1.SelectedValue.ToString();
        if (s1.Equals("Practise"))
        {
            Response.Redirect("../admin/question_type.aspx");
        }
        else if (DropDownList1.SelectedValue.Equals("Final"))
        {
            
            Response.Redirect("../admin/fqtype.aspx");
        }
        
    }
}