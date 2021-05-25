using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace ArmyTech.ViewModels
{
    public class EmployeeViewModels
    {
        public int id { get; set; }
        [Display(Name = "الاسم")]
        public string name { get; set; }
        [Display(Name = "العنوان")]
        public string address { get; set; }
        [Display(Name ="المحافظة")]
        public int? Governorateid { get; set; }
        public IEnumerable<Governorate> Governorate { get; set; }
        [Display(Name = "المنطقة")]
        public int? Neighborhoodid { get; set; }
        public IEnumerable<Neighborhood> Neighborhood { get; set; }
        [Display(Name = "المجال الوظيفي")]
        public int? CareerFieldid { get; set; }
        public IEnumerable<CareerField> CareerField { get; set; }
        [Display(Name = "الوظيفة")]
        public int? Companyjobid { get; set; }
        public IEnumerable<CompanyJob> CompanyJob { get; set; }
        [Display(Name ="ألمؤهلات")]
        public List<int> qualificationid { get; set; }
        public IEnumerable<Qualification> Qualification { get; set; }
        public IEnumerable<Qualification> QualificationsEmp { get; set; }

    }
}