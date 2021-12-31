<%@ Page Async="true" Title="Haberium Editör" Language="C#" ValidateRequest="false" EnableViewState="true" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Editor.aspx.cs" Inherits="Kanal28.Admin.Editor" %>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" href="/Admin/Assets/Css/suneditor.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/codemirror@5.49.0/lib/codemirror.min.css">
    <!-- KaTeX -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">
    <style>
        .sun-editor {
            font-family: 'Roboto'!important;
        }

        .sun-editor-editable{
            font-family: 'Roboto'!important;

        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="Body" runat="server">

    <div class="header bg-primary pb-6">
        <div class="container-fluid">
            <div class="header-body">
                <div class="row align-items-center py-4">
                    <div class="col-lg-6 col-7">
                        <h6 class="h2 text-white d-inline-block mb-0">Haberium Editör</h6>
                        <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                            <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                                <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                                <li class="breadcrumb-item"><a href="#">Haberium</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Düzenle</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid mt--6">
        <div class="row">
            <div class="col-lg-9">
                <div class="card">
                    <div class="card-header px-3 pb-0 border-0 d-flex">
                        <asp:TextBox ID="HaberiumEditor_Title" CssClass="form-control" placeholder="Başlık" runat="server"></asp:TextBox>
                        <asp:Button ID="HaberiumEditor_Preview" runat="server" CssClass="btn btn-sm btn-warning ml-2" Text="Önizleme" />
                        <asp:Button ID="HaberiumEditor_Save" OnClick="HaberiumEditor_Save_Click" runat="server" CssClass="btn btn-sm btn-success ml-0" Text="Kaydet" />
                    </div>
                    <div class="card-body px-3 pt-3">
                        <asp:TextBox ID="HaberiumEditor_Body" ClientIDMode="Static" TextMode="MultiLine" runat="server"></asp:TextBox>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body">
                        <div class="custom-control custom-checkbox">
                            <asp:CheckBox ID="HaberiumEditor_Breaking" ClientIDMode="Static" runat="server" />
                            <label class="custom-control-label" for="HaberiumEditor_Breaking">"Son Dakika" haberi olarak ekle.</label>
                        </div>
                        <div class="custom-control custom-checkbox mt-2">
                            <asp:CheckBox ID="HaberiumEditor_CornerStone" ClientIDMode="Static" runat="server" />
                            <label class="custom-control-label" for="HaberiumEditor_CornerStone">Otomatik olarak öne çıkar.</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="card">
                    <div class="card-header px-3 py-3 border-0 d-flex">
                        Öznitelikler
                    </div>
                    <div class="card-body p-0">
                        <ul class="list-group">
                            <li class="list-group-item">
                                <div class="mb-3">
                                    Meta Açıklaması 
                                </div>
                                <asp:TextBox ID="HaberiumEditor_MetaDescription" runat="server" CssClass="form-control" Rows="6" MaxLength="250" placeholder="Meta açıklaması giriniz..." TextMode="MultiLine"></asp:TextBox>
                                <%--<textarea class="form-control" placeholder="Meta açıklaması giriniz..." maxlength="250" rows="6"></textarea>--%>
                            </li>
                            <li class="list-group-item">
                                <div class="mb-3">Anahtar Kelime</div>
                                <asp:TextBox ID="HaberiumEditor_Keyword" runat="server" CssClass="form-control" placeholder="Anahtar kelime giriniz..."></asp:TextBox>
                                <%--<input type="text" class="form-control" placeholder="Anahtar kelime giriniz..." value="" />--%>
                            </li>
                            <li class="list-group-item">
                                <div class="mb-3">Öne Çıkarılan Görsel</div>

                                <% if (CurrentPost.Thumbnail != null)
                                    { %>

                                <img src="<%= CurrentPost.Thumbnail %>" style="aspect-ratio:16/9;object-fit:cover;width:100%;margin-bottom:10px;" alt="Gönderi Öne Çıkan Görseli" />

                                <% } %>
                                <asp:FileUpload ID="HaberiumEditor_ThumbnailUploader" CssClass="form-control" runat="server" />
                                <%--<input type="file" class="form-control" value="" />--%>
                            </li>
                            <li class="list-group-item">
                                <div class="mb-3">Kategori</div>
                                <asp:DropDownList ID="HaberiumEditor_Category" CssClass="form-control" runat="server"></asp:DropDownList>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Scripts" runat="server" ContentPlaceHolderID="AdditionalScripts">
    <script src="/Admin/Assets/Js/suneditor.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/codemirror@5.49.0/lib/codemirror.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/codemirror@5.49.0/mode/htmlmixed/htmlmixed.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/codemirror@5.49.0/mode/xml/xml.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/codemirror@5.49.0/mode/css/css.js"></script>
    <!-- KaTeX -->
    <script src="https://cdn.jsdelivr.net/npm/katex@0.11.1/dist/katex.min.js"></script>
    <script>
        const editor = SUNEDITOR.create('HaberiumEditor_Body', {
            display: 'block',
            width: '100%',
            height: 'auto',
            popupDisplay: 'full',
            charCounter: true,
            charCounterLabel: 'Characters :',
            imageGalleryUrl: 'https://etyswjpn79.execute-api.ap-northeast-1.amazonaws.com/suneditor-demo',
            buttonList: [
                // default
                ['undo', 'redo'],
                ['font', 'fontSize', 'formatBlock'],
                ['paragraphStyle', 'blockquote'],
                ['bold', 'underline', 'italic', 'strike', 'subscript', 'superscript'],
                ['fontColor', 'hiliteColor', 'textStyle'],
                ['removeFormat'],
                ['outdent', 'indent'],
                ['align', 'horizontalRule', 'list', 'lineHeight'],
                ['table', 'link', 'image', 'video', 'audio', 'math'],
                ['imageGallery'],
                ['fullScreen', 'showBlocks', 'codeView'],
                ['preview', 'print'],
                ['save', 'template'],
                // (min-width: 1546)
                ['%1546', [
                    ['undo', 'redo'],
                    ['font', 'fontSize', 'formatBlock'],
                    ['paragraphStyle', 'blockquote'],
                    ['bold', 'underline', 'italic', 'strike', 'subscript', 'superscript'],
                    ['fontColor', 'hiliteColor', 'textStyle'],
                    ['removeFormat'],
                    ['outdent', 'indent'],
                    ['align', 'horizontalRule', 'list', 'lineHeight'],
                    ['table', 'link', 'image', 'video', 'audio', 'math'],
                    ['imageGallery'],
                    ['fullScreen', 'showBlocks', 'codeView'],
                    ['-right', ':i-More Misc-default.more_vertical', 'preview', 'print', 'save', 'template']
                ]],
                // (min-width: 1455)
                ['%1455', [
                    ['undo', 'redo'],
                    ['font', 'fontSize', 'formatBlock'],
                    ['paragraphStyle', 'blockquote'],
                    ['bold', 'underline', 'italic', 'strike', 'subscript', 'superscript'],
                    ['fontColor', 'hiliteColor', 'textStyle'],
                    ['removeFormat'],
                    ['outdent', 'indent'],
                    ['align', 'horizontalRule', 'list', 'lineHeight'],
                    ['table', 'link', 'image', 'video', 'audio', 'math'],
                    ['imageGallery'],
                    ['-right', ':i-More Misc-default.more_vertical', 'fullScreen', 'showBlocks', 'codeView', 'preview', 'print', 'save', 'template']
                ]],
                // (min-width: 1326)
                ['%1326', [
                    ['undo', 'redo'],
                    ['font', 'fontSize', 'formatBlock'],
                    ['paragraphStyle', 'blockquote'],
                    ['bold', 'underline', 'italic', 'strike', 'subscript', 'superscript'],
                    ['fontColor', 'hiliteColor', 'textStyle'],
                    ['removeFormat'],
                    ['outdent', 'indent'],
                    ['align', 'horizontalRule', 'list', 'lineHeight'],
                    ['-right', ':i-More Misc-default.more_vertical', 'fullScreen', 'showBlocks', 'codeView', 'preview', 'print', 'save', 'template'],
                    ['-right', ':r-More Rich-default.more_plus', 'table', 'link', 'image', 'video', 'audio', 'math', 'imageGallery']
                ]],
                // (min-width: 1123)
                ['%1123', [
                    ['undo', 'redo'],
                    [':p-More Paragraph-default.more_paragraph', 'font', 'fontSize', 'formatBlock', 'paragraphStyle', 'blockquote'],
                    ['bold', 'underline', 'italic', 'strike', 'subscript', 'superscript'],
                    ['fontColor', 'hiliteColor', 'textStyle'],
                    ['removeFormat'],
                    ['outdent', 'indent'],
                    ['align', 'horizontalRule', 'list', 'lineHeight'],
                    ['-right', ':i-More Misc-default.more_vertical', 'fullScreen', 'showBlocks', 'codeView', 'preview', 'print', 'save', 'template'],
                    ['-right', ':r-More Rich-default.more_plus', 'table', 'link', 'image', 'video', 'audio', 'math', 'imageGallery']
                ]],
                // (min-width: 817)
                ['%817', [
                    ['undo', 'redo'],
                    [':p-More Paragraph-default.more_paragraph', 'font', 'fontSize', 'formatBlock', 'paragraphStyle', 'blockquote'],
                    ['bold', 'underline', 'italic', 'strike'],
                    [':t-More Text-default.more_text', 'subscript', 'superscript', 'fontColor', 'hiliteColor', 'textStyle'],
                    ['removeFormat'],
                    ['outdent', 'indent'],
                    ['align', 'horizontalRule', 'list', 'lineHeight'],
                    ['-right', ':i-More Misc-default.more_vertical', 'fullScreen', 'showBlocks', 'codeView', 'preview', 'print', 'save', 'template'],
                    ['-right', ':r-More Rich-default.more_plus', 'table', 'link', 'image', 'video', 'audio', 'math', 'imageGallery']
                ]],
                // (min-width: 673)
                ['%673', [
                    ['undo', 'redo'],
                    [':p-More Paragraph-default.more_paragraph', 'font', 'fontSize', 'formatBlock', 'paragraphStyle', 'blockquote'],
                    [':t-More Text-default.more_text', 'bold', 'underline', 'italic', 'strike', 'subscript', 'superscript', 'fontColor', 'hiliteColor', 'textStyle'],
                    ['removeFormat'],
                    ['outdent', 'indent'],
                    ['align', 'horizontalRule', 'list', 'lineHeight'],
                    [':r-More Rich-default.more_plus', 'table', 'link', 'image', 'video', 'audio', 'math', 'imageGallery'],
                    ['-right', ':i-More Misc-default.more_vertical', 'fullScreen', 'showBlocks', 'codeView', 'preview', 'print', 'save', 'template']
                ]],
                // (min-width: 525)
                ['%525', [
                    ['undo', 'redo'],
                    [':p-More Paragraph-default.more_paragraph', 'font', 'fontSize', 'formatBlock', 'paragraphStyle', 'blockquote'],
                    [':t-More Text-default.more_text', 'bold', 'underline', 'italic', 'strike', 'subscript', 'superscript', 'fontColor', 'hiliteColor', 'textStyle'],
                    ['removeFormat'],
                    ['outdent', 'indent'],
                    [':e-More Line-default.more_horizontal', 'align', 'horizontalRule', 'list', 'lineHeight'],
                    [':r-More Rich-default.more_plus', 'table', 'link', 'image', 'video', 'audio', 'math', 'imageGallery'],
                    ['-right', ':i-More Misc-default.more_vertical', 'fullScreen', 'showBlocks', 'codeView', 'preview', 'print', 'save', 'template']
                ]],
                // (min-width: 420)
                ['%420', [
                    ['undo', 'redo'],
                    [':p-More Paragraph-default.more_paragraph', 'font', 'fontSize', 'formatBlock', 'paragraphStyle', 'blockquote'],
                    [':t-More Text-default.more_text', 'bold', 'underline', 'italic', 'strike', 'subscript', 'superscript', 'fontColor', 'hiliteColor', 'textStyle', 'removeFormat'],
                    [':e-More Line-default.more_horizontal', 'outdent', 'indent', 'align', 'horizontalRule', 'list', 'lineHeight'],
                    [':r-More Rich-default.more_plus', 'table', 'link', 'image', 'video', 'audio', 'math', 'imageGallery'],
                    ['-right', ':i-More Misc-default.more_vertical', 'fullScreen', 'showBlocks', 'codeView', 'preview', 'print', 'save', 'template']
                ]]
            ],
            placeholder: 'Start typing something...',
            templates: [
                {
                    name: 'Template-1',
                    html: '<p>HTML source1</p>'
                },
                {
                    name: 'Template-2',
                    html: '<p>HTML source2</p>'
                }
            ],
            codeMirror: CodeMirror,
            katex: katex
        });
        setInterval(() => {
            $("#HaberiumEditor_Body")[0].innerText = editor.getContents();
        }, 50)
    </script>
</asp:Content>
