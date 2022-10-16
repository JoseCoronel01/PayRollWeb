using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using PayRollWeb.Models;

namespace PayRollWeb.Controllers
{
    public class PayRollController : Controller
    {
        private PayRollEntities db = new PayRollEntities();

        // GET: PayRoll
        public ActionResult Index()
        {
            var payRoll = db.PayRoll.Include(p => p.Employee1);
            return View(payRoll.ToList());
        }

        // GET: PayRoll/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayRoll payRoll = db.PayRoll.Find(id);
            if (payRoll == null)
            {
                return HttpNotFound();
            }
            return View(payRoll);
        }

        // GET: PayRoll/Create
        public ActionResult Create()
        {
            ViewBag.Employee = new SelectList(db.Employee, "Id", "Name");
            return View();
        }

        // POST: PayRoll/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Employee,Salary")] PayRoll payRoll)
        {
            if (ModelState.IsValid)
            {
                db.PayRoll.Add(payRoll);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Employee = new SelectList(db.Employee, "Id", "Name", payRoll.Employee);
            return View(payRoll);
        }

        // GET: PayRoll/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayRoll payRoll = db.PayRoll.Find(id);
            if (payRoll == null)
            {
                return HttpNotFound();
            }
            ViewBag.Employee = new SelectList(db.Employee, "Id", "Name", payRoll.Employee);
            return View(payRoll);
        }

        // POST: PayRoll/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Employee,Salary")] PayRoll payRoll)
        {
            if (ModelState.IsValid)
            {
                db.Entry(payRoll).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Employee = new SelectList(db.Employee, "Id", "Name", payRoll.Employee);
            return View(payRoll);
        }

        // GET: PayRoll/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PayRoll payRoll = db.PayRoll.Find(id);
            if (payRoll == null)
            {
                return HttpNotFound();
            }
            return View(payRoll);
        }

        // POST: PayRoll/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PayRoll payRoll = db.PayRoll.Find(id);
            db.PayRoll.Remove(payRoll);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
