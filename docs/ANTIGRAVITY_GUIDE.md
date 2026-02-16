# ANTIGRAVITY BUILD GUIDE

Panduan lengkap untuk membangun Enrollment Management System untuk **Himpunan Mahasiswa Informatika Fakultas Teknik Universitas Tanjungpura** menggunakan **Antigravity**.

---

## 🎓 TENTANG PROJECT INI

**Organisasi:** Himpunan Mahasiswa Informatika (HMIF)  
**Fakultas:** Teknik  
**Universitas:** Universitas Tanjungpura, Pontianak  
**Tujuan:** Website pendaftaran Bootcamp/Pelatihan untuk mahasiswa & pelajar  
**Bahasa:** **Bahasa Indonesia** (semua UI text, labels, hints)

---

## 🚀 Apa itu Antigravity?

**Antigravity** adalah AI-powered development tool yang bisa generate full-stack web app dari prompt/specification.

**Website:** https://antigravity.dev

---

## 📋 Preparation

### 1. Dokumen yang Sudah Tersedia

✅ **Analisis lengkap:** `docs/ANALISIS_CODING_CAMP_WEBSITE.md`
✅ **Database schema:** `docs/database-schema.sql`
✅ **Project structure:** `README.md`

### 2. Requirements Summary

**Project Type:** Enrollment Management System dengan **Awwwards-level Scrollytelling Design**

**Design Philosophy:** Modern, interactive, scroll-driven storytelling dengan image sequence animation

**Core Features:**
- **Modern scrollytelling landing page** dengan image sequence hero
- Multi-step registration form (2 steps, no document upload)
- User dashboard (track application status)
- Admin dashboard (manage applications + cohorts)
- Email notifications
- Bootcamp history showcase

**Tech Stack:**
- Frontend: Next.js 15 + TypeScript + Tailwind CSS + shadcn/ui + Framer Motion + Lenis
- Backend: Supabase (PostgreSQL + Auth + Storage)
- Email: Resend
- Deployment: Vercel

---

## 🎯 Antigravity Prompt

Gunakan prompt ini di Antigravity untuk generate project:

---

### **PROMPT UNTUK ANTIGRAVITY**

