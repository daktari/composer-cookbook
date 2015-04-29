# Variables
image = node[:composer][:docker][:image_name]
http_port = node[:composer][:docker][:http_port]
transport_port = node[:composer][:docker][:transport_port]
detach = node[:composer][:docker][:detach]
container_name = node[:composer][:docker][:container_name]
volume = node[:composer][:docker][:volume]
# Pull latest image
docker_image image do
  action :remove
end
docker_image image

# Run container exposing ports
docker_container image do
  detach detach
  port http_port
  port transport_port
  container_name container_name
  volume volume 
end