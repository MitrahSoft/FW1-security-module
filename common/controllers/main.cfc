component {
	function init(fw){
		variables.fw = arguments.fw;
		return this;
	}
	
	function logout(rc){
		structClear(session);
		fwStruct = variables.fw.getConfig();
		variables.fw.redirect(fwStruct.home);
	}
}