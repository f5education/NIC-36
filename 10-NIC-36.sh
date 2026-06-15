# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# commands for NGF-36 labs
mkdir ~/.kube
echo -e "\n10.10.1.180     k8s.f5trn.com k8s" | sudo tee --append /etc/hosts
ssh-keyscan -H k8s >> ~/.ssh/known_hosts
scp k8s:~/.kube/config ~/.kube
sed --in-place 's/127.0.0.1/k8s/' ~/.kube/config
echo -e "\nKUBECONFIG=~/.kube/config" >> ~/.bashrc
sudo snap install helm --classic
sudo snap install grpcurl --edge
kubectl delete node nginx    # for some reason this non-existent "node" is "sticky"
