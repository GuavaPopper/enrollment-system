-- Enrollment Management System Database Schema
-- Database: PostgreSQL (Supabase)
-- Version: 1.0
-- Created: 2026-02-16

-- Enable UUID extension
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- =====================================================
-- USERS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS users (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  name VARCHAR(255) NOT NULL,
  phone VARCHAR(50),
  category VARCHAR(50) CHECK (category IN ('SMK', 'Mahasiswa', 'Umum')),
  role VARCHAR(20) DEFAULT 'applicant' CHECK (role IN ('applicant', 'admin', 'reviewer')),
  email_verified BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index untuk pencarian
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_category ON users(category);
CREATE INDEX idx_users_role ON users(role);

-- =====================================================
-- APPLICATIONS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS applications (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  status VARCHAR(50) DEFAULT 'draft' CHECK (status IN ('draft', 'submitted', 'under_review', 'accepted', 'rejected')),
  step_completed INTEGER DEFAULT 0,
  
  -- Personal Data (JSON untuk fleksibilitas)
  personal_data JSONB,
  
  -- School/University Info
  institution_name VARCHAR(255),
  institution_address TEXT,
  major VARCHAR(255),
  graduation_year INTEGER,
  
  -- Documents
  student_card_url TEXT,
  recommendation_letter_url TEXT,
  commitment_letter_url TEXT,
  
  -- Admin Notes
  reviewer_notes TEXT,
  reviewed_by UUID REFERENCES users(id),
  reviewed_at TIMESTAMP WITH TIME ZONE,
  
  -- Timestamps
  submitted_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Index
CREATE INDEX idx_applications_user_id ON applications(user_id);
CREATE INDEX idx_applications_status ON applications(status);
CREATE INDEX idx_applications_created_at ON applications(created_at DESC);

-- =====================================================
-- DOCUMENTS TABLE (untuk tracking upload)
-- =====================================================
CREATE TABLE IF NOT EXISTS documents (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  application_id UUID REFERENCES applications(id) ON DELETE CASCADE,
  type VARCHAR(100) NOT NULL, -- 'student_card', 'recommendation_letter', 'commitment_letter'
  file_name VARCHAR(255) NOT NULL,
  file_url TEXT NOT NULL,
  file_size INTEGER, -- in bytes
  mime_type VARCHAR(100),
  uploaded_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_documents_application_id ON documents(application_id);

-- =====================================================
-- NOTIFICATIONS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS notifications (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  type VARCHAR(50) NOT NULL, -- 'registration', 'status_update', 'offer', 'reminder'
  subject VARCHAR(255) NOT NULL,
  message TEXT NOT NULL,
  email_sent BOOLEAN DEFAULT FALSE,
  email_sent_at TIMESTAMP WITH TIME ZONE,
  read_at TIMESTAMP WITH TIME ZONE,
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_notifications_user_id ON notifications(user_id);
CREATE INDEX idx_notifications_created_at ON notifications(created_at DESC);

-- =====================================================
-- COHORTS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS cohorts (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  category VARCHAR(50) CHECK (category IN ('SMK', 'Mahasiswa', 'Umum')),
  year INTEGER NOT NULL, -- Tahun pelaksanaan (e.g., 2025, 2026)
  start_date DATE,
  end_date DATE,
  max_participants INTEGER,
  total_participants INTEGER DEFAULT 0, -- Total peserta yang enrolled
  status VARCHAR(50) DEFAULT 'draft' CHECK (status IN ('draft', 'active', 'completed', 'cancelled')),
  
  -- History/Showcase Data
  image_url TEXT, -- Cover image untuk showcase
  highlights TEXT[], -- Array of highlights (e.g., "100+ participants", "5 weeks intensive")
  success_stories JSONB, -- Success stories in JSON format
  gallery_urls TEXT[], -- Array of photo URLs
  
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE INDEX idx_cohorts_year ON cohorts(year DESC);
CREATE INDEX idx_cohorts_status ON cohorts(status);

-- =====================================================
-- COHORT MEMBERS TABLE
-- =====================================================
CREATE TABLE IF NOT EXISTS cohort_members (
  id UUID DEFAULT uuid_generate_v4() PRIMARY KEY,
  cohort_id UUID REFERENCES cohorts(id) ON DELETE CASCADE,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  application_id UUID REFERENCES applications(id),
  enrollment_date DATE DEFAULT CURRENT_DATE,
  status VARCHAR(50) DEFAULT 'enrolled' CHECK (status IN ('enrolled', 'dropped', 'completed')),
  created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(),
  UNIQUE(cohort_id, user_id)
);

CREATE INDEX idx_cohort_members_cohort_id ON cohort_members(cohort_id);
CREATE INDEX idx_cohort_members_user_id ON cohort_members(user_id);

-- =====================================================
-- SETTINGS TABLE (System Configuration)
-- =====================================================
CREATE TABLE IF NOT EXISTS settings (
  key VARCHAR(100) PRIMARY KEY,
  value JSONB NOT NULL,
  description TEXT,
  updated_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

-- Insert default settings
INSERT INTO settings (key, value, description) VALUES
('registration_open', '{"smk": true, "mahasiswa": true, "umum": true}'::JSONB, 'Control registration availability per category'),
('registration_deadline', '{"smk": "2026-01-02", "mahasiswa": "2026-01-31"}'::JSONB, 'Registration deadlines'),
('email_templates', '{}'::JSONB, 'Email notification templates'),
('system_info', '{"app_name": "Enrollment System", "version": "1.0.0"}'::JSONB, 'System information')
ON CONFLICT (key) DO NOTHING;

-- =====================================================
-- FUNCTIONS & TRIGGERS
-- =====================================================

-- Function untuk auto-update updated_at
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ language 'plpgsql';

-- Trigger untuk users table
CREATE TRIGGER update_users_updated_at BEFORE UPDATE ON users
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Trigger untuk applications table
CREATE TRIGGER update_applications_updated_at BEFORE UPDATE ON applications
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- Trigger untuk cohorts table
CREATE TRIGGER update_cohorts_updated_at BEFORE UPDATE ON cohorts
FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- =====================================================
-- ROW LEVEL SECURITY (RLS)
-- =====================================================

-- Enable RLS
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE applications ENABLE ROW LEVEL SECURITY;
ALTER TABLE documents ENABLE ROW LEVEL SECURITY;
ALTER TABLE notifications ENABLE ROW LEVEL SECURITY;
ALTER TABLE cohorts ENABLE ROW LEVEL SECURITY;
ALTER TABLE cohort_members ENABLE ROW LEVEL SECURITY;

-- Users: Users can read their own data
CREATE POLICY "Users can view own data" ON users
  FOR SELECT USING (auth.uid() = id);

-- Users: Users can update their own data
CREATE POLICY "Users can update own data" ON users
  FOR UPDATE USING (auth.uid() = id);

-- Applications: Users can view their own applications
CREATE POLICY "Users can view own applications" ON applications
  FOR SELECT USING (user_id = auth.uid());

-- Applications: Users can create applications
CREATE POLICY "Users can create applications" ON applications
  FOR INSERT WITH CHECK (user_id = auth.uid());

-- Applications: Users can update own applications if not submitted
CREATE POLICY "Users can update own draft applications" ON applications
  FOR UPDATE USING (user_id = auth.uid() AND status IN ('draft', 'submitted'));

-- Admins can view all (Note: Implement auth.jwt() check untuk admin role)
-- Contoh: CREATE POLICY "Admins can view all" ON applications
--   FOR ALL USING (auth.jwt() ->> 'role' = 'admin');

-- =====================================================
-- SEED DATA (Optional - untuk testing)
-- =====================================================

-- Create admin user (password hash harus di-generate via Supabase Auth)
-- INSERT INTO users (email, name, role, email_verified)
-- VALUES ('admin@example.com', 'Admin User', 'admin', TRUE);

-- =====================================================
-- VIEWS (untuk reporting)
-- =====================================================

-- View: Application statistics
CREATE OR REPLACE VIEW application_statistics AS
SELECT 
  category,
  status,
  COUNT(*) as count,
  DATE(created_at) as date
FROM applications
GROUP BY category, status, DATE(created_at);

-- View: Cohort capacity
CREATE OR REPLACE VIEW cohort_capacity AS
SELECT 
  c.id,
  c.name,
  c.max_participants,
  COUNT(cm.id) as enrolled_count,
  c.max_participants - COUNT(cm.id) as available_slots
FROM cohorts c
LEFT JOIN cohort_members cm ON c.id = cm.cohort_id
WHERE c.status = 'active'
GROUP BY c.id, c.name, c.max_participants;

-- =====================================================
-- COMMENTS
-- =====================================================

COMMENT ON TABLE users IS 'Stores user data for applicants and admins';
COMMENT ON TABLE applications IS 'Stores application submissions';
COMMENT ON TABLE documents IS 'Tracks uploaded documents';
COMMENT ON TABLE notifications IS 'Email notification log';
COMMENT ON TABLE cohorts IS 'Training cohorts/batches';
COMMENT ON TABLE cohort_members IS 'Participants in each cohort';
COMMENT ON TABLE settings IS 'System-wide configuration';

-- =====================================================
-- DONE!
-- =====================================================
-- Schema created successfully.
-- Next steps:
-- 1. Run this script in Supabase SQL Editor
-- 2. Configure RLS policies for admin access
-- 3. Setup authentication via Supabase Auth
-- 4. Implement API routes in Next.js
