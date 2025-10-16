/*
  # Add Geographic Coordinates to Venues
  
  ## Summary
  Adds latitude and longitude columns to venues table for map display
  
  ## Changes
  - Add `lat` (decimal) - Latitude coordinate
  - Add `lng` (decimal) - Longitude coordinate
  
  ## Purpose
  Enable interactive map visualization of venue locations
*/

-- Add coordinate columns
ALTER TABLE venues 
  ADD COLUMN IF NOT EXISTS lat decimal(10, 7),
  ADD COLUMN IF NOT EXISTS lng decimal(10, 7);

-- Add index for geographic queries
CREATE INDEX IF NOT EXISTS idx_venues_coordinates ON venues(lat, lng);
