# ANALISIS WEBSITE CODING CAMP DBS FOUNDATION

**URL:** https://www.dbs.com/spark/index/id_id/site/codingcamp/index.html

---

## 🎯 **FUNGSI UTAMA WEBSITE**

Website ini adalah **Enrollment Management System** untuk program Coding Camp - sebuah platform untuk:

1. **Registration/Pendaftaran** peserta bootcamp
2. **Multi-stage Selection Process** (seleksi bertahap)
3. **Document Management** (upload & manage dokumen)
4. **Timeline Tracking** (progress tracking peserta)
5. **Notification System** (pengumuman & konfirmasi)

---

## 📊 **FITUR-FITUR YANG ADA**

### **1. Landing Page / Info Page**
- Hero section dengan branding (Coding Camp 2026 powered by DBS Foundation)
- Timeline program (2 track: Siswa SMK vs Mahasiswa/Umum)
- Tahapan seleksi (step-by-step process)
- CTA button "Daftar Sekarang"

### **2. Registration Flow (Multi-Step)**

#### **Step 1: Isi Formulir Aplikasi**
- Form pendaftaran dengan data pribadi
- Generate & download Surat Komitmen
- Tanda tangan (basah atau digital)

#### **Step 2: Lengkapi Syarat Administrasi**
- **Assessment Test** (tes general, teknis, kepribadian)
- **Kelas Financial Literacy 101** (mandatory course)
- **Form Surat Rekomendasi** (generate surat untuk ditandatangani Dosen/Kepala Sekolah)

#### **Step 3: Upload Dokumen**
- Upload Surat Komitmen yang sudah ditandatangani
- Upload Surat Rekomendasi yang sudah disetujui kampus/sekolah

#### **Step 4: Pengumuman & Konfirmasi**
- Notifikasi penawaran (jika terpilih)
- Konfirmasi penerimaan (48 jam deadline)
- Form Data Cohort (data final sebelum mulai program)
- Pengumuman akhir

### **3. Timeline Management**
- **Dual Timeline** (SMK vs Mahasiswa/Umum)
  - SMK: 21 Okt 2025 - 2 Jan 2026 (pendaftaran)
  - Mahasiswa: 21 Okt 2025 - 31 Jan 2026 (pendaftaran)
- Pengumuman bertahap
- Pembagian LoA (Letter of Acceptance)

### **4. User Dashboard (Implied)**
- Track progress tahapan
- Status dokumen
- Notifikasi/announcements
- Download dokumen (Surat Komitmen, LoA, dll)

### **5. Admin Panel (Backend - Implied)**
- Manage applicants
- Review dokumen
- Assessment scoring
- Send notifications
- Generate reports
- Manage cohorts

---

## 🏗️ **ARSITEKTUR SISTEM**

### **User Roles:**
1. **Applicant (Pelamar)** - Siswa SMK, Mahasiswa, Umum
2. **Reviewer/Assessor** - Yang review aplikasi & test
3. **Admin** - Manage sistem, pengumuman, cohort

### **Database Schema (Core Tables):**
```
users
├── id
├── email
├── name
├── phone
├── category (SMK/Mahasiswa/Umum)
├── status (draft/submitted/reviewing/accepted/rejected)
└── created_at

applications
├── id
├── user_id
├── step_completed (1-4)
├── personal_data (JSON)
├── commitment_letter_url
├── recommendation_letter_url
└── timestamps

assessments
├── id
├── user_id
├── general_test_score
├── technical_test_score
├── personality_test_score
└── timestamps

courses
├── id
├── user_id
├── course_slug (financial-literacy-101)
├── status (enrolled/completed)
├── completion_date

notifications
├── id
├── user_id
├── type (offer/reminder/announcement)
├── message
├── read_status
└── created_at

cohorts
├── id
├── name (Cohort 2026 SMK)
├── start_date
├── end_date

cohort_members
├── id
├── cohort_id
├── user_id
├── enrollment_date
```

---

## 🎨 **TECH STACK**

### **Frontend:**
- React.js / Next.js
- Tailwind CSS (responsive design)
- Multi-step form library (React Hook Form + Zod validation)
- File upload component

### **Backend:**
- Node.js (Express) / Laravel
- RESTful API
- Authentication (JWT)
- File storage (AWS S3 / Cloudinary)

### **Database:**
- PostgreSQL / MySQL

### **Third-Party:**
- Email service (SendGrid/Mailgun) - untuk notifikasi
- PDF generation (jsPDF/Puppeteer) - untuk generate Surat Komitmen/Rekomendasi
- Learning Management System (LMS) integration - untuk kelas Financial Literacy
- Assessment platform - untuk tes online

---

## 🚀 **MVP SCOPE (MINIMAL VIABLE PRODUCT)**

### **MVP Features (Essential):**

✅ **Landing Page**
- Hero section
- Timeline info
- CTA button

✅ **User Registration & Auth**
- Sign up / Login
- Email verification

✅ **Multi-Step Application Form**
- Step 1: Personal data form
- Step 2: Document upload (dummy/simplified)
- Step 3: Confirmation

