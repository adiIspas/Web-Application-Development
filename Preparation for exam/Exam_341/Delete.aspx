<%@ Page Title="" Language="C#" MasterPageFile="~/Head.master" AutoEventWireup="true" CodeFile="Delete.aspx.cs" Inherits="Delete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <h2>Sterge o planificare pentru asflatare</h2>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Selecteaza id drum
    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="Id" DataValueField="Id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="height: 22px" AutoPostBack="True">
        
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id] FROM [Drumuri]"></asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="SqlDataSource2" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
            <asp:BoundField DataField="IdDrum" HeaderText="IdDrum" SortExpression="IdDrum" />
            <asp:BoundField DataField="Cost" HeaderText="Cost" SortExpression="Cost" />
            <asp:BoundField DataField="Data" HeaderText="Data" SortExpression="Data" DataFormatString="{0:MM/dd/yyyy}"/>
        </Columns>
    </asp:GridView>

    <br />

    <table>
        <tr>
            <td>

                IdPlanificare</td>
            <td>

                <asp:DropDownList ID="id_planificare" runat="server" DataSourceID="SqlDataSource3" DataTextField="Id" DataValueField="Id">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [Id] FROM [Planificari]"></asp:SqlDataSource>

            </td>
        </tr>
        <tr>
            <td colspan="2">

                <asp:Button ID="sterge" runat="server" OnClick="Button1_Click" Text="Sterge date planificare" Width="191px" />

            </td>
        </tr>
    </table>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Planificari] WHERE ([IdDrum] = @IdDrum)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="IdDrum" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

