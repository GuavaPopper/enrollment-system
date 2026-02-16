# BOOTCAMP HISTORY FEATURE

Feature untuk menampilkan **history bootcamp** tahun-tahun sebelumnya di landing page sebagai social proof & showcase.

---

## 🎯 Tujuan Feature

1. **Social Proof** - Tunjukkan track record bootcamp
2. **Build Trust** - Calon peserta lihat hasil bootcamp sebelumnya
3. **Engagement** - Gallery foto & success stories menarik
4. **Transparency** - Data peserta, durasi, achievements

---

## 📊 Data yang Ditampilkan

### **1. Overview Card (per Cohort)**
- **Nama Cohort** - e.g., "Coding Camp 2025 - SMK"
- **Tahun** - 2025
- **Kategori** - SMK / Mahasiswa / Umum
- **Periode** - Jan - Mar 2025
- **Total Peserta** - e.g., 120 peserta
- **Status** - Completed
- **Cover Image** - Foto banner cohort

### **2. Highlights (Achievements)**
Array of key achievements:
- "120+ participants from 15+ schools"
- "5 weeks intensive training"
- "80% job placement rate"
- "10+ industry mentors"
- "50+ projects completed"

### **3. Success Stories**
JSON format:
```json
{
  "stories": [
    {
      "name": "Budi Santoso",
      "photo": "https://...",
      "title": "Frontend Developer at Tokopedia",
      "quote": "Bootcamp ini mengubah karir saya...",
      "linkedin": "https://linkedin.com/in/..."
    },
    {
      "name": "Siti Aminah",
      "photo": "https://...",
      "title": "Full Stack Developer at Gojek",
      "quote": "Materi sangat aplikatif...",
      "linkedin": "https://linkedin.com/in/..."
    }
  ]
}
```

### **4. Gallery**
Array of photo URLs:
- Foto kegiatan bootcamp
- Foto graduation ceremony
- Foto workshop/mentoring
- Foto project showcase

---

## 🎨 UI/UX Design

### **Landing Page Section: "Bootcamp History"**

**Layout:**
```
===========================================
  BOOTCAMP HISTORY
  Lihat perjalanan bootcamp kami
-------------------------------------------
[2025]  [2024]  [2023]  [All Years]  <-- Tab/Filter

┌─────────────────────────────────────┐
│  [Cover Image]                      │
│  Coding Camp 2025 - SMK             │
│  Jan - Mar 2025 | 120 Participants  │
│                                     │
│  ✨ Highlights:                     │
│  • 120+ participants from 15+ schools│
│  • 80% job placement rate           │
│  • 10+ industry mentors             │
│                                     │
│  [View Details] [Gallery]           │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│  Coding Camp 2025 - Mahasiswa       │
│  ...                                │
└─────────────────────────────────────┘

... (more cohorts)
===========================================
```

**Detail Modal/Page:**
```
===========================================
  CODING CAMP 2025 - SMK
  Jan - Mar 2025
-------------------------------------------

[Cover Image - Full Width]

📊 OVERVIEW
  • Total Peserta: 120
  • Durasi: 5 weeks
  • Kategori: SMK
  • Status: ✅ Completed

✨ HIGHLIGHTS
  • 120+ participants from 15+ schools
  • 5 weeks intensive training
  • 80% job placement rate
  • 10+ industry mentors
  • 50+ projects completed

💬 SUCCESS STORIES
┌─────────────────────────────────────┐
│  [Photo]  Budi Santoso              │
│           Frontend Developer @ Tokopedia│
│                                     │
│  "Bootcamp ini mengubah karir saya  │
│   dari zero to hero..."             │
│                                     │
│  [LinkedIn Profile]                 │
└─────────────────────────────────────┘

┌─────────────────────────────────────┐
│  [Photo]  Siti Aminah               │
│  ...                                │
└─────────────────────────────────────┘

📸 GALLERY
[Photo Grid - 3 columns]
[img] [img] [img]
[img] [img] [img]
...

[Back to History]
===========================================
```

---

## 🗄️ Database Schema Addition

**Table: `cohorts`** (Already exists, enhanced)

**New columns added:**
```sql
-- History/Showcase Data
image_url TEXT, -- Cover image untuk showcase
highlights TEXT[], -- Array of highlights
success_stories JSONB, -- Success stories dalam JSON
gallery_urls TEXT[], -- Array of photo URLs
year INTEGER NOT NULL, -- Tahun pelaksanaan
total_participants INTEGER DEFAULT 0, -- Total peserta enrolled
```

**Index:**
```sql
CREATE INDEX idx_cohorts_year ON cohorts(year DESC);
CREATE INDEX idx_cohorts_status ON cohorts(status);
```

