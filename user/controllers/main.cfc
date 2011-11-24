component {
	function init(fw){
		variables.fw = arguments.fw;
		return this;
	}
	
	function loginAction(rc){
		
		// Do DB check 
		session.userrole = "user";
		variables.fw.redirect('user:main.default');
	}
}