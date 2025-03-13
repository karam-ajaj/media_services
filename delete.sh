#!/bin/bash

echo "This script will delete everything"
echo ""

rm -rf ./list.txt


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

read -p "Delete all services? (Y/N)" delete
if [ $delete == "y" ]; then
    for serviceName in $(sed 's/\.[^.]*$//' list.txt)
    do docker stack rm $domain
    done
    rm -rf ./list.txt
    # exit
fi

# delete locations
echo "deleteing $folderLocation"
rm -rf $folderLocation $configLocation $dataLocation

rm -rf ./list.txt
echo "DONE!!"