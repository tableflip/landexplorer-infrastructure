# Alias for ansible-playbook and all the trimmings.
# Usage:
#  ./deploy.sh <env name, `dev`, `next`, `production`>

DEPLOY_ENV=$1

if [ $# -eq 0 ]
  then
    DEPLOY_ENV="dev"
fi

if [[ $DEPLOY_ENV == production ]]; then
    read -p "PRODUCTION? Are you sure? " -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      echo "Deploying to **PRODUCTION**"
      echo "ansible-playbook deploy.yml -i $DEPLOY_ENV"
      ansible-playbook deploy.yml -i $DEPLOY_ENV
    fi
else
    echo "ansible-playbook deploy.yml -i $DEPLOY_ENV"
    ansible-playbook deploy.yml -i $DEPLOY_ENV
fi
