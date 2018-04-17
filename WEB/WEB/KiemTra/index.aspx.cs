using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class index : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void rad_CheckedChange(object sender, EventArgs e)
    {
        if(radList.Checked)
            Response.Redirect("~/ListEmp.aspx");
        if(radAdd.Checked)
            Response.Redirect("~/AddEmp.aspx");
    }
}