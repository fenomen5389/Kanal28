<%@ Page Title="Profilim" Async="true" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="Kanal28.Admin.Profile" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">
    <div class="header bg-primary pb-6">
        <div class="container-fluid">
            <div class="header-body">
                <div class="row align-items-center py-4">
                    <div class="col-lg-6 col-7">
                        <h6 class="h2 text-white d-inline-block mb-0">Profilim</h6>
                        <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                            <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                                <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                                <li class="breadcrumb-item"><a href="#">Haberium</a></li>
                                <li class="breadcrumb-item active" aria-current="page"><%= ((Kanal28.Entities.Author)Session["INet_User"]).FirstName %> <%= ((Kanal28.Entities.Author)Session["INet_User"]).LastName %></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container-fluid mt--6">
        <div class="row">
            <div class="col">
                <div class="card">
                    <div class="card-header border-0">
                        <h3 class="mb-0">Hoş geldiniz, <%= ((Kanal28.Entities.Author)Session["INet_User"]).FirstName %> <%= ((Kanal28.Entities.Author)Session["INet_User"]).LastName %>
                        </h3>
                    </div>
                    <div class="card-body border-0 pt-0">
                        <h6 class="heading-small text-muted mb-2">Yazar Bilgileri</h6>
                        <div class="row">
                            <div class="col-lg-6">
                                <label class="form-control-label" for="input-first-name">İsim</label>
                                <asp:TextBox ID="Author_FirstName" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                <label class="form-control-label" for="input-first-name">Soyisim</label>
                                <asp:TextBox ID="Author_LastName" CssClass="form-control" placeholder="" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-last-name">Görünür İsim</label>
                                    <%--<input type="text" id="input-last-name" class="form-control">--%>
                                    <asp:TextBox ID="Author_VisibleName" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                        <h6 class="heading-small text-muted mb-2">iletişim</h6>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-address">E-Posta</label>
                                    <%--<input id="input-address" class="form-control" type="email">--%>
                                    <asp:TextBox ID="Author_Email" CssClass="form-control" TextMode="Email" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <h6 class="heading-small text-muted mb-2">Hakkında</h6>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-first-name">Biyografi</label>
                                    <%--<textarea class="form-control" rows="6"></textarea>--%>
                                    <asp:TextBox ID="Author_Biography" TextMode="MultiLine" Rows="6" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>

                        <asp:Button ID="Author_Save" runat="server" OnClick="Author_Save_Click" CssClass="btn btn-primary btn-sm" Text="Kaydet" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Scripts" ContentPlaceHolderID="AdditionalScripts" runat="server">
</asp:Content>
