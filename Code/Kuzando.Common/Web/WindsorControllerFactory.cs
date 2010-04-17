﻿using System.Web.Mvc;
using System.Web.Routing;
using Castle.Windsor;

namespace Kuzando.Common.Web
{
    public class WindsorControllerFactory : IControllerFactory
    {
        private readonly WindsorContainer _container;

        public WindsorControllerFactory(WindsorContainer container)
        {
            _container = container;
        }

        public IController CreateController(RequestContext requestContext, string controllerName)
        {
            return (IController)_container.Resolve(controllerName);
        }

        public void ReleaseController(IController controller)
        {
            _container.Release(controller);
        }
    }
}
