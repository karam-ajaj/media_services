#!/bin/bash

echo "Welcome to media services auto deploy by vNerd"
echo ""


echo "Enter the deployment type"
select deploymentType in compose k8s swarm ;
do
  case "$deploymentType" in
        compose)
            deploymentType="compose"
            break
          ;;
        k8s)
            deploymentType="k8s"
            break
          ;;
        swarm)
            deploymentType="swarm"
            break
            ;;
  esac
done

echo "deployment type is: $deploymentType"

ls "./yml/$deploymentType" > ./list.txt

read -p "Enter the domain name: " domainName
# Set the domainName as an environment variable
export domainName=$domainName

# delete all after '.'
export domain=$(echo $domainName | sed "s/\..*//")

read -p "Enter the folder location: " folderLocation
export folderLocation=$folderLocation
# read -p "Enter the DATA folder location: " dataLocation
# export dataLocation=$dataLocation
export configLocation=$folderLocation/config
export dataLocation=$folderLocation/data
export mediaLocation=$folderLocation/media

# create locations
mkdir $folderLocation $configLocation $dataLocation $mediaLocation $mediaLocation/usenet $mediaLocation/torrents $mediaLocation/sabnzbd


for serviceName in $(sed 's/\.[^.]*$//' list.txt)
do
    mkdir $configLocation/$serviceName
    mkdir $dataLocation/$serviceName
    ## traefik folders
    mkdir $configLocation/traefik/certificates
    mkdir $configLocation/traefik/dynamic-config
    mkdir $configLocation/traefik/static-config
done


echo "Please choose the needed services"

for serviceName in $(sed 's/\.[^.]*$//' list.txt)
do
    # echo "$serviceName?"
    read -p "$serviceName? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] # || exit 1

    # read -p "$confirm"
    # echo "$confirm"
    if [ $confirm == "y" ]; then
        # echo "$serviceName will be installed"
        envsubst < "./yml/$deploymentType/$serviceName.yml" | docker stack deploy -c - $domain --detach=true
        # docker stack deploy -c "./yml/$deploymentType/$serviceName.yml" $serviceName
        echo "$serviceName is installed!"
    fi
    # cd /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp
    # cp /nfs-nas-swarm/github-repos/portainer-compose/stacks/$serviceName.yml /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.yml
    # chmod 777 /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.yml
    # docker run --rm -it -d --name dcv -v $(pwd):/input pmsipilot/docker-compose-viz render -m image -r docker-compose.yml 
    # # wait for container execution
    # sleep 5
    # chmod 777 /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.png 
    # sleep 1
    # mv /nfs-nas-swarm/github-repos/portainer-compose/diagrams/temp/docker-compose.png /nfs-nas-swarm/github-repos/portainer-compose/diagrams/$serviceName.png 
    # sleep 1
done


echo "DONE!!"
