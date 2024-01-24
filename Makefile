dev-docker-serve:
	docker-compose up web
dev-docker-build-frontend:
	docker-compose up build_frontend
backup-images:
	poetry run python manage.py dumpdata django_images > db-backup.django_images.json
backup-all:
	poetry run python manage.py dumpdata > db-backup.all.json
migrate:
	poetry run python manage.py migrate
migrate-no-input:
	poetry run python manage.py migrate --noinput
makemigrations:
	poetry run python manage.py makemigrations
recover-all:
	poetry run python manage.py loaddata db-backup.all.json
collect-static-no-input:
	poetry run python manage.py collectstatic --noinput
bootstrap:
	make install
	make collect-static-no-input
serve:
	poetry run python manage.py runserver 0.0.0.0:8000
install:
	poetry install
test:
	poetry run python manage.py test
shell:
	poetry run python manage.py shell
flake8:
	poetry run flake8
docs-serve:
	poetry run mkdocs serve
docs-build:
	poetry run mkdocs build
docs-publish:
	poetry run mkdocs gh-deploy
