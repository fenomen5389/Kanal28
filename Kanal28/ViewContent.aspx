<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewContent.aspx.cs" Inherits="Kanal28.ViewContent" %>
<%@ Import Namespace="Kanal28.Extensions" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="Head" runat="server">
    <link rel="stylesheet" href="/Admin/Assets/Css/suneditor.min.css" />
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">
    <div class="container mt-4 custom-container">
        <div class="row">
            <div class="col-12">
                <h1 class="bg-haberium news-title">
                    <%= Post.Title %>
                </h1>
                <% if (Post.MetaDescription.Length > 0)
                    { %>
                <div class="news-meta-description mt-3">
                    <%= Post.MetaDescription %>
                </div>
                <% } %>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-lg-9">
                <span class="share-text">PAYLAŞ</span>
                <ul class="share-icons">
                    <li>
                        <i class="fa fa-facebook"></i>
                    </li>
                    <li>
                        <i class="fa fa-twitter"></i>
                    </li>
                    <li>
                        <i class="fa fa-whatsapp"></i>
                    </li>
                    <li>
                        <i class="fa fa-envelope"></i>
                    </li>
                </ul>
            </div>
            <div class="col-lg-3">
                <div class="news-added-date" align="right">
                    <i class="fa fa-clock-o"></i>
                    <%= Post.AddedDate.ToString("dd/MM/yyyy HH:mm") %>
                </div>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-lg-8">
                <img src="<%= Post.Thumbnail %>" alt="<%= Post.Title %>" class="news-featured-image" />
                <div class="news-content my-4 mb-5">
                    <%= Post.Body %>
                </div>
                
                <span class="section-header px-3">Bunlara Da Bakın</span>
                <div class="section-stripe mb-2"></div>

                <div class="row">

                 <% foreach (Kanal28.Entities.Post post in GetRandomPosts(3))
                        { %>
                    
                <div class="col-lg-4 mb-2">
                    <div class="mini-article-vertical">
                    <img src="<%= post.Thumbnail %>" data-src="https://kanal28.tv/i/dosya/haber/kadinlar-kazanacak-evler-gires_1639065621_rs028g.jpg/jpg-90-395-222" alt="Kadınlar Kazanacak, Evler Giresun Kokacak" class="img-fluid width-100 lazyload loaded" data-was-processed="true">
                    <a href="/<%= post.Title.ConvertUrlFriendly() %>/<%= post.Id %>" class="text">
                        <%= post.Title %>
                    </a>
                </div>
                </div>

                    <% } %>

                </div>
            </div>
            <div class="col-lg-4 mt-2">
                <span class="section-header px-3">Çok Okunanlar</span>
                <div class="section-stripe mb-4"></div>
                    <% foreach (Kanal28.Entities.Post post in GetMostPopularPosts(5))
                        { %>
                    
                    <div class="mini-article">
                            <img src="<%= post.Thumbnail %>" alt="<%= post.Title %>" data-was-processed="true">
                            <a href="/<%=post.Title.ConvertUrlFriendly() %>/<%= post.Id %>" class="mini-article-text">
                                <%= post.Title %>
                            </a>
                        </div>

                    <% } %>

                <span class="section-header bg-secondary">Sosyal Ağlar</span>
                <div class="section-stripe bg-secondary"></div>

                <ul class="stay-connected-light overflow-hidden mt-4">
                    <li class="facebook">
                        <a href="https://www.facebook.com/giresunhaberajans/" target="_blank" rel="noreferrer" title="Kanal 28 TV - Facebook sayfamızdan takip edin">
                            <i class="fa fa-facebook" aria-hidden="true"></i>
                            <p>Facebook</p>
                        </a>
                    </li>
                    <li class="twitter">
                        <a href="https://twitter.com" target="_blank" rel="noreferrer" title="Kanal 28 TV - Twitter sayfamızdan takip edin">
                            <i class="fa fa-twitter" aria-hidden="true"></i>
                            <p>Twitter</p>
                        </a>
                    </li>
                    <li class="youtube">
                        <a href="https://www.youtube.com/Giresunhaberajansi" target="_blank" rel="noreferrer" title="Kanal 28 TV - Youtube kanalımıza abone olun">
                            <i class="fa fa-youtube-play" aria-hidden="true"></i>
                            <p>Youtube</p>
                        </a>
                    </li>
                    <li class="rss">
                        <a href="/rss/anasayfa/" target="_blank" title="Kanal 28 TV RSS">
                            <i class="fa fa-rss" aria-hidden="true"></i>
                            <p>RSS</p>
                        </a>
                    </li>
                </ul>
                <br />

                <span class="section-header px-3 mt-4">İlginizi Çekebilir</span>
                <div class="section-stripe mb-4"></div>

                <% foreach (Kanal28.Entities.Post post in GetRandomPosts(5))
                        { %>
                    
                    <div class="mini-article">
                            <img src="<%= post.Thumbnail %>" alt="<%= post.Title %>" class="img-fluid lazyload loaded" data-was-processed="true">
                            <a href="/<%=post.Title.ConvertUrlFriendly() %>/<%= post.Id %>" class="mini-article-text">
                                <%= post.Title %>
                            </a>
                        </div>

                    <% } %>
            </div>
        </div>
    </div>
</asp:Content>
