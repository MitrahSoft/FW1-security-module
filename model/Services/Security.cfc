component output="false" {
	variables.fw = '';
	variables.rules = [ 
		{whitelist = "^admin:main.login,^admin:main.loginAction,^admin:main.noaccess" , securelist = "^admin:*", roles = "admin", redirect = "admin:main.login",  noaccess="admin:main.noaccess"},
		{whitelist = "^user:main.login,^user:main.loginAction,^user:main.noaccess" , securelist = "^user:*", roles = "admin,user", redirect = "user:main.login", noaccess="user:main.noaccess"},
		{whitelist = "^public:*" , securelist = "", roles = ""}
	];
	
	public any function init( required any fw ) {
    	variables.fw = arguments.fw;
    	return this;
  	}
  
	public any function checkUser(currentAction,sessionStruct,rolekey)  {
        //writeDump(arguments);abort;
        var loggedin = isstruct(arguments.sessionStruct) and structkeyexists(arguments.sessionStruct, arguments.rolekey);
        var rulesLen = arrayLen(rules);
        var securearea = true;
        
		for(x=1; x lte rulesLen; x=x+1){
		   	if(rules[x].roles eq "" or isActionInPattern (arguments.currentAction, rules[x].whitelist))
	      		continue;
	      	if(isActionInPattern (arguments.currentAction, rules[x].securelist)){
	      		if(!loggedin)
	      			variables.fw.redirect(rules[x].redirect);
	      		if( loggedin and listFindNoCase(rules[x].roles,arguments.sessionStruct[arguments.rolekey]) eq 0)
	      			variables.fw.redirect(rules[x].noaccess);
	      	}  		
		}
  	}
  	
	private boolean function isActionInPattern(currentAction, patternList){
		
		for ( var unsecured in ListToArray( patternList ) ) 	{
	        if ( ReFindNoCase( unsecured, currentAction ) != 0)
	        	return true;        
      	}
      	return false;
  	}
  
	
}