
# App Service vs App Service Plan

A web app running in Azure typically uses Azure App Service to provide the hosting environment.
App Service can arrange for multiple instances of the web app to run and will load balance incoming requests across these instances.
Each instance runs on a virtual machine.

The resources available to each instance are defined by an App Service plan.
The App Service plan specifies the operating system (Windows or Linux), the hardware (memory, CPU processing capacity, disk storage, and so on), and the availability of services like automatic backup and restore.

Azure provides a series of well-defined App Service plan tiers.

When you create a web app, you can either create a new App Service plan or use an existing one.
If you select an existing plan, any other web apps that use the same plan will share resources with your web app.
They'll all scale together, so they need to have the same scaling requirements.
If your apps have different requirements, use a separate App Service plan for each one.
