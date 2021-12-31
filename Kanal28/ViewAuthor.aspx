<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewAuthor.aspx.cs" Inherits="Kanal28.ViewAuthor" %>

<%@ Import Namespace="Kanal28.Extensions" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="Head" runat="server">

    <link href="/assets/owl/owl.carousel.min.css" rel="stylesheet" />
    <link href="/assets/owl/owl.theme.default.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="/assets/owl/owl.carousel.min.js"></script>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">
    <% var months = new string[12] { "Ocak", "Şubat", "Mart", "Nisan", "Mayıs", "Haziran", "Temmuz", "Ağustos", "Eylül", "Ekim", "Kasım", "Aralık" }; %>

    <div class="container custom-container mt-3 mb-5">
        <div class="row">
            <div class="col-12">
                <div class="card haberium-card">
                    <div class="card-body p-4">
                        <div class="d-flex">
                            <div class="author-meta">
                                <img src="/AuthorPhotos/<%= Author.Id %>.webp" class="author-image" alt="<%= Author.VisibleName %>" />
                                <span class="author-name"><%= Author.VisibleName %></span>
                            </div>
                            <div class="author-biography">
                                <%= Author.Biography %>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card haberium-card mt-3">
                    <div class="card-body">
                        <h5>Yazıları</h5>
                        <div class="owl-carousel">
                            <% foreach (Kanal28.Entities.Post post in Posts)
                                { %>
                            <figure class="snip1493 mx-0">
                                <div class="image">
                                    <img
                                        src="<%= post.Thumbnail %>"
                                        alt="<%= post.Title %>" />
                                </div>
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
                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $('.owl-carousel').owlCarousel({
            loop: false,
            margin: 7,
            stagePadding:5,
            nav: true,
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 3
                },
                1000: {
                    items: 5
                }
            }
        })
    </script>
</asp:Content>