```
Build an Enrollment Management System for Himpunan Mahasiswa Informatika (HMIF) Fakultas Teknik Universitas Tanjungpura with AWWWARDS-LEVEL MODERN SCROLLYTELLING DESIGN.

=== PROJECT CONTEXT ===
**Organization:** Himpunan Mahasiswa Informatika (HMIF)
**Institution:** Fakultas Teknik, Universitas Tanjungpura, Pontianak
**Purpose:** Bootcamp/Training Program Registration System
**Language:** **BAHASA INDONESIA** (all UI text, labels, buttons, hints)

=== OVERVIEW ===
A high-end, interactive full-stack web application featuring scroll-driven storytelling with image sequence animation, multi-step registration (in Indonesian), admin workflow, and automated notifications.

DESIGN INSPIRATION: Awwwards-winning websites with scroll-linked animations, seamless interactions, and premium aesthetics.

=== USER ROLES ===
1. Applicants (Students/Public) - Experience the scrollytelling landing, register, track application
2. Admins (HMIF Committee) - Review, approve/reject applications, manage cohorts

=== LANGUAGE REQUIREMENT ===
**ALL USER-FACING TEXT MUST BE IN BAHASA INDONESIA:**
- Navigation menu (Beranda, Tentang, Program, Riwayat, Daftar, Kontak)
- Form labels & hints (Nama Lengkap, Email, Nomor HP, Kategori, dll)
- Buttons (Daftar Sekarang, Kirim, Lanjut, Kembali, Simpan Draft)
- Status messages (Berhasil, Gagal, Menunggu Review, Diterima, Ditolak)
- Email notifications (subject & body in Indonesian)
- Dashboard labels (Status Pendaftaran, Riwayat, Profil)
- Error messages (Email tidak valid, Field wajib diisi, dll)

ONLY technical/code elements can be in English (variable names, comments, etc.)

=== DESIGN PHILOSOPHY ===

VISUAL DIRECTION:
- Modern, premium, Awwwards-level aesthetics
- Scroll-driven storytelling (scrollytelling)
- Image sequence animation (100-200 frames)
- Seamless blending (background matches image sequence)
- Smooth, buttery scrolling (Lenis library)
- Micro-interactions everywhere
- Dark theme with vibrant accents

TYPOGRAPHY:
- Font: "Outfit" from Google Fonts
- Style: Clean, minimalist, tracking-tight
- Large hero text (6xl-8xl), readable body (base-lg)

COLORS:
- Background: #0A0A0A (match image sequence background)
- Primary: Blue (#1E40AF) - HMIF brand color
- Accent: Orange (#F97316)
- Text: High contrast white/dark
- Seamless blending for image edges

=== CORE FEATURES ===

1. HERO SECTION - IMAGE SEQUENCE SCROLLYTELLING (AWWWARDS-LEVEL)
   
   THE CENTERPIECE:
   - Container: h-[400vh] (4x viewport height for long scroll duration)
   - Canvas element: sticky, top-0, h-screen, w-full, centered
   - Image sequence: 100-200 frames (e.g., laptop rotating 360°, bootcamp dashboard showcase)
   - Frames path: /sequence/frame-001.jpg to frame-200.jpg
   - Scroll mapping: User scroll 0-100% → frame 0-200 (smooth interpolation)
   - Preload all images to prevent flickering
   - Canvas rendering: HTML5 Canvas for performance
   
   TEXT OVERLAYS (fade in/out based on scroll %) - **BAHASA INDONESIA:**
   - 0% scroll: "Wujudkan Masa Depanmu" + "Bergabung dengan Bootcamp HMIF 2026" (Center, large)
   - 30% scroll: "Pendaftaran Multi-Step yang Mudah" (Left aligned, fade in)
   - 60% scroll: "Lacak Status Pendaftaran Real-Time" (Right aligned, fade in)
   - 90% scroll: "Daftar Sekarang" (Center, MAGNETIC BUTTON with spring animation)
   
   TECHNICAL:
   - Use Motion (Framer Motion) useScroll + useTransform
   - Smooth frame interpolation (no stutter)
   - Responsive: scale canvas correctly on mobile (cover fit)
   - Loading state: Awwwards-style preloader while images load

2. LANDING PAGE SECTIONS (Below Hero, wrapped in -mt-[100vh] relative z-10)
   
   ALL TEXT IN **BAHASA INDONESIA**
   
   ORDER:
   a) About Section - TEXT REVEAL ANIMATION
      - Headline: "Tentang HMIF Bootcamp"
      - Subtext: "Program pelatihan intensif untuk mahasiswa & pelajar di Pontianak"
      - Split text into individual characters
      - Each character reveals (opacity 0 → 1) as user scrolls
      - Scroll-scrubbed animation (IntersectionObserver)
      - Large headline with subtext
   
   b) Program Features - BENTO GRID CARDS
      - Section title: "Keunggulan Program"
      - Modern bento-style grid layout (varied sizes)
      - Cards with images, hover effects (scale + glow)
      - Parallax on scroll (slight movement)
      - Staggered fade-in animation
      - Content: Mentor Berpengalaman, Materi Terkini, Sertifikat, Project-Based Learning
   
   c) Bootcamp History - COHORT SHOWCASE
      - Section title: "Riwayat Bootcamp"
      - Year filter tabs: 2025, 2024, 2023, Semua Tahun
      - Cohort cards with cover image, highlights, CTA "Lihat Detail"
      - Detail page: full image, stats, success stories, photo gallery (lightbox)
      - Public access, smooth transitions
   
   d) Stats Section - COUNT-UP NUMBERS
      - Section title: "Pencapaian Kami"
      - Large numbers: 
        * 500+ Peserta
        * 50+ Mentor
        * 95% Kepuasan
      - Count-up animation from 0 to target when in view
      - Duration: 2s, easing: easeOut
      - Icons + labels (in Indonesian)
   
   e) Testimonials - FULLSCREEN AUTOPLAY SLIDER
      - Section title: "Testimoni Alumni"
      - Each slide: fullscreen background + centered quote
      - Participant photo, name, position, testimonial
      - Autoplay (5s interval), pause on hover
      - Progress dots, smooth crossfade transitions
   
   f) Timeline - REGISTRATION JOURNEY
      - Section title: "Alur Pendaftaran"
      - Horizontal/vertical timeline (responsive)
      - Steps (in Indonesian): 
        * Pendaftaran → Review → Diterima → Bootcamp Dimulai
      - Animated progress line
   
   g) CTA Section - ANIMATED GRADIENT BACKGROUND
      - Headline: "Siap Bergabung?"
      - Subtext: "Daftar sekarang dan wujudkan potensi terbaikmu!"
      - Animated mesh gradient (floating blurred blobs)
      - Large headline + magnetic button "Daftar Sekarang"
      - Subtle infinite loop animation
   
   h) Footer - CLEAN & MODERN (BAHASA INDONESIA)
      - Organization: HMIF Fakultas Teknik UNTAN
      - Links: Beranda, Tentang, Program, Riwayat, Kontak
      - Social icons: Instagram, Twitter/X, LinkedIn
      - Contact: email@himaformatika.untan.ac.id, WhatsApp: +62xxx
      - Copyright: © 2026 HMIF UNTAN. All rights reserved.
      - Minimal design

3. NAVBAR - AWWWARDS-LEVEL FULLSCREEN MENU (BAHASA INDONESIA)
   
   DEFAULT STATE:
   - Minimal: Logo HMIF (left) + Menu button (right)
   - Fixed position, backdrop blur on scroll
   
   MENU OPENED (fullscreen overlay):
   - Fullscreen dark backdrop with blur
   - Large navigation links (6xl-8xl text) - **BAHASA INDONESIA:**
     * BERANDA
     * TENTANG
     * PROGRAM
     * RIWAYAT
     * DAFTAR
     * KONTAK
   - Stagger reveal animation (top to bottom)
   - Hover effect: underline expand from center
   - Bottom: Social media icons (Instagram, Twitter/X, LinkedIn)
   - Bottom right: Kontak (email, WhatsApp)
   - Close button (X) with smooth transition

4. BOOTCAMP HISTORY (Detailed)
   - Display past bootcamp cohorts (completed programs)
   - Year filter tabs (2025, 2024, 2023, All Years)
   - Cohort cards with:
     * Cover image
     * Cohort name & year
     * Period (start - end date)
     * Total participants
     * Category badge
     * Highlights (key achievements)
     * View Details button
   
   - Cohort Detail Page/Modal:
     * Full cover image
     * Overview stats (participants, duration, status)
     * Highlights list with icons
     * Success stories section:
       - Participant photo
       - Name & current position
       - Testimonial quote
       - LinkedIn profile link
     * Photo gallery (grid with lightbox)
     * Back button
   
   - Public access (no login required)
   - Smooth animations & transitions

4. AUTHENTICATION
   - User registration (email + password)
   - Login/Logout
   - Email verification (optional for MVP)
   - Protected routes

5. MULTI-STEP REGISTRATION FORM (User)
   
   TOTAL STEPS: 2 (bukan 3 lagi, karena tidak ada document upload)
   
   - Step 1: Personal Data
     
     a) Full name* (text input)
        Placeholder: "Nama lengkap kamu"
     
     b) Email* (email input)
        Placeholder: "email@example.com"
        Validation: email format
     
     c) Phone number* (text input)
        Placeholder: "08xxxxxxxxxx"
        Validation: Indonesian phone format
     
     d) Category* (select dropdown)
        Label: "Kategori"
        Options:
        - Pelajar (SMA atau SMK)
        - Mahasiswa Aktif
        - Umum
     
     e) Asal Universitas* (select dropdown - ONLY IF category = "Mahasiswa Aktif")
        Label: "Asal Universitas"
        Hint: "Dari universitas atau institusi mana kamu berasal? (Jika tidak berasal dari Universitas yang ada di list, bisa isi nama institusi kamu)"
        Options:
        - Universitas Tanjungpura
        - Politeknik Negeri Pontianak
        - Universitas Widya Dharma
        - Universitas Muhammadiyah Pontianak
        - Universitas Bina Sarana Informatika
        - STMIK Pontianak
        - Universitas Panca Bhakti
        - Yang lain: [text input untuk custom]
        
        NOTE: Field ini conditional - hanya muncul jika user pilih "Mahasiswa Aktif"
     
     f) Program Studi/Jurusan* (select dropdown with "Yang lain" option)
        Label: "Program Studi/Jurusan"
        Hint: "Apa program studi atau jurusan kamu? Kami ingin tahu bidang keilmuan kamu saat ini (Jika kamu individu umum, silakan isi \"-\")"
        Options:
        - Informatika
        - Ilmu Komputer
        - Sistem Informasi
        - Rekayasa Sistem Komputer
        - Statistika
        - Yang lain: [text input untuk custom]
        - (Jika category = "Umum", auto-fill dengan "-" atau biarkan user isi bebas)
     
     g) Semester* (select dropdown)
        Label: "Semester"
        Hint: "Di semester berapa kamu sekarang, atau kapan kamu lulus? Ini penting untuk memahami tahap studi kamu (Jika kamu individu umum, silakan isi \"-\")"
        Options:
        - Semester 1
        - Semester 3
        - Semester 5
        - Semester 7
        - Semester 8+
        - Yang lain: [text input untuk custom]
        - (Jika category = "Umum", auto-fill dengan "-" atau biarkan user isi bebas)
   
   - Step 2: Review & Confirmation
     * Summary of ALL data entered in Step 1
     * Display in clean card layout (label: value pairs)
     * Edit button → go back to Step 1
     * Terms & conditions checkbox*
       "Saya setuju dengan syarat dan ketentuan yang berlaku"
     * Submit button (disabled until T&C checked)
   
   - Features:
     * Progress indicator (stepper: 1/2, 2/2)
     * Save draft functionality (auto-save on field change to localStorage)
     * Form validation (Zod schema):
       - All required fields must be filled
       - Email format validation
       - Phone number format validation (Indonesia)
       - Conditional validation (university field only for Mahasiswa Aktif)
     * Smooth step transitions (slide left/right animation)
     * "Yang lain" text input appears when user selects that option
     * Responsive design (mobile-first)

6. USER DASHBOARD (BAHASA INDONESIA)
   - Title: "Dashboard Saya"
   - Application status card:
     * Status labels (in Indonesian):
       - Draft (Konsep)
       - Submitted (Terkirim)
       - Under Review (Dalam Review)
       - Accepted (Diterima)
       - Rejected (Ditolak)
   - Progress timeline visual (Indonesian labels)
   - Download acceptance letter button: "Unduh Surat Penerimaan" (if accepted)
   - Edit application button: "Edit Pendaftaran" (only if Draft or Pending)
   - Email notifications inbox: "Notifikasi"

5. ADMIN DASHBOARD (BAHASA INDONESIA)
   - Title: "Dashboard Admin"
   - Table of all applications with columns (in Indonesian):
     * Nama Pelamar (Applicant name)
     * Email
     * Kategori (Category)
     * Universitas (University) - if applicable
     * Jurusan (Major)
     * Status
     * Tanggal Daftar (Submitted date)
     * Aksi (Actions)
   
   - Features:
     * Filter by status: Semua / Terkirim / Dalam Review / Diterima / Ditolak
     * Filter by category: Semua / Pelajar (SMA/SMK) / Mahasiswa Aktif / Umum
     * Search: Cari berdasarkan nama atau email
     * Pagination (20 per halaman) - labels: Sebelumnya, Selanjutnya
     * View detail modal: Lihat Detail
     * Approve/Reject action: Terima / Tolak (with notes field: Catatan)
     * Bulk select & action
   
   - Detail View Modal:
     * Title: "Detail Pendaftaran"
     * All applicant data (labels in Indonesian)
     * Reviewer notes input: "Catatan Reviewer"
     * Approve button: "Terima Pendaftaran"
     * Reject button: "Tolak Pendaftaran"
     * Email notification trigger automatically

6. EMAIL NOTIFICATIONS (BAHASA INDONESIA)
   - Welcome email (after registration):
     * Subject: "Selamat Datang di HMIF Bootcamp!"
     * Body: Greeting + confirmation + next steps (in Indonesian)
   
   - Application submitted confirmation:
     * Subject: "Pendaftaran Berhasil Dikirim"
     * Body: Thank you message + review timeline
   
   - Status update emails:
     * Under Review - Subject: "Pendaftaran Sedang Direview"
     * Accepted - Subject: "Selamat! Kamu Diterima di Bootcamp HMIF"
     * Rejected - Subject: "Informasi Status Pendaftaran"
   
   - Acceptance letter (with download link):
     * Subject: "Surat Penerimaan Bootcamp HMIF"
   
   - Auto-send on status change
   - HTML email templates (professional, branded with HMIF colors)

7. ADMIN: MANAGE COHORTS (BAHASA INDONESIA)
   - Cohorts list page at /admin/cohorts
   - Title: "Kelola Cohort"
   - Table with columns (in Indonesian):
     * Nama Cohort (Cohort name)
     * Tahun (Year)
     * Kategori (Category)
     * Jumlah Peserta (Participants count)
     * Status
     * Aksi (Actions: Edit, Hapus)
   
   - Create/Edit Cohort Form (labels in Indonesian):
     * Nama* (Name - text)
     * Deskripsi (Description - textarea)
     * Kategori* (Category - select: Pelajar (SMA/SMK)/Mahasiswa Aktif/Umum)
     * Tahun* (Year - number)
     * Tanggal Mulai & Tanggal Selesai (Start & end date - date pickers)
     * Maks. Peserta (Max participants - number)
     * Total Peserta (Total participants - number)
     * Status* (select: draft/active/completed/cancelled)
     * Upload Cover Image (single file, max 5MB)
     * Highlights (dynamic array input - add/remove items)
     * Success Stories (repeater fields):
       - Nama
       - Upload Foto
       - Jabatan/Posisi
       - Testimoni (textarea)
       - Link LinkedIn
     * Galeri (multiple image upload, max 10 photos)
   
   - Features (Indonesian labels):
     * Filter berdasarkan tahun/status
     * Cari berdasarkan nama
     * Pagination
     * Konfirmasi hapus modal
     * Preview gambar sebelum upload
     * Drag & drop galeri upload
   
   - Create/Edit Cohort Form:
     * Name (text)
     * Description (textarea)
     * Category (select: SMK/Mahasiswa/Umum)
     * Year (number)
     * Start date & end date (date pickers)
     * Max participants (number)
     * Total participants (number)
     * Status (select: draft/active/completed/cancelled)
     * Cover image upload (single file, max 5MB)
     * Highlights (dynamic array input - add/remove items)
     * Success Stories (repeater fields):
       - Name
       - Photo upload
       - Title/Position
       - Quote (textarea)
       - LinkedIn URL
     * Gallery (multiple image upload, max 10 photos)
   
   - Features:
     * Filter by year/status
     * Search by name
     * Pagination
     * Delete confirmation modal
     * Image preview before upload
     * Drag & drop gallery upload

=== TECH STACK ===

Frontend:
- Next.js 15 (App Router)
- TypeScript
- Tailwind CSS
- shadcn/ui components (Button, Input, Card, Table, Dialog, Form, Select, Progress)
- **Motion (Framer Motion)** - for all animations
- **@studio-freight/lenis** - for smooth scroll
- React Hook Form + Zod validation
- Lucide icons
- Google Fonts (Outfit)

Animation Libraries:
- framer-motion (useScroll, useTransform, motion components)
- @studio-freight/lenis (smooth scroll)
- Canvas API (image sequence rendering)

Backend:
- Supabase (PostgreSQL database)
- Supabase Auth (authentication)
- Supabase Storage (file uploads)
- Next.js API Routes (server actions)

Services:
- Resend (email service)
- Vercel (deployment)

=== DATABASE SCHEMA ===

Table: users
- id (uuid, primary key)
- email (varchar, unique)
- name (varchar)
- phone (varchar)
- category (enum: 'Pelajar (SMA atau SMK)' | 'Mahasiswa Aktif' | 'Umum')
- role (enum: 'applicant' | 'admin', default 'applicant')
- email_verified (boolean, default false)
- created_at (timestamp)
- updated_at (timestamp)

Table: applications
- id (uuid, primary key)
- user_id (uuid, foreign key → users.id)
- status (enum: 'draft' | 'submitted' | 'under_review' | 'accepted' | 'rejected', default 'draft')
- step_completed (integer, default 0)
- university (varchar, nullable) - Nama universitas (hanya untuk Mahasiswa Aktif)
- major (varchar) - Program Studi/Jurusan
- semester (varchar) - Semester (e.g., "Semester 1", "Semester 8+", "-")
- reviewer_notes (text, nullable) - Catatan reviewer
- reviewed_by (uuid, foreign key → users.id, nullable)
- reviewed_at (timestamp, nullable)
- submitted_at (timestamp, nullable)
- created_at (timestamp)
- updated_at (timestamp)

NOTE: 
- Tidak ada student_card_url (tidak perlu upload dokumen)
- Tidak ada institution_name (diganti dengan university field yang conditional)
- Tidak ada graduation_year (diganti dengan semester)
- Field university hanya diisi jika category = "Mahasiswa Aktif"

Table: notifications
- id (uuid, primary key)
- user_id (uuid, foreign key → users.id)
- type (enum: 'registration' | 'status_update' | 'acceptance')
- subject (varchar)
- message (text)
- email_sent (boolean, default false)
- email_sent_at (timestamp, nullable)
- read_at (timestamp, nullable)
- created_at (timestamp)

Table: settings
- key (varchar, primary key)
- value (jsonb)
- description (text)
- updated_at (timestamp)

Table: cohorts (NEW)
- id (uuid, primary key)
- name (varchar, not null)
- description (text)
- category (enum: 'SMK' | 'Mahasiswa' | 'Umum')
- year (integer, not null)
- start_date (date)
- end_date (date)
- max_participants (integer)
- total_participants (integer, default 0)
- status (enum: 'draft' | 'active' | 'completed' | 'cancelled', default 'draft')
- image_url (text) - cover image for showcase
- highlights (text array) - key achievements
- success_stories (jsonb) - testimonials in JSON format
- gallery_urls (text array) - photo gallery URLs
- created_at (timestamp)
- updated_at (timestamp)

Index on: year (DESC), status

Table: cohort_members
- id (uuid, primary key)
- cohort_id (uuid, foreign key → cohorts.id)
- user_id (uuid, foreign key → users.id)
- application_id (uuid, foreign key → applications.id)
- enrollment_date (date, default current_date)
- status (enum: 'enrolled' | 'dropped' | 'completed', default 'enrolled')
- created_at (timestamp)
- UNIQUE constraint on (cohort_id, user_id)

=== DESIGN REQUIREMENTS ===

Colors:
- Background: #0A0A0A (dark, matches image sequence)
- Background Secondary: #1A1A1A
- Primary: Blue (#1E40AF)
- Accent: Orange (#F97316)
- Success: Green (#10B981)
- Error: Red (#EF4444)
- Text Primary: #FFFFFF
- Text Secondary: #A0A0A0
- Seamless blending for image sequence edges

Typography:
- Font family: **Outfit** from Google Fonts (NOT Inter)
- Hero text: 6xl-8xl, bold, tracking-tight
- Section headlines: 4xl-5xl, semibold
- Body: base-lg, regular weight
- Clean, minimalist aesthetic

Animations & Interactions:
- Smooth scroll: Lenis library (buttery smooth)
- Hero: Image sequence animation (Canvas-based)
- Text: Character-by-character reveal
- Buttons: Magnetic effect (spring animation)
- Cards: Hover scale + glow
- Sections: Fade in on scroll (IntersectionObserver)
- Navbar: Fullscreen menu with stagger reveal
- All transitions: smooth, eased (no sudden movements)

Components:
- Use shadcn/ui for forms, dialogs, tables
- Custom components for scrollytelling (SequenceScroll, TextReveal, MagneticButton)
- Responsive (mobile-first)
- Card-based layouts with hover effects
- Dark theme with vibrant accents

=== PAGES & ROUTES (BAHASA INDONESIA URLs & Page Titles) ===

Public:
- / → Landing page (title: "HMIF Bootcamp - Beranda")
- /riwayat → Bootcamp history page (title: "Riwayat Bootcamp")
- /riwayat/:id → Cohort detail page (title: "Detail Cohort")
- /masuk → Login page (title: "Masuk")
- /daftar-akun → Register account page (title: "Daftar Akun")

Protected (User):
- /dashboard → User dashboard (title: "Dashboard Saya")
- /daftar → Multi-step application form (title: "Formulir Pendaftaran")

Protected (Admin):
- /admin/dashboard → Admin dashboard (title: "Dashboard Admin")
- /admin/pendaftaran → Applications list (title: "Kelola Pendaftaran")
- /admin/pendaftaran/:id → Application detail (title: "Detail Pendaftaran")
- /admin/cohort → Cohorts management (title: "Kelola Cohort")
- /admin/cohort/baru → Create cohort (title: "Buat Cohort Baru")
- /admin/cohort/:id/edit → Edit cohort (title: "Edit Cohort")

API Routes (internal, no translation needed):
- /api/applications → CRUD operations
- /api/applications/:id/approve → Approve application
- /api/applications/:id/reject → Reject application
- /api/notifications/send → Send email
- /api/upload → File upload handler (for cohort images)
- /api/cohorts → Get all cohorts (public, filterable by year/status)
- /api/cohorts/:id → Get cohort detail (public)
- /api/admin/cohorts → Create cohort (admin)
- /api/admin/cohorts/:id → Update/delete cohort (admin)

=== FUNCTIONALITY REQUIREMENTS ===

1. Authentication:
   - Use Supabase Auth
   - Email + password authentication
   - Protected routes middleware
   - Role-based access control

2. File Upload:
   - Upload to Supabase Storage
   - Validate file type (jpg, png, pdf)
   - Validate file size (max 5MB)
   - Generate secure URLs
   - Preview before upload

3. Form Validation:
   - All required fields validated
   - Email format validation
   - Phone number format validation
   - File type/size validation
   - Error messages displayed inline

4. Email Service:
   - Use Resend API
   - HTML email templates
   - Include application data in emails
   - Track email sent status
   - Retry mechanism for failed sends

5. Security:
   - Row Level Security (RLS) enabled on Supabase
   - Users can only view/edit own applications
   - Admins can view all applications
   - File access controlled via signed URLs
   - Input sanitization

6. Scrollytelling Implementation (CRITICAL):
   
   a) Image Sequence Component (SequenceScroll.tsx):
      - Container: div with h-[400vh] for scroll duration
      - Canvas: sticky top-0 h-screen w-full
      - Preload ALL 100-200 images on component mount (loading state)
      - Use Motion's useScroll hook: target container, offset ["start start", "end end"]
      - Use useTransform to map scrollYProgress (0-1) to frame index (0-193)
      - Draw current frame to canvas on every scroll tick (smooth interpolation)
      - Text overlays: motion.div with opacity based on scroll progress
      - Mobile: reduce frames (e.g., 50 frames instead of 200)
   
   b) Smooth Scroll (Lenis):
      - Initialize Lenis in layout.tsx or root component
      - Integrate with RequestAnimationFrame loop
      - Smooth multiplier: 1.0 (buttery smooth)
      - Direction: vertical
   
   c) Text Reveal (TextReveal.tsx):
      - Split text into array of characters
      - Each char: motion.span with initial opacity: 0
      - Use whileInView: opacity: 1
      - Transition delay: index * 0.05 (stagger effect)
      - viewport: once: true
   
   d) Magnetic Button (MagneticButton.tsx):
      - Track mouse position relative to button center
      - Use useMotionValue for x, y offset
      - Apply useSpring for smooth spring animation
      - onMouseMove: calculate offset, set x/y
      - onMouseLeave: reset to 0
      - motion.button with style={{ x, y }}
   
   e) Count-Up Numbers:
      - Use IntersectionObserver to detect when in view
      - Animate from 0 to target number (2s duration, easeOut)
      - Display with toLocaleString() for thousands separator
   
   f) Fullscreen Slider (Testimonials):
      - Auto-advance every 5s (pause on hover)
      - Smooth crossfade transition between slides
      - Progress dots indicator
      - Each slide: fullscreen background, centered content
   - Retry mechanism for failed sends

5. Security:
   - Row Level Security (RLS) enabled on Supabase
   - Users can only view/edit own applications
   - Admins can view all applications
   - File access controlled via signed URLs
   - Input sanitization

=== DEPLOYMENT ===

- Host on Vercel
- Connect Supabase project
- Configure environment variables
- Enable automatic deployments from GitHub

=== ENVIRONMENT VARIABLES ===

Required in .env.local:
- NEXT_PUBLIC_SUPABASE_URL
- NEXT_PUBLIC_SUPABASE_ANON_KEY
- SUPABASE_SERVICE_ROLE_KEY
- RESEND_API_KEY
- NEXT_PUBLIC_APP_URL

=== MVP SCOPE ===

Include in MVP:
✅ Landing page
✅ Authentication (register/login)
✅ Multi-step form (3 steps)
✅ User dashboard
✅ Admin dashboard (basic)
✅ File upload
✅ Email notifications
✅ Approve/reject functionality

Exclude from MVP (Phase 2):
❌ Email verification
❌ Assessment tests
❌ Cohort management
❌ Advanced analytics
❌ Bulk email
❌ Export to CSV

=== ADDITIONAL NOTES ===

- Focus on clean, maintainable code
- Use TypeScript for type safety
- Implement proper error handling
- Add loading states for async operations
- Mobile-responsive design
- Accessibility (ARIA labels, keyboard navigation)
- SEO-friendly (meta tags, semantic HTML)

Generate a complete, production-ready Next.js application with all the features above.
```

