component {
	function init(fw){
		variables.fw = arguments.fw;
		return this;
	}
	
	function loginAction(rc){
		
		// Do DB check 
		session.userrole = "admin";
		variables.fw.redirect('admin:main.default');
	}
}