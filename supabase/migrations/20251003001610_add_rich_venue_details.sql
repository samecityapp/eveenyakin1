/*
  # Add Rich Venue Details
  
  ## Summary
  Replaces simple description with rich, multi-layered content structure
  
  ## Changes
  - Drop old `description` column
  - Add `mentor_note` (text) - The mentor's one-liner
  - Add `reviews_summary` (text[]) - Array of customer insights
  - Add `must_order` (text) - Signature dish/item
  
  ## Purpose
  Create personality and depth, avoid AI-sounding content, provide genuine value
*/

-- Add new rich detail columns
ALTER TABLE venues 
  ADD COLUMN IF NOT EXISTS mentor_note text,
  ADD COLUMN IF NOT EXISTS reviews_summary text[],
  ADD COLUMN IF NOT EXISTS must_order text;

-- Drop old description column
ALTER TABLE venues DROP COLUMN IF EXISTS description;