---

## 📝 Step-by-Step Guide

### **1. Buat Project di Antigravity**

1. Buka https://antigravity.dev
2. Sign in / Create account
3. Click "New Project"
4. Project name: `enrollment-system`
5. Paste prompt di atas
6. Click "Generate"

### **2. Tunggu Generation Process**

Antigravity akan:
- Generate folder structure
- Create all components
- Setup routing
- Configure database
- Add styling
- Implement features

**Estimasi waktu:** 5-15 menit (tergantung kompleksitas)

### **3. Review Generated Code**

Setelah selesai, review:
- ✅ Folder structure sesuai requirement
- ✅ All components ada
- ✅ API routes implemented
- ✅ Database schema correct
- ✅ Styling menggunakan Tailwind + shadcn/ui

### **4. Setup Environment Variables**

1. Download project dari Antigravity
2. Create `.env.local`:

```env
NEXT_PUBLIC_SUPABASE_URL=https://your-project.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=your-anon-key
SUPABASE_SERVICE_ROLE_KEY=your-service-role-key
RESEND_API_KEY=your-resend-api-key
NEXT_PUBLIC_APP_URL=http://localhost:3000
```

### **5. Install Dependencies**

```bash
npm install
```

### **6. Setup Supabase**

1. Buat project di https://supabase.com
2. Run migration:
   - Buka SQL Editor
   - Copy isi `docs/database-schema.sql`
   - Execute
