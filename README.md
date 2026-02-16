# Enrollment Management System

Website pendaftaran online untuk bootcamp/program training, terinspirasi dari [DBS Foundation Coding Camp](https://www.dbs.com/spark/index/id_id/site/codingcamp/index.html).

## 🎯 Fitur Utama

### User Side
- **Landing Page** - Hero section, timeline pendaftaran, info program
- **Multi-Step Registration** - Form pendaftaran bertahap (3-4 steps)
- **User Dashboard** - Track status aplikasi, progress indicator
- **Document Management** - Upload & download dokumen
- **Email Notifications** - Konfirmasi, status updates, acceptance letter

### Admin Side
- **Admin Dashboard** - Manage semua aplikasi
- **Review System** - Approve/reject aplikasi dengan notes
- **Applicant Management** - Filter, search, export data
- **Email Triggers** - Send notification otomatis
- **Analytics** - Basic statistics & reports

## 🛠️ Tech Stack

### Frontend
- **Framework:** Next.js 15 (App Router)
- **Language:** TypeScript
- **Styling:** Tailwind CSS
- **UI Components:** shadcn/ui
- **Form Handling:** React Hook Form + Zod
- **State Management:** React Context / Zustand

### Backend
- **Database:** Supabase (PostgreSQL)
- **Authentication:** Supabase Auth
- **Storage:** Supabase Storage
- **API:** Next.js API Routes / Supabase Edge Functions

### Services
- **Email:** Resend / SendGrid
- **Deployment:** Vercel
- **Domain:** TBD

## 📁 Project Structure

```
enrollment-system/
├── app/                    # Next.js 15 App Router
│   ├── (auth)/            # Auth routes (login, register)
│   ├── (user)/            # User dashboard
│   ├── (admin)/           # Admin dashboard
│   ├── api/               # API routes
│   └── page.tsx           # Landing page
├── components/            # React components
│   ├── ui/               # shadcn/ui components
│   ├── forms/            # Form components
│   └── layouts/          # Layout components
├── lib/                  # Utilities & configs
│   ├── supabase/         # Supabase client & queries
│   ├── validations/      # Zod schemas
│   └── utils.ts          # Helper functions
├── types/                # TypeScript types
├── public/               # Static assets
├── docs/                 # Documentation
│   └── ANALISIS_CODING_CAMP_WEBSITE.md
├── .env.local.example    # Environment variables example
├── package.json
└── README.md
```

## 🚀 Quick Start

### Prerequisites
- Node.js 18+ dan npm/pnpm/yarn
- Akun Supabase (gratis)
- Akun Vercel (gratis) - untuk deployment

### Installation

1. **Clone repository**
```bash
git clone https://github.com/GuavaPopper/enrollment-system.git
cd enrollment-system
```

2. **Install dependencies**
```bash
npm install
# atau
pnpm install
# atau
yarn install
```

3. **Setup environment variables**
```bash
cp .env.local.example .env.local
```

Edit `.env.local` dengan credentials Supabase kamu:
```env
NEXT_PUBLIC_SUPABASE_URL=your_supabase_url
NEXT_PUBLIC_SUPABASE_ANON_KEY=your_supabase_anon_key
SUPABASE_SERVICE_ROLE_KEY=your_service_role_key

RESEND_API_KEY=your_resend_api_key
NEXT_PUBLIC_APP_URL=http://localhost:3000
```

4. **Setup database**
```bash
# Jalankan migration di Supabase SQL Editor
# File: docs/database-schema.sql
```

5. **Run development server**
```bash
npm run dev
```

Buka [http://localhost:3000](http://localhost:3000) di browser.

## 📊 Database Schema

Lihat detail di `docs/database-schema.sql`

**Main Tables:**
- `users` - User data (applicants & admins)
- `applications` - Application records
- `documents` - Uploaded documents
- `notifications` - Email notifications log
- `cohorts` - Cohort/batch management
- `settings` - System configuration

## 🎨 Design System

- **Primary Color:** Blue (#1E40AF)
- **Accent Color:** Orange (#F97316)
- **Font:** Inter (sans-serif)
- **UI Library:** shadcn/ui (Radix UI + Tailwind)

## 📝 Development Status

### Phase 1: MVP (Current)
- [ ] Landing page
- [ ] User authentication (register/login)
- [ ] Multi-step registration form
- [ ] User dashboard
- [ ] Admin dashboard (basic)
- [ ] Email notifications
- [ ] Deployment

### Phase 2: Enhancement
- [ ] Assessment test integration
- [ ] Document e-signature
- [ ] Cohort management
- [ ] Advanced analytics
- [ ] Bulk email
- [ ] Export to CSV

## 🤝 Contributing

1. Fork repository
2. Create feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to branch (`git push origin feature/AmazingFeature`)
5. Open Pull Request

## 📄 License

MIT License - see [LICENSE](LICENSE) file for details

## 🙋 Support

- **Documentation:** [ANALISIS_CODING_CAMP_WEBSITE.md](docs/ANALISIS_CODING_CAMP_WEBSITE.md)
- **Issues:** [GitHub Issues](https://github.com/GuavaPopper/enrollment-system/issues)

## 🎓 Credits

Project terinspirasi dari [DBS Foundation Coding Camp 2026](https://www.dbs.com/spark/index/id_id/site/codingcamp/index.html)

---

**Built with ❤️ by AbangAdit**
