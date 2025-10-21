#!/bin/bash
python manage.py collectstatic && gunicorn --worker 2 apprunner.wsgi