﻿<%@ Page language="c#" Codebehind="Browser.aspx.cs" AutoEventWireup="True" Inherits="WatchersNET.CKEditor.Browser.Browser" %>
<%@ Register TagPrefix="wnet" Namespace="WatchersNET.CKEditor.Controls" Assembly="WatchersNET.CKEditor" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    <meta name="language" content="en" />
    <title id="title" runat="server">WatchersNET.FileBrowser</title>
    <link rel="stylesheet" type="text/css" href="Browser.css" />
    <asp:Placeholder id="favicon" runat="server"></asp:Placeholder>
    <script type="text/javascript">
        function ScrollToSelectedNode() { var selectedNodeID = jQuery('#<%=FoldersTree.ClientID %>_SelectedNode').val(); if (selectedNodeID != '') { var scrollTop = jQuery('#' + selectedNodeID).position().top; var scrollLeft = jQuery('#' + selectedNodeID).position().left; jQuery('#FoldersBox').scrollTop(scrollTop); jQuery('#FoldersBox').scrollLeft(scrollLeft) } } function readCookie(name) { var nameEQ = name + "="; var ca = document.cookie.split(';'); for (var i = 0; i < ca.length; i++) { var c = ca[i]; while (c.charAt(0) == ' ') c = c.substring(1, c.length); if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length) } return null }
    </script>
    <script src="js/Browser.js" type="text/javascript"></script>
  </head>
  <body>
    <form id="fBrowser" method="post" runat="server">
      <asp:Label id="ckFileName" runat="server" />
      <div id="BrowserContainer">
      <h1><asp:Label id="lblModus" runat="server"></asp:Label></h1>
      <hr />
      <div class="ui-tabs ui-widget ui-widget-content ui-corner-all" style="width:820px">
      <asp:RadioButtonList id="BrowserMode" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" CssClass="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
          <asp:ListItem text="File Link" value="file" Selected="True"></asp:ListItem>
          <asp:ListItem text="Page Link" value="page"></asp:ListItem>
       </asp:RadioButtonList>
      <asp:Panel id="panPageMode" runat="server">
        <table>
          <tr>
            <td>
              <strong><asp:Label id="lblChoosetab" runat="server" Text="Choose a Page:"></asp:Label></strong>
            </td>
            <td>
              <div id="TabsBox">
                <asp:TreeView id="treeTabs" runat="server" Width="683"  ExpandDepth="1" ExpandImageUrl="Images/plus.gif" CollapseImageUrl="Images/minus.gif">
                  <NodeStyle ImageUrl="Images/Page.gif" />
                  <SelectedNodeStyle Font-Underline="true" ForeColor="#9eda29" />
                </asp:TreeView>
              </div>
            </td>
          </tr>
          <tr>
            <td>
              <strong><asp:Label id="ExtraTabOptions" runat="server" Text="Extra Tab Options:"></asp:Label></strong>
            </td>
            <td>
                <table>
                  <tr>
                    <td>
                    </td>
                    <td>
                      <asp:CheckBox ID="chkHumanFriendy" runat="server" Text="Human Friendly Url" Checked="true" />
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <em><asp:Label id="LabelAnchor" runat="server" Text="Select an Page Anchor:"></asp:Label></em>
                    </td>
                    <td>
                      <asp:DropDownList ID="AnchorList" runat="server">
                        <asp:ListItem Text="None"></asp:ListItem>
                      </asp:DropDownList>
                    </td>
                  </tr>
                  <tr id="LanguageRow" runat="server">
                    <td>
                      <em><asp:Label id="LabelTabLanguage" runat="server" Text="Add Aditional Language Parameter:"></asp:Label></em>
                    </td>
                    <td>
                      
                      <asp:DropDownList ID="LanguageList" runat="server">
                        <asp:ListItem Text="None"></asp:ListItem>
                      </asp:DropDownList>
                    </td>
                  </tr>
                </table> 
              </td>
          </tr>
        </table>
      </asp:Panel>
      <asp:Panel id="panImageEdHead" runat="server" Visible="false">
        <h1><asp:Label id="lblResizeHeader" runat="server" Text="Image Editor : Resize"></asp:Label></h1>
        <div style="margin:5px 0 5px 0;">
          <asp:Label id="lblOtherTools" runat="server" Text="Other Tools:"></asp:Label>
          <asp:Button ID="cmdCrop" runat="server" Text="Crop" />
          <asp:Button ID="cmdZoom" runat="server" Text="Zoom" />
          <asp:Button ID="cmdRotate" runat="server" Text="Rotate" />
          <asp:Button ID="cmdResize2" runat="server" Text="Resize" />
        </div>
      </asp:Panel>
      <asp:Panel id="panThumb" runat="server" Visible="false">

        <div style="margin-top:5px">
          <div class="PanelSubDivs">
          <asp:Label id="lblWidth" runat="server" Text="New Width:" Font-Bold="true"></asp:Label> 
          &nbsp;<asp:TextBox ID="txtWidth" runat="server" onchange="javascript: ChangedSliderW(this);" Width="30"></asp:TextBox>px&nbsp;
          <asp:Label id="lblHeight" runat="server" Text="New Height:" Font-Bold="true"></asp:Label> 
          &nbsp;<asp:TextBox ID="txtHeight" runat="server" onchange="javascript: ChangedSliderH(this);" Width="30"></asp:TextBox>px
          &nbsp;<asp:CheckBox id="chkAspect" runat="server" Text="Maintain Aspect Ratio" Checked="true" />
          <div id="SliderHeight"></div>
          <div id="SliderWidth"></div>
          </div>
         <div class="PanelSubDivs">
            <asp:Label id="lblThumbName" runat="server" Text="New Filename:" Font-Bold="true"></asp:Label>&nbsp;
            <asp:TextBox ID="txtThumbName" runat="server" Width="500"></asp:TextBox>
          </div>
          <div class="PanelSubDivs">
            <asp:Label id="lblImgQuality" runat="server" Text="Image Quality:" Font-Bold="true"></asp:Label>&nbsp;
            <asp:DropDownList id="dDlQuality" runat="server"></asp:DropDownList>&nbsp;%
          </div>
          <div class="PanelSubDivs" style="padding-bottom:5px;">
           <asp:Button ID="cmdResizeNow" CssClass="DefaultButton" Text="Resize Now" runat="server" />&nbsp;
           <asp:Button ID="cmdResizeCancel" Text="Cancel Resize" runat="server" />
          </div>
        </div>
         </asp:Panel>
         <asp:Panel id="panImageEditor" runat="server" Visible="false">
          <div  class="PanelSubDivs">
             <asp:Label id="lblCropImageName" runat="server" Text="New Filename:" Font-Bold="true"></asp:Label>&nbsp;
             <asp:TextBox ID="txtCropImageName" runat="server" Width="500"></asp:TextBox>
           </div>
           <div class="PanelSubDivs" style="padding-bottom:5px;">
              <input type="submit" name="CropNow" value='<%= DotNetNuke.Services.Localization.Localization.GetString("cmdCropNow.Text", this.ResXFile, this.LanguageCode) %>' id="CropNow" CssClass="DefaultButton" />
              <asp:Button ID="cmdCropNow" Text="Create New Image" runat="server" Style="display:none" />&nbsp;
              <asp:Button ID="cmdCropCancel" Text="Cancel Crop" runat="server" />
            </div>
          <div class="CropButtons">
             <div id="PreviewCrop">
              <img src="images/Preview.png" alt="Show Preview" />&nbsp;<asp:Label id="lblShowPreview" runat="server" Text="Show Preview"></asp:Label>
            </div>
            <div id="ClearCrop">
              <img src="images/Clear.png" alt="Clear Preview" />&nbsp;<asp:Label id="lblClearPreview" runat="server" Text="Clear Preview"></asp:Label>
            </div>
            <div style="clear:both"></div>
          </div>
        </asp:Panel>
        <asp:Panel id="panImagePreview" runat="server" Visible="false">
      <table id="ImageTable">
        <tr>
           <td><asp:Label id="lblOriginal" Text="Original:" Font-Bold="true" runat="server"></asp:Label></td>
          <td><asp:Label id="lblPreview" Text="Preview:" Font-Bold="true" runat="server"></asp:Label></td>
        </tr>
        <tr>
          <td>
            <div id="ImageOriginal">
              <asp:Image id="imgOriginal" runat="server" />
            </div>
          </td>
          <td>
            <div class="ImagePreview">
              <asp:Label id="lblCropInfo" runat="server" Text="Here you will see the cropped image" Visible="false" Font-Italic="true"></asp:Label>
              <asp:Image id="imgResized" runat="server" />
            </div>
          </td>
        </tr>
      </table>
      </asp:Panel>
      
      <asp:Panel id="panLinkMode" runat="server">
        <p style="margin:5px 0 5px 5px"><strong><asp:Label id="lblCurrent" runat="server" text="Current Directory:"></asp:Label></strong> <asp:Label id="lblCurrentDir" runat="server"></asp:Label></p>
      
      <asp:Panel id="panUploadDiv" runat="server" Visible="false">
      <div class="ModalDialog_overlayBG" ></div>
      <div class="MessageBox">
        <div class="ModalDialog">
          <div class="popup">
            <div class="DialogContent">
              <div class="modalHeader">
                <h3><asp:Label id="UploadTitle" runat="server" Text="Upload a File" /></h3>
              </div>
              <div>
                  <asp:FileUpload ID="ctlUpload" runat="server" />
              </div>
              <div class="maximumFileUploadInfo">
                  <asp:Label ID="MaximumUploadSizeInfo" runat="server"></asp:Label>
              </div>
              <hr />
              <div class="ModalFooter">
                <input type="submit" name="UploadNow" value="Upload Now" onclick="GetFileSize('ctlUpload', <%= WatchersNET.CKEditor.Utilities.Utility.GetMaxUploadSize(false) %>, '<%= DotNetNuke.Services.Localization.Localization.GetString("FileToBig.Text", this.ResXFile, this.LanguageCode) %>');" id="UploadNow" />
                <asp:Button ID="cmdUploadNow" Style="display:none" runat="server" />&nbsp;
                <asp:Button ID="cmdUploadCancel" Text="Cancel Upload" runat="server" />
              </div>
            </div>
          </div>
        </div>
      </div>
      </asp:Panel>
      
      <asp:Panel id="panCreate" runat="server" Visible="false">
      <div class="ModalDialog_overlayBG" ></div>
      <div class="MessageBox">
        <div class="ModalDialog">
          <div class="popup">
            <div class="DialogContent">
              <div class="modalHeader">
                <h3><asp:Label id="NewFolderTitle" runat="server" Text="Create New Folder" /></h3>
              </div>
              <div><asp:Label id="lblNewFoldName" runat="server" Text="New Folder Name"></asp:Label></div>
              <asp:TextBox ID="tbFolderName" runat="server" Width="300" />
              <hr />
              <div class="ModalFooter">
                <asp:Button ID="cmdCreateFolder" CssClass="DefaultButton ui-state-focus" Text="Create Now" runat="server" />
                <asp:Button ID="cmdCreateCancel" Text="Cancel" runat="server" />
              </div>
            </div>
          </div>
        </div>
      </div>
      </asp:Panel>
      
      <table class="LinkModeTable">
        <tr>
          <td>
              <span class="Toolbar">
                  <asp:LinkButton id="cmdCreate"  runat="server" ToolTip="Create a New Sub folder" onclick="Create_Click">
                      <img src="Images/CreateFolder.gif" alt="Create Folder" title="Create a New Sub folder" /> Create New Folder
                  </asp:LinkButton>
                  <asp:LinkButton id="Syncronize"  runat="server" ToolTip="Synchronize Folder" onclick="Syncronize_Click">
                      <img src="Images/CreateFolder.gif" alt="Synchroniz Folder" title="Syncronize Folder" /> Synchronize Folder
                  </asp:LinkButton>
             </span>
          </td>
          <td>
              <span class="Toolbar">
                  <asp:LinkButton id="cmdUpload"  runat="server" ToolTip="Upload a file" onclick="Upload_Click">
                      <img src="Images/UploadButton.gif" alt="Upload File" title="Upload a file" /> Upload File
                  </asp:LinkButton>
                  &nbsp;<asp:LinkButton ToolTip="Download selected file" id="cmdDownload"  runat="server" onclick="Download_Click">
                            <img src="Images/DownloadButton.gif" alt="Download File" title="Download selected a file" /> Download File
                        </asp:LinkButton>
                  &nbsp;<asp:LinkButton ToolTip="Delete the selected file" id="cmdDelete"  runat="server" onclick="Delete_Click">
                        <img src="Images/DeleteFile.gif" alt="Delete File" title="Delete the selected file" /> Delete File
                  </asp:LinkButton> 
                  &nbsp;<asp:LinkButton ToolTip="Image Resizer" id="cmdResizer" runat="server" onclick="Resizer_Click">
                        <img src="Images/ResizeImage.gif" alt="Image Resizer" title="Image Resizer" /> Image Resizer
                  </asp:LinkButton>
              </span>
          </td>
        </tr>
        <tr>
          <td style="padding-top:9px">
            <asp:Label id="lblSubDirs" runat="server" Text="Subdirectories:"></asp:Label><br />
            <div id="FoldersBox">
              <asp:TreeView ID="FoldersTree" runat="server"  ExpandDepth="1" ExpandImageUrl="Images/plus.gif" CollapseImageUrl="Images/minus.gif">
                <NodeStyle ImageUrl="Images/folder.gif" />
                <SelectedNodeStyle Font-Underline="true" ForeColor="#9eda29" />
              </asp:TreeView>
            </div>
            <asp:Label runat="server" ID="FileSpaceUsedLabel" CssClass="fileSpaceUsedLabel"></asp:Label>
          </td>
          <td style="Width:550px">
            <asp:Label id="lblConFiles" runat="server" Text="Contained Files:"></asp:Label>&nbsp;
            <asp:Label runat="server" id="SwitchDetailView">DetailView</asp:Label>&nbsp;
            <asp:Label runat="server" id="SwitchListView">ListView</asp:Label>&nbsp;
            <asp:Label runat="server" id="SwitchIconsView">IconsView</asp:Label>&nbsp;|
            <asp:LinkButton runat="server" id="SortAscending" OnClick="SortAscendingClick">Sort Ascending</asp:LinkButton>&nbsp;
            <asp:LinkButton runat="server" id="SortDescending" OnClick="SortDescendingClick">Sort Descending</asp:LinkButton>
            <br />
            <asp:HiddenField runat="server" ID="ListViewState"/>
            <div id="FilesBox">
              <asp:Repeater ID="FilesList" runat="server">
                <HeaderTemplate>
                  <ul class="FilesDetailView">
                </HeaderTemplate>
                <ItemTemplate>
                  <li class="FilesListRow" id="ListRow" runat="server" 
                      title='<%# DataBinder.Eval(Container.DataItem, "PictureURL").ToString().Substring(DataBinder.Eval(Container.DataItem, "PictureURL").ToString().LastIndexOf("/", StringComparison.Ordinal) + 1)%>'>
                    <asp:LinkButton runat="server" ID="FileListItem" CssClass="FilesListItem" 
                       CommandArgument='<%# DataBinder.Eval(Container.DataItem, "FileId").ToString()%>'>
                      <asp:Image runat="server" ID="FileThumb" CssClass="FilePreview" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "PictureURL").ToString()%>'
                          AlternateText='<%# DataBinder.Eval(Container.DataItem, "FileName").ToString()%>' ToolTip='<%# DataBinder.Eval(Container.DataItem, "FileName").ToString()%>' />
                      <span class="ItemInfo"><%# DataBinder.Eval(Container.DataItem, "Info").ToString()%></span>
                    </asp:LinkButton>
                  </li>
                </ItemTemplate>
                <AlternatingItemTemplate>
                  <li class="FilesListRowAlt" id="ListRow" runat="server" 
                      title='<%# DataBinder.Eval(Container.DataItem, "PictureURL").ToString().Substring(DataBinder.Eval(Container.DataItem, "PictureURL").ToString().LastIndexOf("/", StringComparison.Ordinal) + 1)%>'>
                                        <asp:LinkButton runat="server" ID="FileListItem" CssClass="FilesListItem" 
                       CommandArgument='<%# DataBinder.Eval(Container.DataItem, "FileId").ToString()%>'>
                      <asp:Image runat="server" ID="FileThumb" CssClass="FilePreview" ImageUrl='<%# DataBinder.Eval(Container.DataItem, "PictureURL").ToString()%>'
                          AlternateText='<%# DataBinder.Eval(Container.DataItem, "FileName").ToString()%>' ToolTip='<%# DataBinder.Eval(Container.DataItem, "FileName").ToString()%>' />
                      <span class="ItemInfo"><%# DataBinder.Eval(Container.DataItem, "Info").ToString()%></span>
                    </asp:LinkButton>
                  </li>
                </AlternatingItemTemplate>
                <FooterTemplate>
                  </ul>
                </FooterTemplate>
              </asp:Repeater>
            </div>
            <wnet:Pager id="PagerFileLinks" runat="server" OnPageChanged="PagerFileLinks_PageChanged"></wnet:Pager>
          </td>
        </tr>
      </table>
      </asp:Panel>
      </div>
       <asp:Panel id="panInfo" runat="server">
        <table>
          <tr>
            <td><asp:Label id="FileId" runat="server" Visible="false"></asp:Label><asp:Label id="lblFileName" runat="server" Visible="false"></asp:Label>
              <strong><asp:Label id="lblUrlType" runat="server" Text="Choose Url Type*:"></asp:Label></strong>
            </td>
            <td>
              <asp:RadioButtonList id="rblLinkType" runat="server" ToolTip="Choose Url Type" RepeatDirection="Vertical" CssClass="ButtonList" AutoPostBack="true">
                <asp:ListItem Text="Relative URL" Value="relLnk" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Absolute URL" Value="absLnk"></asp:ListItem>
                <asp:ListItem Text="Relative Secure URL (via LinkClick)" Value="lnkClick"></asp:ListItem>
                <asp:ListItem Text="Absolute Secure URL (via LinkClick)" Value="lnkAbsClick"></asp:ListItem>
              </asp:RadioButtonList>
              <asp:CheckBox id="TrackClicks" runat="server" Text="Track User Clicks?" Visible="false" />
            </td>
          </tr>
        </table>
        </asp:Panel>
        
        <asp:Button id="cmdClose" CssClass="DefaultButton ui-state-focus" runat="server" text="OK" onclick="CmdCloseClick"></asp:Button>&nbsp;<asp:Button id="cmdCancel" runat="server" text="Cancel" ></asp:Button>   
      </div>
      <!-- Loading screen -->
      <asp:Panel id="panelLoading" runat="server" style="display:none">
      <div class="ModalDialog_overlayBG" id="LoadingScreen" ></div>
      <div class="MessageBox">
        <div class="ModalDialog">
          <div class="popup">
            <div class="DialogContent LoadingContent">
              <div class="modalHeader">
                <h3><asp:Label id="Wait" runat="server" Text="Please Wait" /></h3>
              </div>
              <div class="LoadingMessage"><asp:Label id="WaitMessage" runat="server" Text="Loading Page and Parsing Anchors"></asp:Label></div>
            </div>
          </div>
        </div>
      </div>
      </asp:Panel>
      <!-- / Loading screen -->
    </form>
  </body>
</html>