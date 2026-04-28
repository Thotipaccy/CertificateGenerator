using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CertificateGenerator
{
    public partial class Certificates : Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData(string search = "")
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM CertificateOfAttendance";
                if (!string.IsNullOrEmpty(search))
                {
                    query += " WHERE StudentName LIKE @Search OR StudentID LIKE @Search";
                }

                SqlCommand cmd = new SqlCommand(query, conn);
                if (!string.IsNullOrEmpty(search))
                {
                    cmd.Parameters.AddWithValue("@Search", "%" + search + "%");
                }

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvStudents.DataSource = dt;
                gvStudents.DataBind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            BindData(txtSearch.Text.Trim());
        }

        protected void gvStudents_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string studentID = e.CommandArgument.ToString();
            
            if (e.CommandName == "Generate")
            {
                Response.Redirect("ViewCertificate.aspx?id=" + studentID);
            }
            else if (e.CommandName == "EditStudent")
            {
                Response.Redirect("StudentForm.aspx?id=" + studentID);
            }
            else if (e.CommandName == "DeleteStudent")
            {
                DeleteStudent(studentID);
                BindData(txtSearch.Text.Trim());
            }
        }

        private void DeleteStudent(string studentID)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM CertificateOfAttendance WHERE StudentID = @StudentID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentID", studentID);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }
        protected void gvStudents_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvStudents.PageIndex = e.NewPageIndex;
            BindData(txtSearch.Text.Trim());
        }
    }
}
