# FW1 security module

FW1 simple role based security module


## How?

Set up your role based access in security.cfc
<pre>
variables.rules = [ 
	{whitelist = "^admin:main.login,^admin:main.loginAction,^admin:main.noaccess" , securelist = "^admin:*", roles = "admin", redirect = "admin:main.login",  noaccess="admin:main.noaccess"},
	{whitelist = "^user:main.login,^user:main.loginAction,^user:main.noaccess" , securelist = "^user:*", roles = "admin,user", redirect = "user:main.login", noaccess="user:main.noaccess"},
	{whitelist = "^public:*" , securelist = "", roles = ""}
];
</pre>

## Should I fork this and improve it?

Yes, right now.

### Copyright

Do what ever you want ;)