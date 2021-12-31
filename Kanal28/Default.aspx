<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Kanal28.Default" %>
<%@ Import Namespace="Kanal28.Extensions" %>
<asp:Content ID="Head" ContentPlaceHolderID="Head" runat="server">
    <meta name="description" content="<%= SEOConfig.SiteDescription %>">
    <meta name="robots" content="index, follow"/>
</asp:Content>
<asp:Content ID="Body" ContentPlaceHolderID="Body" runat="server">
    <% var months = new string[12] { "Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık" }; %>
    <section class="custom-container container site-section">
        <div class="row">
            <div class="col-12">
                <div class="row">
                    <div class="col-md-8">
                        <div class="gn-slider">
                            <div class="gn-slider__wrapper" id="slide-one">
                                <% var firstPost = Posts.First(); %>
                                <img src="<%= firstPost.Thumbnail %>" alt="<%= firstPost.Title %>" class="gn-slider__wrapper--img" atl="space-x">
                                <div class="gn-slider__wrapper__content">
                                    <span class="tag tag-white"><%= GetCategoryById((int)firstPost.CategoryId).Name %></span>
                                    <h2 class="gn-slider__wrapper__content--title"><%= firstPost.Title %>
                                    </h2>
                                    <div class="gn-slider__wrapper__content__details">
                                        <div class="gn-slider__wrapper__content__details--texts">
                                            <span>Yazar</span>
                                            <p>
                                                <% var author = GetAuthorById(firstPost.AuthorId); %>
                                                <%= author.FirstName %>
                                                <%= author.LastName %>
                                            </p>
                                        </div>
                                        <div class="gn-slider__wrapper__content__details--texts">
                                            <span>Tarih</span>
                                            <p><%= months[firstPost.AddedDate.Month-1] %>, <%= firstPost.AddedDate.Day %></p>
                                        </div>
                                        <div class="gn-slider__wrapper__content__details--texts">
                                            <span>Saat</span>
                                            <p><%= firstPost.AddedDate.Hour %>:<%= firstPost.AddedDate.Minute %></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="gn-slider__footer">
                                <% for (var i = 0; i < 3; i++)
                                    {
                                        var currentPost = Posts[i + 1];
                                %>
                                <div class="gn-slider__footer__item">
                                    <img src="<%= currentPost.Thumbnail %>" width="50" height="50" style="object-fit: cover; border-radius: 10px;" alt="item">
                                    <div class="gn-slider__footer__item__title">
                                        <a href="/<%= currentPost.Title.ConvertUrlFriendly() %>/<%= currentPost.Id %>">
                                            <%= currentPost.Title %>
                                        </a>
                                    </div>
                                </div>
                                <% } %>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <% foreach (Kanal28.Entities.Post post in GetCornerStonePosts().Take(5))
                            { %>
                        <div class="mini-article">
                            <img src="<%= post.Thumbnail %>" alt="<%= post.Title %>" class="img-fluid lazyload loaded" data-was-processed="true">
                            <a href="/<%= post.Title.ConvertUrlFriendly() %>/<%= post.Id %>" class="mini-article-text">
                                <%= post.Title %>
                            </a>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="custom-container container">
        <div class="row">
            <% foreach (Kanal28.Entities.Post post in Posts.Take(4))
                {
            %>

            <div class="col-lg-3">
                <div class="mini-article-vertical">
                    <img src="<%= post.Thumbnail %>" data-src="https://kanal28.tv/i/dosya/haber/kadinlar-kazanacak-evler-gires_1639065621_rs028g.jpg/jpg-90-395-222" alt="Kadınlar Kazanacak, Evler Giresun Kokacak" class="img-fluid width-100 lazyload loaded" data-was-processed="true">
                    <a href="/<%= post.Title.ConvertUrlFriendly() %>/<%= post.Id %>" class="text">
                        <%= post.Title %>
                    </a>
                </div>
            </div>

            <% } %>
        </div>
    </section>

    <section class="custom-container container mt-5 mb-5">
        <span class="section-header">Yerel Haberler</span>
        <div class="section-stripe"></div>

        <!-- Haber içerik -->

        <div class="row mt-4">
            <% foreach (Kanal28.Entities.Post post in Posts.OrderByDescending(p => p.AddedDate).Where(p => p.CategoryId == 2).Take(4))
                { %>
            <div class="col-lg-3">
                <div class="mini-article-vertical">
                    <img src="<%= post.Thumbnail %>" data-src="https://kanal28.tv/i/dosya/haber/kadinlar-kazanacak-evler-gires_1639065621_rs028g.jpg/jpg-90-395-222" alt="Kadınlar Kazanacak, Evler Giresun Kokacak" class="img-fluid width-100 lazyload loaded" data-was-processed="true">
                    <a href="/<%= post.Title.ConvertUrlFriendly() %>/<%= post.Id %>" class="text">
                        <%= post.Title %>
                    </a>
                </div>
            </div>
            <% } %>
        </div>
        <div class="row mt-4">
            <% foreach (Kanal28.Entities.Post post in Posts.OrderByDescending(p => p.AddedDate).Where(p => p.CategoryId == 2).Skip(4).Take(3))
                { %>
            <div class="col-lg-4">
                <div class="mini-article">
                    <img src="<%= post.Thumbnail %>" data-src="https://kanal28.tv/i/dosya/haber/yeni-spor-salonu-hizmete-girec_1630585442_tcfT4j.jpeg/jpg-90-110-88" alt="Yeni Spor Salonu  Hizmete Girecek" class="img-fluid lazyload loaded" data-was-processed="true">
                    <a href="/<%= post.Title.ConvertUrlFriendly() %>/<%= post.Id %>" class="mini-article-text">
                        <%= post.Title %>
                    </a>
                </div>
            </div>
            <% } %>
        </div>
        <div class="row">
            <% foreach (Kanal28.Entities.Post post in Posts.OrderByDescending(p => p.AddedDate).Where(p => p.CategoryId == 2).Skip(7).Take(3))
                { %>
            <div class="col-lg-4">
                <div class="mini-article">
                    <img src="<%= post.Thumbnail %>" data-src="https://kanal28.tv/i/dosya/haber/yeni-spor-salonu-hizmete-girec_1630585442_tcfT4j.jpeg/jpg-90-110-88" alt="Yeni Spor Salonu  Hizmete Girecek" class="img-fluid lazyload loaded" data-was-processed="true">
                    <a href="/<%= post.Title.ConvertUrlFriendly() %>/<%= post.Id %>" class="mini-article-text">
                        <%= post.Title %>
                    </a>
                </div>
            </div>
            <% } %>
        </div>
    </section>

    <section class="custom-container container mt-5 mb-5">


        <div class="row">
            <div class="col-lg-8">

            </div>
            <div class="col-lg-4">
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
            </div>
        </div>
    </section>
</asp:Content>
