# EFS

```
lsblk

sudo mkdir /efs

sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport 10.0.0.46:/ /efs

# 10.0.0.46 - is IP of EFS 
# View mounted volume
mount
df -h

# Copy data from ebs to efs
sudo rsync -rav /data/* /efs
```
Unmount EBS
```
sudo umount /data
```
Remove `/etc/fstab` entry so that it  EBS volume is not mounted at boot
```
sudo vim /etc/fstab
```
The add entry for efs
Your mount point should now look like this:

`<NFS MOUNT IP>:/ 		/data 	nfs4 	 <OPTIONS> 0 0`

```
10.0.0.46:/               /data   nfs4    nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport  0 0
```

Unmount EFS
```
sudo umount /efs

df -h
#now mount efs
sudo mount -a
```