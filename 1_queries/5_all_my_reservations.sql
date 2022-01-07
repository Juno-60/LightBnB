SELECT reservations.*, properties.*, avg(rating) as average_rating
FROM reservations
JOIN properties ON properties.id = reservations.property_id
JOIN property_reviews ON properties.id = property_reviews.property_id
WHERE reservations.guest_id = 1
AND reservations.end_date < now()::DATE
GROUP BY properties.id, reservations.id
ORDER BY reservations.start_date ASC
LIMIT 10;