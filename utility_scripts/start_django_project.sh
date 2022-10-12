echo "Enter project name:"
read project
mkdir $project
cd $project
echo -e "\033[1;34mCreating Dockerfile...\033[0m"
touch Dockerfile
echo -e "\033[1;34mCreating Compose file...\033[0m"
touch docker-compose.yml
echo -e "\033[1;34mCreating .gitignore file...\033[0m"
touch .gitignore
echo -e "\033[1;34mCreating README file...\033[0m"
touch README.md
echo -e "\033[1;34mCreating local environment files...\033[0m"
mkdir envs
touch envs/.dev
echo -e "\033[1;34mCreating requirenets file...\033[0m"
touch requirements.txt
echo -e "\033[1;34mUpdating requirements.txt...\033[0m"
echo "Django>=3.0,<4.0" >> requirements.txt
echo "psycopg2>=2.8" >> requirements.txt
echo "django-environ==0.9.0" >> requirements.txt
echo "djangorestframework==3.13.1" >> requirements.txt
echo "requests==2.28.1" >> requirements.txt
echo -e "\033[1;34mUpdating Dockerfile...\033[0m"
echo "FROM python:3
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt
COPY . /code/" > Dockerfile
echo -e "\033[1;34mUpdating Compose file...\033[0m"

echo "version: '3'
services:
  db:
    image: postgres
    volumes:
      - dbdata:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: postgres
      POSTGRES_PASSWORD: postgres
      POSTGRES_DB: postgres
  web:
    build: .
    command: python manage.py runserver
    volumes:
      - .:/code
    ports:

        - 8000:8000
    depends_on:
        - db
volumes:
    dbdata:" > docker-compose.yml
echo -e "\033[1;34mUpdating .gitignore file...\033[0m"

echo "# Byte-compiled / optimized / DLL files
__pycache__/
*.py[cod]
*$py.class

# C extensions
*.so

# Distribution / packaging
.Python
build/
develop-eggs/
dist/
downloads/
eggs/
.eggs/
lib/
lib64/
parts/
sdist/
var/
wheels/
share/python-wheels/
*.egg-info/
.installed.cfg
*.egg
MANIFEST

# PyInstaller
#  Usually these files are written by a python script from a template
#  before PyInstaller builds the exe, so as to inject date/other infos into it.
*.manifest
*.spec

# Installer logs
pip-log.txt
pip-delete-this-directory.txt

# Unit test / coverage reports
htmlcov/
.tox/
.nox/
.coverage
.coverage.*
.cache
nosetests.xml
coverage.xml
*.cover
*.py,cover
.hypothesis/
.pytest_cache/
cover/

# Translations
*.mo
*.pot

# Django stuff:
*.log
local_settings.py
db.sqlite3
db.sqlite3-journal

# Flask stuff:
instance/
.webassets-cache

# Scrapy stuff:
.scrapy

# Sphinx documentation
docs/_build/

# PyBuilder
.pybuilder/
target/

# Jupyter Notebook
.ipynb_checkpoints

# IPython
profile_default/
ipython_config.py

# pyenv
#   For a library or package, you might want to ignore these files since the code is
#   intended to run in multiple environments; otherwise, check them in:
# .python-version

# pipenv
#   According to pypa/pipenv#598, it is recommended to include Pipfile.lock in version control.
#   However, in case of collaboration, if having platform-specific dependencies or dependencies
#   having no cross-platform support, pipenv may install dependencies that don't work, or not
#   install all needed dependencies.
#Pipfile.lock

# poetry
#   Similar to Pipfile.lock, it is generally recommended to include poetry.lock in version control.
#   This is especially recommended for binary packages to ensure reproducibility, and is more
#   commonly ignored for libraries.
#   https://python-poetry.org/docs/basic-usage/#commit-your-poetrylock-file-to-version-control
#poetry.lock

# pdm
#   Similar to Pipfile.lock, it is generally recommended to include pdm.lock in version control.
#pdm.lock
#   pdm stores project-wide configurations in .pdm.toml, but it is recommended to not include it
#   in version control.
#   https://pdm.fming.dev/#use-with-ide
.pdm.toml

# PEP 582; used by e.g. github.com/David-OConnor/pyflow and github.com/pdm-project/pdm
__pypackages__/

# Celery stuff
celerybeat-schedule
celerybeat.pid

# SageMath parsed files
*.sage.py

# Environments
.env
.venv
env/
venv/
ENV/
env.bak/
venv.bak/
! envs/.dev

# Spyder project settings
.spyderproject
.spyproject

# Rope project settings
.ropeproject

# mkdocs documentation
/site

# mypy
.mypy_cache/
.dmypy.json
dmypy.json

# Pyre type checker
.pyre/

# pytype static type analyzer
.pytype/

# Cython debug symbols
cython_debug/

# PyCharm
#  JetBrains specific template is maintained in a separate JetBrains.gitignore that can
#  be found at https://github.com/github/gitignore/blob/main/Global/JetBrains.gitignore
#  and can be added to the global gitignore or merged into this file.  For a more nuclear
#  option (not recommended) you can uncomment the following to ignore the entire idea folder.
#.idea/" > .gitignore

echo -e "\033[1;34mCreating Django project...\033[0m"
docker-compose run web django-admin startproject $project .

echo -e "\033[1;32mDone! But, a double check would be nice :) \033[0m"

