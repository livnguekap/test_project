#!/bin/sh
pip install -U pipenv
pipenv run python manage.py migrate
pipenv run python manage.py runserver 0.0.0.0:8000