<%@ Page Title="Yazarlar" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Authors.aspx.cs" Inherits="Kanal28.Authors" %>
<%@ Import Namespace="Kanal28.Extensions" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">
    <div class="container mt-4 custom-container">
        <div class="row">
            <div class="col-lg-8">
                <span class="section-header">Yazarlar</span>
                <div class="section-stripe"></div>
                <div class="row mt-4">
                    <% foreach (Kanal28.Entities.Author author in AllAuthors)
                        { %>
                    <div class="col-lg-4 mb-2">
                        <div class="outer-div">
                            <div class="inner-div">
                                <div class="front">
                                    <div class="front__bkg-photo"></div>
                                    <div class="front__face-photo" style="background: url('/AuthorPhotos/<%= author.Id %>.webp'); background-size: contain;"></div>
                                    <div class="front__text">
                                        <h3 class="front__text-header"><%= author.VisibleName %></h3>
                                        <p class="front__text-para">
                                            <i class="fas fa-map-marker-alt front-icons"></i><% if (author.IsAdministrator)
                                                                                                 {

                                            %> Yönetici <%}
                                                            else
                                                            { %>
                                    Yazar
                                    <% } %>
                                        </p>

                                        <a href="/Yazar/<%= author.VisibleName.ConvertUrlFriendly() %>/<%= author.Id %>" class="front__text-hover text-white">Profili Ziyaret Et</a>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>
            </div>
            <div class="col-lg-4">
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
