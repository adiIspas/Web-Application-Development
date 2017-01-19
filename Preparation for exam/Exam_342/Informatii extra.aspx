<%@ Page Title="" Language="C#" MasterPageFile="~/MP.master" AutoEventWireup="true" CodeFile="Informatii extra.aspx.cs" Inherits="Informatii_extra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Informatii extra</h2>
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
          <tr>
              <td>

                  Valoare vanzari</td>
              <td>

                  <asp:TextBox ID="valoare" runat="server" TextMode="Number"></asp:TextBox>

              </td>
          </tr>
        <tr>
            <td class="auto-style1">

                Data</td>
            <td class="auto-style1">

                <asp:TextBox ID="data" runat="server" TextMode="Date"></asp:TextBox>

            </td>
        </tr>
        <tr>
            <td colspan="2">

                <asp:Button ID="genereaza" runat="server" Text="Genereaza" />

            </td>
        </tr>
        <tr>
            <td colspan="2"> 

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="Nume" HeaderText="Nume" SortExpression="Nume" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT b.Nume FROM Beneficiar AS b INNER JOIN Factura AS f ON(b.IdBeneficiar = f.IdBeneficiar) GROUP BY b.Nume, f.DataEmitere HAVING (SUM(f.Valoare) &gt;= @valoare AND f.DataEmitere &gt;= @data) ">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="valoare" DefaultValue="0" Name="valoare" PropertyName="Text" />
                        <asp:ControlParameter ControlID="data" DefaultValue="01.01.1900" Name="data" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>

            </td>
        </tr>
    </table>
</asp:Content>

