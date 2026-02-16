# ANTIGRAVITY BUILD GUIDE

Panduan lengkap untuk membangun Enrollment Management System menggunakan **Antigravity**.

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

**Project Type:** Enrollment Management System (web app)

**Core Features:**
- Landing page dengan hero + timeline
- Multi-step registration form (3 steps)
- User dashboard (track application status)
- Admin dashboard (manage applications)
- Email notifications
- File upload (documents)

**Tech Stack:**
- Frontend: Next.js 15 + TypeScript + Tailwind CSS + shadcn/ui
- Backend: Supabase (PostgreSQL + Auth + Storage)
- Email: Resend / SendGrid
- Deployment: Vercel

---

## 🎯 Antigravity Prompt

Gunakan prompt ini di Antigravity untuk generate project:

---

### **PROMPT UNTUK ANTIGRAVITY**

```
Build an Enrollment Management System for bootcamp/training programs.

=== OVERVIEW ===
A full-stack web application for managing bootcamp enrollments with multi-step registration, admin approval workflow, and automated email notifications.

=== USER ROLES ===
1. Applicants (Students/Public) - Register and track application
2. Admins - Review, approve/reject applications

=== CORE FEATURES ===

1. LANDING PAGE
   - Hero section with CTA button "Daftar Sekarang"
   - Timeline section (2 categories: SMK vs Mahasiswa/Umum)
   - Program information
   - Responsive design

2. AUTHENTICATION
   - User registration (email + password)
   - Login/Logout
   - Email verification (optional for MVP)
   - Protected routes

3. MULTI-STEP REGISTRATION FORM (User)
   - Step 1: Personal Data
     * Full name
     * Email
     * Phone number
     * Category (SMK / Mahasiswa / Umum)
     * Institution name
     * Major/Field of study
     * Graduation year
   
   - Step 2: Document Upload
     * Student card (KTM/Kartu Pelajar) - JPG/PNG/PDF, max 5MB
     * Recommendation letter - PDF, max 5MB
   
   - Step 3: Review & Confirmation
     * Summary of all data
     * Terms & conditions checkbox
     * Submit button
   
   - Features:
     * Progress indicator (stepper)
     * Save draft functionality
     * Form validation (Zod)
     * File upload preview

4. USER DASHBOARD
   - Application status card (Draft / Submitted / Under Review / Accepted / Rejected)
   - Progress timeline visual
   - Download acceptance letter (if accepted)
   - Edit application (only if Draft or Pending)
   - Email notifications inbox

5. ADMIN DASHBOARD
   - Table of all applications with columns:
     * Applicant name
     * Email
     * Category
     * Status
     * Submitted date
     * Actions
   
   - Features:
     * Filter by status (All / Submitted / Under Review / Accepted / Rejected)
     * Filter by category (All / SMK / Mahasiswa / Umum)
     * Search by name or email
     * Pagination (20 per page)
     * View detail modal
     * Approve/Reject action with notes field
     * Bulk select & action
   
   - Detail View Modal:
     * All applicant data
     * Document preview/download
     * Reviewer notes input
     * Approve/Reject buttons
     * Email notification trigger

6. EMAIL NOTIFICATIONS
   - Welcome email (after registration)
   - Application submitted confirmation
   - Status update (Under Review → Accepted/Rejected)
   - Acceptance letter (with download link)
   - Auto-send on status change

=== TECH STACK ===

Frontend:
- Next.js 15 (App Router)
- TypeScript
- Tailwind CSS
- shadcn/ui components (Button, Input, Card, Table, Dialog, Form, Select, Progress)
- React Hook Form + Zod validation
- Lucide icons

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
- category (enum: 'SMK' | 'Mahasiswa' | 'Umum')
- role (enum: 'applicant' | 'admin', default 'applicant')
- email_verified (boolean, default false)
- created_at (timestamp)
- updated_at (timestamp)

Table: applications
- id (uuid, primary key)
- user_id (uuid, foreign key → users.id)
- status (enum: 'draft' | 'submitted' | 'under_review' | 'accepted' | 'rejected', default 'draft')
- step_completed (integer, default 0)
- institution_name (varchar)
- major (varchar)
- graduation_year (integer)
- student_card_url (text)
- recommendation_letter_url (text)
- reviewer_notes (text, nullable)
- reviewed_by (uuid, foreign key → users.id, nullable)
- reviewed_at (timestamp, nullable)
- submitted_at (timestamp, nullable)
- created_at (timestamp)
- updated_at (timestamp)

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

=== DESIGN REQUIREMENTS ===

Colors:
- Primary: Blue (#1E40AF)
- Accent: Orange (#F97316)
- Success: Green (#10B981)
- Error: Red (#EF4444)
- Neutral: Gray scale

Typography:
- Font family: Inter (sans-serif)
- Headings: Bold, larger sizes
- Body: Regular weight

Components:
- Use shadcn/ui for consistency
- Responsive (mobile-first)
- Modern, clean interface
- Card-based layouts
- Smooth transitions

=== PAGES & ROUTES ===

Public:
- / → Landing page
- /login → Login page
- /register → Register page

Protected (User):
- /dashboard → User dashboard
- /apply → Multi-step application form

Protected (Admin):
- /admin/dashboard → Admin dashboard
- /admin/applications/:id → Application detail

API Routes:
- /api/applications → CRUD operations
- /api/applications/:id/approve → Approve application
- /api/applications/:id/reject → Reject application
- /api/notifications/send → Send email
- /api/upload → File upload handler

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
- [ ] Responsive design
- [ ] Navigation menu

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