3. Copy credentials dari Dashboard → Settings → API

### **7. Run Development Server**

```bash
npm run dev
```

Test di http://localhost:3000

### **8. Test All Features**

**User Flow:**
1. Register akun baru
2. Login
3. Isi multi-step form
4. Upload dokumen
5. Submit aplikasi
6. Check dashboard (status berubah)

**Admin Flow:**
1. Create admin user (via Supabase SQL):
   ```sql
   UPDATE users SET role = 'admin' WHERE email = 'your-email@example.com';
   ```
2. Login as admin
3. View applications
4. Filter & search
5. View detail
6. Approve/reject
7. Check email sent

### **9. Deploy to Vercel**

```bash
# Push ke GitHub
git init
git add .
git commit -m "Initial commit from Antigravity"
git remote add origin https://github.com/GuavaPopper/enrollment-system.git
git push -u origin main

# Deploy via Vercel CLI
npm install -g vercel
vercel
```

Atau via Vercel dashboard:
1. https://vercel.com
2. Import GitHub repo
3. Add environment variables
4. Deploy

---

## 🔧 Post-Generation Customization

Setelah generate, kamu bisa customize:

### **1. Branding**
- Edit `app/page.tsx` untuk landing page
- Update logo di `public/`
- Ganti color scheme di `tailwind.config.ts`

