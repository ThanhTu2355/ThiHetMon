<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemSach.aspx.cs" Inherits="QLBanSach.ThemSach" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>THÊM SÁCH MỚI</h2>
    <hr />
    <div class="w-100">

        <div class="form-group">
            <label class="font-weight-bold">Tên sách</label>
            <asp:TextBox ID="txtTen" runat="server" CssClass="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator ID="rfvTenSach" runat="server" ControlToValidate="txtTen"
                            ErrorMessage="Tên sách không được để trống!" CssClass="text-danger" Display="Dynamic">(*)</asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label class="font-weight-bold">Đơn giá</label>
            <asp:TextBox ID="txtDonGia" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvDonGia" runat="server" ControlToValidate="txtDonGia"
                            ErrorMessage="Đơn giá không được để trống!" CssClass="text-danger" Display="Dynamic">(*)</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvDonGia" runat="server" ErrorMessage="Đơn giá lớn hơn 0" ControlToValidate="txtDonGia"  CssClass="text-danger" Operator="GreaterThan" Type="Integer" ValueToCompare="0">(*)</asp:CompareValidator>
        </div>
        <div class="form-group">
            <label class="font-weight-bold">Chủ đề</label>
            <asp:DropDownList ID="ddlChuDe" runat="server" CssClass="form-control" DataSourceID="odsChuDe" DataTextField="TenCD" DataValueField="MaCD"></asp:DropDownList>
        </div>
        <div class="form-group">
            <label class="font-weight-bold">Ảnh bìa sách</label>
            <asp:FileUpload ID="FHinh" runat="server" CssClass="form-control-file" />
            <asp:RequiredFieldValidator ID="rfvHinh" runat="server" ControlToValidate="FHinh"
                            ErrorMessage="Phải có hình ảnh minh hoạ!" CssClass="text-danger" Display="Dynamic">(*)</asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <label class="font-weight-bold">Khuyến mãi</label>
            <asp:CheckBox ID="chkKhuyenMai" runat="server" Checked="true" CssClass="form-check" />
        </div>
        <asp:Button ID="btXuLy" runat="server" Text="Lưu" OnClick="btXuLy_Click" CssClass="btn btn-success" />

    </div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:ObjectDataSource ID="odsChuDe" runat="server" SelectMethod="getAll" TypeName="QLBanSach.Models.ChuDeDAO"></asp:ObjectDataSource>
    <br />
</asp:Content>
