<%@ Page Title="" Language="C#" MasterPageFile="~/ad.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="preview_dotnet_templates_akshara_multi_master_index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <!-- Carousel -->
    <div id="carousel-example-generic" class="carousel slide carousel-fade" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target='#carousel-example-generic' data-slide-to='0' class='active'>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/img/12.jpg"
                    Width="50px" Height="50px" CssClass="img-circle" /></li>
            <li data-target='#carousel-example-generic' data-slide-to='1'>
                <asp:Image ID="Image2" runat="server" ImageUrl="~/img/13.jpg"
                    Width="50px" Height="50px" CssClass="img-circle" /></li>
          
            <li data-target='#carousel-example-generic' data-slide-to='2'>
                <asp:Image ID="Image3" runat="server" ImageUrl="~/img/14.jpg"
                    Width="50px" Height="50px" CssClass="img-circle" /></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active one">
                <!-- <img src="#" alt="" /> -->
                <div class="main-text hidden-xs">
                    <div class="col-md-12 text-center">
                       <h1>
                            Ads are the <b class="yellow">Caveout</b> of&nbsp; <b class="yellow">twenty first</b><br />
                            <span class="span">century.</span></h1>
                        <div class="">
                             <asp:HyperLink ID="HyperLink1"  NavigateUrl="~/login.aspx" runat="server" CssClass="btn btn-clear btn-sm btn-min-block">Login</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink2" NavigateUrl="~/signup.aspx" runat="server" CssClass="btn btn-clear btn-sm btn-min-block">Registration</asp:HyperLink>
							</div>
                    </div>
                </div>
            </div>
            <div class="item two">
                <div class="main-text hidden-xs">
                    <div class="col-md-12 text-center">
                        <h1>
                            Want your presence felt? Lets create an ad for you.<br /> <span class="yellow">Register Now </span></h1>
                        <div class="">
                            <asp:HyperLink ID="HyperLink3"  NavigateUrl="~/login.aspx" runat="server" CssClass="btn btn-clear btn-sm btn-min-block">Login</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink4" NavigateUrl="~/signup.aspx" runat="server" CssClass="btn btn-clear btn-sm btn-min-block">Registration</asp:HyperLink>
                        </div>
                    </div>
                </div>
            </div>
            <div class="item three">
                <div class="main-text hidden-xs">
                    <div class="col-md-12 text-center">
                        <h1>
                            Creativity without strategy is called <b class="yellow"> Art</b>  </br>
                            <span class="span">Creativity with strategy is called </span> <b class="yellow">Advertisement</b><br /></h1>
                        <div class="">
                             <asp:HyperLink ID="HyperLink5"  NavigateUrl="~/login.aspx" runat="server" CssClass="btn btn-clear btn-sm btn-min-block">Login</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink6" NavigateUrl="~/signup.aspx" runat="server" CssClass="btn btn-clear btn-sm btn-min-block">Registration</asp:HyperLink>
                            </div>
                </div>
            </div>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span></a><a class="right carousel-control"
                href="#carousel-example-generic" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right">
                </span></a>
    </div>
    <!-- Carousel -->
    <!-- Service Section -->
    <section id="services" class="padding100">
        <div class="container">
            <div class="row">
                <h2 class="background double animated wow fadeInUp" data-wow-delay="0.2s"><span><strong>F</strong>eatures</span></h2>
            </div>
            <!-- ./ end row -->
            <div class="row">
                <div class="col-md-4">
                    <i class="fa fa-laptop animated wow fadeInDown"></i>
                    <div class="sc-inner">
                        <h4>
                            Great Design</h4>
                        <p>
                            We create your adverisements with latest and new trends</p>
                    </div>
                </div>
                <!-- ./ end service box -->
                <div class="col-md-4">
                    <i class="fa fa-support animated wow fadeInDown" data-wow-delay="0.2s"></i>
                    <div class="sc-inner">
                        <h4>
                            Quick Support</h4>
                        <p>
                            Got a problem? Need some changes in logo or video? Contact us for superfast solution.</p>
                    </div>
                </div>
                <!-- ./ end service box -->
                <div class="col-md-4">
                    <i class="fa fa-youtube-play animated wow fadeInDown" data-wow-delay="0.4s"></i>
                    <div class="sc-inner">
                        <h4>
                            Video Support</h4>
                        <p>
                            We make video advertiements for you too.</p>
                    </div>
                </div>
                <!-- ./ end service box -->
            </div>
           
        
    </section>
    <!-- ./ End Service Section -->
    <!-- Page Content -->
    <section class="service-info padding100">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h4>
                        Creative design</h4>
                    <p>
                        My AD is a business aimed at creating advertisements as per the demands of the customer. We create advertisements with following features....
                    </p>
                    <ul>
                        <li><i class="fa fa-check"></i>Colorful Ads</li>
                        <li><i class="fa fa-check"></i>Video advertisements with 720p supported</li>
                        <li><i class="fa fa-check"></i>Easy Solutions</li>
                        <li><i class="fa fa-check"></i>Easy Login form and user module</li>
                        <li><i class="fa fa-check"></i>Best for mobiles and business related Advertisments</li>
                    </ul>
                   
                </div>
                <!-- ./ app info box -->
                <div class="col-md-6">
                    <img src="~/img/2.png" runat="server" class="img-responsive" alt="" />
                </div>
                <!-- ./ app info box -->
            </div>
        </div>
    </section>
    <!-- /.container -->
    <!-- Products Section -->
    <section id="products" class="products-list padding100">
        <div class="container">
            <div class="row">
                <div class="section-title col-sm-8 col-sm-offset-2 col-md-8 col-md-offset-2 col-lg-8 col-lg-offset-2">
                    <h2 class="animated wow fadeInLeft" data-wow-delay="0.4s">
                        Our Innovative Sample <span class="common">' Advertisements ' </span></h2>                   
                </div>
            </div>
            <!-- ./end row -->
            <div class="row">
                <div class="col-sm-12 animated wow fadeInUp" data-wow-delay="0.6s">
                    <div id="screens" class="owl-carousel">
                        <div>
                            <img src="img/products/1.jpg" class="img-responsive" alt="screens">
                        </div>
                        <div>
                            <img src="img/products/2.jpg" class="img-responsive" alt="screens">
                        </div>
                        <div>
                            <img src="img/products/3.jpg" class="img-responsive" alt="screens">
                        </div>
                        <div>
                            <img src="img/products/4.jpg" class="img-responsive" alt="screens">
                        </div>
                        <div>
                            <img src="img/products/6.jpg" class="img-responsive" alt="screens">
                        </div>
                        <div>
                            <img src="img/products/5.jpg" class="img-responsive" alt="screens">
                        </div>
                        
                    </div>
                    <!-- ./ end slider -->
                </div>
            </div>
            <!-- ./ end row -->
        </div>
    </section>
   <%-- <!-- Download Section -->
    <section id="download" class="padding100">
        <div class="container">
            <div class="row">
                <div class="section-title col-sm-8 col-sm-offset-2 col-md-8 col-md-offset-2 col-lg-8 col-lg-offset-2">
                    <h2 class="animated wow fadeInLeft" data-wow-delay="0.4s">
                        Waiting for what <span class="common">' DOWNLOAD NOW'</span></h2>
                    
                </div>
            </div>
            <!-- ./end row -->
            <div class="row">
                <div class="col-sm-8 col-sm-offset-2 text-center">
                    <div class="download-wrap animated wow fadeInLeft" data-wow-delay="0.4s">
                        <a href="#" class="btn btn-download wow fadeInUp"><i class="fa fa-android"></i><strong>
                            Download App</strong> <span>From Play Store</span> </a><a href="#" class="btn btn-download app wow fadeInUp"
                                data-wow-delay="0.2s"><i class="fa fa-apple"></i><strong>Download App</strong> <span>
                                    From App Store</span> </a><a href="#" class="btn btn-download window wow fadeInUp"
                                        data-wow-delay="0.2s"><i class="fa fa-windows"></i><strong>Download App</strong>
                                        <span>From windows store</span> </a>
                    </div>
                </div>
            </div>
            <!-- ./end row -->
        </div>
    </section>
    <!--End Download Section end-->--%>
</asp:Content>

