<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CautareVizite.aspx.cs" Inherits="CautareVizite" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Cauta o vizita</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>

                URL</td>
            <td>

                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td>

                Tara</td>
            <td>

                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td colspan="2">

                <asp:Button ID="cauta" runat="server" Text="Cauta vizite" Width="135px" />

            </td>
        </tr>
        <tr>
            <td colspan="2">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="IDVizita" DataSourceID="SqlDataSource1">
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

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT v.IDVizita, v.IDPagina, v.IP, v.Data, v.Browser, v.Tara, p.URL FROM Vizita AS v INNER JOIN Pagina AS p ON (v.IDPagina = p.ID) WHERE (p.URL LIKE CONCAT('%', CONCAT(@url_site, '%')) OR v.Tara LIKE CONCAT('%', CONCAT(@tara_vizita, '%')))  ORDER BY v.Data ASC">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="TextBox1" DefaultValue="''" Name="url_site" PropertyName="Text" />
                        <asp:ControlParameter ControlID="TextBox2" DefaultValue="''" Name="tara_vizita" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
    </table>
</asp:Content>

