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
    public class ManageController : Controller
    {
        private InfosDBEntities db = new InfosDBEntities();

        //
        // GET: /Manage/

        public ActionResult Index()
        {
            return View(db.Info.ToList());
        }

        //
        // GET: /Manage/Details/5

        public ActionResult Details(int id = 0)
        {
            Info info = db.Info.Single(i => i.Id == id);
            if (info == null)
            {
                return HttpNotFound();
            }
            return View(info);
        }

        //
        // GET: /Manage/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Manage/Create

        [HttpPost]
        public ActionResult Create(Info info)
        {
            if (ModelState.IsValid)
            {
                db.Info.AddObject(info);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(info);
        }

        //
        // GET: /Manage/Edit/5

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
        // POST: /Manage/Edit/5

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
        // GET: /Manage/Delete/5

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
        // POST: /Manage/Delete/5

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
    }
}