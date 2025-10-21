echo "Running all migrations..."
python manage.py migrate
echo "All migrations completed."

# Start server
python manage.py runserver 0.0.0.0:8000
