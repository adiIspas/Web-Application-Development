<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="Delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Sterge o vizita</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>

                Selecteaza ID Vizita</td>
            <td>

                <asp:DropDownList ID="vizita_id" runat="server" DataSourceID="SqlDataSource1" DataTextField="IdVizita" DataValueField="IdVizita" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IdVizita] FROM [Vizita]"></asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td colspan="2">

                <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="IDVizita">
                    <Columns>
                        <asp:BoundField DataField="IDVizita" HeaderText="IDVizita" InsertVisible="False" ReadOnly="True" SortExpression="IDVizita" />
                        <asp:BoundField DataField="IDPagina" HeaderText="IDPagina" SortExpression="IDPagina" />
                        <asp:BoundField DataField="IP" HeaderText="IP" SortExpression="IP" />
                        <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" DataFormatString="{0:MM/dd/yyyy}"/>
                        <asp:BoundField DataField="Browser" HeaderText="Browser" SortExpression="Browser" />
                        <asp:BoundField DataField="Tara" HeaderText="Tara" SortExpression="Tara" />
                        <asp:BoundField DataField="URL" HeaderText="URL" SortExpression="URL" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT v.IDVizita, v.IDPagina, v.IP, v.Data, v.Browser, v.Tara, p.URL FROM Vizita AS v INNER JOIN Pagina AS p ON (v.IDPagina = p.ID) WHERE v.IDVizita = @vizita">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="vizita_id" Name="vizita" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td colspan="2">

                <asp:Button ID="sterge_vizita" runat="server" Text="Sterge vizita" OnClick="sterge_vizita_Click" />

            </td>
        </tr>
    </table>
</asp:Content>

