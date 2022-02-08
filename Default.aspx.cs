using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Configuration;

public partial class _Default : System.Web.UI.Page
{
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        Button5.Visible = false;
        con = new SqlConnection(ConfigurationManager.ConnectionStrings["DatabaseConnectionString1"].ConnectionString);
        printData();
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Button5.Visible == false)
        {
            Button5.Visible = true;
            Button5.Enabled = true;
            Button5.ForeColor = Color.White;
            Button5.BackColor = ColorTranslator.FromHtml("#00CC00");
        }
        if (DropDownList1.SelectedIndex == 1)
        {
            
            CheckBox1.Enabled = true;
        }
        else
        {
            CheckBox1.Enabled = false;
            if (DropDownList1.SelectedIndex == 2)
            {
                CheckBox1.Checked = false;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string gender = "Male";
            string isAvailable = "Not Available";
            if (RadioButton2.Checked)
            {
                gender = RadioButton2.Text;
            }
            if (CheckBox1.Checked)
            {
                isAvailable = "Available";
            }
            SqlCommand cmd = new SqlCommand("INSERT INTO [patients] ([name], [gender], [status], [vaccine]) VALUES (@name, @gender, @status, @vaccine)", con);
            cmd.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@gender", gender);
            cmd.Parameters.AddWithValue("@status", DropDownList1.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@vaccine", isAvailable);

            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();

            if (s == 1)
            {
                Literal1.Text = "Patient Details Added Successfully!";
                printData();
                resetForm();
            }
            else
            {
                Literal1.Text = "Error! The Details Entered are Invalid!";
                printData();
                resetForm();
            }
        }
    }
    public void printData()
    {
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [name], [gender], [status], [vaccine] FROM [patients]", con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
    public void resetForm()
    {
        Button5.Enabled = false;
        Button5.BackColor = Color.Black;
        Button5.ForeColor = Color.Silver;
        TextBox1.Text = "";
        RadioButton1.Checked = true;
        RadioButton2.Checked = false;
        CheckBox1.Checked = false;
        CheckBox1.Enabled = false;
        DropDownList1.SelectedIndex = 0;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        SqlCommand cmd = new SqlCommand("DELETE FROM [patients] WHERE [id] = @id", con);
        cmd.Parameters.AddWithValue("@id", btn.CommandArgument);

        con.Open();
        int s = cmd.ExecuteNonQuery();
        con.Close();

        if (s == 1)
        {
            Literal1.Text = "Record Deleted Successfully!";
            printData();
        }
        else
        {
            Literal1.Text = "Error! Record could not be Deleted!";
            printData();
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Button5.Visible = true;
        Button1.Visible = false;
        Button btn = new Button();
        btn = (Button)sender;
        SqlDataAdapter adpt = new SqlDataAdapter("SELECT [id], [name], [gender], [status], [vaccine] FROM [patients] WHERE [id] = "+btn.CommandArgument, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        CheckBox1.Enabled = true;
        Button1.Enabled = false;
        Button1.ForeColor = Color.Silver;
        Button1.BackColor = Color.Black;
        Button5.Enabled = true;
        Button5.ForeColor = Color.White;
        Button5.BackColor = ColorTranslator.FromHtml("#00CC00");
        TextBox1.Text = dt.Rows[0][1].ToString();
        string gender = dt.Rows[0][2].ToString();
        if (gender.Equals("Male"))
        {
            RadioButton1.Checked = true;
        }
        else
        {
            RadioButton2.Checked = true;
        }
        string status = dt.Rows[0][3].ToString();
        if(status.Equals("Covid +ve"))
        {
            DropDownList1.SelectedIndex = 1;
        }
        else
        {
            DropDownList1.SelectedIndex = 2;
            CheckBox1.Enabled = false;
        }
        string vaccine = dt.Rows[0][4].ToString();
        if (vaccine.Equals("Available"))
        { 
            CheckBox1.Checked = true;
        }
        ViewState["id"] = btn.CommandArgument;
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Button1.Visible = true;
        Button1.Enabled = true;
        Button1.ForeColor = Color.White;
        Button1.BackColor = ColorTranslator.FromHtml("#00CC00");
        Literal1.Text = "";
        resetForm();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Button1.Visible = true;
        Button1.Enabled = true;
        Button1.ForeColor = Color.White;
        Button1.BackColor = ColorTranslator.FromHtml("#00CC00");
        if (Page.IsValid)
        {
            string gender = "Male";
            string isAvailable = "Not Available";
            if (RadioButton2.Checked)
            {
                gender = RadioButton2.Text;
            }
            if (CheckBox1.Checked)
            {
                isAvailable = "Available";
            }
            SqlCommand cmd = new SqlCommand("UPDATE [patients] SET [name] = @name, [gender] = @gender, [status] = @status, [vaccine] = @vaccine WHERE [id] = @id", con);
            cmd.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@gender", gender);
            cmd.Parameters.AddWithValue("@status", DropDownList1.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@vaccine", isAvailable);
            cmd.Parameters.AddWithValue("@id", ViewState["id"]);

            con.Open();
            int s = cmd.ExecuteNonQuery();
            con.Close();

            if (s == 1)
            {
                Literal1.Text = "Patient Details Updated Successfully!";
                printData();
                resetForm();
            }
            else
            {
                Literal1.Text = "Error! The Record Could Not Be Updated!";
                printData();
                resetForm();
            }
        }
    }
}