---

## 🔌 API Endpoints

### **1. Get All Cohorts (Public)**
```
GET /api/cohorts?status=completed&year=2025
```

**Response:**
```json
{
  "cohorts": [
    {
      "id": "uuid",
      "name": "Coding Camp 2025 - SMK",
      "year": 2025,
      "category": "SMK",
      "start_date": "2025-01-15",
      "end_date": "2025-03-20",
      "total_participants": 120,
      "status": "completed",
      "image_url": "https://...",
      "highlights": [
        "120+ participants from 15+ schools",
        "80% job placement rate",
        "10+ industry mentors"
      ]
    },
    ...
  ]
}
```

### **2. Get Cohort Detail (Public)**
```
GET /api/cohorts/:id
```

**Response:**
```json
{
  "id": "uuid",
  "name": "Coding Camp 2025 - SMK",
  "description": "Intensive 5-week coding bootcamp...",
  "year": 2025,
  "category": "SMK",
  "start_date": "2025-01-15",
  "end_date": "2025-03-20",
  "total_participants": 120,
  "max_participants": 150,
  "status": "completed",
  "image_url": "https://...",
  "highlights": [...],
  "success_stories": {
    "stories": [
      {
        "name": "Budi Santoso",
        "photo": "https://...",
        "title": "Frontend Developer at Tokopedia",
        "quote": "...",
        "linkedin": "https://linkedin.com/in/..."
      },
      ...
    ]
  },
  "gallery_urls": [
    "https://...",
    "https://...",
    ...
  ]
}
```

### **3. Create/Update Cohort (Admin Only)**
```
POST /api/admin/cohorts
PUT /api/admin/cohorts/:id
```

**Request Body:**
```json
{
  "name": "Coding Camp 2025 - SMK",
  "description": "...",
  "category": "SMK",
  "year": 2025,
  "start_date": "2025-01-15",
  "end_date": "2025-03-20",
  "max_participants": 150,
  "total_participants": 120,
  "status": "completed",
  "image_url": "https://...",
  "highlights": [
    "120+ participants",
    "80% job placement"
  ],
  "success_stories": {
    "stories": [...]
  },
  "gallery_urls": [...]
}
```

---

## 🎯 Components Structure

```
components/
├── bootcamp-history/
│   ├── HistorySection.tsx      # Main section di landing page
│   ├── CohortCard.tsx          # Card untuk 1 cohort
│   ├── YearFilter.tsx          # Filter by year tabs
│   ├── CohortDetail.tsx        # Detail modal/page
│   ├── SuccessStoryCard.tsx    # Success story card
│   ├── GalleryGrid.tsx         # Photo gallery grid
│   └── HighlightsList.tsx      # Highlights list component
```

---

## 📝 Admin Panel Feature

### **Admin: Manage Cohorts**

**Page:** `/admin/cohorts`

**Features:**
- ✅ List all cohorts (table)
- ✅ Filter by year/status
- ✅ Create new cohort
- ✅ Edit cohort data
- ✅ Upload cover image
- ✅ Add/remove highlights
- ✅ Add/edit success stories
- ✅ Upload gallery photos
- ✅ Publish/unpublish cohort

**Form Fields:**
- Name (text)
- Description (textarea)
- Category (select: SMK/Mahasiswa/Umum)
- Year (number)
- Start Date (date picker)
- End Date (date picker)
- Max Participants (number)
- Total Participants (number)
- Status (select: draft/active/completed/cancelled)
- Cover Image (file upload)
- Highlights (dynamic array input)
- Success Stories (repeater fields):
  - Name
  - Photo (file upload)
  - Title/Position
  - Quote (textarea)
  - LinkedIn URL
- Gallery (multiple file upload)

---

## 🚀 Implementation Steps

### **Phase 1: Database**
1. ✅ Update `cohorts` table schema (sudah dilakukan)
2. Add seed data (sample cohort 2025)

### **Phase 2: API**
1. Create `/api/cohorts` (public GET)
2. Create `/api/cohorts/:id` (public GET)
3. Create `/api/admin/cohorts` (admin CRUD)

### **Phase 3: Components**
1. Build `HistorySection.tsx`
2. Build `CohortCard.tsx`
3. Build `YearFilter.tsx`
4. Build `CohortDetail.tsx`
5. Build `SuccessStoryCard.tsx`
6. Build `GalleryGrid.tsx`

### **Phase 4: Admin Panel**
1. Build `/admin/cohorts` page
2. Build cohort form (create/edit)
3. Implement file upload (cover + gallery)
4. Success stories management

