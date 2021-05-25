using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ArmyTech.Controllers.api
{
    public class NeighborhoodController : ApiController
    {
        private readonly ArmyTechTaskEntities _context;
        public NeighborhoodController()
        {
            _context = new ArmyTechTaskEntities();
        }
        [HttpGet]
        public IHttpActionResult GetNeighborhood(int id)
        {
            var neighbor = _context.Neighborhoods.Where(x=>x.GovernorateId == id).Select(x=>new { id = x.ID  ,name = x.Name }).ToList();
            return Ok(neighbor);
        }
    }
}
