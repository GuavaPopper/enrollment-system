# Enrollment Management System - HMIF Bootcamp

**Website Pendaftaran Bootcamp HMIF**  
Himpunan Mahasiswa Informatika - Fakultas Teknik - Universitas Tanjungpura

Website pendaftaran online untuk bootcamp/program pelatihan **HMIF** dengan desain modern Awwwards-level scrollytelling.

---

## 🎓 Tentang Project

Platform web untuk mengelola pendaftaran peserta bootcamp **Himpunan Mahasiswa Informatika (HMIF)** Fakultas Teknik Universitas Tanjungpura, Pontianak.

**Fitur Utama:**
- Modern scrollytelling landing page dengan image sequence animation
- Multi-step registration form (2 langkah, tanpa upload dokumen)
- User dashboard untuk tracking status pendaftaran
- Admin panel untuk kelola pendaftaran & cohort
- Email notifications otomatis (full Bahasa Indonesia)
- Riwayat bootcamp showcase

**Bahasa:** Full Bahasa Indonesia (semua UI, labels, email)

---

## ✨ Fitur Lengkap

### 👤 User Side (Peserta)
- **Landing Page** - Awwwards-level scrollytelling dengan image sequence animation (100-200 frames)
- **Formulir Pendaftaran** - Multi-step form (2 langkah):
  * Step 1: Data Pribadi (Nama, Email, HP, Kategori, Universitas, Jurusan, Semester)
  * Step 2: Review & Konfirmasi
- **Dashboard** - Track status: Konsep, Terkirim, Dalam Review, Diterima, Ditolak
- **Notifikasi Email** - Konfirmasi & update status (Bahasa Indonesia)

### 👨‍💼 Admin Side (Panitia HMIF)
- **Dashboard Admin** - Kelola semua pendaftaran
- **Review System** - Terima/Tolak dengan catatan reviewer
- **Kelola Cohort** - CRUD cohort: cover image, highlights, success stories, gallery
- **Filter & Search** - Filter by status/kategori, search by nama/email
- **Email Triggers** - Auto-send saat status berubah

### 🎨 Design Highlights
- **Awwwards-level** scrollytelling hero
- **Smooth scroll** (Lenis library)
- **Framer Motion** animations (text reveal, magnetic button, count-up)
- **Fullscreen navbar** menu
- **Dark theme** + Blue accent (HMIF brand)
- **Typography:** Outfit font (Google Fonts)

---

## 🛠️ Tech Stack

### Frontend
- **Next.js 15** (App Router) + TypeScript
- **Tailwind CSS** + **shadcn/ui**
- **Framer Motion** + **Lenis** (smooth scroll)
- **React Hook Form** + **Zod** (validation)
- **Outfit** font (Google Fonts)

### Backend & Services
- **Supabase** (PostgreSQL + Auth + Storage)
- **Resend** (Email service - Indonesian templates)
- **Vercel** (Deployment)

---

## 📁 Project Structure

```
enrollment-system/
├── app/                    # Next.js App Router
│   ├── (auth)/            # Login, Register
│   ├── (user)/            # User dashboard, application form
│   ├── (admin)/           # Admin dashboard
│   ├── api/               # API routes
│   └── page.tsx           # Landing page
├── components/            # React components
│   ├── ui/               # shadcn/ui components
│   ├── forms/            # Form components
│   └── layouts/          # Layout components
├── lib/                  # Utilities
│   ├── supabase/         # Supabase client & queries
│   ├── validations/      # Zod schemas
│   └── utils.ts
├── types/                # TypeScript types
├── docs/                 # Documentation
│   ├── ANALISIS_CODING_CAMP_WEBSITE.md
│   └── database-schema.sql
└── README.md
```

---

## 🚀 Quick Start

### Prerequisites
- Node.js 18+
- Supabase account (gratis)
- Resend/SendGrid account (gratis)

### Installation

```bash
# Clone repository
git clone https://github.com/GuavaPopper/enrollment-system.git
cd enrollment-system

# Install dependencies
npm install

# Setup environment variables
cp .env.local.example .env.local
# Edit .env.local dengan Supabase & email service credentials
```

### Database Setup

1. Buat project di [Supabase](https://supabase.com)
2. Run migration di Supabase SQL Editor:
   - Copy isi `docs/database-schema.sql`
   - Paste & execute di SQL Editor
3. Copy credentials ke `.env.local`

### Run Development

```bash
npm run dev
```

Buka [http://localhost:3000](http://localhost:3000)

---

## 📊 Database Schema

**Main Tables:**
- `users` - User data (applicants & admins)
- `applications` - Application records
- `documents` - Uploaded documents
- `notifications` - Email notification log
- `cohorts` - Cohort/batch management
- `settings` - System configuration

Detail lengkap: `docs/database-schema.sql`

---

## 🎨 Design System

- **Primary:** Blue (#1E40AF)
- **Accent:** Orange (#F97316)
- **Font:** Inter
- **UI Library:** shadcn/ui

---

## 📝 Development Status

### ✅ Phase 1: MVP (Current)
- [ ] Landing page
- [ ] User authentication
- [ ] Multi-step registration form
- [ ] User dashboard
- [ ] Admin dashboard
- [ ] Email notifications
- [ ] Deployment

### 🔮 Phase 2: Enhancement
- [ ] Assessment test integration
- [ ] Document e-signature
- [ ] Cohort management
- [ ] Analytics dashboard
- [ ] Bulk email
- [ ] Export CSV

---

## 🚢 Deployment

### Vercel (Recommended)

```bash
# Push to GitHub
git push origin main

# Deploy via Vercel CLI
npm install -g vercel
vercel

# Atau via Vercel Dashboard
# https://vercel.com → Import GitHub repo
```

Add environment variables di Vercel:
- `NEXT_PUBLIC_SUPABASE_URL`
- `NEXT_PUBLIC_SUPABASE_ANON_KEY`
- `SUPABASE_SERVICE_ROLE_KEY`
- `RESEND_API_KEY`

---

## 📚 Documentation

- **Full Analysis:** [docs/ANALISIS_CODING_CAMP_WEBSITE.md](docs/ANALISIS_CODING_CAMP_WEBSITE.md)
- **Database Schema:** [docs/database-schema.sql](docs/database-schema.sql)
- **GitHub:** [GuavaPopper/enrollment-system](https://github.com/GuavaPopper/enrollment-system)

---

## 💰 Estimasi Budget

### Development
- **DIY:** Rp 150k-500k/tahun (hosting + domain)
- **Freelancer:** Rp 5-8 juta (MVP)

### Operational
- **Monthly:** ~Rp 108.500/bulan
  - Domain: Rp 12.500
  - VPS: Rp 96.000
  - Others: Gratis (Supabase + Vercel free tier)

---

## 🤝 Contributing

1. Fork repository
2. Create feature branch: `git checkout -b feature/AmazingFeature`
3. Commit: `git commit -m 'Add AmazingFeature'`
4. Push: `git push origin feature/AmazingFeature`
5. Open Pull Request

---

## 📄 License

MIT License

---

## 🎓 Credits

Inspired by [DBS Foundation Coding Camp 2026](https://www.dbs.com/spark/index/id_id/site/codingcamp/index.html)

**Built with ❤️ by AbangAdit**
