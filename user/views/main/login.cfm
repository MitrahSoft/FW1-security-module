<cfoutput>
	<cfform format="html" method="post" action="#buildurl('user:main.loginAction')#" name=login>
	<table>
			<tr>
				<td colspan=2><h1>User login</h1></td>
			</tr>
			<tr>
				<td>Username:</td>
				<td><cfinput name="txtUsername" label="Username" type="text"></td>
			</tr>				
			<tr>
				<td>Password:</td>
				<td><cfinput name="txtPassword" label="Password" type="password"></td>
			</tr>
			<tr>
				<td colspan=2>
					<cfinput name="frmSubmit" label="Submit" type="submit" value="Login">
				</td>
			</tr>
		</table>
	</cfform>	
</cfoutput>