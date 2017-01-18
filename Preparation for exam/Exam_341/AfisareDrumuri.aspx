<%@ Page Title="" Language="C#" MasterPageFile="~/Head.master" AutoEventWireup="true" CodeFile="AfisareDrumuri.aspx.cs" Inherits="AfisareDrumuri" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Afisare drumuri</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <table>
       <tr>
           <td>

               Data inceput</td>
           <td>

               <asp:TextBox ID="data_inceput" runat="server"></asp:TextBox>
               <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="data_inceput" ErrorMessage="Data inceput incorecta!" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>

           </td>
       </tr>
       <tr>
           <td style="height: 30px">

               Data sfarsit</td>
           <td style="height: 30px">

               <asp:TextBox ID="data_sfarsit" runat="server"></asp:TextBox>

               <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="data_sfarsit" ErrorMessage="Data sfarsit incorecta!" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>

           </td>
       </tr>
       <tr>
           <td colspan="2">
               <asp:Button ID="cauta" runat="server" Text="Cauta" />
           </td>
       </tr>
   </table>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Numele" HeaderText="Numele" SortExpression="Numele" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT d.Numele FROM Planificari AS p INNER JOIN Drumuri AS d ON p.IdDrum = d.Id WHERE ((p.Data &gt;= @Data) AND (p.Data &lt;= @Data2))">
        <SelectParameters>
            <asp:ControlParameter ControlID="data_inceput" DbType="Date" Name="Data" PropertyName="Text" />
            <asp:ControlParameter ControlID="data_sfarsit" DbType="Date" Name="Data2" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

