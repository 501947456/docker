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



#已有容器导出成镜像
[root@linux-node1 ~]# docker ps -a | grep mynginx
2e110e00eef4 centos "/bin/bash" 8 minutes ago Exited (0) 2 minutes ago mynginx

[root@linux-node1 ~]# docker commit -m "My Nginx" 2e110e00eef4 test/mynginx:v1
sha256:cfd25da2c9c5dd2bcce9e5d2ef4e316b46b5f03617176b97b60a34f2958a6d70



#镜像加速







sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://pzh1y1hf.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
