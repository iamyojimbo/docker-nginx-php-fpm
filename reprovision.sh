CONTAINERS="dockernginxphpfpm_server_1 dockernginxphpfpm_php1_1 dockernginxphpfpm_php2_1 dockernginxphpfpm_php3_1"
IMAGES="dockernginxphpfpm_server dockernginxphpfpm_php1 dockernginxphpfpm_php2 dockernginxphpfpm_php3"

# Stop and remove all containers
docker stop $CONTAINERS
docker rm   $CONTAINERS

# Destroy all images
docker rmi  $IMAGES

# Recreate the images and containers
docker-compose up -d