✅ **User Dashboard**
- View application status
- Track progress (step indicator)
- Download generated documents

✅ **Admin Panel**
- View all applicants
- Filter by status/category
- Mark as accepted/rejected
- Send email notification

✅ **Email Notifications**
- Registration confirmation
- Status updates
- Acceptance/Rejection letter

### **MVP Deprioritized (Phase 2):**
- Assessment test integration
- LMS integration (Financial Literacy)
- Advanced document signing (e-signature)
- Cohort management
- Analytics dashboard

---

## 📋 **CHECKLIST MVP (MINIMAL)**

### **Must Have (Priority 1):**
- [ ] Landing page with CTA
- [ ] User registration (email + password)
- [ ] Login/Logout
- [ ] Multi-step application form (3 steps minimum)
- [ ] File upload (at least 1 file)
- [ ] User dashboard (view status)
- [ ] Admin dashboard (view all applications)
- [ ] Admin can approve/reject
- [ ] Email notification (registration + status update)

### **Nice to Have (Priority 2):**
- [ ] Email verification
- [ ] Save draft functionality
- [ ] Progress indicator/stepper
- [ ] Filter & search di admin
- [ ] Document preview (PDF/image viewer)
- [ ] Download acceptance letter (auto-generate PDF)
- [ ] Timeline display (like original website)

### **Future Enhancement (Phase 2):**
- [ ] Assessment test integration
- [ ] LMS integration (courses)
- [ ] E-signature for documents
- [ ] Cohort management
- [ ] Analytics dashboard
- [ ] Bulk email notification
- [ ] Export to CSV/Excel

---

## 💰 **ESTIMASI BIAYA & TIMELINE**

### **Development Cost:**
- **DIY (Self-Build):** Rp 150.000 - 500.000/tahun (hosting + domain + services)
- **Freelancer Mahasiswa:** Rp 5.000.000 - 8.000.000
- **Professional Developer:** Rp 10.000.000 - 15.000.000

### **Operational Cost (Monthly):**
- Domain .com: ~Rp 12.500/bulan
- Hosting (VPS): ~Rp 96.000/bulan
- Database (Supabase free tier): Gratis
- Email service (SendGrid free tier): Gratis
- **Total: ~Rp 108.500/bulan**

### **Timeline:**
- **MVP Development:** 2-4 minggu
- **Testing & Refinement:** 1-2 minggu
- **Total:** 3-6 minggu (1.5 bulan)

---

## 🎯 **REKOMENDASI TECH STACK UNTUK MVP**

### **Frontend:**
- **Framework:** Next.js 15 (App Router)
- **Language:** TypeScript
- **Styling:** Tailwind CSS
- **UI Components:** shadcn/ui
- **Form:** React Hook Form + Zod validation
- **State:** React Context / Zustand

### **Backend:**
- **Database:** Supabase (PostgreSQL)
- **Auth:** Supabase Auth
- **Storage:** Supabase Storage
- **API:** Next.js API Routes

### **Services:**
- **Email:** Resend / SendGrid
- **Deployment:** Vercel (gratis)
- **Domain:** Namecheap / Cloudflare

### **Why This Stack?**
✅ **All-in-one:** Supabase provides database + auth + storage + API
✅ **Free tier:** Supabase + Vercel free tier cukup untuk MVP
✅ **Fast development:** Next.js + shadcn/ui = rapid prototyping
✅ **Type-safe:** TypeScript + Zod = less bugs
✅ **Scalable:** Mudah scale up jika needed

---

## 📝 **DEVELOPMENT GUIDE**

### **Step-by-Step Build Process:**

#### **Phase 1: Setup Project**
1. Initialize Next.js 15 + TypeScript
2. Setup Tailwind CSS + shadcn/ui
3. Configure Supabase client
4. Setup environment variables
5. Create folder structure

#### **Phase 2: Database Setup**
1. Create Supabase project
2. Run database schema migration
3. Configure Row Level Security (RLS)
4. Setup authentication

#### **Phase 3: Landing Page**
1. Design hero section
2. Timeline component (dual track)
3. Tahapan seleksi section
4. CTA button → register page

#### **Phase 4: Authentication**
1. Register page (sign up form)
2. Login page
3. Email verification flow
4. Protected routes

#### **Phase 5: Multi-Step Form**
1. Step 1: Personal data (name, email, phone, category, institution)
2. Step 2: Document upload (KTM/Kartu Pelajar, Surat Rekomendasi)
3. Step 3: Review & confirmation
4. Progress indicator/stepper
5. Save draft functionality

#### **Phase 6: User Dashboard**
1. Application status card
2. Progress timeline
3. Edit application (if draft/pending)
4. Download documents

#### **Phase 7: Admin Dashboard**
1. Login admin (separate auth)
2. Applications table (with pagination)
3. Filter by status/category
4. Search by name/email
5. View detail modal
6. Approve/Reject action
7. Email notification trigger

#### **Phase 8: Email Notifications**
1. Setup email service (Resend/SendGrid)
2. Templates: Welcome, Confirmation, Acceptance, Rejection
3. Auto-send on status change
4. Track email sent status

