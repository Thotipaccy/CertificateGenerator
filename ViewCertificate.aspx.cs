using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace CertificateGenerator
{
    public partial class ViewCertificate : Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;

        public string QRCodeUrl { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string studentID = Request.QueryString["id"];
                if (!string.IsNullOrEmpty(studentID))
                {
                    LoadCertificateData(studentID);
                    GenerateQRCodeLink();
                }
                else
                {
                    Response.Redirect("Certificates.aspx");
                }
            }
        }

        private void GenerateQRCodeLink()
        {
            string domain = System.Configuration.ConfigurationManager.AppSettings["DomainName"];
            string currentUrl = Request.Url.AbsoluteUri;

            if (!string.IsNullOrEmpty(domain) && domain != "localhost")
            {
                string host = Request.Url.Host;
                QRCodeUrl = currentUrl.Replace(host, domain);
            }
            else
            {
                QRCodeUrl = currentUrl;
            }
        }

        private void LoadCertificateData(string studentID)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM CertificateOfAttendance WHERE StudentID = @StudentID";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@StudentID", studentID);

                conn.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    litStudentName.Text = dr["StudentName"].ToString();
                    litBornDate.Text = dr["BornDate"] != DBNull.Value ? Convert.ToDateTime(dr["BornDate"]).ToString("MMMM dd, yyyy") : "N/A";
                    litStudentID.Text = dr["StudentID"].ToString();
                    litStudiedFrom.Text = FormatMonthYear(dr["StudiedFrom"].ToString());
                    litStudiedTo.Text = FormatMonthYear(dr["StudiedTo"].ToString());
                    litYear.Text = dr["Year"].ToString();
                    litFaculty.Text = dr["Faculty"].ToString();
                    litMajor.Text = dr["Major"].ToString();
                    litAcademicYear.Text = dr["AcademicYear"].ToString();
                    litValidity.Text = dr["AcademicYear"].ToString(); // Usually same as academic year
                    litCurrentDate.Text = DateTime.Now.ToString("MMMM dd, yyyy");
                }
                else
                {
                    // Student not found
                    Response.Write("<script>alert('Student record not found!'); window.location='Certificates.aspx';</script>");
                }
            }
        }

        private string FormatMonthYear(string value)
        {
            if (string.IsNullOrEmpty(value)) return "N/A";
            if (value.Equals("Date", StringComparison.OrdinalIgnoreCase)) return "Date";

            DateTime dt;
            if (DateTime.TryParse(value, out dt))
            {
                return dt.ToString("MMMM yyyy");
            }
            return value;
        }
    }
}
