/*
  # Add Mentor Tricks to Venues

  Replace reviews_summary with mentor_tricks - insider tips that make users say "wow"
*/

ALTER TABLE venues 
ADD COLUMN IF NOT EXISTS mentor_tricks text[];

-- Keep reviews_summary for backward compatibility but we'll use mentor_tricks now
COMMENT ON COLUMN venues.mentor_tricks IS 'Insider tips and tactics from a local mentor';
