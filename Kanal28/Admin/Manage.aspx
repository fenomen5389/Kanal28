<%@ Page Title="Yönetilebilir Haberium" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Manage.aspx.cs" Inherits="Kanal28.Admin.Manage" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">
    <div class="header bg-primary pb-6">
        <div class="container-fluid">
            <div class="header-body">
                <div class="row align-items-center py-4">
                    <div class="col-lg-6 col-7">
                        <h6 class="h2 text-white d-inline-block mb-0">Yönetilebilir Haberium</h6>
                        <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                            <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                                <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                                <li class="breadcrumb-item"><a href="#">Haberium</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Yönet</li>
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
                        <h3 class="mb-0">Haberium SEO Eklenti Ayarları
                        </h3>
                    </div>
                    <div class="card-body pt-0">
                        <div class="row">
                            <div class="col-lg-6">
                                <asp:TextBox ID="SiteName" CssClass="form-control" placeholder="Site Başlığı" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-lg-6">
                                <asp:TextBox ID="SiteOwner" CssClass="form-control" placeholder="Site Sahibi" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <asp:TextBox ID="SiteDescription" Rows="12" placeholder="Site Açıklaması" TextMode="MultiLine" CssClass="form-control" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <asp:TextBox ID="SiteCanonicalUrl" CssClass="form-control" placeholder="Site Url" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <asp:TextBox ID="FacebookPage" CssClass="form-control" placeholder="Facebook Sayfa" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <asp:TextBox ID="YoutubePage" CssClass="form-control" placeholder="YouTube Sayfa" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12">
                                <asp:TextBox ID="HomepageTitle" CssClass="form-control" placeholder="Anasayfa Başlığı" runat="server"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row mt-3">
                            <div class="col-12 d-flex">
                                <asp:Button ID="SaveSEO" CssClass="btn btn-primary ml-auto" OnClick="SaveSEO_Click" runat="server" Text="Kaydet" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12">
                <div class="card">
                    <div class="card-header border-0">
                        <h3 class="mb-0">
                            Tema
                        </h3>
                    </div>
                    <div class="card-body pt-0">
                        <div class="row">
                            <div class="col-lg-4">
                                Haberium V1.0 Tema
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row mt-3">
            <div class="col-12">
                <div class="card">
                    <div class="card-header border-0">
                        <h3 class="mb-0">
                            Yazılım Ayarları
                        </h3>
                    </div>
                    <div class="card-body pt-0">
                        <div class="row">
                            <div class="col-12">
                                <a href="?DeleteCache=1" class="btn btn-danger btn-sm"><i class="fa fa-trash mr-2"></i>Önbelleği Sil</a>
                                <button class="btn btn-primary btn-sm">Önbellek Tercihlerini Değiştir</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%      if (!string.IsNullOrEmpty(Request.QueryString["DeleteCache"]))
        {  %>

     <div class="modal fade" id="fastEditor" tabindex="-1" role="dialog" aria-labelledby="Hızlı Düzenleyici" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Caching Middleware</h5>
        <a href="/Admin/Manage.aspx" type="button" class="close" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </a>
      </div>
      <div class="modal-body py-1">
          Sistem önbelleği boşaltıldı. Bir sonraki önbelleklemeye kadar site hızı düşebilir.
      </div>
      <div class="modal-footer">
        <a href="/Admin/Manage.aspx" type="button" class="btn btn-primary btn-sm" >Anladım</a>
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
</asp:Content>
