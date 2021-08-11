using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SecondHand.Models;

namespace SecondHand.Controllers
{
    public class mynewsController : Controller
    {
        private InfosDBEntities db = new InfosDBEntities();

        //
        // GET: /mynews/

        public ActionResult Index()
        {
            return View(db.Info.ToList());
        }

        //
        // GET: /mynews/Details/5

        public ActionResult Details(int id = 0)
        {
            Info info = db.Info.Single(i => i.Id == id);
            if (info == null)
            {
                return HttpNotFound();
            }

            //以下是改的
            var list = (from i in db.Table where i.Product.Equals(info.Product) && i.Uname.Equals(User.Identity.Name) select i).ToList();//
            String m = "";
            foreach (var i in list)
            {
                m = i.Product;
            }
            if (m != "")
            {
                Table t = db.Table.Single(i => i.Product.Equals(info.Product) && i.Uname.Equals(User.Identity.Name));
                db.Table.DeleteObject(t);
            }
            //创建实体对象
            Table table = new Table();
            table.Product = info.Product;
            table.Type = info.Type;
            table.Pic = info.Pic;
            table.Status = info.Status;
            table.Uname = User.Identity.Name;//改过 用session不行;User.Identity.Name获取当前登录的用户名
            table.Time = DateTime.Now;
            db.Table.AddObject(table);//将对象添加到 上下文对象的集合中
            db.SaveChanges();//调用上下文对象的保存方法，将对象存入数据库

            return View(info);
        }

        //
        // GET: /mynews/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /mynews/Create

        [HttpPost]
        public ActionResult Create(Info info, HttpPostedFileBase Pic1)//
        {
            if (ModelState.IsValid)
            {
                info.Username = (String)@Session["username"];    //加的
                info.Password = (String)@Session["password"];    //加的

                info.Pic = "/Images/" + Pic1.FileName;//
                info.Infotime = DateTime.Now;
                string filepath = Server.MapPath("/Images/") + Pic1.FileName;//
                Pic1.SaveAs(filepath);//

                db.Info.AddObject(info);
                db.SaveChanges();
                return RedirectToAction("../Home/Index");
            }
            return View(info);
        }

        //
        // GET: /mynews/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Info info = db.Info.Single(i => i.Id == id);
            if (info == null)
            {
                return HttpNotFound();
            }
            return View(info);
        }

        //
        // POST: /mynews/Edit/5
        [HttpPost]
        public ActionResult Edit(Info info, HttpPostedFileBase Pic)
        {
            if (ModelState.IsValid)
            {
                db.Info.Attach(info);
                db.ObjectStateManager.ChangeObjectState(info, EntityState.Modified);
                if (Pic==null) 
                { 
                 return Content("<script>alert('上传图片不能为空');history.go(-1);</script>");
                }
                info.Pic = "/Images/" + Pic.FileName;//
                //info.Infotime = DateTime.Now;
                string filepath = Server.MapPath("/Images/") + Pic.FileName;//
                Pic.SaveAs(filepath);//
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View();
        }

        //
        // GET: /mynews/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Info info = db.Info.Single(i => i.Id == id);
            if (info == null)
            {
                return HttpNotFound();
            }
            return View(info);
        }

        //
        // POST: /mynews/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Info info = db.Info.Single(i => i.Id == id);
            db.Info.DeleteObject(info);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
        public ActionResult Editstatue(int id = 0)
        {
            var info1 = db.Info.Single(i => i.Id == id);
            if (info1.Tradingstatus.Equals("尚未交易"))
            {
                info1.Tradingstatus = "完成交易";
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            info1.Tradingstatus = "尚未交易";
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}