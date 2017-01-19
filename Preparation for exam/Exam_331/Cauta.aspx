<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Cauta.aspx.vb" Inherits="Cauta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Cauta evenimente</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>

                Titlu</td>
            <td>

                <asp:TextBox ID="titlu_eveniment" runat="server" AutoPostBack="True"></asp:TextBox>

            </td>
        </tr>
         <tr>
            <td>

                Data</td>
            <td>

                <asp:TextBox ID="data_eveniment" runat="server" AutoPostBack="True" TextMode="Date"></asp:TextBox>

            </td>
        </tr>
         <tr>
            <td>

                Locatie</td>
            <td>

                <asp:TextBox ID="nume_locatie" runat="server" AutoPostBack="True"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="cauta_eveniment" runat="server" Text="Cauta eveniment" />
            </td>
        </tr>
        <tr>
            <td colspan="2">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="Titlu" HeaderText="Titlu" SortExpression="Titlu" />
                        <asp:BoundField DataField="Descriere" HeaderText="Descriere" SortExpression="Descriere" />
                        <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" />
                        <asp:BoundField DataField="NrLocuri" HeaderText="NrLocuri" SortExpression="NrLocuri" />
                        <asp:BoundField DataField="DenumireLoc" HeaderText="DenumireLoc" SortExpression="DenumireLoc" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT e.Titlu, e.Descriere, e.Data, e.NrLocuri, l.DenumireLoc FROM Eveniment AS e INNER JOIN Locatie AS l ON e.IdLocatie = l.IdLocatie WHERE (e.Titlu LIKE CONCAT('%', CONCAT(@titlu, '%'))) OR e.Data = @data OR(l.DenumireLoc LIKE CONCAT('%', CONCAT(@loc, '%')))">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="titlu_eveniment" DefaultValue="''" Name="titlu" PropertyName="Text" />
                        <asp:ControlParameter ControlID="data_eveniment" DefaultValue="" Name="data" PropertyName="Text" />
                        <asp:ControlParameter ControlID="nume_locatie" DefaultValue="''" Name="loc" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
    </table>
</asp:Content>

