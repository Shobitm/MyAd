<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Password Strength Example</title>
<style type="text/css">
.VeryPoorStrength
{
background: Red;
color:White;
font-weight:bold;
}
.WeakStrength
{
background: Gray;
color:White;
font-weight:bold;
}
.AverageStrength
{
background: orange;
color:black;
font-weight:bold;
}
.GoodStrength


{
background: blue;
color:White;
font-weight:bold;
}
.ExcellentStrength

{
background: Green;
color:White;
font-weight:bold;
}
.BarBorder
{
border-style: solid;
border-width: 1px;
width: 180px;
padding:2px;
}
</style>
</head>
<body>
<form id="form1" runat="server">
<asp:ScriptManager ID="ScriptManger1" runat="server"></asp:ScriptManager>
<div>
<table>
<tr>
<td>
Enter Password:
</td>
<td>
<asp:TextBox runat="server" ID="txtPassword" TextMode="Password"/>
</td>
</tr>
<tr>
<td></td>
<td>
<asp:Label ID="lblhelp" runat="server"/>
</td>
</tr>

</table> 
<ajax:PasswordStrength ID="pwdStrength" TargetControlID="txtPassword" StrengthIndicatorType="Text" PrefixText="Strength:" HelpStatusLabelID="lblhelp" PreferredPasswordLength="8"
MinimumNumericCharacters="1" MinimumSymbolCharacters="1" TextStrengthDescriptions="Very Poor;Weak;Average;Good;Excellent" TextStrengthDescriptionStyles="VeryPoorStrength;WeakStrength;
AverageStrength;GoodStrength;ExcellentStrength" runat="server" />

</div>
</form>
</body>
</html>
