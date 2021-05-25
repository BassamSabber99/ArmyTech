using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Data.Entity;
using System.Security.Cryptography.X509Certificates;
using System.Web.Mvc;
using ArmyTech.ViewModels;

namespace ArmyTech.Controllers
{
    public class CrudeController : Controller
    {
        private readonly ArmyTechTaskEntities _context;

        public CrudeController()
        {
            _context = new ArmyTechTaskEntities();
        }
        protected override void Dispose(bool disposing)
        {
            _context.Dispose();
        }
        // GET: Crude
        public ActionResult Index()
        {
            
            return View();
        }
        public ActionResult Add()
        {
            ViewBag.pageTitle = "اضافة موظف";
            var empVm = new EmployeeViewModels
            {
                Governorate = _context.Governorates.ToList(),
                Neighborhood = _context.Neighborhoods.ToList(),
                CareerField = _context.CareerFields.ToList(),
                CompanyJob = _context.CompanyJobs.ToList(),
                Qualification = _context.Qualifications.ToList(),
                QualificationsEmp = null
                
            };
            return View(empVm);
        }
        public ActionResult Edit(int id)
        {
            ViewBag.pageTitle = "تعديل موظف";
            var emp = _context.Employees.SingleOrDefault(e => e.ID == id);
            var empVm = new EmployeeViewModels
            {
                id = emp.ID,
                name = emp.Name,
                address = emp.Address,
                CareerFieldid = emp.CareerFieldId,
                Companyjobid = emp.CompanyJobId,
                Governorateid = emp.BirthGovernorateId,
                Neighborhoodid = emp.BirthNeighborhoodId,
                Governorate = _context.Governorates.ToList(),
                Neighborhood = _context.Neighborhoods.ToList(),
                CareerField = _context.CareerFields.ToList(),
                CompanyJob = _context.CompanyJobs.ToList(),
                Qualification = _context.Qualifications.ToList(),
                QualificationsEmp = _context.EmployeeQualifications.Where(m => m.EmployeeId == id).Select(x=>x.Qualification).ToList()
            };
            return View("add",empVm);
        }
        [HttpPost]
        public JsonResult Save(EmployeeViewModels empVm,List<int>qualifications)
        {
            if(empVm.id == 0)
            {
                var employee = new Employee();
                employee.Name = empVm.name;
                employee.BirthNeighborhoodId = (int)empVm.Neighborhoodid;
                employee.BirthGovernorateId = (int)empVm.Governorateid; 
                employee.CareerFieldId = empVm.CareerFieldid;
                employee.Address = empVm.address;
                employee.CompanyJobId = empVm.Companyjobid;
                _context.Employees.Add(employee);
                if (qualifications != null)
                {
                    for (int i = 0; i < qualifications.Count; i++)
                    {
                        var empQ = new EmployeeQualification();
                        empQ.EmployeeId = employee.ID;
                        empQ.QualificationId = qualifications[i];
                        _context.EmployeeQualifications.Add(empQ);
                    }
                }
            }
            else
            {
                var empInDb = _context.Employees.SingleOrDefault(m => m.ID == empVm.id);
                empInDb.Name = empVm.name;
                empInDb.Address = empVm.address;
                empInDb.BirthNeighborhoodId =(int) empVm.Neighborhoodid;
                empInDb.BirthGovernorateId = (int)empVm.Governorateid;
                empInDb.CareerFieldId = empVm.CareerFieldid;
                empInDb.CompanyJobId = empVm.Companyjobid;
                if (qualifications != null)
                {
                    var ls = _context.EmployeeQualifications.Where(x => x.EmployeeId == empVm.id).ToList();
                    for (int i = 0; i < ls.ToList().Count; i++)
                    {
                        _context.EmployeeQualifications.Remove(ls[i]);
                    }


                    for (int i = 0; i < qualifications.Count; i++)
                    {
                        var empQ = new EmployeeQualification();
                        empQ.EmployeeId = empVm.id;
                        empQ.QualificationId = qualifications[i];
                        _context.EmployeeQualifications.Add(empQ);
                    }
                }
                else
                {
                    var ls = _context.EmployeeQualifications.Where(x => x.EmployeeId == empVm.id).ToList();
                    for (int i = 0; i < ls.ToList().Count; i++)
                    {
                        _context.EmployeeQualifications.Remove(ls[i]);
                    }
                }
            }
            _context.SaveChanges();
            return Json("done");
        }
    }
}