### **Phase 5: Landing Page Integration**
1. Add History Section di landing page
2. Connect to API
3. Test responsiveness
4. Add animations (optional)

---

## 💡 Sample Data (Seed)

```sql
INSERT INTO cohorts (
  name, 
  description, 
  category, 
  year, 
  start_date, 
  end_date, 
  max_participants, 
  total_participants, 
  status,
  image_url,
  highlights,
  success_stories,
  gallery_urls
) VALUES (
  'Coding Camp 2025 - SMK',
  'Intensive 5-week coding bootcamp for SMK students focusing on web development fundamentals.',
  'SMK',
  2025,
  '2025-01-15',
  '2025-03-20',
  150,
  120,
  'completed',
  'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=800',
  ARRAY[
    '120+ participants from 15+ schools',
    '5 weeks intensive training',
    '80% job placement rate',
    '10+ industry mentors',
    '50+ projects completed'
  ],
  '{
    "stories": [
      {
        "name": "Budi Santoso",
        "photo": "https://randomuser.me/api/portraits/men/1.jpg",
        "title": "Frontend Developer at Tokopedia",
        "quote": "Bootcamp ini mengubah karir saya dari zero to hero. Materi sangat aplikatif dan mentor sangat supportive!",
        "linkedin": "https://linkedin.com/in/budisantoso"
      },
      {
        "name": "Siti Aminah",
        "photo": "https://randomuser.me/api/portraits/women/1.jpg",
        "title": "Full Stack Developer at Gojek",
        "quote": "Best decision ever! Dari tidak tahu coding sama sekali, sekarang saya bekerja di tech unicorn.",
        "linkedin": "https://linkedin.com/in/sitiaminah"
      }
    ]
  }'::JSONB,
  ARRAY[
    'https://images.unsplash.com/photo-1522071820081-009f0129c71c?w=600',
    'https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?w=600',
    'https://images.unsplash.com/photo-1515187029135-18ee286d815b?w=600',
    'https://images.unsplash.com/photo-1556761175-5973dc0f32e7?w=600',
    'https://images.unsplash.com/photo-1542744173-8e7e53415bb0?w=600',
    'https://images.unsplash.com/photo-1523240795612-9a054b0db644?w=600'
  ]
);

-- Cohort 2024
INSERT INTO cohorts (
  name, 
  description, 
  category, 
  year, 
  start_date, 
  end_date, 
  max_participants, 
  total_participants, 
  status,
  image_url,
  highlights,
  gallery_urls
) VALUES (
  'Coding Camp 2024 - Mahasiswa',
  'Advanced bootcamp for university students with focus on full-stack development.',
  'Mahasiswa',
  2024,
  '2024-02-01',
  '2024-04-15',
  100,
  85,
  'completed',
  'https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=800',
  ARRAY[
    '85 participants from 10+ universities',
    '10 weeks intensive program',
    '90% project completion rate',
    'Real-world capstone projects'
  ],
  ARRAY[
    'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?w=600',
    'https://images.unsplash.com/photo-1513258496099-48168024aec0?w=600'
  ]
);
```

---

## ✅ Feature Checklist

### Landing Page
- [ ] History Section component
- [ ] Year filter tabs (2025, 2024, 2023, All)
- [ ] Cohort cards grid (responsive)
- [ ] View Details button
- [ ] Smooth scroll to section

### Cohort Detail Page/Modal
- [ ] Cover image display
- [ ] Overview stats
- [ ] Highlights list
- [ ] Success stories carousel/grid
- [ ] Photo gallery (lightbox)
- [ ] Back button

### Admin Panel
- [ ] Cohorts list page
- [ ] Create cohort form
- [ ] Edit cohort form
- [ ] File upload (cover image)
- [ ] Highlights array input
- [ ] Success stories repeater
- [ ] Gallery multiple upload
- [ ] Delete cohort

### API
- [ ] GET /api/cohorts (public)
- [ ] GET /api/cohorts/:id (public)
- [ ] POST /api/admin/cohorts (admin)
- [ ] PUT /api/admin/cohorts/:id (admin)
- [ ] DELETE /api/admin/cohorts/:id (admin)

---

## 🎨 Design Inspiration

**Style:**
- Card-based layout (modern)
- Gradient overlay pada cover images
- Badge untuk year/category
- Stats dengan icons
- Quotes dengan italic style
- Gallery dengan hover effects
- Smooth transitions

**Colors:**
- Completed cohorts: Green accent
- Active cohorts: Blue accent
- Draft cohorts: Gray

---

**Feature siap untuk di-implement!** 🧆📚✨

Mau saya update Antigravity prompt untuk include feature ini?
