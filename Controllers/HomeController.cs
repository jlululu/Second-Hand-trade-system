using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SecondHand.Filters;
using SecondHand.Models;
namespace SecondHand.Controllers
{
    public class HomeController : Controller
    {
        private InfosDBEntities db = new InfosDBEntities();
        public ActionResult Index(string search)
        {
            var infos = from m in db.Info
                        select m;
            ViewBag.Message = "在这里选择对应的专区进行信息的查看";
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

        public ActionResult About()
        {
            ViewBag.Message = "你的闲置求购/转让信息发布页。";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "在这你能看到5条最近的浏览记录";

            return View();
        }
        public ActionResult Action(string search)
        {
            var infos = from m in db.Info
                        select m;
            ViewBag.Message = "在这里选择对应的专区进行信息的查看";
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

        [AllowAnonymous]
        public ActionResult manage()
        {
            string a = User.Identity.Name;
            using (UsersContext dbtest = new UsersContext())
            {
                List<UserProfile> showuser = dbtest.UserProfiles.ToList<UserProfile>();
                ViewBag.showuser = showuser;
                return View(showuser);                
            }
        }

        public ActionResult deleteinfo(int id = 0)
        {
                Info deleteuser = db.Info.Single(i=>i.Id==id);
                db.Info.DeleteObject(deleteuser);
                db.SaveChanges();
                return RedirectToAction("manageproduct"); 
        }

        public ActionResult Delete(int id = 0)
        {
            using (UsersContext dbtest = new UsersContext())
            {
                UserProfile deleteuser = dbtest.UserProfiles.Find(id);
                dbtest.UserProfiles.Remove(deleteuser);
                dbtest.SaveChanges();
                return RedirectToAction("manage");
            }
        }
        public ActionResult manageon()
        {
            string a = User.Identity.Name;
            if (!a.Equals("888")) { return Content("<script>alert('您不是管理员，无权访问');history.go(-1);</script>"); }
            return View();
        }

        public ActionResult manageproduct()
        {
           var showpro1 = db.Info.Where(i => i.Tradingstatus.Equals("尚未交易"));              
           ViewBag.showpro1 = showpro1;
           var showpro2 = db.Info.Where(i => i.Tradingstatus.Equals("完成交易"));
           ViewBag.showpro2 = showpro2;        
           return View();
        }
        public ActionResult Editstatue(int id = 0) 
        {
            var info1 = db.Info.Single(i => i.Id == id);
            if (info1.Tradingstatus.Equals("尚未交易")) 
            {
                info1.Tradingstatus = "完成交易";
                db.SaveChanges();
                return RedirectToAction("manageproduct");
            }
                info1.Tradingstatus = "尚未交易";
                db.SaveChanges();
                return RedirectToAction("manageproduct");
        }

        public ActionResult managereview() 
        {
            var show = db.Review.ToList();
            ViewBag.show = show;
            return View();  
        }
        public ActionResult deletereview(int id=0)
        {
            var show = db.Review.Single(i=>i.Reid==id);
            db.Review.DeleteObject(show);
            db.SaveChanges();
            return RedirectToAction("managereview");
        }
        public ActionResult Index2(string  search)
        {
            var infos = from m in db.Info
                        select m;
            ViewBag.Message = "在这里选择对应的专区进行信息的查看";
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
    }
}
