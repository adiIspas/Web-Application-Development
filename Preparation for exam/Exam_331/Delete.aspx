<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="Delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Sterge un eveniment programat</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>

                Selecteaza id-ul unui eveniment</td>
            <td>

                <asp:DropDownList ID="id_eveniment" runat="server" DataSourceID="SqlDataSource1" DataTextField="IdEveniment" DataValueField="IdEveniment" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IdEveniment] FROM [Eveniment]"></asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td colspan="2">

                <asp:GridView ID="informatii_eveniment" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="IdEveniment">
                    <Columns>
                        <asp:BoundField DataField="IdEveniment" HeaderText="IdEveniment" InsertVisible="False" ReadOnly="True" SortExpression="IdEveniment" />
                        <asp:BoundField DataField="Titlu" HeaderText="Titlu" SortExpression="Titlu" />
                        <asp:BoundField DataField="Descriere" HeaderText="Descriere" SortExpression="Descriere" />
                        <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" />
                        <asp:BoundField DataField="NrLocuri" HeaderText="NrLocuri" SortExpression="NrLocuri" />
                        <asp:BoundField DataField="IdLocatie" HeaderText="IdLocatie" SortExpression="IdLocatie" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Eveniment] WHERE ([IdEveniment] = @IdEveniment)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="id_eveniment" Name="IdEveniment" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td colspan="2">

                <asp:Button ID="delete_event" runat="server" OnClick="delete_Click" Text="Sterge evenimentul selectat" Width="191px" />

            </td>
        </tr>
    </table>
</asp:Content>

