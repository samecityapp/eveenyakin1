/*
  # Clean and Setup Tokyo Food Guide

  ## Overview
  This migration cleans Tokyo's existing data and sets up the standardized food guide structure
  with 6 core categories: Burgers, Pizza, Coffee, Fine Dining, Michelin Stars, and Local Specialties.

  ## Changes

  1. Data Cleanup
    - Remove all existing Tokyo food categories and venues
    - Keep Tokyo city entry intact

  2. New Food Categories for Tokyo
    - Best Burgers (11 venues)
    - Best Pizza (11 venues)
    - Best Coffee (11 venues)
    - Fine Dining (11 venues)
    - Michelin Starred (variable count)
    - Local Specialties (Tokyo-specific dishes)

  ## Important Notes
  - All venue data will be added in subsequent migrations
  - This establishes the foundation structure only
*/

-- Clean existing Tokyo food data
DELETE FROM venues 
WHERE food_category_id IN (
  SELECT id FROM food_categories WHERE city_id = '0e50a122-4556-4eab-811d-3d7967a64d41'
);

DELETE FROM food_categories 
WHERE city_id = '0e50a122-4556-4eab-811d-3d7967a64d41';

-- Add Tokyo food categories
INSERT INTO food_categories (city_id, name, slug, icon, sort_order) VALUES
('0e50a122-4556-4eab-811d-3d7967a64d41', 'Best Burgers', 'burgers', 'Beef', 1),
('0e50a122-4556-4eab-811d-3d7967a64d41', 'Best Pizza', 'pizza', 'Pizza', 2),
('0e50a122-4556-4eab-811d-3d7967a64d41', 'Best Coffee', 'coffee', 'Coffee', 3),
('0e50a122-4556-4eab-811d-3d7967a64d41', 'Fine Dining', 'fine-dining', 'UtensilsCrossed', 4),
('0e50a122-4556-4eab-811d-3d7967a64d41', 'Michelin Starred', 'michelin', 'Star', 5),
('0e50a122-4556-4eab-811d-3d7967a64d41', 'Tokyo Specialties', 'local-specialties', 'ChefHat', 6);
