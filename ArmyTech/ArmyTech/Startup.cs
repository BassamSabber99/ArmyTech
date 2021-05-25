using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ArmyTech.Startup))]
namespace ArmyTech
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
