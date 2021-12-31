<%@ Page Title="Yazarlar" Async="true" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Authors.aspx.cs" Inherits="Kanal28.Admin.Authors" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">
    <div class="header bg-primary pb-6">
        <div class="container-fluid">
            <div class="header-body">
                <div class="row align-items-center py-4">
                    <div class="col-lg-6 col-7">
                        <h6 class="h2 text-white d-inline-block mb-0">Yazarlar</h6>
                        <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                            <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                                <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                                <li class="breadcrumb-item"><a href="#">Haberium</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Yazarlar</li>
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
                    <!-- Card header -->
                    <div class="card-header border-0">
                        <h3 class="mb-0">Yazar Tablosu
                            <a href="?AddNew=true" class="btn btn-primary btn-sm float-right"><i class="fa fa-plus mr-2"></i>Yeni</a>
                        </h3>
                    </div>
                    <!-- Light table -->
                    <div class="table-responsive" style="min-height: 500px;">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col" class="sort" data-sort="name">ADI</th>
                                    <th scope="col" class="sort" data-sort="budget">SOYADI</th>
                                    <th scope="col" class="sort" data-sort="status">E-POSTA</th>
                                    <th scope="col">GÖRÜNÜR İSİM</th>
                                    <th scope="col" class="sort" data-sort="completion">BİYOGRAFİ</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody class="list">
                                <% foreach (Kanal28.Entities.Author author in AllAuthors)
                                    { %>

                                <tr>
                                    <td scope="row">
                                        <span class="name mb-0 text-sm"><%= author.FirstName %></span>

                                    </td>
                                    <td class="budget"><%= author.LastName%>
                                    </td>
                                    <td>
                                        <%= author.Email %>
                                    </td>
                                    <td>
                                        <%= author.VisibleName %>
                                    </td>

                                    <td>
                                        <%= author.Biography %>
                                    </td>
                                    <td class="text-right">
                                        <div class="dropdown">
                                            <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-ellipsis-v"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                                <a href="?Edit=<%= author.Id %>" class="dropdown-item">Düzenle</a>
                                                <a href="?Delete=<%= author.Id %>" class="dropdown-item">Sil</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <% }
%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%      if (!string.IsNullOrEmpty(Request.QueryString["Edit"]))
        { %>
    <div class="modal fade" id="fastEditor" tabindex="-1" role="dialog" aria-labelledby="Hızlı Düzenleyici" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Author Editor <span class="badge badge-badge-info bg-primary text-white">V1.0</span></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body py-1">
                    <h6 class="heading-small text-muted mb-4">Yazar Bilgileri</h6>
                    <div class="">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-first-name">İsim</label>
                                    <%--<input type="text" id="input-first-name" class="form-control">--%>
                                    <asp:TextBox ID="AuthorEditor_FirstName" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-last-name">Soyisim</label>
                                    <%--<input type="text" id="input-last-name" class="form-control">--%>
                                    <asp:TextBox ID="AuthorEditor_LastName" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-last-name">Görünür İsim</label>
                                    <%--<input type="text" id="input-last-name" class="form-control">--%>
                                    <asp:TextBox ID="AuthorEditor_VisibleName" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="my-4">
                    <h6 class="heading-small text-muted mb-4">İletişim</h6>
                    <div class="">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-address">E-Posta</label>
                                    <%--<input id="input-address" class="form-control" type="email">--%>
                                    <asp:TextBox ID="AuthorEditor_Email" CssClass="form-control" TextMode="Email" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <h6 class="heading-small text-muted mb-4">Hakkında</h6>
                    <div class="">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-first-name">Biyografi</label>
                                    <%--<textarea class="form-control" rows="6"></textarea>--%>
                                    <asp:TextBox ID="AuthorEditor_Biography" TextMode="MultiLine" Rows="6" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Kapat</button>
                    <asp:Button ID="SaveButton" CssClass="btn btn-primary btn-sm"
                        runat="server" Text="Kaydet" OnClick="SaveButton_Click" />
                </div>
            </div>
        </div>
    </div>

    <script>
        window.addEventListener('load', () => {
            $("#fastEditor").modal('show');
        })
    </script>
    <% } %>

        <%      if (!string.IsNullOrEmpty(Request.QueryString["AddNew"]))
        { %>
    <div class="modal fade" id="addNew" tabindex="-1" role="dialog" aria-labelledby="Hızlı Düzenleyici" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Yeni Yazar</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body py-1">
                    <h6 class="heading-small text-muted mb-4">Yazar Bilgileri</h6>
                    <div class="">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-first-name">İsim</label>
                                    <%--<input type="text" id="input-first-name" class="form-control">--%>
                                    <asp:TextBox ID="NewAuthor_FirstName" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-last-name">Soyisim</label>
                                    <%--<input type="text" id="input-last-name" class="form-control">--%>
                                    <asp:TextBox ID="NewAuthor_LastName" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-last-name">Görünür İsim</label>
                                    <%--<input type="text" id="input-last-name" class="form-control">--%>
                                    <asp:TextBox ID="NewAuthor_VisibleName" CssClass="form-control" runat="server"></asp:TextBox>

                                </div>
                            </div>
                        </div>
                    </div>
                    <hr class="my-4">
                    <h6 class="heading-small text-muted mb-4">İletişim</h6>
                    <div class="">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-address">E-Posta</label>
                                    <%--<input id="input-address" class="form-control" type="email">--%>
                                    <asp:TextBox ID="NewAuthor_Email" CssClass="form-control" TextMode="Email" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <h6 class="heading-small text-muted mb-4">Hakkında</h6>
                    <div class="">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="form-group">
                                    <label class="form-control-label" for="input-first-name">Biyografi</label>
                                    <%--<textarea class="form-control" rows="6"></textarea>--%>
                                    <asp:TextBox ID="NewAuthor_Biography" TextMode="MultiLine" Rows="6" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="alert alert-primary">
                        <i class="fa fa-key mr-2"></i> Yazar oluşturulduktan sonra şifre görüntülenecektir.
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Kapat</button>
                    <asp:Button ID="AddButton" CssClass="btn btn-primary btn-sm"
                        runat="server" Text="Ekle" OnClick="AddButton_Click" />
                </div>
            </div>
        </div>
    </div>

    <script>
        window.addEventListener('load', () => {
            $("#addNew").modal('show');
        })
    </script>
    <% } %>

     <%      if (!string.IsNullOrEmpty(Request.QueryString["ShowPassword"]))
         { %>

        <div class="modal fade" id="passwordNotification" tabindex="-1" role="dialog" aria-labelledby="Hızlı Düzenleyici" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Yeni Yazar Eklendi</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body py-1">
                    <div class="alert alert-primary">
                        <i class="fa fa-info mr-2"></i>Oluşturmuş olduğunuz yazarın şifresi <code>
                            <%= Request.QueryString["ShowPassword"] %>
                        </code> olarak ayarlanmıştır.
                    </div>
                </div>
                <div class="modal-footer">
                    <a href="./Authors.aspx" class="btn btn-secondary btn-sm">Kapat</a>
                </div>
            </div>
        </div>
    </div>

        <script>
            window.addEventListener('load', () => {
                $("#passwordNotification").modal('show');
            })
        </script>

    <% } %>
</asp:Content>