#### **Phase 9: Testing & Deployment**
1. Manual testing semua flow
2. Fix bugs
3. Deploy to Vercel
4. Configure custom domain
5. Test production

---

## 📂 **PROJECT STRUCTURE**

```
enrollment-system/
├── app/                      # Next.js 15 App Router
│   ├── (auth)/
│   │   ├── login/           # Login page
│   │   └── register/        # Register page
│   ├── (user)/
│   │   ├── dashboard/       # User dashboard
│   │   └── apply/           # Multi-step form
│   ├── (admin)/
│   │   └── dashboard/       # Admin dashboard
│   ├── api/                 # API routes
│   │   ├── applications/
│   │   ├── notifications/
│   │   └── auth/
│   ├── layout.tsx           # Root layout
│   └── page.tsx             # Landing page
├── components/              # React components
│   ├── ui/                 # shadcn/ui components
│   ├── forms/              # Form components
│   ├── layouts/            # Layout components
│   └── shared/             # Shared components
├── lib/                    # Utilities & configs
│   ├── supabase/           # Supabase client & queries
│   │   ├── client.ts
│   │   ├── queries.ts
│   │   └── mutations.ts
│   ├── validations/        # Zod schemas
│   │   ├── application.ts
│   │   └── user.ts
│   ├── email/              # Email templates
│   └── utils.ts            # Helper functions
├── types/                  # TypeScript types
│   ├── database.ts
│   └── application.ts
├── public/                 # Static assets
│   ├── images/
│   └── icons/
├── docs/                   # Documentation
│   ├── ANALISIS_CODING_CAMP_WEBSITE.md
│   ├── database-schema.sql
│   └── API.md
├── .env.local.example      # Environment variables template
├── package.json
├── tsconfig.json
├── tailwind.config.ts
└── README.md
```

---

## 🔧 **SETUP INSTRUCTIONS**

### **1. Prerequisites**
- Node.js 18+
- npm / pnpm / yarn
- Git
- Supabase account (gratis)
- Resend/SendGrid account (gratis)

### **2. Installation**

```bash
# Clone repository
git clone https://github.com/GuavaPopper/enrollment-system.git
cd enrollment-system

# Install dependencies
npm install

# Copy environment variables
cp .env.local.example .env.local
```

### **3. Supabase Setup**

1. **Buat project di Supabase:** https://supabase.com
2. **Jalankan SQL migration:** Copy isi `docs/database-schema.sql` dan run di Supabase SQL Editor
3. **Get credentials:** Dashboard → Settings → API
4. **Update `.env.local`:**

```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
```

### **4. Email Service Setup**

**Option A: Resend (Recommended)**
1. Sign up: https://resend.com
2. Get API key
3. Add to `.env.local`:
```env
RESEND_API_KEY=re_xxx
```

**Option B: SendGrid**
1. Sign up: https://sendgrid.com
2. Get API key
3. Add to `.env.local`:
```env
SENDGRID_API_KEY=SG.xxx
```

### **5. Run Development Server**

```bash
npm run dev
```

Open http://localhost:3000

### **6. Create Admin User**

Via Supabase SQL Editor:
```sql
-- Insert admin user (after register via UI)
UPDATE users 
SET role = 'admin' 
WHERE email = 'your-email@example.com';
```

---

## 🚀 **DEPLOYMENT (VERCEL)**

### **1. Push to GitHub**
```bash
git add .
git commit -m "Ready for deployment"
git push origin main
```

### **2. Deploy to Vercel**
1. Go to: https://vercel.com
2. Import GitHub repository
3. Add environment variables (sama seperti `.env.local`)
4. Deploy!

### **3. Configure Custom Domain (Optional)**
1. Buy domain (Namecheap, Cloudflare, dll)
2. Add to Vercel: Settings → Domains
3. Update DNS records

---

## 📊 **API ENDPOINTS (PLANNED)**

### **Authentication**
- `POST /api/auth/register` - Register user
- `POST /api/auth/login` - Login user
- `POST /api/auth/logout` - Logout user
- `GET /api/auth/me` - Get current user

### **Applications**
- `GET /api/applications` - List applications (admin)
- `GET /api/applications/:id` - Get application detail
- `POST /api/applications` - Create application
- `PUT /api/applications/:id` - Update application
- `DELETE /api/applications/:id` - Delete application
- `POST /api/applications/:id/submit` - Submit application
- `POST /api/applications/:id/approve` - Approve (admin)
- `POST /api/applications/:id/reject` - Reject (admin)

### **Documents**
- `POST /api/documents/upload` - Upload file
- `GET /api/documents/:id` - Get document
- `DELETE /api/documents/:id` - Delete document

### **Notifications**
- `GET /api/notifications` - List notifications (user)
- `POST /api/notifications/send` - Send notification (admin)
- `PUT /api/notifications/:id/read` - Mark as read

---

## 🎓 **CREDITS**

Project terinspirasi dari:
- [DBS Foundation Coding Camp 2026](https://www.dbs.com/spark/index/id_id/site/codingcamp/index.html)

---

**Built with ❤️ using Next.js + Supabase**
