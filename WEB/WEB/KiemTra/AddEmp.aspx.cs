using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

public partial class AddEmp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            this.FillEmp();
    }

    private void FillEmp()
    {
        cmbDV.Items.Clear();
        string connectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\NhanVien.mdb;Persist Security Info=False;";
        string query = "Select MaDV, TenDV from DonVi";
        OleDbDataAdapter adapter = new OleDbDataAdapter(query, connectionString);
        DataTable dt = new DataTable();
        adapter.Fill(dt);
        cmbDV.DataSource = dt;
        cmbDV.DataBind();
    }
    protected void btnAccept_Click(object sender, EventArgs e)
    {
        string connectionString = @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\NhanVien.mdb;Persist Security Info=False;";
        if (cmbDV.SelectedIndex > -1)
        {
            int madv = Convert.ToInt32(cmbDV.SelectedValue);
            string MaNV = CreateMaNV(madv, connectionString);
            string Ho = txtHo.Text;
            string ten = txtTen.Text.Trim();
            if (ten.Length == 0)
            {
                lblMessage.Text = "Chưa nhập tên nhân viên";
                return;
            }
            string dt = txtDT.Text;
            string email = txtEmail.Text;
            string query = "Insert into NhanVien Values('" + MaNV + "','" + Ho + "','" + ten + "','" + dt + "','" + email + "', " + madv + ")";
            OleDbConnection con = new OleDbConnection(connectionString);
            con.Open();
            OleDbCommand cmd = new OleDbCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            lblMessage.Text = "Nhân viên " + Ho + " " + ten + " đã được thêm thành công!";
        }
        else
        {
            lblMessage.Text = "Chưa chọn đơn vị";
        }
    }

    private string CreateMaNV(int madv, string con)
    {
        string s = string.Empty;
        string code = "NV";
        switch (madv)
        {
            case 1: code = "TC";
                break;
            case 2: code = "TV";
                break;
            case 3: code = "KT";
                break;
            case 4: code = "KH";
                break;
            case 5: code = "VT";
                break;
        }
        int index = 1;
        string query = "Select MaNV From NhanVien Where MaDV = "+madv + " ORDER BY MaNV DESC";
        OleDbDataAdapter adapter = new OleDbDataAdapter(query, con);
        DataTable dt = new DataTable();
        adapter.Fill(dt);
        if (dt.Rows.Count > 0)
        {
            string last = Convert.ToString(dt.Rows[0]["MaNV"]);
            string sIndex = last.Substring(2);
            index = Convert.ToInt32(sIndex) + 1;
        }
        s = code + index.ToString("000");
        return s;
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtHo.Text = "";
        txtTen.Text = "";
        txtDT.Text = "";
        txtEmail.Text = "";
        cmbDV.SelectedIndex = -1;
    }
}