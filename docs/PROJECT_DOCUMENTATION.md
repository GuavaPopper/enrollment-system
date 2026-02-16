# Project Documentation - HMIF Bootcamp Enrollment System

**Himpunan Mahasiswa Informatika - Fakultas Teknik - Universitas Tanjungpura**

---

## 📋 Table of Contents

1. [Project Overview](#project-overview)
2. [Problem Statement](#problem-statement)
3. [Solution](#solution)
4. [Features](#features)
5. [User Roles](#user-roles)
6. [Functional Requirements](#functional-requirements)
7. [Non-Functional Requirements](#non-functional-requirements)
8. [Technical Specifications](#technical-specifications)
9. [Database Schema](#database-schema)
10. [User Interface](#user-interface)
11. [Workflow](#workflow)

---

## 🎯 Project Overview

**Project Name:** HMIF Bootcamp Enrollment System  
**Organization:** Himpunan Mahasiswa Informatika (HMIF), Fakultas Teknik, Universitas Tanjungpura  
**Location:** Pontianak, Kalimantan Barat, Indonesia  
**Language:** Bahasa Indonesia (Full UI)  
**Purpose:** Website pendaftaran online untuk program bootcamp/pelatihan HMIF

### Vision
Menyediakan platform pendaftaran bootcamp yang modern, user-friendly, dan efisien untuk mahasiswa dan pelajar di Pontianak.

### Mission
- Mempermudah proses pendaftaran bootcamp dengan form digital yang simple
- Meningkatkan transparansi status pendaftaran peserta
- Membantu panitia HMIF mengelola pendaftaran secara efisien
- Menampilkan riwayat bootcamp sebelumnya untuk meningkatkan kredibilitas

---

## ❗ Problem Statement

### Current Challenges:
1. **Manual Registration Process**
   - Pendaftaran masih menggunakan form manual (Google Forms/Excel)
   - Data peserta tersebar dan tidak terstruktur
   - Sulit tracking status pendaftaran

2. **Admin Workload**
   - Panitia kesulitan manage ratusan pendaftaran
   - Proses review & approval memakan waktu
   - Email notification manual (copy-paste)

3. **Lack of Transparency**
   - Peserta tidak tahu status pendaftaran mereka
   - Tidak ada notifikasi otomatis
   - Sulit akses informasi bootcamp sebelumnya

4. **Poor User Experience**
   - Form pendaftaran tidak menarik
   - Tidak ada validasi real-time
   - Tidak mobile-friendly

5. **No Historical Data**
   - Tidak ada showcase bootcamp sebelumnya
   - Calon peserta tidak bisa lihat success stories
   - Data alumni tidak terdokumentasi dengan baik

---

## ✅ Solution

### Web-Based Enrollment System dengan:

1. **Modern Scrollytelling Landing Page**
   - Awwwards-level design dengan image sequence animation
   - Menarik perhatian calon peserta
   - Menampilkan value proposition bootcamp

2. **Simple 2-Step Registration Form**
   - Data pribadi (tanpa upload dokumen)
   - Review & konfirmasi
   - Auto-save draft

3. **Real-Time Status Tracking**
   - User dashboard untuk cek status
   - Email notification otomatis (Bahasa Indonesia)
   - Timeline visual progress

4. **Admin Panel**
   - Kelola semua pendaftaran di satu tempat
   - Approve/reject dengan catatan
   - Filter & search by kategori/status
   - Export to CSV

5. **Bootcamp History Showcase**
   - Display cohort sebelumnya
   - Success stories alumni
   - Photo gallery
   - Year filter

---

## ✨ Features

### 1. Landing Page (Public)

#### A. Hero Section - Image Sequence Scrollytelling
- **Image sequence animation** (100-200 frames)
- Canvas-based rendering
- Scroll-driven: user scroll → frame changes smoothly
- Text overlays:
  - "Wujudkan Masa Depanmu"
  - "Bergabung dengan Bootcamp HMIF 2026"
  - CTA: "Daftar Sekarang" (magnetic button)
- Smooth scroll (Lenis library)

#### B. About Section
- Character-by-character text reveal animation
- Headline: "Tentang HMIF Bootcamp"
- Subtext: Value proposition bootcamp

#### C. Program Features (Bento Grid)
- Modern bento-style grid layout
- Cards with hover effects (scale + glow)
- Parallax on scroll
- Content:
  - Mentor Berpengalaman
  - Materi Terkini
  - Sertifikat Resmi
  - Project-Based Learning

#### D. Bootcamp History
- Year filter tabs (2025, 2024, 2023, Semua Tahun)
- Cohort cards:
  - Cover image
  - Nama cohort & tahun
  - Total peserta
  - Highlights
  - CTA "Lihat Detail"
- Detail page:
  - Full cover image
  - Stats (peserta, durasi, status)
  - Success stories (photo, nama, posisi, testimoni)
  - Photo gallery (lightbox)

#### E. Stats Section
- Count-up animation (0 → target number)
- Numbers:
  - 500+ Peserta
  - 50+ Mentor
  - 95% Kepuasan
- Icons + labels (Bahasa Indonesia)

#### F. Testimonials
- Fullscreen autoplay slider
- Each slide:
  - Background image
  - Centered quote
  - Participant photo, nama, posisi
- Autoplay 5s interval (pause on hover)
- Progress dots

#### G. Timeline - Alur Pendaftaran
- Horizontal/vertical timeline (responsive)
- Steps:
  1. Pendaftaran
  2. Review
  3. Diterima
  4. Bootcamp Dimulai
- Animated progress line

#### H. CTA Section
- Animated mesh gradient background
- Headline: "Siap Bergabung?"
- Magnetic button: "Daftar Sekarang"

#### I. Footer
- Organization info: HMIF Fakultas Teknik UNTAN
- Links: Beranda, Tentang, Program, Riwayat, Kontak
- Social media: Instagram, Twitter/X, LinkedIn
- Contact: email, WhatsApp
- Copyright: © 2026 HMIF UNTAN

---

### 2. Registration Form (Protected)

#### 2-Step Process (No Document Upload)

**Step 1: Data Pribadi**

| Field | Type | Required | Validation |
|-------|------|----------|------------|
| Nama Lengkap | Text | ✅ | Min 3 char |
| Email | Email | ✅ | Valid email format |
| Nomor HP | Text | ✅ | Indonesia phone format |
| Kategori | Select | ✅ | Pelajar/Mahasiswa/Umum |
| Asal Universitas | Select | Conditional* | Only if Mahasiswa Aktif |
| Program Studi | Select | ✅ | - |
| Semester | Select | ✅ | - |

*Conditional field: Muncul hanya jika kategori = "Mahasiswa Aktif"

**Kategori Options:**
- Pelajar (SMA atau SMK)
- Mahasiswa Aktif
- Umum

**Asal Universitas Options (7 Universitas Pontianak):**
1. Universitas Tanjungpura
2. Politeknik Negeri Pontianak
3. Universitas Widya Dharma
4. Universitas Muhammadiyah Pontianak
5. Universitas Bina Sarana Informatika
6. STMIK Pontianak
7. Universitas Panca Bhakti
8. Yang lain: [custom text input]

**Program Studi Options:**
- Informatika
- Ilmu Komputer
- Sistem Informasi
- Rekayasa Sistem Komputer
- Statistika
- Yang lain: [custom text input]

**Semester Options:**
- Semester 1
- Semester 3
- Semester 5
- Semester 7
- Semester 8+
- Yang lain: [custom text input]

**Features:**
- Real-time validation (Zod schema)
- Auto-save draft to localStorage
- Progress indicator (1/2)
- Button: "Simpan Draft" | "Lanjut ke Review →"

---

**Step 2: Review & Konfirmasi**

- Summary of all data entered in Step 1
- Clean card layout (label: value pairs)
- Edit button → go back to Step 1
- Terms & conditions checkbox*:
  "Saya setuju dengan syarat dan ketentuan yang berlaku"
- Submit button (disabled until T&C checked)
- Button: "← Kembali" | "SUBMIT PENDAFTARAN"

**Post-Submit:**
- Success message
- Redirect to user dashboard
- Email notification sent automatically

---

### 3. User Dashboard (Protected)

**Title:** Dashboard Saya

**Components:**

#### A. Application Status Card
- Status badge (with color coding):
  - 🟡 Konsep (Draft) - Yellow
  - 🔵 Terkirim (Submitted) - Blue
  - 🟠 Dalam Review (Under Review) - Orange
  - 🟢 Diterima (Accepted) - Green
  - 🔴 Ditolak (Rejected) - Red

#### B. Progress Timeline Visual
- Visual representation of application progress
- Icons for each stage
- Current stage highlighted

#### C. Actions
- **If Draft/Pending:**
  - Button: "Edit Pendaftaran"
- **If Accepted:**
  - Button: "Unduh Surat Penerimaan"
  - Download PDF acceptance letter

#### D. Notifikasi
- Inbox for email notifications
- Read/unread status
- Subject, date, preview

---

### 4. Admin Dashboard (Protected)

**Title:** Dashboard Admin

**Role:** Panitia HMIF (Admin/Reviewer)

#### A. Applications Table

**Columns:**
- Nama Pelamar
- Email
- Kategori
- Universitas (if applicable)
- Jurusan
- Status
- Tanggal Daftar
- Aksi

**Features:**
- **Filter by Status:**
  - Semua
  - Terkirim
  - Dalam Review
  - Diterima
  - Ditolak

- **Filter by Kategori:**
  - Semua
  - Pelajar (SMA/SMK)
  - Mahasiswa Aktif
  - Umum

- **Search:**
  - Cari berdasarkan nama atau email
  - Real-time search

- **Pagination:**
  - 20 per halaman
  - Buttons: Sebelumnya | Selanjutnya
  - Page numbers

- **Bulk Actions:**
  - Select multiple applications
  - Bulk approve/reject (with confirmation)

- **Export:**
  - Button: "Ekspor ke CSV"
  - Export filtered/all data

#### B. Application Detail Modal

**Triggered by:** Click "Lihat Detail" button

**Content:**
- **Applicant Info:**
  - All personal data (labels in Indonesian)
  - Category, university, major, semester
  - Submitted date

- **Review Section:**
  - Textarea: "Catatan Reviewer"
  - Save notes button

- **Actions:**
  - Button: "Terima Pendaftaran" (Green)
  - Button: "Tolak Pendaftaran" (Red)
  - Confirmation dialog before approve/reject
  - Auto-send email notification on status change

---

### 5. Manage Cohorts (Admin)

**Path:** /admin/cohort

**Title:** Kelola Cohort

#### A. Cohorts List Table

**Columns:**
- Nama Cohort
- Tahun
- Kategori
- Jumlah Peserta
- Status
- Aksi (Edit, Hapus)

**Features:**
- Filter berdasarkan tahun
- Filter berdasarkan status (draft/active/completed/cancelled)
- Search by nama cohort
- Pagination
- Button: "+ Buat Cohort Baru"

#### B. Create/Edit Cohort Form

**Fields:**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| Nama | Text | ✅ | Nama cohort/batch |
| Deskripsi | Textarea | ❌ | Deskripsi program |
| Kategori | Select | ✅ | Pelajar/Mahasiswa/Umum |
| Tahun | Number | ✅ | 2024, 2025, 2026, dll |
| Tanggal Mulai | Date | ❌ | Start date |
| Tanggal Selesai | Date | ❌ | End date |
| Maks. Peserta | Number | ❌ | Kapasitas max |
| Total Peserta | Number | ❌ | Jumlah enrolled |
| Status | Select | ✅ | draft/active/completed/cancelled |

**Media Fields:**

1. **Cover Image Upload**
   - Single file upload
   - Max 5MB
   - JPG/PNG
   - Preview before upload
   - Drag & drop support

2. **Highlights** (Dynamic Array)
   - Add/remove items
   - Each item: text input
   - Example: "100+ Peserta", "5 Minggu Intensif"

3. **Success Stories** (Repeater Fields)
   - Add multiple success stories
   - Each story contains:
     - Nama (text)
     - Upload Foto (image, max 2MB)
     - Jabatan/Posisi (text)
     - Testimoni (textarea)
     - Link LinkedIn (URL, optional)
   - Drag to reorder

4. **Galeri** (Multiple Image Upload)
   - Max 10 photos
   - Drag & drop
   - Preview thumbnails
   - Delete individual photos

**Buttons:**
- Simpan
- Batal
- Hapus (with confirmation dialog: "Yakin ingin menghapus cohort ini?")

---

### 6. Email Notifications (Automated)

**Service:** Resend API  
**Language:** Bahasa Indonesia  
**Format:** HTML email templates (branded with HMIF colors)

#### Email Templates:

**1. Welcome Email**
- **Trigger:** After user registration (account created)
- **Subject:** "Selamat Datang di HMIF Bootcamp!"
- **Content:**
  - Greeting
  - Confirmation email registered
  - Next steps
  - Login credentials
  - Link to dashboard

**2. Application Submitted**
- **Trigger:** After user submits application
- **Subject:** "Pendaftaran Berhasil Dikirim"
- **Content:**
  - Thank you message
  - Application ID
  - Review timeline (estimasi 3-5 hari kerja)
  - Link to track status

**3. Under Review**
- **Trigger:** Admin changes status to "Dalam Review"
- **Subject:** "Pendaftaran Sedang Direview"
- **Content:**
  - Notification bahwa pendaftaran sedang diproses
  - Expected timeline
  - Link to dashboard

**4. Accepted**
- **Trigger:** Admin approves application
- **Subject:** "Selamat! Kamu Diterima di Bootcamp HMIF"
- **Content:**
  - Congratulations message
  - Next steps (payment, onboarding, dll)
  - Download acceptance letter link
  - Bootcamp schedule info
  - Contact person

**5. Rejected**
- **Trigger:** Admin rejects application
- **Subject:** "Informasi Status Pendaftaran"
- **Content:**
  - Polite rejection message
  - Reviewer notes (if any)
  - Encouragement to try again next batch
  - Link to bootcamp history for future info

**6. Acceptance Letter Attachment**
- **Trigger:** User clicks "Unduh Surat Penerimaan"
- **Subject:** "Surat Penerimaan Bootcamp HMIF"
- **Content:**
  - PDF attachment (acceptance letter)
  - Bootcamp details
  - Important dates
  - Contact info

**Features:**
- Auto-send on status change (no manual trigger)
- Email sent status tracked in database
- Retry mechanism for failed sends (3x retry)
- Unsubscribe link (optional)

---

## 👥 User Roles

### 1. Public (Non-authenticated)
**Access:**
- Landing page (view)
- Bootcamp history (view)
- Cohort detail pages (view)
- Login/Register pages

**Actions:**
- View public content
- Register account
- Login

---

### 2. Applicant (Authenticated User)
**Access:**
- All public pages
- User dashboard
- Registration form
- Profile settings

**Actions:**
- Submit application
- Edit draft application
- Track application status
- Download acceptance letter (if accepted)
- View email notifications
- Update profile

**Restrictions:**
- Cannot view other users' applications
- Cannot access admin panel
- Can only submit 1 application per bootcamp batch

---

### 3. Admin/Reviewer (Authenticated Admin)
**Access:**
- All public pages
- Admin dashboard
- Applications management
- Cohorts management
- Settings

**Actions:**
- View all applications
- Approve/reject applications
- Add reviewer notes
- Create/edit/delete cohorts
- Upload cohort media (images, success stories)
- Export applications to CSV
- Send email notifications
- Manage application status

**Restrictions:**
- Cannot edit other admins' data (unless super admin)
- Cannot delete applications (soft delete only)

---

## 🔧 Functional Requirements

### FR-1: User Management
- **FR-1.1:** User dapat registrasi akun dengan email + password
- **FR-1.2:** User dapat login dengan credentials
- **FR-1.3:** User dapat logout
- **FR-1.4:** User dapat reset password (via email)
- **FR-1.5:** Email verification (optional untuk MVP)
- **FR-1.6:** Role-based access control (Applicant vs Admin)

### FR-2: Application Submission
- **FR-2.1:** User dapat mengisi form pendaftaran (2 steps)
- **FR-2.2:** Form auto-save draft to localStorage
- **FR-2.3:** Real-time form validation (Zod schema)
- **FR-2.4:** Conditional field (university only for Mahasiswa Aktif)
- **FR-2.5:** User dapat submit application
- **FR-2.6:** User hanya bisa submit 1 application per batch
- **FR-2.7:** User dapat edit draft application
- **FR-2.8:** User tidak dapat edit setelah submitted

### FR-3: Application Tracking
- **FR-3.1:** User dapat view application status di dashboard
- **FR-3.2:** Status timeline visual display
- **FR-3.3:** User dapat download acceptance letter (if accepted)
- **FR-3.4:** User dapat view reviewer notes (if rejected)

### FR-4: Admin - Application Management
- **FR-4.1:** Admin dapat view semua applications dalam table
- **FR-4.2:** Admin dapat filter by status (Semua/Terkirim/Review/Diterima/Ditolak)
- **FR-4.3:** Admin dapat filter by kategori (Pelajar/Mahasiswa/Umum)
- **FR-4.4:** Admin dapat search by nama or email
- **FR-4.5:** Admin dapat view application detail (modal/page)
- **FR-4.6:** Admin dapat approve application
- **FR-4.7:** Admin dapat reject application
- **FR-4.8:** Admin dapat add reviewer notes
- **FR-4.9:** Admin dapat bulk select & approve/reject
- **FR-4.10:** Admin dapat export applications to CSV

### FR-5: Admin - Cohort Management
- **FR-5.1:** Admin dapat create cohort baru
- **FR-5.2:** Admin dapat edit cohort
- **FR-5.3:** Admin dapat delete cohort (with confirmation)
- **FR-5.4:** Admin dapat upload cover image (max 5MB)
- **FR-5.5:** Admin dapat add/remove highlights (dynamic array)
- **FR-5.6:** Admin dapat add/remove success stories (repeater)
- **FR-5.7:** Admin dapat upload gallery photos (max 10, drag & drop)
- **FR-5.8:** Admin dapat filter cohorts by year/status
- **FR-5.9:** Admin dapat search cohorts by name

### FR-6: Email Notifications
- **FR-6.1:** Auto-send welcome email setelah user register
- **FR-6.2:** Auto-send confirmation email setelah submit application
- **FR-6.3:** Auto-send "Under Review" email saat status berubah
- **FR-6.4:** Auto-send "Accepted" email saat approved
- **FR-6.5:** Auto-send "Rejected" email saat rejected
- **FR-6.6:** Email contain application details & next steps
- **FR-6.7:** Email tracking (sent status, timestamp)
- **FR-6.8:** Retry mechanism for failed emails (3x retry)

### FR-7: Public Pages
- **FR-7.1:** Landing page dengan scrollytelling hero (image sequence)
- **FR-7.2:** About, Features, Stats, Testimonials sections
- **FR-7.3:** Bootcamp history showcase (public access)
- **FR-7.4:** Year filter tabs (2025, 2024, 2023, Semua Tahun)
- **FR-7.5:** Cohort detail page dengan success stories & gallery
- **FR-7.6:** Fullscreen navbar menu (responsive)
- **FR-7.7:** Footer dengan links & social media

### FR-8: Authentication & Authorization
- **FR-8.1:** Protected routes (redirect to login if not authenticated)
- **FR-8.2:** Role-based access (Admin vs Applicant)
- **FR-8.3:** Session management (JWT or session-based)
- **FR-8.4:** Logout functionality (clear session)

---

## 🚀 Non-Functional Requirements

### NFR-1: Performance
- **NFR-1.1:** Page load time < 3 detik (desktop)
- **NFR-1.2:** Page load time < 5 detik (mobile 3G)
- **NFR-1.3:** Image sequence preload tanpa flicker
- **NFR-1.4:** Smooth 60fps scroll animation (Lenis)
- **NFR-1.5:** Canvas rendering optimized (no lag)
- **NFR-1.6:** Database query < 200ms (with indexing)

### NFR-2: Usability
- **NFR-2.1:** Responsive design (mobile, tablet, desktop)
- **NFR-2.2:** Mobile-first approach
- **NFR-2.3:** Intuitive navigation (max 3 clicks to any page)
- **NFR-2.4:** Clear error messages (Bahasa Indonesia)
- **NFR-2.5:** Accessible (WCAG 2.1 AA compliance)
- **NFR-2.6:** Form validation real-time (immediate feedback)
- **NFR-2.7:** Success/error toast notifications

### NFR-3: Security
- **NFR-3.1:** Password hashing (bcrypt/argon2)
- **NFR-3.2:** HTTPS enforced (SSL certificate)
- **NFR-3.3:** SQL injection prevention (parameterized queries)
- **NFR-3.4:** XSS protection (input sanitization)
- **NFR-3.5:** CSRF protection (CSRF tokens)
- **NFR-3.6:** Row Level Security (RLS) enabled on Supabase
- **NFR-3.7:** File upload validation (type, size)
- **NFR-3.8:** Rate limiting (API endpoints)
- **NFR-3.9:** Session timeout (30 min idle)

### NFR-4: Reliability
- **NFR-4.1:** 99.9% uptime (SLA)
- **NFR-4.2:** Error handling (try-catch, fallback UI)
- **NFR-4.3:** Database backup daily (automated)
- **NFR-4.4:** Email retry mechanism (3x before fail)
- **NFR-4.5:** Graceful degradation (if JS disabled, basic form still works)

### NFR-5: Scalability
- **NFR-5.1:** Support 1000+ concurrent users
- **NFR-5.2:** Support 10,000+ applications in database
- **NFR-5.3:** Image CDN (optimize delivery)
- **NFR-5.4:** Database indexing (optimized queries)
- **NFR-5.5:** Serverless architecture (auto-scale)

### NFR-6: Maintainability
- **NFR-6.1:** Modular code structure (components, utils, hooks)
- **NFR-6.2:** TypeScript untuk type safety
- **NFR-6.3:** Code comments (complex logic)
- **NFR-6.4:** Consistent coding style (ESLint, Prettier)
- **NFR-6.5:** Git version control (meaningful commits)
- **NFR-6.6:** Environment variables untuk sensitive data

### NFR-7: Compatibility
- **NFR-7.1:** Browser support: Chrome, Firefox, Safari, Edge (latest 2 versions)
- **NFR-7.2:** Mobile browser: Chrome Mobile, Safari iOS
- **NFR-7.3:** Screen sizes: 320px - 2560px width
- **NFR-7.4:** OS: Windows, macOS, Linux, iOS, Android

---

## 💻 Technical Specifications

### Tech Stack

#### Frontend:
- **Framework:** Next.js 15 (App Router)
- **Language:** TypeScript
- **Styling:** Tailwind CSS
- **UI Components:** shadcn/ui (Radix UI primitives)
- **Animation:**
  - Framer Motion (useScroll, useTransform, motion components)
  - @studio-freight/lenis (smooth scroll)
  - Canvas API (image sequence rendering)
- **Form Handling:** React Hook Form
- **Validation:** Zod
- **Icons:** Lucide React
- **Typography:** Outfit font (Google Fonts)

#### Backend:
- **Database:** Supabase (PostgreSQL)
- **Authentication:** Supabase Auth
- **Storage:** Supabase Storage (for images)
- **API:** Next.js API Routes (Server Actions)

#### Services:
- **Email:** Resend (email delivery service)
- **Deployment:** Vercel
- **Version Control:** Git (GitHub)

#### Development Tools:
- **Package Manager:** npm/pnpm
- **Linting:** ESLint
- **Formatting:** Prettier
- **Type Checking:** TypeScript compiler

---

### Architecture

```
enrollment-system/
├── app/                        # Next.js App Router
│   ├── (auth)/                # Auth routes group
│   │   ├── masuk/            # Login page
│   │   └── daftar-akun/      # Register page
│   │
│   ├── (public)/              # Public routes group
│   │   ├── page.tsx          # Landing page (/)
│   │   ├── riwayat/          # Bootcamp history
│   │   │   ├── page.tsx      # List cohorts
│   │   │   └── [id]/         # Cohort detail
│   │   │       └── page.tsx
│   │   └── layout.tsx
│   │
│   ├── (user)/                # User protected routes
│   │   ├── dashboard/        # User dashboard
│   │   │   └── page.tsx
│   │   ├── daftar/           # Application form
│   │   │   └── page.tsx
│   │   └── layout.tsx
│   │
│   ├── (admin)/               # Admin protected routes
│   │   ├── dashboard/        # Admin dashboard
│   │   ├── pendaftaran/      # Applications management
│   │   │   ├── page.tsx      # List view
│   │   │   └── [id]/         # Detail view
│   │   └── cohort/           # Cohorts management
│   │       ├── page.tsx      # List view
│   │       ├── baru/         # Create cohort
│   │       └── [id]/edit/    # Edit cohort
│   │
│   ├── api/                   # API Routes
│   │   ├── applications/
│   │   ├── cohorts/
│   │   ├── notifications/
│   │   └── upload/
│   │
│   └── layout.tsx             # Root layout
│
├── components/                 # React components
│   ├── ui/                    # shadcn/ui components
│   │   ├── button.tsx
│   │   ├── input.tsx
│   │   ├── card.tsx
│   │   └── ...
│   │
│   ├── landing/               # Landing page components
│   │   ├── SequenceScroll.tsx  # Image sequence hero
│   │   ├── TextReveal.tsx      # Character reveal animation
│   │   ├── MagneticButton.tsx  # Magnetic button effect
│   │   ├── CountUpStats.tsx    # Count-up numbers
│   │   └── FullscreenSlider.tsx # Testimonials slider
│   │
│   ├── forms/                 # Form components
│   │   ├── RegistrationForm.tsx
│   │   ├── Step1Personal.tsx
│   │   └── Step2Review.tsx
│   │
│   ├── admin/                 # Admin components
│   │   ├── ApplicationsTable.tsx
│   │   ├── CohortForm.tsx
│   │   └── ...
│   │
│   └── shared/                # Shared components
│       ├── Navbar.tsx
│       ├── Footer.tsx
│       └── ...
│
├── lib/                        # Utilities & configs
│   ├── supabase.ts            # Supabase client
│   ├── validations.ts         # Zod schemas
│   ├── utils.ts               # Helper functions
│   └── email.ts               # Email templates
│
├── hooks/                      # Custom React hooks
│   ├── useAuth.ts
│   ├── useApplication.ts
│   └── useScrollProgress.ts
│
├── types/                      # TypeScript types
│   ├── database.ts
│   ├── application.ts
│   └── cohort.ts
│
├── public/                     # Static assets
│   ├── sequence/              # Image sequence frames
│   │   ├── frame-001.jpg
│   │   ├── frame-002.jpg
│   │   └── ...
│   └── images/
│
├── docs/                       # Documentation
│   ├── PROJECT_DOCUMENTATION.md
│   ├── ANTIGRAVITY_GUIDE.md
│   └── database-schema.sql
│
├── .env.local                  # Environment variables
├── next.config.js              # Next.js config
├── tailwind.config.ts          # Tailwind config
├── tsconfig.json               # TypeScript config
└── package.json
```

---

### Environment Variables

```bash
# Supabase
NEXT_PUBLIC_SUPABASE_URL=https://xxx.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJxxx...
SUPABASE_SERVICE_ROLE_KEY=eyJxxx...

# Resend (Email)
RESEND_API_KEY=re_xxx...
RESEND_FROM_EMAIL=noreply@hmif.untan.ac.id

# App
NEXT_PUBLIC_APP_URL=https://bootcamp.hmif.untan.ac.id
NEXT_PUBLIC_APP_NAME=HMIF Bootcamp

# Optional
NEXT_PUBLIC_ENABLE_EMAIL_VERIFICATION=false
NEXT_PUBLIC_MAX_FILE_SIZE=5242880  # 5MB in bytes
```

---

## 🗄️ Database Schema

### Tables

#### 1. users
```sql
CREATE TABLE users (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(50),
  category VARCHAR(50) CHECK (category IN ('Pelajar (SMA atau SMK)', 'Mahasiswa Aktif', 'Umum')),
  role VARCHAR(20) DEFAULT 'applicant' CHECK (role IN ('applicant', 'admin')),
  email_verified BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);
```

#### 2. applications
```sql
CREATE TABLE applications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  status VARCHAR(50) DEFAULT 'draft' CHECK (status IN ('draft', 'submitted', 'under_review', 'accepted', 'rejected')),
  step_completed INTEGER DEFAULT 0,
  
  -- Personal Data
  university VARCHAR(255),        -- Hanya untuk Mahasiswa Aktif
  major VARCHAR(255),            -- Program Studi/Jurusan
  semester VARCHAR(100),         -- Semester
  
  -- Admin
  reviewer_notes TEXT,
  reviewed_by UUID REFERENCES users(id),
  reviewed_at TIMESTAMP,
  
  -- Timestamps
  submitted_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_applications_user_id ON applications(user_id);
CREATE INDEX idx_applications_status ON applications(status);
CREATE INDEX idx_applications_created_at ON applications(created_at DESC);
```

#### 3. notifications
```sql
CREATE TABLE notifications (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  type VARCHAR(50) CHECK (type IN ('registration', 'submitted', 'under_review', 'accepted', 'rejected')),
  subject VARCHAR(255) NOT NULL,
  message TEXT,
  email_sent BOOLEAN DEFAULT FALSE,
  email_sent_at TIMESTAMP,
  read_at TIMESTAMP,
  created_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_notifications_user_id ON notifications(user_id);
```

#### 4. cohorts
```sql
CREATE TABLE cohorts (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  name VARCHAR(255) NOT NULL,
  description TEXT,
  category VARCHAR(50) CHECK (category IN ('Pelajar (SMA atau SMK)', 'Mahasiswa Aktif', 'Umum')),
  year INTEGER NOT NULL,
  start_date DATE,
  end_date DATE,
  max_participants INTEGER,
  total_participants INTEGER DEFAULT 0,
  status VARCHAR(50) DEFAULT 'draft' CHECK (status IN ('draft', 'active', 'completed', 'cancelled')),
  
  -- Media
  image_url TEXT,
  highlights TEXT[],              -- Array of highlights
  success_stories JSONB,          -- JSON array of success stories
  gallery_urls TEXT[],            -- Array of photo URLs
  
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE INDEX idx_cohorts_year ON cohorts(year DESC);
CREATE INDEX idx_cohorts_status ON cohorts(status);
```

#### 5. cohort_members
```sql
CREATE TABLE cohort_members (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  cohort_id UUID REFERENCES cohorts(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  application_id UUID REFERENCES applications(id),
  enrollment_date DATE DEFAULT CURRENT_DATE,
  status VARCHAR(50) DEFAULT 'enrolled' CHECK (status IN ('enrolled', 'dropped', 'completed')),
  created_at TIMESTAMP DEFAULT NOW(),
  UNIQUE(cohort_id, user_id)
);

CREATE INDEX idx_cohort_members_cohort_id ON cohort_members(cohort_id);
CREATE INDEX idx_cohort_members_user_id ON cohort_members(user_id);
```

---

### Relationships

```
users (1) ──< (N) applications
users (1) ──< (N) notifications
users (1) ──< (N) cohort_members

applications (N) ──> (1) users (reviewed_by)

cohorts (1) ──< (N) cohort_members

cohort_members (N) ──> (1) cohorts
cohort_members (N) ──> (1) users
cohort_members (N) ──> (1) applications
```

---

## 🎨 User Interface

### Design System

#### Colors (HMIF Brand)
```css
/* Primary Colors */
--hmif-primary: #4A9FF5;        /* Light Blue (main) */
--hmif-secondary: #1E3A5F;      /* Dark Blue/Navy */
--hmif-accent: #000000;         /* Black */

/* Background */
--bg-dark: #0A0A0A;             /* Main background */
--bg-secondary: #1A1A1A;        /* Card background */

/* Text */
--text-primary: #FFFFFF;        /* White */
--text-secondary: #A0A0A0;      /* Gray */

/* Status */
--status-draft: #F59E0B;        /* Yellow */
--status-submitted: #3B82F6;    /* Blue */
--status-review: #F97316;       /* Orange */
--status-accepted: #10B981;     /* Green */
--status-rejected: #EF4444;     /* Red */
```

#### Typography
```css
/* Font Family */
font-family: 'Outfit', sans-serif;

/* Sizes */
--text-hero: 6rem - 8rem;       /* Hero headlines */
--text-h1: 3rem - 4rem;         /* Section titles */
--text-h2: 2rem - 2.5rem;       /* Subsection titles */
--text-body: 1rem - 1.125rem;   /* Body text */
--text-small: 0.875rem;         /* Small text */

/* Weights */
--weight-bold: 700;
--weight-semibold: 600;
--weight-regular: 400;
```

#### Spacing
```css
/* Base unit: 4px */
--space-1: 0.25rem;  /* 4px */
--space-2: 0.5rem;   /* 8px */
--space-4: 1rem;     /* 16px */
--space-6: 1.5rem;   /* 24px */
--space-8: 2rem;     /* 32px */
--space-12: 3rem;    /* 48px */
--space-16: 4rem;    /* 64px */
```

#### Shadows
```css
--shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
--shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
--shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.1);
--shadow-xl: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
```

---

### Component Specifications

#### Button Variants
1. **Primary** (CTA)
   - Background: #4A9FF5
   - Text: #FFFFFF
   - Hover: Lighter #4A9FF5 + glow
   - Padding: 16px 32px
   - Border radius: 8px

2. **Secondary**
   - Background: #1E3A5F
   - Text: #FFFFFF
   - Hover: Lighter #1E3A5F
   - Padding: 16px 32px
   - Border radius: 8px

3. **Outline**
   - Border: 2px solid #4A9FF5
   - Background: transparent
   - Text: #4A9FF5
   - Hover: Background #4A9FF5, Text #FFFFFF
   - Padding: 14px 30px

4. **Magnetic** (Special)
   - Base: Primary button
   - Effect: Follows mouse cursor (spring animation)
   - Use: Hero CTA, important actions

#### Card Component
- Background: #1A1A1A
- Border: 1px solid #1E3A5F
- Border radius: 12px
- Padding: 24px
- Hover: Scale 1.02 + glow (#4A9FF5 shadow)
- Transition: 0.3s ease

#### Form Input
- Background: #1A1A1A
- Border: 1px solid #333333
- Border radius: 8px
- Padding: 12px 16px
- Focus: Border #4A9FF5, glow
- Error: Border #EF4444, text #EF4444
- Font size: 16px (prevent mobile zoom)

#### Modal/Dialog
- Backdrop: rgba(0, 0, 0, 0.8) with blur
- Content: Card style
- Max width: 600px (responsive)
- Animation: Fade in + scale
- Close button: Top-right, #FFFFFF

---

### Responsive Breakpoints

```css
/* Mobile First */
--screen-sm: 640px;   /* Small devices */
--screen-md: 768px;   /* Tablets */
--screen-lg: 1024px;  /* Small laptops */
--screen-xl: 1280px;  /* Desktops */
--screen-2xl: 1536px; /* Large screens */
```

**Design Adjustments:**
- **Mobile (< 640px):**
  - Single column layout
  - Fullscreen modals
  - Stacked form fields
  - Reduced image sequence frames (50 instead of 200)
  - Hero text: 3rem - 4rem

- **Tablet (640px - 1024px):**
  - 2-column grid (bento)
  - Side-by-side form fields (2 columns)
  - Hero text: 4rem - 6rem

- **Desktop (> 1024px):**
  - 3-4 column grid
  - Multi-column forms
  - Hero text: 6rem - 8rem
  - Full image sequence (200 frames)

---

## 🔄 Workflow

### User Registration & Application Flow

```
┌─────────────────────────────────────────────────────────────────┐
│ 1. LANDING PAGE                                                 │
│    User visits / (public)                                       │
│    Scrolls through hero animation, features, history            │
│    Clicks "Daftar Sekarang" button                              │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│ 2. REGISTER ACCOUNT                                             │
│    User redirected to /daftar-akun                              │
│    Fills: Email, Password, Nama, No HP                          │
│    Submits → Account created in Supabase Auth                   │
│    Email: "Selamat Datang di HMIF Bootcamp!" sent              │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│ 3. LOGIN                                                        │
│    User redirected to /masuk                                    │
│    Login with email + password                                  │
│    Authenticated → Redirect to /dashboard                       │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│ 4. USER DASHBOARD (First Visit)                                │
│    Status: "Belum ada pendaftaran"                              │
│    CTA: "Daftar Bootcamp Sekarang"                              │
│    Click → Redirect to /daftar                                  │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│ 5. REGISTRATION FORM - STEP 1                                   │
│    Path: /daftar                                                │
│    User fills personal data:                                    │
│    - Nama Lengkap                                               │
│    - Email (pre-filled from account)                            │
│    - Nomor HP                                                   │
│    - Kategori (Pelajar/Mahasiswa/Umum)                          │
│    - [Conditional] Asal Universitas (if Mahasiswa Aktif)        │
│    - Program Studi/Jurusan                                      │
│    - Semester                                                   │
│                                                                 │
│    Features:                                                    │
│    - Real-time validation (Zod)                                 │
│    - Auto-save to localStorage (draft)                          │
│    - Progress indicator: 1/2                                    │
│                                                                 │
│    Actions:                                                     │
│    - "Simpan Draft" → Save & exit (can continue later)          │
│    - "Lanjut ke Review →" → Validate & go to Step 2             │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│ 6. REGISTRATION FORM - STEP 2                                   │
│    Review & Confirmation                                        │
│                                                                 │
│    Display all entered data in clean card layout               │
│    User reviews:                                                │
│    - Nama Lengkap: [Value]                                      │
│    - Email: [Value]                                             │
│    - ... (all fields from Step 1)                               │
│                                                                 │
│    Actions:                                                     │
│    - "← Kembali" → Go back to Step 1 (edit)                     │
│    - Checkbox: "Saya setuju dengan syarat dan ketentuan"        │
│    - "SUBMIT PENDAFTARAN" (disabled until checkbox checked)     │
│                                                                 │
│    On Submit:                                                   │
│    - Save application to database (status: submitted)           │
│    - Clear localStorage draft                                   │
│    - Email: "Pendaftaran Berhasil Dikirim" sent                │
│    - Redirect to /dashboard                                     │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│ 7. USER DASHBOARD (After Submit)                                │
│    Status: "Terkirim" (Blue badge)                              │
│    Timeline: Pendaftaran → [Review] → Diterima                  │
│    Message: "Pendaftaran kamu sedang menunggu review panitia"   │
│    Estimated: 3-5 hari kerja                                    │
│                                                                 │
│    User waits for admin review...                               │
└─────────────────────────────────────────────────────────────────┘
```

---

### Admin Review Flow

```
┌─────────────────────────────────────────────────────────────────┐
│ 1. ADMIN LOGIN                                                  │
│    Admin visits /masuk                                          │
│    Login with admin credentials                                 │
│    Redirect to /admin/dashboard                                 │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│ 2. ADMIN DASHBOARD                                              │
│    Path: /admin/dashboard                                       │
│    Overview:                                                    │
│    - Total applications: 150                                    │
│    - Pending review: 23                                         │
│    - Accepted: 100                                              │
│    - Rejected: 27                                               │
│                                                                 │
│    CTA: "Kelola Pendaftaran" → /admin/pendaftaran               │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│ 3. APPLICATIONS TABLE                                           │
│    Path: /admin/pendaftaran                                     │
│                                                                 │
│    Table with columns:                                          │
│    | Nama | Email | Kategori | Univ | Jurusan | Status | Aksi | │
│    |------|-------|----------|------|---------|--------|------|  │
│    | Budi | @...  | Mhs      | Untan| Inform. | Terkrm | Lihat| │
│    | ... (20 rows per page)                                     │
│                                                                 │
│    Filters:                                                     │
│    - Status: [Terkirim ▼]                                       │
│    - Kategori: [Semua ▼]                                        │
│    - Search: [Cari nama/email...]                               │
│                                                                 │
│    Actions:                                                     │
│    - Click "Lihat Detail" → Open detail modal                   │
│    - Select multiple → Bulk approve/reject                      │
│    - Export to CSV                                              │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│ 4. APPLICATION DETAIL MODAL                                     │
│    Triggered by: Click "Lihat Detail"                           │
│                                                                 │
│    Modal content:                                               │
│    ┌─────────────────────────────────────────────────────────┐ │
│    │ DETAIL PENDAFTARAN                               [X]    │ │
│    │                                                           │ │
│    │ Nama Lengkap: Budi Santoso                                │ │
│    │ Email: budi@example.com                                   │ │
│    │ Nomor HP: 08123456789                                     │ │
│    │ Kategori: Mahasiswa Aktif                                 │ │
│    │ Universitas: Universitas Tanjungpura                      │ │
│    │ Jurusan: Informatika                                      │ │
│    │ Semester: Semester 5                                      │ │
│    │ Tanggal Daftar: 15 Feb 2026, 10:30 WIB                    │ │
│    │                                                           │ │
│    │ ─────────────────────────────────────────────────────── │ │
│    │                                                           │ │
│    │ Catatan Reviewer:                                         │ │
│    │ [_______________________________________________]          │ │
│    │ [_______________________________________________]          │ │
│    │                                                           │ │
│    │ [Terima Pendaftaran]  [Tolak Pendaftaran]                │ │
│    └─────────────────────────────────────────────────────────┘ │
│                                                                 │
│    Admin actions:                                               │
│    - Add reviewer notes                                         │
│    - Click "Terima Pendaftaran" → Confirmation dialog           │
│    - Click "Tolak Pendaftaran" → Confirmation dialog            │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│ 5A. APPROVE APPLICATION                                         │
│     Confirmation dialog:                                        │
│     "Yakin ingin menerima pendaftaran Budi Santoso?"            │
│     [Batal]  [Ya, Terima]                                       │
│                                                                 │
│     On confirm:                                                 │
│     - Update status → "accepted"                                │
│     - Save reviewer notes                                       │
│     - Timestamp: reviewed_at, reviewed_by                       │
│     - Email: "Selamat! Kamu Diterima..." sent                   │
│     - Update user dashboard                                     │
│     - Close modal                                               │
│     - Toast: "Pendaftaran berhasil diterima"                    │
└─────────────────────────────────────────────────────────────────┘

                                OR

┌─────────────────────────────────────────────────────────────────┐
│ 5B. REJECT APPLICATION                                          │
│     Confirmation dialog:                                        │
│     "Yakin ingin menolak pendaftaran Budi Santoso?"             │
│     Note: Catatan reviewer akan dikirim ke peserta              │
│     [Batal]  [Ya, Tolak]                                        │
│                                                                 │
│     On confirm:                                                 │
│     - Update status → "rejected"                                │
│     - Save reviewer notes (REQUIRED)                            │
│     - Timestamp: reviewed_at, reviewed_by                       │
│     - Email: "Informasi Status Pendaftaran" sent                │
│         (includes reviewer notes)                               │
│     - Update user dashboard                                     │
│     - Close modal                                               │
│     - Toast: "Pendaftaran ditolak"                              │
└─────────────────────────────────────────────────────────────────┘
```

---

### User Post-Review Flow

```
┌─────────────────────────────────────────────────────────────────┐
│ SCENARIO A: APPLICATION ACCEPTED                                │
│                                                                 │
│ 1. Email Notification Received                                 │
│    Subject: "Selamat! Kamu Diterima di Bootcamp HMIF"          │
│    Content:                                                     │
│    - Congratulations message                                    │
│    - Next steps (payment, onboarding, etc)                      │
│    - Link to dashboard                                          │
│    - Bootcamp schedule                                          │
│    - Contact person                                             │
│                                                                 │
│ 2. User Visits Dashboard                                        │
│    Path: /dashboard                                             │
│    Status: "Diterima" (Green badge)                             │
│    Timeline: [✓] Pendaftaran → [✓] Review → [●] Diterima       │
│    Message: "Selamat! Pendaftaran kamu telah diterima"          │
│                                                                 │
│    Actions:                                                     │
│    - [Unduh Surat Penerimaan] button (generates PDF)            │
│    - View next steps                                            │
│    - View bootcamp schedule                                     │
│                                                                 │
│ 3. Download Acceptance Letter                                   │
│    Click button → Generate PDF                                  │
│    PDF contains:                                                │
│    - HMIF logo & letterhead                                     │
│    - Participant name & details                                 │
│    - Bootcamp name, dates                                       │
│    - Signature (digital)                                        │
│    - QR code (verification)                                     │
│                                                                 │
│ 4. Email: Acceptance Letter Sent                                │
│    Auto-send PDF as attachment                                  │
│    Subject: "Surat Penerimaan Bootcamp HMIF"                    │
└─────────────────────────────────────────────────────────────────┘

                                OR

┌─────────────────────────────────────────────────────────────────┐
│ SCENARIO B: APPLICATION REJECTED                                │
│                                                                 │
│ 1. Email Notification Received                                 │
│    Subject: "Informasi Status Pendaftaran"                      │
│    Content:                                                     │
│    - Polite rejection message                                   │
│    - Reviewer notes (reason for rejection)                      │
│    - Encouragement to try again next batch                      │
│    - Link to bootcamp history (view upcoming batches)           │
│                                                                 │
│ 2. User Visits Dashboard                                        │
│    Path: /dashboard                                             │
│    Status: "Ditolak" (Red badge)                                │
│    Timeline: [✓] Pendaftaran → [✓] Review → [✗] Ditolak        │
│    Message: "Maaf, pendaftaran kamu belum bisa diterima"        │
│                                                                 │
│    Display:                                                     │
│    - Reviewer notes (visible to user)                           │
│    - Suggestions for improvement                                │
│    - Link to future bootcamp info                               │
│                                                                 │
│ 3. User Actions (Optional)                                      │
│    - View riwayat bootcamp (plan for next batch)                │
│    - Contact admin (if questions)                               │
│    - Apply again next batch (if available)                      │
└─────────────────────────────────────────────────────────────────┘
```

---

### Cohort Management Flow (Admin)

```
┌─────────────────────────────────────────────────────────────────┐
│ 1. ADMIN DASHBOARD                                              │
│    Navigate to: /admin/cohort                                   │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│ 2. COHORTS LIST                                                 │
│    Path: /admin/cohort                                          │
│    Title: "Kelola Cohort"                                       │
│                                                                 │
│    Table:                                                       │
│    | Nama Cohort | Tahun | Kategori | Peserta | Status | Aksi |│
│    |-------------|-------|----------|---------|--------|------|│
│    | Web Dev 2025| 2025  | Mahasiswa| 50/100  | Active | Edit |│
│    | Data Sci 24 | 2024  | Umum     | 80/80   | Done   | Edit |│
│                                                                 │
│    Filters:                                                     │
│    - Tahun: [2025 ▼]                                            │
│    - Status: [Semua ▼]                                          │
│    - Search: [Cari nama cohort...]                              │
│                                                                 │
│    Actions:                                                     │
│    - [+ Buat Cohort Baru] button                                │
│    - Click "Edit" → Edit cohort form                            │
│    - Click "Hapus" → Delete confirmation                        │
└───────────────────────────────┬─────────────────────────────────┘
                                │
                                ▼
┌─────────────────────────────────────────────────────────────────┐
│ 3. CREATE COHORT FORM                                           │
│    Path: /admin/cohort/baru                                     │
│    Title: "Buat Cohort Baru"                                    │
│                                                                 │
│    Form fields:                                                 │
│    ┌───────────────────────────────────────────────────────┐   │
│    │ Nama Cohort*                                          │   │
│    │ [_________________________________]                   │   │
│    │                                                       │   │
│    │ Deskripsi                                             │   │
│    │ [_________________________________]                   │   │
│    │ [_________________________________]                   │   │
│    │                                                       │   │
│    │ Kategori*           Tahun*                            │   │
│    │ [Mahasiswa ▼]       [2026    ]                        │   │
│    │                                                       │   │
│    │ Tanggal Mulai       Tanggal Selesai                   │   │
│    │ [01/03/2026  ]      [31/03/2026  ]                    │   │
│    │                                                       │   │
│    │ Maks. Peserta       Total Peserta                     │   │
│    │ [100         ]      [0           ]                    │   │
│    │                                                       │   │
│    │ Status*                                               │   │
│    │ [active ▼]                                            │   │
│    │                                                       │   │
│    │ ─────────────────────────────────────────────────── │   │
│    │                                                       │   │
│    │ Cover Image Upload*                                   │   │
│    │ ┌─────────────────────────────────────────┐          │   │
│    │ │  Drag & drop atau click untuk upload   │          │   │
│    │ │  [📁 Select File]                       │          │   │
│    │ └─────────────────────────────────────────┘          │   │
│    │ Max 5MB, JPG/PNG                                      │   │
│    │                                                       │   │
│    │ Highlights                                            │   │
│    │ [100+ Peserta                    ] [➖ Remove]        │   │
│    │ [5 Minggu Intensif               ] [➖ Remove]        │   │
│    │ [+ Add Highlight]                                     │   │
│    │                                                       │   │
│    │ Success Stories                                       │   │
│    │ ┌───────────────────────────────────────┐            │   │
│    │ │ Story #1                              │            │   │
│    │ │ Nama: [Andi Wijaya          ]         │            │   │
│    │ │ Foto: [📁 Upload]                     │            │   │
│    │ │ Posisi: [Software Engineer  ]         │            │   │
│    │ │ Testimoni:                            │            │   │
│    │ │ [_____________________________]        │            │   │
│    │ │ LinkedIn: [https://...      ]         │            │   │
│    │ │                            [➖ Remove]│            │   │
│    │ └───────────────────────────────────────┘            │   │
│    │ [+ Add Success Story]                                 │   │
│    │                                                       │   │
│    │ Galeri (Max 10 photos)                                │   │
│    │ ┌─────────────────────────────────────────┐          │   │
│    │ │ [🖼️] [🖼️] [🖼️] [🖼️] [🖼️]              │          │   │
│    │ │ [+ Upload Photos (Drag & Drop)]         │          │   │
│    │ └─────────────────────────────────────────┘          │   │
│    │                                                       │   │
│    │ [Batal]                      [Simpan Cohort]          │   │
│    └───────────────────────────────────────────────────────┘   │
│                                                                 │
│    On submit:                                                   │
│    - Validate all required fields                               │
│    - Upload cover image to Supabase Storage                     │
│    - Upload success story photos                                │
│    - Upload gallery photos                                      │
│    - Save cohort data to database                               │
│    - Toast: "Cohort berhasil dibuat"                            │
│    - Redirect to /admin/cohort (list)                           │
└─────────────────────────────────────────────────────────────────┘
```

---

## 📅 Timeline Estimate

### Phase 1: Setup & Design (Week 1)
- Project setup (Next.js, Tailwind, Supabase)
- Database schema creation
- Design system setup (colors, typography, components)
- Landing page static structure

### Phase 2: Landing Page (Week 2)
- Image sequence scrollytelling hero
- Smooth scroll integration (Lenis)
- About, Features, Stats sections
- Testimonials slider
- Footer

### Phase 3: Authentication (Week 3)
- Supabase Auth integration
- Register/Login pages
- Protected routes middleware
- Role-based access control

### Phase 4: Registration Form (Week 4)
- 2-step form (Step 1: Personal Data)
- Form validation (Zod)
- Conditional fields (university)
- Step 2: Review & Confirmation
- Auto-save draft (localStorage)
- Submit application

### Phase 5: User Dashboard (Week 5)
- Application status display
- Timeline visual
- Download acceptance letter (PDF generation)
- Notifications inbox

### Phase 6: Admin Panel - Applications (Week 6)
- Applications table (filter, search, pagination)
- Application detail modal
- Approve/reject functionality
- Reviewer notes
- Export to CSV

### Phase 7: Admin Panel - Cohorts (Week 7)
- Cohorts list table
- Create/edit cohort form
- File uploads (cover, success stories, gallery)
- Dynamic fields (highlights, success stories)
- Delete confirmation

### Phase 8: Email Notifications (Week 8)
- Resend integration
- Email templates (5 types)
- Auto-send on status change
- Email tracking
- Retry mechanism

### Phase 9: Bootcamp History (Week 9)
- Public cohort showcase page
- Year filter tabs
- Cohort detail page
- Success stories display
- Gallery lightbox

### Phase 10: Testing & Deployment (Week 10)
- Unit testing (critical components)
- Integration testing
- User acceptance testing (UAT)
- Bug fixes
- Performance optimization
- Deployment to Vercel
- Domain setup
- SSL certificate
- Production monitoring

---

## 🎓 Success Metrics

### User Metrics:
- **Registration Completion Rate:** > 80%
  - % of users who start registration and complete it
  
- **Application Submission Time:** < 10 minutes
  - Average time from start to submit
  
- **User Satisfaction:** > 4.5/5
  - Post-submission survey rating

### Admin Metrics:
- **Review Time per Application:** < 5 minutes
  - Average time to review & decide
  
- **Application Processing Time:** < 3 days
  - Time from submit to approved/rejected

### Technical Metrics:
- **Page Load Time:** < 3 seconds (desktop)
- **Email Delivery Rate:** > 99%
- **Uptime:** > 99.9%
- **Mobile Responsiveness:** 100% (all pages)

### Business Metrics:
- **Application Volume:** Track monthly trends
- **Acceptance Rate:** % of applications accepted
- **Cohort Fill Rate:** % of max participants enrolled
- **Return Rate:** % of users applying to multiple batches

---

## 📞 Support & Contact

**Project Owner:** Himpunan Mahasiswa Informatika (HMIF)  
**Institution:** Fakultas Teknik, Universitas Tanjungpura  
**Email:** contact@hmif.untan.ac.id  
**Website:** https://bootcamp.hmif.untan.ac.id  
**Instagram:** @hmif.untan  
**Location:** Pontianak, Kalimantan Barat, Indonesia

**Technical Support:**
- GitHub Issues: [repository-url]/issues
- Email: dev@hmif.untan.ac.id
- Documentation: /docs

---

**Last Updated:** February 16, 2026  
**Version:** 1.0  
**Status:** Ready for Development

---
