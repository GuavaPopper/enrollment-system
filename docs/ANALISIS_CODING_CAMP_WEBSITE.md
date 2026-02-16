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

## 🎨 **TECH STACK (ESTIMASI)**

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

## 💡 **PROMPT UNTUK MVP**

---

# 📝 **PROMPT 1: UNTUK AI CODE GENERATOR (v0, Bolt.new, Lovable, dll)**

```
Buatkan MVP website enrollment system untuk bootcamp/program training dengan fitur:

**USER SIDE:**
1. Landing page dengan:
   - Hero section (judul program, deskripsi singkat)
   - Timeline pendaftaran (2 kategori: Siswa SMK & Mahasiswa/Umum)
   - CTA button "Daftar Sekarang"

2. Multi-step registration form:
   - Step 1: Data Pribadi (nama, email, phone, kategori [SMK/Mahasiswa/Umum], sekolah/kampus)
   - Step 2: Upload Dokumen (foto KTM/Kartu Pelajar, Surat Rekomendasi)
   - Step 3: Konfirmasi & Submit
   - Progress indicator untuk tracking step

3. User Dashboard:
   - Login/Register dengan email
   - View status aplikasi (Pending/Reviewing/Accepted/Rejected)
   - Download surat penerimaan (jika diterima)
   - Timeline progress

**ADMIN SIDE:**
4. Admin Dashboard:
   - Login admin
   - List semua aplikasi dengan filter (status, kategori)
   - Detail view aplikasi (data + dokumen)
   - Action: Approve/Reject dengan keterangan
   - Send email notification otomatis

**TECH STACK:**
- Frontend: Next.js + Tailwind CSS + shadcn/ui
- Backend: Next.js API Routes / Supabase
- Database: Supabase (PostgreSQL)
- Auth: Supabase Auth
- File Storage: Supabase Storage
- Email: Resend / SendGrid

**STYLING:**
- Modern, clean design
- Responsive (mobile-first)
- Primary color: Blue (#1E40AF)
- Accent: Orange (#F97316)

Buatkan project lengkap dengan folder structure, semua file yang dibutuhkan, dan instruksi setup.
```

---

# 📝 **PROMPT 2: UNTUK CURSOR AI / WINDSURF (Step-by-Step)**

```
Saya ingin membuat MVP Enrollment Management System untuk bootcamp.

**PROJECT SETUP:**
Buatkan Next.js 15 project dengan:
- TypeScript
- Tailwind CSS
- shadcn/ui components
- Supabase (database + auth + storage)
- Folder structure: app router, components, lib, types

**DATABASE SCHEMA:**
Buatkan Supabase schema untuk:
1. users table (id, email, name, phone, category, role)
2. applications table (id, user_id, status, personal_data JSON, created_at)
3. documents table (id, application_id, type, file_url)

**FEATURES (Build Step-by-Step):**

STEP 1: Landing Page
- Hero section dengan gradient background
- Timeline section (2 columns: SMK vs Mahasiswa)
- CTA button redirect ke /register

STEP 2: Registration Flow
- Multi-step form (3 steps) dengan progress indicator
- Step 1: Personal data form (React Hook Form + Zod validation)
- Step 2: File upload (drag-and-drop, max 2MB)
- Step 3: Review & submit
- Save progress di localStorage (draft mode)

STEP 3: User Dashboard
- Protected route (login required)
- Card showing application status
- Timeline stepper (visual progress)
- Download button (jika accepted)

STEP 4: Admin Dashboard
- Separate route /admin (protected)
- Table dengan filter & search
- Modal untuk view detail + approve/reject
- Email trigger after status update

Buatkan kode untuk STEP 1 dulu.
```

---

# 📝 **PROMPT 3: UNTUK FREELANCER / DEVELOPER**

```
**PROJECT BRIEF: Enrollment Management System MVP**

**Background:**
Kami ingin membuat website pendaftaran online untuk program bootcamp/training, mirip dengan:
https://www.dbs.com/spark/index/id_id/site/codingcamp/index.html

**Target Users:**
- Pelamar (Siswa SMK, Mahasiswa, Umum)
- Admin (review & manage aplikasi)

**Core Features (MVP):**

1. **Landing Page**
   - Hero section dengan branding program
   - Timeline pendaftaran (dual track: SMK vs Mahasiswa)
   - Info tahapan seleksi
   - CTA button "Daftar Sekarang"

2. **User Registration & Application**
   - Sign up/Login dengan email + password
   - Email verification
   - Multi-step form (3 steps):
     - Personal data
     - Document upload (KTM/Kartu Pelajar, Surat Rekomendasi)
     - Review & confirmation
   - Save draft functionality
   - Progress tracking

3. **User Dashboard**
   - View application status (Pending/Under Review/Accepted/Rejected)
   - Edit application (jika masih draft/pending)
   - Download acceptance letter (jika diterima)

4. **Admin Dashboard**
   - Login admin (separate from user)
   - View all applications (table dengan pagination)
   - Filter by status/category
   - Search by name/email
   - View detail aplikasi (data + dokumen preview)
   - Approve/Reject dengan notes
   - Send email notification otomatis

5. **Email Notifications**
   - Welcome email setelah register
   - Confirmation email setelah submit aplikasi
   - Acceptance/Rejection email
   - Reminder email (optional untuk MVP)

**Technical Requirements:**
- Responsive design (mobile & desktop)
- Secure authentication
- File upload (max 5MB per file, PDF/JPG/PNG)
- Email service integration
- Database dengan proper relations
- Clean UI/UX (modern, professional)

**Deliverables:**
- Source code (GitHub repo)
- Deployment (Vercel/Netlify)
- Admin credentials
- Basic documentation (README + user guide)

**Timeline:** 3-4 minggu
**Budget:** [Sesuaikan dengan budget kamu]

**Tech Stack Preference:**
- Next.js + Tailwind CSS (frontend)
- Supabase atau Firebase (backend)
- Vercel (deployment)

Mohon provide proposal dengan:
1. Estimasi timeline detail per fitur
2. Total cost breakdown
3. Portfolio project serupa (jika ada)
```

