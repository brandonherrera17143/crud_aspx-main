<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="web_umg_bd._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lbl_carne" runat="server" CssClass="badge" Text="carne"></asp:Label>
    <asp:TextBox ID="txt_carne" runat="server" CssClass="form-control" placeholder="E001"></asp:TextBox>
    <asp:Label ID="lbl_nombre" runat="server" CssClass="badge" Text="Nombre"></asp:Label>
    <asp:TextBox ID="txt_nombre" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:Label ID="lbl_apellido" runat="server" CssClass="badge" Text="Apellido"></asp:Label>
    <asp:TextBox ID="txt_apellido" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:Label ID="lbl_direccion" runat="server" CssClass="badge" Text="Direccion"></asp:Label>
    <asp:TextBox ID="txt_direccion" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:Label ID="lbl_telefono" runat="server" CssClass="badge" Text="Telefono"></asp:Label>
    <asp:TextBox ID="txt_telefono" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
     <asp:Label ID="lbl_correo" runat="server" CssClass="badge" Text="Correo"></asp:Label>
    <asp:TextBox ID="txt_correo" runat="server" CssClass="form-control" Text="correo"></asp:TextBox>
    <asp:Label ID="lbl_fnacimiento" runat="server" CssClass="badge" Text="Fecha Nacimiento"></asp:Label>
    <asp:TextBox ID="txt_fn" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
    <asp:Label ID="lbl_sangre" runat="server" CssClass="badge" Text="Tipo sangre"></asp:Label>
    <asp:DropDownList ID="drop_tipos_sangre" runat="server" CssClass="form-control"></asp:DropDownList>
    <asp:Button ID="btn_agregar" runat="server" Text="Agregar" CssClass="btn btn-info btn-lg" OnClick="btn_agregar_Click" />
    <asp:Button ID="btn_modificar" runat="server" OnClick="btn_modificar_Click" Text="Modificar" CssClass="btn btn-success btn-lg" Visible="False" />
    <asp:Label ID="lbl_mensaje" runat="server" CssClass="alert-info"></asp:Label>
    <asp:GridView ID="grid_estudiantes" runat="server" AutoGenerateColumns="False" CssClass="table-condensed" DataKeyNames="id,id_tipos_sangre" OnRowDeleting="grid_estudiantes_RowDeleting" OnSelectedIndexChanged="grid_estudiantes_SelectedIndexChanged">
        <Columns>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button2" runat="server" CausesValidation="False" CommandName="Select" Text="Ver" />
                </ItemTemplate>
                <ControlStyle CssClass="btn btn-info"  />
                
            </asp:TemplateField>
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:Button ID="Button1" runat="server" CausesValidation="False" CommandName="Delete" Text="Eliminar" OnClientClick="javascript:if(!confirm('¿Desea Eliminar?'))return false" />
                </ItemTemplate>
                <ControlStyle CssClass="btn btn-danger" />
            </asp:TemplateField>
            <asp:BoundField DataField="carne" HeaderText="carne" />
            <asp:BoundField DataField="nombre" HeaderText="Nombre" />
            <asp:BoundField DataField="apellido" HeaderText="Apellido" />
            <asp:BoundField DataField="direccion" HeaderText="Direccion" />
            <asp:BoundField DataField="telefono" HeaderText="Telefono" />
            <asp:BoundField DataField="correo" HeaderText="correo" />
            <asp:BoundField DataField="fecha_nacimiento" DataFormatString="{0:d}" HeaderText="Nacimiento" />
            <asp:BoundField DataField="tipos_sangre" HeaderText="Tipos sangre" />
        </Columns>
    </asp:GridView>
</asp:Content>
