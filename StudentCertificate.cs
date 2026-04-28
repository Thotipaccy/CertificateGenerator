using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CertificateGenerator
{
    public class StudentCertificate
    {
        public string StudentName { get; set; }
        public DateTime? BornDate { get; set; }
        public string StudentID { get; set; }
        public string StudiedFrom { get; set; }
        public string StudiedTo { get; set; }
        public string Year { get; set; }
        public string Faculty { get; set; }
        public string Major { get; set; }
        public string AcademicYear { get; set; }
        public string ApprovedBy { get; set; }
        public string Comment { get; set; }
        public string Status { get; set; }
    }
}