### **2. Email Templates**
- Edit templates di `lib/email/templates/`
- Customize subject & body
- Add branding/logo

### **3. Form Fields**
- Tambah/kurangi field di `components/forms/`
- Update validation schema di `lib/validations/`
- Sync database schema

### **4. UI/UX**
- Customize components di `components/ui/`
- Adjust spacing, colors, typography
- Add animations (Framer Motion)

---

## ⚠️ Troubleshooting

### Issue: Supabase connection error
**Solution:** Check `.env.local` credentials, pastikan URL & keys benar

### Issue: File upload gagal
**Solution:** 
- Check Supabase Storage bucket created
- Verify bucket is public or RLS configured
- Check file size limit

### Issue: Email tidak terkirim
**Solution:**
- Verify Resend API key
- Check Resend dashboard for errors
- Test dengan email verified di Resend

### Issue: Admin dashboard tidak muncul
**Solution:**
- Check user role di database: `SELECT role FROM users WHERE email = 'your-email';`
- Update role: `UPDATE users SET role = 'admin' WHERE email = 'your-email';`

---

## 📊 Feature Checklist

Setelah generation, pastikan semua fitur ada:

### Landing Page
- [ ] Hero section dengan CTA
- [ ] Timeline section (SMK vs Mahasiswa)
- [ ] **Bootcamp History section** (NEW)
- [ ] **Year filter tabs** (NEW)
- [ ] **Cohort cards grid** (NEW)
- [ ] Responsive design
- [ ] Navigation menu

