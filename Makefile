    setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ~/.capstone_project
	source ~/.capstone_project/bin/activate

install:
	# This should be run from inside a virtualenv
	sudo -n wget -O /bin/hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 && sudo -n chmod +x /bin/hadolint
	pip install --upgrade pip &&\
		pip install -r requirements.txt

lint:
	hadolint --ignore DL3006 Dockerfile

upload:
	sh ./upload_docker.sh

all: install lint