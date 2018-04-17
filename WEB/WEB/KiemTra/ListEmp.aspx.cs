using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class ListEmp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            this.FillEmp();
    }

    private void FillEmp()
    {
        lstEmp1.Items.Clear();
        string connectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\NhanVien.mdb;Persist Security Info=False;";
        string query = "Select MaNV, HoNV + ' ' + TenNV AS HoTenNV from NhanVien";
        OleDbDataAdapter adapter = new OleDbDataAdapter(query, connectionString);
        DataTable dt = new DataTable();
        adapter.Fill(dt);
        int rowindex = 0;
        foreach (DataRow dr in dt.Rows)
        {
            rowindex++;
            string s = rowindex + ". " + Convert.ToString(dr["HoTenNV"]);
            lstEmp1.Items.Add(new ListItem()
            {
                Text = s,
                Value = Convert.ToString(dr["MaNV"])
            });
        }
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        if (lstEmp1.SelectedItem != null)
        {
            string connectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\NhanVien.mdb;Persist Security Info=False;";
            string query = "Select MaNV, HoNV, TenNV, DienThoai, TenDV from NhanVien nv, DonVi dv where nv.madv = dv.madv and nv.manv='" + lstEmp1.SelectedItem.Value + "' ";
            OleDbDataAdapter adapter = new OleDbDataAdapter(query, connectionString);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            dlDetails.DataSource = dt;
            dlDetails.DataBind();
        }
    }
}