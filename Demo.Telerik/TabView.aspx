<%@ Page Title="Home Page" Language="C#" AutoEventWireup="true" CodeBehind="Telerik5.aspx.cs" Inherits="Demo.Telerik.TabView" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns='http://www.w3.org/1999/xhtml'>
<head runat="server">
    <title>Telerik ASP.NET Example</title>
    <link rel="stylesheet" type="text/css" href="styles5.css" />
</head>
<body>
    <p>
        This demo was adapted from <a href="https://demos.telerik.com/aspnet-ajax/tabstrip">https://demos.telerik.com/aspnet-ajax/tabstrip</a>
    </p>
    <form id="form1" runat="server">
    <telerik:RadScriptManager runat="server" ID="RadScriptManager1" />
    <telerik:RadSkinManager ID="RadSkinManager1" runat="server" ShowChooser="true" />
    <div class="demo-container no-bg">
        <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip1"  MultiPageID="RadMultiPage1" SelectedIndex="0" Skin="Silk">
            <Tabs>
                <telerik:RadTab Text="My Cook Book" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="Newest" Width="200px"></telerik:RadTab>
                <telerik:RadTab Text="Top Recipe" Width="200px"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <telerik:RadMultiPage runat="server" ID="RadMultiPage1"  SelectedIndex="0" CssClass="outerMultiPage">
            <telerik:RadPageView runat="server" ID="RadPageView1">
                <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip2"  MultiPageID="RadMultiPage2"
                    Orientation="VerticalLeft" Skin="Silk" Width="50px" Height="355px" SelectedIndex="0">
                    <Tabs>
                        <telerik:RadTab ImageUrl="images/icon_AllRecipes.png" ToolTip="Main Course" SelectedImageUrl="images/icon_AllRecipes.png" HoveredImageUrl="images/icon_AllRecipes.png" Height="40px"></telerik:RadTab>
                        <telerik:RadTab ImageUrl="images/icon_Desserts.png" ToolTip="Desserts" SelectedImageUrl="images/icon_Desserts.png" HoveredImageUrl="images/icon_Desserts.png" Height="40px"></telerik:RadTab>
                        <telerik:RadTab ImageUrl="images/icon_Soups.png" ToolTip="Soups" SelectedImageUrl="images/icon_Soups.png" HoveredImageUrl="images/icon_Soups.png" Height="40px"></telerik:RadTab>
                        <telerik:RadTab ImageUrl="images/icon_Seafood.png" ToolTip="Seafood" SelectedImageUrl="images/icon_Seafood.png" HoveredImageUrl="images/icon_Seafood.png" Height="40px"></telerik:RadTab>
                    </Tabs>
                </telerik:RadTabStrip>
                <telerik:RadMultiPage runat="server" ID="RadMultiPage2"  SelectedIndex="0" CssClass="innerMultiPage">
                    <telerik:RadPageView runat="server" ID="PageView1">
                        <div class="recipeImage qsf-ib">
                            <img src="images/Beef_Stewed.png" alt="image" />
                        </div>
                        <div class="ingredients qsf-ib">
                            <p>Beef Stewed in a Salty Herb Crust</p>
                            <ul>
                                <li>800 gr beef bonfile</li>
                                <li>2 tablespoons olive oil</li>
                                <li>1 tabslespoon butter</li>
                                <li>salt and pepper</li>
                            </ul>
                            <p class="subtitle">For the crust:</p>
                            <ul>
                                <li>120 gr cooking salt </li>
                                <li>200 gr sea salt</li>
                                <li>500 gr butter</li>
                                <li>2 egg whites</li>
                                <li>250 ml water</li>
                                <li>2 tablespoons of rosmarin and salvia</li>
                            </ul>
                        </div>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" ID="PageView2">
                        <div class="recipeImage qsf-ib">
                            <img src="images/Lavender_Ice_Cream.png" alt="image" />
                        </div>
                        <div class="ingredients qsf-ib">
                            <p>Lavender Ice Cream</p>
                            <ul>
                                <li>250 ml cream 35%</li>
                                <li>1 can of condensed milk</li>
                                <li>1 can of sweetened condensed milk</li>
                                <li>1 vanilla bean</li>
                                <li>1 tablespoon lavender flowers</li>
                            </ul>
                        </div>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" ID="PageView3">
                        <div class="recipeImage qsf-ib">
                            <img src="images/Creamy_Soup.png" alt="image" />
                        </div>
                        <div class="ingredients qsf-ib">
                            <p>Creamy Soup with Port Wine and Cheese</p>
                            <ul>
                                <li>2 tablespoons butter </li>
                                <li>1 onion</li>
                                <li>450 gr carrots</li>
                                <li>500 ml vegetable stock</li>
                                <li>100 gr. Feta cheese</li>
                                <li>3 tablespoons Port wine </li>
                                <li>2 tablespoons fresh dill</li>
                            </ul>
                        </div>
                    </telerik:RadPageView>
                    <telerik:RadPageView runat="server" ID="PageView4">
                        <div class="recipeImage qsf-ib">
                            <img src="images/Clam_Spinach_and_Peanut_Stew.png" alt="image" />
                        </div>
                        <div class="ingredients qsf-ib">
                            <p>Clam, Spinach and Peanut Stew</p>
                            <ul>
                                <li>1 onion</li>
                                <li>30 ml olive oil</li>
                                <li>500 gr white clams</li>
                                <li>100 gr raw peanuts</li>
                                <li>2 small tomatoes</li>
                                <li>100 gr spinach</li>
                                <li>200 gr. rice</li>
                                <li>salt and pepper</li>
                            </ul>
                        </div>
                    </telerik:RadPageView>
                </telerik:RadMultiPage>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="RadPageView2">
                <div class="recipeImage qsf-ib">
                    <img src="images/Greek_Moussaka.png" alt="image" />
                </div>
                <div class="ingredients qsf-ib">
                    <p>Greek Moussaka </p>
                    <ul>
                        <li>1 kg eggplant</li>
                        <li>500 gr minced meat</li>
                        <li>100 ml olive oil</li>
                        <li>1 onion</li>
                        <li>100 ml dry white wine</li>
                        <li>600 gr tomatoes</li>
                        <li>1 cinnammon stick</li>
                        <li>0.5 parsley bunch</li>
                        <li>salt and pepper</li>
                    </ul>
                </div>
            </telerik:RadPageView>
            <telerik:RadPageView runat="server" ID="RadPageView3">
                <div class="recipeImage qsf-ib">
                    <img src="images/Chocolate_Cheesecake.png" alt="image" />
                </div>
                <div class="ingredients qsf-ib">
                    <telerik:RadRating RenderMode="Lightweight" ID="RadRating" Skin="Silk" Value="5" runat="server"></telerik:RadRating>
                    <p>Chocolate Cheesecake with Bombardino </p>
                    <ul>
                        <li>150 gr cocoa biscuits </li>
                        <li>80 gr butter</li>
                        <li>0.5 teaspoon cinnammon </li>
                        <li>800 gr cream cheese</li>
                        <li>150 gr sugar</li>
                        <li>100 gr dark chocolate</li>
                        <li>100 gr milk chocolate</li>
                        <li>1 teaspoon vanilla extract</li>
                        <li>3 eggs</li>
                        <li>100 ml Bombardino liquer</li>
                    </ul>
                </div>
            </telerik:RadPageView>
        </telerik:RadMultiPage>
        <div class="disclaimer">
            <p>
                The images and recipies have been adjusted for the purpose of this demo.
                The originals belong to <b>kulinarno-joana.com</b>.
            </p>
        </div>
    </div>
 
    </form>
</body>
</html>