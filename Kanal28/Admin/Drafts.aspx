<%@ Page Title="Taslaklar" Async="true" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Drafts.aspx.cs" Inherits="Kanal28.Admin.Drafts" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

    <div class="header bg-primary pb-6">
        <div class="container-fluid">
            <div class="header-body">
                <div class="row align-items-center py-4">
                    <div class="col-lg-6 col-7">
                        <h6 class="h2 text-white d-inline-block mb-0">Haberler</h6>
                        <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                            <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                                <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                                <li class="breadcrumb-item"><a href="#">Haberium</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Taslaklar</li>
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
                        <h3 class="mb-0">Haber Tablosu (Taslaklar)
                            <a href="Editor.aspx" class="btn btn-primary btn-sm float-right"><i class="fa fa-plus mr-2"></i> Yeni</a>
                            <a href="Drafts.aspx" class="btn btn-danger btn-sm float-right mr-2"><i class="fa fa-tasks mr-2"></i> Taslaklar</a>
                        </h3>
                    </div>
                    <!-- Light table -->
                    <div class="table-responsive" style="min-height:500px;">
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col" class="sort" data-sort="name">BAŞLIK</th>
                                    <th scope="col" class="sort" data-sort="budget">YAZAR</th>
                                    <th scope="col" class="sort" data-sort="status">KATEGORİ</th>
                                    <th scope="col">GÖRÜNTÜLENME</th>
                                    <th scope="col" class="sort" data-sort="completion">İÇERİK</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody class="list" >
                                <% foreach (Kanal28.Entities.Post post in AllPosts)
                                    {  %>
                                <tr>
                                    <th scope="row">
                                        <div class="media align-items-center">
                                            <a href="#" class="avatar rounded-circle mr-3">
                                                <img alt="Image placeholder" style="    height: 100%;
    object-fit: cover;" src="<%= post.Thumbnail %>">
                                            </a>
                                            <div class="media-body">
                                                <span class="name mb-0 text-sm"><%= post.Title %></span>
                                            </div>
                                        </div>
                                    </th>
                                    <td class="budget"><%= GetAuthorById(post.AuthorId).FirstName %> <%= GetAuthorById(post.AuthorId).LastName %>
                                    </td>
                                    <td>
                                        <span class="badge badge-dot mr-4">
                                            <i class="bg-warning"></i>
                                            <span class="status"><%= GetCategoryById((int)post.CategoryId).Name %></span>
                                        </span>
                                    </td>
                                    <td>
                                        <div class="avatar-group">
                                        </div>
                                    </td>
                                    <td>
                                        <div class="d-flex align-items-center">
                                            <span class="completion mr-2">Harika!</span>
                                            <div>
                                                <div class="progress">
                                                    <div class="progress-bar bg-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="text-right">
                                        <div class="dropdown">
                                            <a class="btn btn-sm btn-icon-only text-light" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                <i class="fas fa-ellipsis-v"></i>
                                            </a>
                                            <div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow">
                                                <a href="#" onclick="deletePost(<%= post.Id %>);" class="dropdown-item">Sil</a>
                                                <a href="/Admin/Editor.aspx?Id=<%= post.Id %>"  class="dropdown-item">Düzenle</a>
                                                <a href="?QuickEditor=<%= post.Id %>" class="dropdown-item">Hızlı Düzenle</a>
                                                <a href="?Publish=<%= post.Id %>" class="dropdown-item">Yayımla</a>                                                
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function deletePost(postId) {
            const xhr = new XMLHttpRequest();
            xhr.open('GET', '/Admin/Posts.aspx?delete=' + postId);
            xhr.send();
            xhr.onload = function () {
                window.location.reload();
            }
        }

        function toggleCornerStone(postId) {
            const xhr = new XMLHttpRequest();
            xhr.open('GET', '/Admin/Posts.aspx?cornerStone=' + postId);
            xhr.send();
            xhr.onload = function () {
                window.location.reload();
            }
        }

        function toggleBreaking(postId) {
            const xhr = new XMLHttpRequest();
            xhr.open('GET', '/Admin/Posts.aspx?breaking=' + postId);
            xhr.send();
            xhr.onload = function () {
                window.location.reload();
            }
        }
    </script>



    <%      if (!string.IsNullOrEmpty(Request.QueryString["QuickEditor"]))
        { %>

        <div class="modal fade" id="fastEditor" tabindex="-1" role="dialog" aria-labelledby="Hızlı Düzenleyici" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Quick Editor <span class="badge badge-badge-info bg-primary text-white">V1.0</span></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body py-1">
          <asp:TextBox ID="QuickEditor_Title" CssClass="form-control " placeholder="Haber Başlığı" runat="server"></asp:TextBox>
          <asp:TextBox ID="QuickEditor_MetaDescription" Rows="7" CssClass="form-control mt-3" runat="server" TextMode="MultiLine" placeholder="Haber Meta Açıklaması"></asp:TextBox>
          <asp:DropDownList ID="QuickEditor_Category" CssClass="form-control mt-3" runat="server"></asp:DropDownList>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Kapat</button>
          <asp:Button ID="SaveButton" CssClass="btn btn-primary btn-sm" OnClick="SaveButton_Click"
              runat="server" Text="Kaydet" />
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
<asp:Content ID="Scripts" ContentPlaceHolderID="AdditionalScripts" runat="server">
</asp:Content>
