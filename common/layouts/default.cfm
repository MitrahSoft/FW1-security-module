
<cfoutput>
	
	<a href="#buildurl('common:main.logout')#">Clear session</a> |
	<a href="#buildurl('user:main.loginAction')#">Set user session</a> |
	<a href="#buildurl('admin:main.loginAction')#">Set admin session</a>  
	
	<cfif structkeyexists(session, "userrole")>
	<h4>Current user role : #session.userrole#</h4>
	</cfif>
	#body#
	<a href="#buildurl('admin:main.default')#">Try to see admin page</a> |
	<a href="#buildurl('user:main.default')#">Try to see user page</a> |
	<a href="#buildurl('public:main.default')#">Try to see public page</a> 

</cfoutput>