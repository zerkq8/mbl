# LandOfDraft — كاونترات Mobile Legends

موقع ثابت (Static Site) بالكامل — ملف `index.html` واحد يحتوي كل شيء (HTML + CSS + JavaScript)، بلا أي خادم أو قاعدة بيانات. يعمل بفتحه مباشرة في المتصفح.

> **تنبيه صادق:** لا أستطيع دفع هذا المستودع فعلياً إلى GitHub أو نشره على Vercel من هنا — بيئتي هنا معزولة عن الإنترنت ولا تملك حساباتك. الخطوات أدناه تأخذ فعلياً دقيقتين على جهازك.

---

## ١. اختبار محلي فوري (بلا أي تثبيت)

افتح `index.html` مباشرة بالنقر المزدوج عليه، أو من سطر الأوامر:

```bash
# macOS
open index.html
# Windows
start index.html
# Linux
xdg-open index.html
```

---

## ٢. رفعه على GitHub

```bash
cd deploy                     # داخل هذا المجلد (فيه index.html وREADME.md)
git init
git add .
git commit -m "LandOfDraft — النسخة الأولى"

# أنشئ مستودعاً فارغاً من github.com/new (بدون README كي لا يتعارض)
git branch -M main
git remote add origin https://github.com/USERNAME/landofdraft.git
git push -u origin main
```

استبدل `USERNAME` باسم حسابك على GitHub.

---

## ٣. نشره على Vercel

**الطريقة الأسهل — من الموقع مباشرة:**

1. ادخل [vercel.com](https://vercel.com) وسجّل الدخول (يمكن عبر حساب GitHub نفسه).
2. اضغط **Add New → Project**.
3. اختر مستودع `landofdraft` من قائمة مستودعات GitHub المتصلة (اربط حسابك إن لم يظهر).
4. **لا حاجة لأي إعداد** — Vercel يكتشف تلقائياً أنه موقع HTML ثابت (Framework Preset: **Other**، بلا Build Command، بلا Output Directory).
5. اضغط **Deploy**. خلال أقل من دقيقة يظهر رابط جاهز مثل `landofdraft.vercel.app`.

**أو عبر سطر الأوامر (Vercel CLI):**

```bash
npm install -g vercel
cd deploy
vercel login
vercel --prod
```

---

## ٤. بعد النشر — نقاط مهمة

- **لوحة الإدارة (`الإدارة` في القائمة):** بيانات الدخول الافتراضية `admin` / `2026` مكتوبة داخل كود `index.html` نفسه (البحث عن `ADMIN_USER`). **غيّرها قبل مشاركة الرابط مع أي شخص**، لأنها مقروءة بالكامل من الكود المصدري (View Source) — ليست حماية أمنية حقيقية، بل حاجز بسيط لمنع التعديل العرضي.
- **التعديلات من لوحة الإدارة لا تُحفظ بشكل دائم.** الموقع ثابت بلا قاعدة بيانات، فأي إضافة/تعديل/حذف بطل يعمل فقط في الجلسة الحالية للمتصفح ويختفي عند إعادة التحميل. لتعديلات دائمة حقيقية، يلزم ربط الموقع بقاعدة بيانات فعلية (راجع مشروع Next.js + Supabase الكامل الذي بُني في مراحل سابقة من هذا المشروع لهذا الغرض بالضبط).
- **نطاق مخصَّص:** من إعدادات المشروع في Vercel → Domains، يمكن ربط نطاق خاص بك مجاناً بشهادة SSL تلقائية.
- **كل تحديث لاحق:** بمجرّد `git push` لأي تعديل على `index.html`، ينشر Vercel تلقائياً نسخة جديدة خلال ثوانٍ (Auto-Deploy من GitHub).

---

## بنية الملف

- `index.html` — الموقع بالكامل: توكنز التصميم، بيانات ١٣٣ بطلاً، ٢٧٨ إدخال كاونتر، محرّك «احسب أفضل اختيار»، صفحة OP، Patch Notes، ولوحة الإدارة.
- لا حزم (`node_modules`)، لا خطوة بناء (`build`)، لا تبعيات خارجية عدا خطوط Google Fonts عبر `<link>`.