### Bootcamp History (NEW)
- [ ] History section on landing page
- [ ] Year filter (2025, 2024, 2023, All)
- [ ] Cohort cards with cover image
- [ ] View Details button
- [ ] Cohort detail page/modal
- [ ] Success stories display
- [ ] Photo gallery with lightbox
- [ ] Smooth transitions

### Authentication
- [ ] Register page
- [ ] Login page
- [ ] Logout functionality
- [ ] Protected routes

### Multi-Step Form
- [ ] Step 1: Personal data form
- [ ] Step 2: Document upload
- [ ] Step 3: Review & confirmation
- [ ] Progress indicator
- [ ] Form validation
- [ ] Save draft

### User Dashboard
- [ ] Application status card
- [ ] Progress timeline
- [ ] Edit application button
- [ ] Download acceptance letter

### Admin Dashboard
- [ ] Applications table
- [ ] Filter by status
- [ ] Filter by category
- [ ] Search functionality
- [ ] Pagination
- [ ] View detail modal
- [ ] Approve/reject action
- [ ] **Cohorts management page** (NEW)
- [ ] **Create/edit cohort form** (NEW)
- [ ] **Upload cover image & gallery** (NEW)
- [ ] **Manage highlights & success stories** (NEW)

### Email Notifications
- [ ] Welcome email
- [ ] Submission confirmation
- [ ] Status update email
- [ ] Acceptance letter email

