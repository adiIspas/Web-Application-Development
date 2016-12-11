<%@ Page Title="" Language="C#" MasterPageFile="~/master_page.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
        function getServerTime() {
            PageMethods.GetTimeOnServer(onSucess, onError);
            function onSucess(result) {
                document.getElementById('myTextBox').value = result;
            }
            function onError(result) {
                document.getElementById('myTextBox').value = "Something wrong.";
            }
        }
    </script>

    <script type="text/javascript">
        function getCities(judet) {
            PageMethods.GetCities(judet, onSucess, onError);
                function onSucess(result) {
                    document.getElementById('judet').value = result;
                }
                function onError(result) {
                    document.getElementById('judet').value = "Something wrong.";
                }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        Bun venit!
    </p>

    <p>
        <input type="text" id="myTextBox"/> 
        <input type="button" onclick="getServerTime()" value="Time" />
    </p>

    <p>
        <input type="text" id="judet"/> 
        <input type="text" id="nume" value="bucuresti"/>
        <input type="button" onclick="getCities('\'' + nume.value + '\'')" value="Orase" />
    </p>

</asp:Content>


        

