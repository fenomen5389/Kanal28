<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCategory.aspx.cs" Inherits="Kanal28.ViewCategory" %>

<%@ Import Namespace="Kanal28.Extensions" %>
<asp:Content ID="HeadContent" ContentPlaceHolderID="Head" runat="server">
    <link href='https://fonts.googleapis.com/css?family=Poppins' rel='stylesheet'>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">
    <% var months = new string[12] { "Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık" }; %>
    <div class="container mt-3 custom-container">
        <div class="row">
            <div class="col-12">
                <span class="category-name">
                    <%= Category.Name %>
                </span>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-lg-8 mb-5">
                <div class="gn-slider">
                    <div class="gn-slider__wrapper" id="slide-one">
                        <% var firstPost = Posts.First(); %>
                        <img src="<%= firstPost.Thumbnail %>" alt="<%= firstPost.Title %>" class="gn-slider__wrapper--img" atl="space-x">
                        <div class="gn-slider__wrapper__content">
                            <span class="tag tag-white"><%= Category.Name %></span>
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
                                    <p><%= firstPost.AddedDate.ToString("HH:mm") %></p>
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
            <div class="col-lg-4">
                <%foreach (Kanal28.Entities.Post post in Posts.Where(p => p.CornerStone).Take(2))
                    { %>
                <div class="img-overlay-70 img-scale-animate mb-2">
                    <a href="/<%= post.Title.ConvertUrlFriendly() %>/<%= post.Id %>" title="<%= post.Title %>">
                        <picture>


                            <img src="<%= post.Thumbnail %>" alt="<%= post.Title %>" class="img-fluid width-100 lazyload loaded" data-was-processed="true">
                        </picture>
                    </a>
                    <div class="mask-content-lg m-0">
                        <h3 class="title-medium-light size-lg lh-27">
                            <a href="/<%= post.Title.ConvertUrlFriendly() %>/<%= post.Id %>" title="<%= post.Title %>"><%= post.Title %></a>
                        </h3>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
        <div class="row mt-3">
            <div class="col-lg-8 mt-5">
                 <span class="section-header px-3"><%= Category.Name %> Haberleri</span>
                <div class="section-stripe mb-1"></div>

                    <div class="row">
                        <% foreach (Kanal28.Entities.Post post in Posts.Skip(4))
                            { %>
                        <div class="col-lg-6 d-flex align-items-stretch">
                            <figure class="snip1493 mx-0">
                            <div class="image"><img
                                    src="<%= post.Thumbnail %>"
                                    alt="<%= post.Title %>" /></div>
                            <figcaption>
                                <div class="date"><span class="day"><%= post.AddedDate.Day %></span><span class="month"><%= months[post.AddedDate.Month-1] %></span></div>
                                <h3><%= post.Title %></h3>
                                <p>

                                    <%= post.MetaDescription %>
                                </p>
                                <footer>
                                    <div class="comments"><i class="ion-chatboxes"></i>23</div>
                                </footer>
                            </figcaption>
                            <a href="/<%= post.Title.ConvertUrlFriendly() %>/<%= post.Id %>"></a>
                        </figure>
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
