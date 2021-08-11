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
    public class EFController : Controller
    {
        private InfosDBEntities db = new InfosDBEntities();
        //
        // GET: /EF/

        public ActionResult Index(string search)
        {
            var infos = from m in db.Info
                        select m;
            if (!String.IsNullOrEmpty(search))
            {
                infos = infos.Where(s => s.Product.Contains(search));
                if (infos.Count() == 0)
                {
                    ViewData["Mes"] = "没有搜索到相关商品信息";
                }
                string a = "1";
                ViewBag.hao = a;
                ViewBag.haoinfo = infos;
            }
            return View(infos);
        }


        public ActionResult indextime() 
        {
            if (ModelState.IsValid) 
            {
                string a = Request["type"];
                string b = Request["statue"];
                string c = Request["trading"];
                var list = (from i in db.Info where i.Type.Equals(a) && i.Status.Equals(b) && i.Tradingstatus.Equals(c) select i).ToList();
                var lit1 = list.OrderBy(s=>s.Infotime);
                ViewBag.infotime = list;
                return View(list);
            }
            return View();
        }
        //
        // GET: /EF/Details/5

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
            var re = db.Review.Where(b => b.Id == id);
            ViewBag.re = re;
            if (re.Count() == 0) { ViewData["Mes"] = "暂无评论"; }
            db.SaveChanges();
            return View(info);
        }
        //
        // GET: /EF/Create

        public ActionResult Create()
        {
            return View();
        }
        public ActionResult Create2()
        {
            return View();
        }
        
        
       
        //
        // POST: /EF/Create

        [HttpPost]
        public ActionResult Create(Info info,HttpPostedFileBase Pic1)//
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
        [HttpPost]
        public ActionResult Create2(Info info,HttpPostedFileBase Pic1)
        {
            if (ModelState.IsValid)
            {
                info.Username = (String)@Session["username"];    //加的
                info.Password = (String)@Session["password"];    //加的
                info.Pic = "/Images/" + Pic1.FileName;
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
        // GET: /EF/Edit/5

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
        // POST: /EF/Edit/5

        [HttpPost]
        public ActionResult Edit(Info info)
        {
            if (ModelState.IsValid)
            {
                db.Info.Attach(info);
                db.ObjectStateManager.ChangeObjectState(info, EntityState.Modified);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(info);
        }

        //
        // GET: /EF/Delete/5

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
        // POST: /EF/Delete/5

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

        //Record  加的
        public ActionResult Record()
        {
            return View(db.Table.ToList());
        }
        //评论
        public ActionResult Createre()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Createre(Review rev)//
        {
            if (ModelState.IsValid)
            {
                rev.Rename = User.Identity.Name;
                rev.Content = Request["content1"];
                if (rev.Content == "") 
                {
                  return Content("<script>alert('内容不能为空');history.go(-1);</script>");
                }
                string time = System.DateTime.Now.ToString("yyyy-MM-dd-hh-mm-ss");
                rev.Retime = DateTime.Now;
                var id1 = Request["id1"];
                rev.Id = Convert.ToInt32(id1);
                db.Review.AddObject(rev);
                db.SaveChanges();
                return Content("<script>alert('评论成功，刷新一下页面可显示信息');history.go(-1);</script>");
            }
            return View(rev);
        }
        public ActionResult reply()
        {
            return View();
        }
        [HttpPost]
        public ActionResult reply(Review reply)
        {
            if (ModelState.IsValid)
            {
                reply.Rename = User.Identity.Name;
                reply.Replyname = Request["name2"];
                reply.Content = Request["content2"];
                string upid1 = Request["reid2"];
                reply.Upid = Convert.ToInt32(upid1);
                var id1 = Request["id2"];
                reply.Id = Convert.ToInt32(id1);
                reply.Retime = DateTime.Now;
                db.Review.AddObject(reply);
                db.SaveChanges();
                return Content("<script>alert('评论成功，刷新一下页面可显示信息');history.go(-1);</script>");
            }
            return View(reply);
        }
        public ActionResult Createreply(int id = 0)
        {
            var re = db.Review.Where(b => b.Reid == id);
            ViewBag.rep = re;
            var allre = db.Review.Where(c => c.Upid == id);
            ViewBag.allre = allre;
            if (allre.Count() == 0) { ViewData["Mess"] = "暂无回复"; }
            return View(allre);
        }
        public ActionResult Message(string search) 
        {
            string a = User.Identity.Name;
            var review = db.Review.Where(i => i.Rename == a);
            ViewBag.send = review;
            if (review.Count() == 0) { ViewData["Mes1"] = "你还没有发表过评论";}
            var reply = db.Review.Where(i => i.Replyname == a);
            ViewBag.reply = reply;
            if (reply.Count() == 0) { ViewData["Mes2"] = "没有收到回复消息";}
           if (!String.IsNullOrEmpty(search))
            {
                int id = 0;
                int.TryParse(search, out id);
                var  rev = db.Info.Where(s => s.Id.Equals(id));
                if (rev.Count() == 0)
                {
                return Content("<script>alert('搜索不到相关信息');history.go(-1);</script>");
                }
                return RedirectToAction("Details", new { id=id});
            }
           return View();
        }
        public ActionResult deletereply(int id = 0) 
        {
            Review dereply = db.Review.Single(i => i.Reid == id);
            db.Review.DeleteObject(dereply);
            db.SaveChanges();
            return RedirectToAction("Message");
        }
    }
}