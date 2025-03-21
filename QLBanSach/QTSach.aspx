<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="QTSach.aspx.cs" Inherits="QLBanSach.QTSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>TRANG QUẢN TRỊ SÁCH</h2>
    <hr />
    <div class="row mb-2">
        <div class="col-md-6">
            <div class="form-inline">
                Tựa sách
                <asp:TextBox ID="txtTen" runat="server" placeholder="Nhập tựa sách cần tìm" CssClass="form-control ml-2" Width="300"></asp:TextBox>
                <asp:Button ID="btTraCuu" OnClick="btTraCuu_Click" runat="server" Text="Tra cứu" CssClass="btn btn-info ml-2" />
            </div>
        </div>
        <div class="col-md-6 text-right">
            <a href="ThemSach.aspx" class="btn btn-success">Thêm sách mới</a>
        </div>
    </div>

    <asp:GridView ID="grSach" runat="server" DataSourceID="odsSach" AutoGenerateColumns="False" CssClass="table table-bordered"
        AllowPaging="True" PageSize="5" DataKeyNames="masach">
        <Columns>
            <asp:BoundField DataField="TenSach" HeaderText="Tên sách" />
            <asp:ImageField DataImageUrlField="Hinh" DataImageUrlFormatString="/Bia_Sach/{0}"
                ControlStyle-Width="150px" HeaderText="Hình ảnh" ReadOnly="true">
            </asp:ImageField>
            <asp:BoundField DataField="Dongia" HeaderText="Đơn giá" />
            <asp:TemplateField HeaderText="Khuyến mãi">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Eval("KhuyenMai", "{0:true}").ToString().ToLower() == "true" ? "X" : "" %>' />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:CheckBox runat="server" Checked='<%# Eval("KhuyenMai", "{0:true}").ToString().ToLower() == "true" %>' />
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowDeleteButton="true" ShowEditButton="true" ButtonType="Button" />
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
    </asp:GridView>

    <asp:ObjectDataSource ID="odsSach" runat="server" SelectMethod="laySachTheoTen" TypeName="QLBanSach.Models.SachDAO" DataObjectTypeName="QLBanSach.Models.Sach" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtTen" Name="tensach" PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:ObjectDataSource>

</asp:Content>
