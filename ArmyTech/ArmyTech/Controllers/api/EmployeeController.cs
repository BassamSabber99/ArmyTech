using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Data.Entity;
using ArmyTech.Dtos;
using System.Threading.Tasks;

namespace ArmyTech.Controllers.api
{
    public class EmployeeController : ApiController
    {
        private readonly ArmyTechTaskEntities _context;
        public EmployeeController()
        {
            _context = new ArmyTechTaskEntities();
        }

        [HttpGet]
        public async Task<IHttpActionResult> GetEmployees()
        {
            var employees = await _context.Employees
                .Include(m=>m.Governorate)
                .Include(m=>m.Neighborhood)
                .Include(m=>m.CareerField)
                .Include(m=>m.CompanyJob)
                .Include(m=>m.EmployeeQualifications)
                .OrderBy(m=>m.CompanyJob.JobArrangement)
                .ToListAsync();

            var empDto = new List<EmployeeDto>();
          
            for (int i = 0; i < employees.Count; i++)
            {
                var tmp = new EmployeeDto();
                tmp.id = employees[i].ID;
                tmp.name = employees[i].Name;
                if (employees[i].Address == null)
                {
                    tmp.adress = "لم يتم التحديد  ";
                }
                else
                {
                    tmp.adress = employees[i].Address;
                }

                if (employees[i].CareerField == null)
                {
                    tmp.careerfield = "لم يتم التحديد  ";
                }
                else
                {
                    tmp.careerfield = employees[i].CareerField.Name;
                }

                if (employees[i].CompanyJobId == null)
                {
                    tmp.companyjob = "لم يتم التحديد  ";
                }
                else
                {
                    tmp.companyjob = employees[i].CompanyJob.Name;
                }

                tmp.governorate = employees[i].Governorate.Name;
                tmp.neighborhood = employees[i].Neighborhood.Name;
               
                tmp.qualification = employees[i].EmployeeQualifications.Select(m => m.Qualification.Name);
                
                
                empDto.Add(tmp);
            }


            return Ok(empDto);
        }

        [HttpDelete]
        public async Task<IHttpActionResult> DeleteEmployee(int id)
        {
            var emp = await _context.Employees.SingleOrDefaultAsync(e => e.ID == id);
            _context.Employees.Remove(emp);
            var qualification = await _context.EmployeeQualifications.Where(e => e.EmployeeId == id).ToListAsync();
            foreach(var q in qualification)
            {
                _context.EmployeeQualifications.Remove(q);
            }
            _context.SaveChanges();
            return Ok();
        }
    }
}
