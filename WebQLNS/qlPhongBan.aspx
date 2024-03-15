<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="QLPhongBan.aspx.cs" Inherits="WedQLNS.QLPhongBan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"

    <div class="row w-50 m-auto">
        <div calss="col-md-12 form-inline mt-3 text-center">
            Chọn phòng ban: <asp:DropDownList ID="ddPhong" runat="server" CssClass="form-control" DataSourceID="dsPhong" DataTextField="TenPhong" DataValueField="MaPhong" AutoPostBack="true"></asp:DropDownList>
        </div>
    </div>
    <asp:GridView ID="gvNhanVien" runat="server" AutoGenerateColumns="false"
        CssClass="table table-bordered table-hover" DataSourceID="dsNhanVienTheoPhong" DataKeyNames="MaNV">
        <Columns>
            <asp:BoundField DataField="MaNV" HeaderText="Mã nv" ReadOnly="true" />
            <asp:BoundField DataField="HoNV" HeaderText="Họ nv" />
            <asp:BoundField DataField="TenNV" HeaderText="Tên nv" />
            <asp:CheckBoxField DataField="Phai" HeaderText="Phái" />
            <asp:BoundField DataField="NgaySinh" DataFormatString="{0:dd/MM/yyyy}" HeaderText="Ngày sinh" />
            <asp:BoundField DataField="NoiSinh" HeaderText="Nơi sinh" />
            <asp:BoundField DataField="MaPhong" HeaderText="Mã phòng" />
            <asp:CommandField ButtonType="Button" ShowDeleteButton="true" />
        </Columns>
        <HeaderStyle CssClass="bg-secondary text-light" />
        <EmptyDataTemplate>
            <div class="alert alert-warning">
                Không có nhân viên nào thuộc phòng ban này
            </div>
        </EmptyDataTemplate>
    </asp:GridView>

    <asp:SqlDataSource ID="dsPhong" runat="server" 
        ConnectionString="<%$ ConnectionString:QLNhanVienConnectionString %>" 
        SelectCommand="SELECT * FROM [PhongBan]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="dsNhanVienTheoPhong" runat="server"
        ConnectionString="<%$ ConnectionString: QLNhanVienConnectionString %>"
        DeleteCommand="DELETE FORM [NhanVien] WHERE [MaNV] = @MaNV"
        SelectCommand="SELECT * FROM [NhanVien] WHERE ([MaPhong] = @MaPhong)"
        >
        <DeleteParameters>
            <asp:Parameter Name="MaNV" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddPhong" Name="MaPhong" PropertyName="Selectedvalue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>