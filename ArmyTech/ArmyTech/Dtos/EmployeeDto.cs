using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ArmyTech.Dtos
{
    public class EmployeeDto
    {
        public int id { get; set; } 
        public string name { get; set; } 
        public string adress { get; set; } 
        public string governorate { get; set; } 
        public string neighborhood { get; set; } 
        public string careerfield { get; set; } 
        public string companyjob { get; set; } 
        public IEnumerable<string> qualification { get; set; } 
        
    }
}