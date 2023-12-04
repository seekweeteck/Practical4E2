<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeesSales.aspx.cs" Inherits="Practical4E2.EmployeesSales" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td>Name</td>
                    <td>:</td>
                    <td> <asp:DropDownList runat="server" DataSourceID="sdsNames" ID="ddlName" DataTextField="Name" DataValueField="EmployeeID"></asp:DropDownList></td>
                </tr>
                <tr>
                    <td>Year</td>
                    <td>:</td>
                    <td>
                        <asp:RadioButtonList ID="rblYear" runat="server" DataTextField="Years" DataValueField="Years" DataSourceID="sdsYears">
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;<asp:Button runat="server" Text="Search" ID="btnSearch" OnClick="btnSearch_Click"></asp:Button></td>
                </tr>
            </table>
            <asp:GridView runat="server" ID="grvOrders" DataSourceID="sdsOrders">
                <Columns>
                    <asp:CommandField ShowSelectButton="True"></asp:CommandField>
                </Columns>
            </asp:GridView>
           
            
            <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT CONCAT(FirstName, CONCAT(' ', LastName)) As Name, EmployeeID
FROM Employees"
                ID="sdsNames"></asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="sdsYears" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT DISTINCT YEAR(OrderDate) As Years
FROM Orders
ORDER BY Years ASC"></asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="sdsOrders" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT OrderID, OrderDate FROM Orders WHERE (EmployeeID = @EmployeeID) AND (YEAR(OrderDate) = @Year)">
                <SelectParameters>
                    <asp:Parameter Name="EmployeeID"></asp:Parameter>
                    <asp:Parameter Name="Year"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource runat="server" ID="sdsOrderDetails" OnSelecting="sdsOrderDetails_Selecting" ConnectionString="<%$ ConnectionStrings:NORTHWNDConnectionString %>" SelectCommand="SELECT [Order Details].OrderID, [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, Products.ProductName(([Order Details].UnitPrice * [Order Details].Quantity) * (1 - [Order Details].Discount)) AS Sales FROM [Order Details] INNER JOIN Products ON [Order Details].ProductID = Products.ProductID WHERE ([Order Details].OrderID = @OrderID)">
                <SelectParameters>
                    <asp:Parameter Name="OrderID"></asp:Parameter>
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
