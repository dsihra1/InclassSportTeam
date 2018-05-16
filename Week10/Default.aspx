<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:SqlDataSource ID="dsPlayers" runat="server" ConnectionString="<%$ ConnectionStrings:devon_SportDatabaseConnectionString %>" DeleteCommand="DELETE FROM [Player] WHERE [playerID] = @playerID" InsertCommand="INSERT INTO [Player] ([playerFirstName], [playerLastName], [playerDoB], [playerPhone], [playerTeamID]) VALUES (@playerFirstName, @playerLastName, @playerDoB, @playerPhone, @playerTeamID)" SelectCommand="SELECT Player.*, Team.teamName FROM Player INNER JOIN Team ON Player.playerTeamID = Team.teamID" UpdateCommand="UPDATE [Player] SET [playerFirstName] = @playerFirstName, [playerLastName] = @playerLastName, [playerDoB] = @playerDoB, [playerPhone] = @playerPhone, [playerTeamID] = @playerTeamID WHERE [playerID] = @playerID">
            <DeleteParameters>
                <asp:Parameter Name="playerID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="playerFirstName" Type="String" />
                <asp:Parameter Name="playerLastName" Type="String" />
                <asp:Parameter DbType="Date" Name="playerDoB" />
                <asp:Parameter Name="playerPhone" Type="String" />
                <asp:Parameter Name="playerTeamID" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="playerFirstName" Type="String" />
                <asp:Parameter Name="playerLastName" Type="String" />
                <asp:Parameter DbType="Date" Name="playerDoB" />
                <asp:Parameter Name="playerPhone" Type="String" />
                <asp:Parameter Name="playerTeamID" Type="Int32" />
                <asp:Parameter Name="playerID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" DataKeyNames="playerID" DataSourceID="dsPlayers" GridLines="None" Height="50px" Width="125px">
            <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="playerID" HeaderText="playerID" InsertVisible="False" ReadOnly="True" SortExpression="playerID" />
                <asp:BoundField DataField="playerFirstName" HeaderText="playerFirstName" SortExpression="playerFirstName" />
                <asp:BoundField DataField="playerLastName" HeaderText="playerLastName" SortExpression="playerLastName" />
                <asp:BoundField DataField="playerDoB" HeaderText="playerDoB" SortExpression="playerDoB" />
                <asp:BoundField DataField="playerPhone" HeaderText="playerPhone" SortExpression="playerPhone" />
                <asp:BoundField DataField="playerTeamID" HeaderText="playerTeamID" SortExpression="playerTeamID" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
            </Fields>
            <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
            <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
        </asp:DetailsView>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="playerID" DataSourceID="dsPlayers">
            <Columns>
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure?');" Text="Delete"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="playerFirstName" HeaderText="First Name" SortExpression="playerFirstName" />
                <asp:BoundField DataField="playerLastName" HeaderText="Last Name" SortExpression="playerLastName" />
                <asp:TemplateField HeaderText="Birth Date" SortExpression="playerDoB">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("playerDoB", "{0:d}") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Enter a birth date" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="Enter a valid date" ForeColor="Red" Operator="DataTypeCheck" Type="Date">*</asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("playerDoB", "{0:d}") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="playerPhone" HeaderText="Phone Number" SortExpression="playerPhone" />
                <asp:TemplateField HeaderText="Team" SortExpression="teamName">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="dsTeamList" DataTextField="teamName" DataValueField="teamID" SelectedValue='<%# Bind("playerTeamID") %>'>
                        </asp:DropDownList>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("teamName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsTeamList" runat="server" ConnectionString="<%$ ConnectionStrings:devon_SportDatabaseConnectionString2 %>" SelectCommand="SELECT [teamID], [teamName] FROM [Team] ORDER BY [teamName]"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
