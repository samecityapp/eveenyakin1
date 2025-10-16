/*
  # Add Design Fields to Cities Table

  1. Changes
    - Add `bg_color` column for Tailwind background color class
    - Add `icon_names` column as text array for Lucide icon names
    - Add `icon_color` column for Tailwind text color class
  
  2. Data Population
    - Populate design fields for existing cities (London, Berlin, Paris, Roma)
    - Each city gets its own unique color scheme and iconic symbols
  
  3. Notes
    - Using Lucide React icons (already installed in the project)
    - Color schemes chosen to reflect each city's character
*/

-- Add design columns to cities table
ALTER TABLE cities 
ADD COLUMN IF NOT EXISTS bg_color text DEFAULT 'bg-gray-50',
ADD COLUMN IF NOT EXISTS icon_names text[] DEFAULT '{}',
ADD COLUMN IF NOT EXISTS icon_color text DEFAULT 'text-gray-300';

-- Update London with red theme and British icons
UPDATE cities 
SET 
  bg_color = 'bg-red-50',
  icon_names = ARRAY['Bus', 'Crown', 'Phone', 'Coffee'],
  icon_color = 'text-red-200'
WHERE slug = 'londra';

-- Update Berlin with gray theme and German icons
UPDATE cities 
SET 
  bg_color = 'bg-gray-50',
  icon_names = ARRAY['Landmark', 'Beer', 'Music', 'Tv'],
  icon_color = 'text-gray-300'
WHERE slug = 'berlin';

-- Update Paris with blue theme and French icons
UPDATE cities 
SET 
  bg_color = 'bg-blue-50',
  icon_names = ARRAY['Landmark', 'Wine', 'Croissant', 'Palette'],
  icon_color = 'text-blue-200'
WHERE slug = 'paris';

-- Update Roma with amber theme and Italian icons
UPDATE cities 
SET 
  bg_color = 'bg-amber-50',
  icon_names = ARRAY['Church', 'Pizza', 'Landmark', 'Wine'],
  icon_color = 'text-amber-200'
WHERE slug = 'roma';
