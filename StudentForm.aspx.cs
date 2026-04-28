using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace CertificateGenerator
{
    public partial class StudentForm : Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string id = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(id))
                {
                    litTitle.Text = "Edit Student";
                    txtStudentID.ReadOnly = true;
                    LoadStudent(id);
                }
            }
        }

        private void LoadStudent(string id)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM CertificateOfAttendance WHERE StudentID = @StudentID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentID", id);
                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    txtStudentID.Text = dr["StudentID"].ToString();
                    txtStudentName.Text = dr["StudentName"].ToString();
                    if (dr["BornDate"] != DBNull.Value)
                        txtBornDate.Text = Convert.ToDateTime(dr["BornDate"]).ToString("yyyy-MM-dd");
                    txtStudiedFrom.Text = dr["StudiedFrom"].ToString();
                    txtStudiedTo.Text = dr["StudiedTo"].ToString();
                    txtYear.Text = dr["Year"].ToString();
                    txtFaculty.Text = dr["Faculty"].ToString();
                    txtMajor.Text = dr["Major"].ToString();
                    txtAcademicYear.Text = dr["AcademicYear"].ToString();
                    txtApprovedBy.Text = dr["ApprovedBy"].ToString();
                    txtComment.Text = dr["Comment"].ToString();
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            bool isEdit = !string.IsNullOrEmpty(id);

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query;
                if (isEdit)
                {
                    query = @"UPDATE CertificateOfAttendance SET 
                                StudentName=@StudentName, BornDate=@BornDate, StudiedFrom=@StudiedFrom, 
                                StudiedTo=@StudiedTo, [Year]=@Year, Faculty=@Faculty, Major=@Major, 
                                AcademicYear=@AcademicYear, ApprovedBy=@ApprovedBy, Comment=@Comment 
                                WHERE StudentID=@StudentID";
                }
                else
                {
                    query = @"INSERT INTO CertificateOfAttendance 
                                (StudentID, StudentName, BornDate, StudiedFrom, StudiedTo, [Year], Faculty, Major, AcademicYear, ApprovedBy, Comment, Status) 
                                VALUES (@StudentID, @StudentName, @BornDate, @StudiedFrom, @StudiedTo, @Year, @Faculty, @Major, @AcademicYear, @ApprovedBy, @Comment, 'Active')";
                }

                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentID", txtStudentID.Text.Trim());
                cmd.Parameters.AddWithValue("@StudentName", txtStudentName.Text.Trim());
                cmd.Parameters.AddWithValue("@BornDate", string.IsNullOrEmpty(txtBornDate.Text) ? (object)DBNull.Value : DateTime.Parse(txtBornDate.Text));
                cmd.Parameters.AddWithValue("@StudiedFrom", txtStudiedFrom.Text.Trim());
                cmd.Parameters.AddWithValue("@StudiedTo", txtStudiedTo.Text.Trim());
                cmd.Parameters.AddWithValue("@Year", txtYear.Text.Trim());
                cmd.Parameters.AddWithValue("@Faculty", txtFaculty.Text.Trim());
                cmd.Parameters.AddWithValue("@Major", txtMajor.Text.Trim());
                cmd.Parameters.AddWithValue("@AcademicYear", txtAcademicYear.Text.Trim());
                cmd.Parameters.AddWithValue("@ApprovedBy", txtApprovedBy.Text.Trim());
                cmd.Parameters.AddWithValue("@Comment", txtComment.Text.Trim());

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("Certificates.aspx");
        }
    }
}
