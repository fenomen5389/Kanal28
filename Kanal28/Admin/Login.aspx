﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Kanal28.Admin.Login" EnableEventValidation="false" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
    <meta name="author" content="Creative Tim">
    <title>Giriş Yap</title>
    <!-- Favicon -->
    <link rel="icon" href="/Admin/assets/img/brand/favicon.png" type="image/png">
    <!-- Fonts -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700">
    <!-- Icons -->
    <link rel="stylesheet" href="/Admin/assets/vendor/nucleo/css/nucleo.css" type="text/css">
    <link rel="stylesheet" href="/Admin/assets/vendor/@fortawesome/fontawesome-free/css/all.min.css" type="text/css">
    <!-- Argon CSS -->
    <link rel="stylesheet" href="/Admin/assets/css/argon.css?v=1.2.0" type="text/css">
</head>

<body class="bg-default">
    <form runat="server">
        <div class="main-content">
            <!-- Header -->
            <div class="header bg-gradient-primary py-7 py-lg-8 pt-lg-9">
                <div class="container">
                    <div class="header-body text-center mb-7">
                        <div class="row justify-content-center">
                            <div class="col-xl-5 col-lg-6 col-md-8 px-5">
                                <h1 class="text-white">Yazar Paneli</h1>
                                <p class="text-lead text-white">Yazarlığınızı doğrulamak için lütfen giriş yapınız.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="separator separator-bottom separator-skew zindex-100">
                    <svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
                        <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
                    </svg>
                </div>
            </div>
            <!-- Page content -->
            <div class="container mt--8 pb-5">
                <div class="row justify-content-center">
                    <div class="col-lg-5 col-md-7">
                        <div class="card bg-secondary border-0 mb-0">
                            <div class="card-body px-lg-5 py-lg-5">
                                <div class="text-center text-muted mb-4">
                                    <%if (LoginError)
                                        {

                                    %>
                                    <small class="mb-0">Giriş yapma başarısız oldu.</small>
                                    <%}
                                        else
                                        {  %>
                                    <small>Haberium V1.0 designed by <a href="https://www.technopat.net/sosyal/uye/dekoltekafa.115180/" target="_blank">DekolteKafa</a> for <a href="https://kanal28.tv">kanal28.tv</a></small>

                                    <% } %>
                                </div>
                                <form role="form">
                                    <div class="form-group mb-3">
                                        <div class="input-group input-group-merge input-group-alternative">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="ni ni-email-83"></i></span>
                                            </div>
                                            <asp:TextBox ID="Email" CssClass="form-control" placeholder="E-Posta" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="input-group input-group-merge input-group-alternative">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
                                            </div>
                                            <asp:TextBox ID="Password" CssClass="form-control" placeholder="Şifre" TextMode="Password" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="custom-control custom-control-alternative custom-checkbox">
                                        <input class="custom-control-input" id=" customCheckLogin" type="checkbox">
                                        <label class="custom-control-label" for=" customCheckLogin">
                                            <span class="text-muted">Beni hatırla</span>
                                        </label>
                                    </div>
                                    <div class="text-center">
                                        <asp:Button ID="LoginButton" CssClass="btn btn-primary my-4" runat="server" Text="Giriş Yap" OnClick="LoginButton_Click" />
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer -->
            <footer class="py-5" id="footer-main">
                <div class="container">
                    <div class="row align-items-center justify-content-xl-between">
                        <div class="col-xl-6">
                            <div class="copyright text-center text-xl-left text-muted">
                                &copy; 2021 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Ajans Giresun</a>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
        </div>
    </form>
    <!-- Argon Scripts -->
    <!-- Core -->
    <script src="/Admin/assets/vendor/jquery/dist/jquery.min.js"></script>
    <script src="/Admin/assets/vendor/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/Admin/assets/vendor/js-cookie/js.cookie.js"></script>
    <script src="/Admin/assets/vendor/jquery.scrollbar/jquery.scrollbar.min.js"></script>
    <script src="/Admin/assets/vendor/jquery-scroll-lock/dist/jquery-scrollLock.min.js"></script>
    <!-- Argon JS -->
    <script src="/Admin/assets/js/argon.js?v=1.2.0"></script>
</body>

</html>
