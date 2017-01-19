<%@ Page Title="" Language="C#" MasterPageFile="~/MP.master" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="Delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Sterge o factura</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>

                Selecteaza id factura</td>
            <td>

                <asp:DropDownList ID="id_factura_sterge" runat="server" DataSourceID="SqlDataSource1" DataTextField="IdFactura" DataValueField="IdFactura" AutoPostBack="True">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [IdFactura] FROM [Factura]"></asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td>
                Informatii despre factura selectata
            </td>
            <td>

                <asp:GridView ID="informatii_factura" runat="server" DataSourceID="SqlDataSource2" AutoGenerateColumns="False" DataKeyNames="IdFactura">
                    <Columns>
                        <asp:BoundField DataField="IdFactura" HeaderText="IdFactura" InsertVisible="False" ReadOnly="True" SortExpression="IdFactura" />
                        <asp:BoundField DataField="IdBeneficiar" HeaderText="IdBeneficiar" SortExpression="IdBeneficiar" />
                        <asp:BoundField DataField="Detalii" HeaderText="Detalii" SortExpression="Detalii" />
                        <asp:BoundField DataField="DataEmitere" HeaderText="DataEmitere" SortExpression="DataEmitere" />
                        <asp:BoundField DataField="Valoare" HeaderText="Valoare" SortExpression="Valoare" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Factura] WHERE ([IdFactura] = @IdFactura)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="id_factura_sterge" Name="IdFactura" PropertyName="SelectedValue" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td colspan ="2">
                <asp:Button ID="sterge" runat="server" Text="Sterge factura" Width="124px" OnClick="sterge_Click" />
            </td>
        </tr>
    </table>
</asp:Content>

