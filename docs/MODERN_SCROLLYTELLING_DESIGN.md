# MODERN IMAGE SEQUENCE SCROLLYTELLING CONCEPT

Konsep desain landing page dengan **Awwwards-level scrollytelling** menggunakan image sequence animation yang triggered by scroll.

---

## 🎯 Konsep Utama

### **Scrollytelling dengan Image Sequence**

User scroll → Image sequence berubah frame by frame → Membuat efek video/animasi 3D yang smooth

**Inspirasi:** Apple product pages, Awwwards winners

**Key Features:**
- 🎬 **Image sequence animation** (100+ frames)
- 📜 **Scroll-triggered** transitions
- 🎨 **Seamless blending** (background match image)
- ✨ **Text reveals** & fade animations
- 🧲 **Magnetic interactions**
- 🌊 **Smooth scroll** (Lenis)
- 📱 **Mobile optimized**

---

## 🎨 Visual Design Direction

### **Color Palette**
- **Background:** Match dengan image sequence background (seamless)
- **Primary:** Blue (#1E40AF) - brand color
- **Accent:** Orange (#F97316) - CTA buttons
- **Text:** High contrast (white on dark, dark on light)

### **Typography**
- **Font:** Outfit (Google Fonts)
- **Style:** Clean, minimalist, tracking-tight
- **Sizes:** Large hero text (4xl-8xl), readable body (base-lg)

### **Layout**
- **Hero:** Full-screen sticky canvas dengan text overlays
- **Sections:** Full-screen sections dengan reveal animations
- **Navbar:** Minimal (logo + menu), fullscreen menu overlay
- **Footer:** Clean, modern

---

## 🏗️ Technical Architecture

### **Tech Stack**
```
Framework:     Next.js 15 (App Router)
Styling:       Tailwind CSS
Animation:     Motion (Framer Motion)
Scroll:        Lenis (smooth scroll)
Canvas:        HTML5 Canvas (image sequence rendering)
Typography:    Google Fonts (Outfit)
Components:    Custom + shadcn/ui
```

### **Performance Optimizations**
- ✅ Image preloading (prevent flickering)
- ✅ Canvas rendering (GPU accelerated)
- ✅ RequestAnimationFrame for smooth updates
- ✅ Lazy loading untuk sections dibawah hero
- ✅ Image optimization (Next.js Image)
- ✅ Code splitting

---

## 📐 Page Structure

### **1. Hero Section (Scrollytelling)**

**Component:** `SequenceScroll.tsx`

```
┌─────────────────────────────────────────┐
│                                         │
│         [Sticky Canvas]                 │
│     Image Sequence (193 frames)         │
│                                         │
│   ┌─────────────────────────────┐      │
│   │  Text Overlay (Centered)    │      │
│   │  "Welcome to Bootcamp"      │      │
│   │  "Transform Your Career"    │      │
│   └─────────────────────────────┘      │
│                                         │
└─────────────────────────────────────────┘
   ↓ Scroll Down (4x viewport height)
   
   0%:  "Main Headline" (Center)
   30%: "Feature 1" (Left fade-in)
   60%: "Feature 2" (Right fade-in)
   90%: "CTA Button" (Center magnetic)
```

**Scroll Mechanics:**
- Container: `h-[400vh]` (4x viewport)
- Canvas: `sticky top-0 h-screen w-full`
- Frame mapping: scroll 0-100% → frame 0-193
- Text overlays: opacity transitions based on scroll %

---

### **2. About Section (Text Reveal)**

```
┌─────────────────────────────────────────┐
│                                         │
│  [Character-by-character reveal]        │
│                                         │
│  A  b  o  u  t    O  u  r              │
│  B  o  o  t  c  a  m  p                │
│                                         │
│  [Each character fades in as scroll]   │
│                                         │
└─────────────────────────────────────────┘
```

**Animation:**
- Split text into individual characters
- Each char: `opacity: 0` → `opacity: 1`
- Triggered by scroll scrub (IntersectionObserver)

---

### **3. Bento Grid (Features)**

```
┌───────────┬───────────┬───────────┐
│           │           │           │
│  Card 1   │  Card 2   │  Card 3   │
│  [Image]  │  [Image]  │  [Image]  │
│  Title    │  Title    │  Title    │
│           │           │           │
├───────────┴───────────┼───────────┤
│                       │           │
│      Card 4           │  Card 5   │
│      [Large]          │  [Image]  │
│                       │           │
└───────────────────────┴───────────┘
```

**Interactions:**
- Hover: scale + glow effect
- Parallax: slight movement on scroll
- Staggered fade-in animation

---

### **4. Stats Section (Count-Up)**

```
┌─────────────────────────────────────────┐
│                                         │
│    1000+          500+         95%      │
│  Graduates     Companies    Success     │
│                                         │
│  [Numbers animate from 0 when in view]  │
│                                         │
└─────────────────────────────────────────┘
```

**Animation:**
- CountUp effect (0 → target number)
- Triggered when section enters viewport
- Duration: 2s, easing: easeOut

---

### **5. Testimonials (Fullscreen Slider)**

```
┌─────────────────────────────────────────┐
│                                         │
│        [Fullscreen Background]          │
│                                         │
│   ┌─────────────────────────────┐      │
│   │  "Amazing experience..."    │      │
│   │  - John Doe, Developer      │      │
│   │  [Photo]                    │      │
│   └─────────────────────────────┘      │
│                                         │
│          [Prev] • • • [Next]            │
│                                         │
└─────────────────────────────────────────┘
```

**Features:**
- Autoplay slider (5s interval)
- Fullscreen each slide
- Smooth transitions (crossfade)
- Progress dots indicator
- Pause on hover

---

### **6. CTA Section (Animated Background)**

```
┌─────────────────────────────────────────┐
│   [Animated gradient background]        │
│                                         │
│      Ready to Start?                    │
│      [Magnetic CTA Button]              │
│                                         │
│   [Background: animated mesh gradient]  │
└─────────────────────────────────────────┘
```

**Background Animation:**
- Gradient mesh animation (CSS/SVG)
- Subtle movement (infinite loop)
- Blurred blobs floating

**Button:**
- Magnetic effect (follows cursor)
- Hover: scale + glow
- Smooth spring animation

---

### **7. Navbar (Fullscreen Menu)**

**Default State:**
```
┌─────────────────────────────────────────┐
│  [Logo]               [☰ Menu]          │
└─────────────────────────────────────────┘
```

**Menu Opened:**
```
┌─────────────────────────────────────────┐
│                                         │
│            HOME                         │
│            ABOUT                        │
│            PROGRAM                      │
│            HISTORY                      │
│            CONTACT                      │
│                                         │
│   [Social Icons]  [Email/Phone]         │
│                                         │
└─────────────────────────────────────────┘
```

**Animations:**
- Menu open: backdrop blur + fade
- Links: stagger reveal (top to bottom)
- Hover: underline expand animation
- Large text (6xl-8xl)

---

## 🎬 Image Sequence Details

### **For Enrollment System Landing:**

**Concept:** Laptop/Desktop dengan website enrollment system yang rotate 360°

**Frames:** 100-200 frames
**Format:** JPG/PNG (optimized)
**Naming:** `frame-001.jpg`, `frame-002.jpg`, ..., `frame-200.jpg`
**Size:** 1920x1080 (Full HD)
**Background:** Solid color (match website bg)

**Sequence Flow:**
1. **Frame 1-50:** Laptop muncul dari bawah, fade in
2. **Frame 51-100:** Laptop rotate 180° (show front)
3. **Frame 101-150:** Zoom in ke screen (show enrollment form)
4. **Frame 151-200:** Zoom out, laptop fade out

**Alternative (Simpler):**
- **Frame 1-50:** Logo animation (particles forming logo)
- **Frame 51-100:** Logo to product screenshot transition
- **Frame 101-150:** Product screenshot rotate
- **Frame 151-200:** Fade to solid background

---

## 💻 Key Components

### **1. SequenceScroll.tsx**

```typescript
"use client"

import { useRef, useEffect } from 'react'
import { useScroll, useTransform, motion } from 'framer-motion'

export default function SequenceScroll() {
  const containerRef = useRef<HTMLDivElement>(null)
  const canvasRef = useRef<HTMLCanvasElement>(null)
  
  const { scrollYProgress } = useScroll({
    target: containerRef,
    offset: ["start start", "end end"]
  })
  
  const frameIndex = useTransform(scrollYProgress, [0, 1], [0, 193])
  
  useEffect(() => {
    // Preload images
    const images: HTMLImageElement[] = []
    for (let i = 1; i <= 194; i++) {
      const img = new Image()
      img.src = `/sequence/frame-${String(i).padStart(3, '0')}.jpg`
      images.push(img)
    }
    
    // Draw to canvas on scroll
    frameIndex.on('change', (latest) => {
      const ctx = canvasRef.current?.getContext('2d')
      const img = images[Math.floor(latest)]
      if (ctx && img) {
        ctx.drawImage(img, 0, 0, canvas.width, canvas.height)
      }
    })
  }, [frameIndex])
  
  return (
    <div ref={containerRef} className="h-[400vh] relative">
      <canvas
        ref={canvasRef}
        className="sticky top-0 h-screen w-full"
      />
      
      {/* Text Overlays */}
      <motion.div
        className="absolute inset-0 flex items-center justify-center"
        style={{
          opacity: useTransform(scrollYProgress, [0, 0.2], [1, 0])
        }}
      >
        <h1>Welcome to Bootcamp</h1>
      </motion.div>
      
      {/* More text layers at different scroll points */}
    </div>
  )
}
```

---

### **2. TextReveal.tsx**

```typescript
"use client"

import { motion } from 'framer-motion'

export default function TextReveal({ text }: { text: string }) {
  const chars = text.split('')
  
  return (
    <div>
      {chars.map((char, i) => (
        <motion.span
          key={i}
          initial={{ opacity: 0 }}
          whileInView={{ opacity: 1 }}
          transition={{ delay: i * 0.05 }}
          viewport={{ once: true }}
        >
          {char}
        </motion.span>
      ))}
    </div>
  )
}
```

---

### **3. MagneticButton.tsx**

```typescript
"use client"

import { useRef } from 'react'
import { motion, useMotionValue, useSpring } from 'framer-motion'

export default function MagneticButton({ children }: { children: React.ReactNode }) {
  const ref = useRef<HTMLButtonElement>(null)
  const x = useMotionValue(0)
  const y = useMotionValue(0)
  
  const springX = useSpring(x, { stiffness: 300, damping: 20 })
  const springY = useSpring(y, { stiffness: 300, damping: 20 })
  
  const handleMouseMove = (e: React.MouseEvent) => {
    if (!ref.current) return
    const rect = ref.current.getBoundingClientRect()
    const centerX = rect.left + rect.width / 2
    const centerY = rect.top + rect.height / 2
    x.set((e.clientX - centerX) * 0.3)
    y.set((e.clientY - centerY) * 0.3)
  }
  
  const handleMouseLeave = () => {
    x.set(0)
    y.set(0)
  }
  
  return (
    <motion.button
      ref={ref}
      onMouseMove={handleMouseMove}
      onMouseLeave={handleMouseLeave}
      style={{ x: springX, y: springY }}
      className="..."
    >
      {children}
    </motion.button>
  )
}
```

---

## 📦 Dependencies

```json
{
  "dependencies": {
    "next": "^15.0.0",
    "react": "^19.0.0",
    "framer-motion": "^11.0.0",
    "@studio-freight/lenis": "^1.0.0",
    "tailwindcss": "^3.4.0",
    "@next/font": "^15.0.0"
  }
}
```

---

## 🎯 Implementation for Enrollment System

### **Hero Sequence Concept:**

**Option 1: Product Showcase**
- Frame 1-50: Laptop dengan enrollment form (front view)
- Frame 51-100: Rotate 90° (side view)
- Frame 101-150: Rotate 180° (back view)
- Frame 151-200: Rotate 270° → back to front

**Option 2: Journey Timeline**
- Frame 1-50: Calendar (registration period)
- Frame 51-100: Form filling animation
- Frame 101-150: Document upload
- Frame 151-200: Acceptance letter

**Option 3: Logo Animation**
- Frame 1-50: Particles forming logo
- Frame 51-100: Logo pulsing
- Frame 101-150: Logo to dashboard transition
- Frame 151-200: Dashboard showcase

---

### **Text Overlays (per scroll stage):**

**0% Scroll:**
```
Transform Your Future
Join Our Bootcamp 2026
```

**30% Scroll:**
```
Multi-Step Registration
Made Simple & Fast
```

**60% Scroll:**
```
Track Your Application
Real-Time Updates
```

**90% Scroll:**
```
[Magnetic Button]
Apply Now
```

---

## ✅ Feature Integration

### **Landing Page Sections (in order):**

1. **Hero (Image Sequence)** - `h-[400vh]` scroll container
2. **About (Text Reveal)** - Split character animation
3. **Program Features (Bento Grid)** - Card hover effects
4. **Bootcamp History** - Year filter + cohort cards (dari feature sebelumnya)
5. **Stats (Count-Up)** - Graduates, Companies, Success Rate
6. **Testimonials (Fullscreen Slider)** - Autoplay carousel
7. **Timeline** - Registration to Graduation journey
8. **CTA (Animated BG)** - Gradient mesh + magnetic button
9. **Footer** - Social links, copyright

---

### **Navbar:**
- Logo (left)
- Menu button (right)
- Fullscreen overlay menu (on click)
- Links: Home, About, Program, History, Apply, Contact
- Social icons: LinkedIn, Instagram, Twitter
- Email/Phone contact

---

## 🎨 Design Tokens

```css
/* globals.css */
:root {
  --bg-primary: #0A0A0A;
  --bg-secondary: #1A1A1A;
  --text-primary: #FFFFFF;
  --text-secondary: #A0A0A0;
  --accent-blue: #1E40AF;
  --accent-orange: #F97316;
  --radius: 12px;
}

@font-face {
  font-family: 'Outfit';
  src: url('https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;600;700&display=swap');
}
```

---

## 🚀 Performance Checklist

- [ ] Image sequence preloaded (loading state)
- [ ] Canvas rendering optimized (requestAnimationFrame)
- [ ] Lenis smooth scroll enabled
- [ ] Lazy load sections below fold
- [ ] Images optimized (Next.js Image component)
- [ ] Fonts preloaded (Google Fonts optimized)
- [ ] Motion reduced for accessibility
- [ ] Mobile: simplified animation (fewer frames)

---

## 📱 Mobile Optimization

**Hero:**
- Reduce frames: 100 frames instead of 200
- Canvas: `object-fit: cover` (maintain aspect)
- Text: smaller font sizes (3xl instead of 6xl)
- Touch-optimized (no magnetic button, use tap)

**Sections:**
- Stack vertically
- Reduce animation complexity
- Faster scroll scrub (less distance)

---

## 🎬 How to Generate Image Sequence

### **Option 1: Blender**
1. Model laptop + screen
2. Animate 360° rotation (200 frames)
3. Render each frame as JPG (1920x1080)
4. Export sequence

### **Option 2: After Effects**
1. Import design mockup
2. Animate rotation/zoom
3. Export frame sequence (PNG/JPG)

### **Option 3: Spline 3D**
1. Create 3D scene
2. Animate camera/object
3. Export frame sequence

### **Option 4: Rive / Lottie (simplified)**
- Create vector animation
- Export as image sequence
- Less file size, vector-based

---

**Dokumentasi lengkap siap!** 🧆✨🎬

Mau saya update Antigravity prompt untuk include modern scrollytelling concept ini?
