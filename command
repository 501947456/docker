#docker install for centos
cd /etc/yum.repos.d/
wget https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum install -y docker-ce
systemctl start docker
docker --version

#镜像的导入导出
docker save -o centos.tar centos
docker load --input centos.tar
docker load < centos.tar
