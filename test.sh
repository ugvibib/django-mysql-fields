#!/bin/sh

py.test -rx -vv --cov-report=term-missing --cov=django_mysql_fields --flake8 --isort django_mysql_fields
