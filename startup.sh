#!/bin/bash

echo "Iniciando aplicacao Django no Azure..."

# Instalar dependencias
pip install -r requirements.txt

# Coletar arquivos estaticos
python manage.py collectstatic --noinput

# Executar migracoes
python manage.py migrate

echo "Aplicacao configurada com sucesso!"

# Iniciar servidor Gunicorn
exec gunicorn --bind=0.0.0.0 --timeout 600 config.wsgi