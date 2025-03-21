using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using QLBanSach.Models;

namespace QLBanSach
{
    public partial class ThemSach : System.Web.UI.Page
    {
        SachDAO sachDAO = new SachDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btXuLy_Click(object sender, EventArgs e)
        {
            try
            {
                string tensach = txtTen.Text;
                int dongia = int.Parse(txtDonGia.Text);
                int chude = int.Parse(ddlChuDe.SelectedValue);

                string hinh = FHinh.FileName;
                string path = Server.MapPath("~/Bia_Sach") + "/" + FHinh.FileName;
                FHinh.SaveAs(path);
                Boolean khuyenmai = chkKhuyenMai.Checked;
                DateTime ngaycapnhat = DateTime.Now;

                Sach sach = new Sach
                {
                    TenSach = tensach,
                    Dongia = dongia,
                    MaCD = chude,
                    Hinh = hinh,
                    KhuyenMai = khuyenmai,
                    NgayCapNhat = ngaycapnhat
                };

                sachDAO.Insert(sach);
                Response.Write("<script>alert('Thêm sách thành công!');</script>");
            }catch(Exception ex)
            {
                Response.Write("<script>alert('Thêm sách thất bại!');</script>");
            }
        }
    }
}