---

## 🎯 Tips for Best Results

1. **Be Specific:** The more detailed your prompt, the better the result
2. **Provide Examples:** Reference existing websites (like DBS Coding Camp)
3. **List All Features:** Don't assume Antigravity will infer features
4. **Specify Tech Stack:** Clearly state Next.js, Supabase, etc.
5. **Include Database Schema:** Provide exact table structure
6. **Mention Styling:** Specify Tailwind + shadcn/ui
7. **Define User Flows:** Describe step-by-step user journey

---

## 📚 Additional Resources

- **Supabase Docs:** https://supabase.com/docs
- **Next.js Docs:** https://nextjs.org/docs
- **shadcn/ui:** https://ui.shadcn.com
- **Resend Docs:** https://resend.com/docs
- **Tailwind CSS:** https://tailwindcss.com/docs

---

## 🚀 Next Steps After MVP

1. **User Testing** - Ajak user test flow registration
2. **Bug Fixes** - Fix issues yang ditemukan
3. **Performance** - Optimize loading time
4. **SEO** - Add meta tags, sitemap
5. **Analytics** - Integrate Google Analytics
6. **Phase 2 Features** - Assessment tests, cohort management, etc.

---

**Good luck building with Antigravity!** 🧆🚀

Jika ada kendala atau butuh customization, refer ke dokumentasi atau ask for help.