---

## 🎯 **REKOMENDASI APPROACH**

### **Jika Kamu Developer (Ada Skill Coding):**

**Gunakan Prompt 2** dengan **Cursor AI / Windsurf**

**Workflow:**
1. Setup project Next.js + Supabase
2. Build landing page dulu (front-end only)
3. Setup database schema
4. Build registration form (step-by-step)
5. Build user dashboard
6. Build admin panel
7. Integrate email notification
8. Testing & deployment

**Timeline:** 2-3 minggu (part-time)
**Budget:** Gratis (Supabase free tier + Vercel free hosting)

---

### **Jika Non-Developer (No Coding Skill):**

**Gunakan Prompt 1** dengan **v0.dev, Bolt.new, atau Lovable.dev**

**Tools:**
- **v0.dev** (by Vercel) - Generate React components from prompt
- **Bolt.new** - Full-stack web app builder
- **Lovable.dev** - AI web app builder dengan Supabase integration

**Workflow:**
1. Paste prompt 1 ke tool
2. Generate initial project
3. Iterate dengan feedback ("tambahkan fitur X", "ubah warna Y")
4. Export & deploy

**Timeline:** 1-2 minggu (dengan banyak iteration)
**Budget:** $20-50/bulan (subscription tool)

---

### **Jika Budget Ada (Mau Hire Developer):**

**Gunakan Prompt 3** untuk brief ke freelancer

**Platform:**
- Upwork
- Fiverr
- Sribulancer (Indonesia)
- Projects.co.id

**Budget Estimasi:**
- Freelancer Indonesia: Rp 5-10 juta (MVP)
- Freelancer Internasional: $500-1,500 (MVP)

**Timeline:** 3-4 minggu

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

## 💰 **BUDGET BREAKDOWN (Opsi)**

### **Opsi 1: DIY (Self-Build dengan AI Tool)**
- AI Tool subscription (Cursor/v0/Bolt): $20-50/bulan
- Hosting (Vercel): Gratis
- Database (Supabase): Gratis (free tier)
- Domain (.com): Rp 150.000/tahun
- Email service (SendGrid): Gratis (100 email/hari)

**Total:** **Rp 150.000-500.000** (first year) + **waktu kamu**

---

### **Opsi 2: Hire Freelancer Mahasiswa**
- Development: Rp 5.000.000 - 7.000.000
- Hosting + Domain + Services: Rp 500.000/tahun
- Maintenance (optional): Rp 500.000-1.000.000/tahun

**Total:** **Rp 5.500.000 - 8.000.000** (first year)

---

### **Opsi 3: Hire Professional Freelancer**
- Development: Rp 10.000.000 - 15.000.000
- Hosting + Domain + Services: Rp 1.000.000/tahun
- Maintenance: Rp 2.000.000/tahun

**Total:** **Rp 13.000.000 - 18.000.000** (first year)

---

## 🚀 **KESIMPULAN**

**Untuk MVP website seperti Coding Camp DBS Foundation:**

✅ **Fungsi Inti:** Enrollment management system dengan multi-step registration & admin approval

✅ **Timeline Realistis:** 2-4 minggu (tergantung approach)

✅ **Budget Range:** Rp 150k - 15 juta (tergantung opsi)

✅ **Rekomendasi Tech Stack:**
- Frontend: Next.js + Tailwind CSS + shadcn/ui
- Backend: Supabase (all-in-one BaaS)
- Deployment: Vercel
- Email: SendGrid/Resend

✅ **Best Prompt:** Gunakan **Prompt 2** jika pakai Cursor AI (step-by-step build)

---

**Mau saya bantu:**
1. Setup project structure-nya?
2. Buatkan database schema lengkap?
3. Design mockup untuk landing page & dashboard?
4. Tulis technical spec document untuk developer?

Kasih tau! 🧆💻🚀
