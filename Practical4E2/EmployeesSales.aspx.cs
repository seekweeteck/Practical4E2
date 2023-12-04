using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practical4E2
{
    public partial class EmployeesSales : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            
            sdsOrders.SelectParameters["EmployeeID"].DefaultValue = 
                ddlName.SelectedValue;

            sdsOrders.SelectParameters["Year"].DefaultValue = 
                rblYear.SelectedItem.Value;

        }

        protected void sdsOrderDetails_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}