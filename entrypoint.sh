#!/bin/bash
set -e

echo "Running all migrations..."
python manage.py migrate --noinput
echo "All migrations completed."

echo "Collecting static files..."
python manage.py collectstatic --noinput || true
echo "Static files collected."

# Start Gunicorn server
echo "Starting Gunicorn server on 0.0.0.0:8000..."
exec gunicorn apprunner.wsgi:application \
    --bind 0.0.0.0:8000 \
    --workers 2 \
    --threads 4 \
    --timeout 60 \
    --access-logfile - \
    --error-logfile - \
    --log-level info
