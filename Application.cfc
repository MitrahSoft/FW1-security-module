component extends="org.corfield.framework" output="false"{
	
	this.name = "Simple FW1 security";
	this.sessionmanagement = true;
	this.mappings["/model"] = getDirectoryFromPath(getCurrentTemplatePath())&'model\';
	
	variables.framework = {
		defaultSubsystem = 'public',
		usingSubsystems = true,
		error =  'common:error.error',
		siteWideLayoutSubsystem = "common",
		reloadApplicationOnEveryRequest = true
	};
	
	function setupRequest(){
		securityService = createobject("component", "model.Services.Security").init(this);
		securityService.checkUser(request.action,session,"userrole");
	}
	
}