command -v docker >/dev/null 2>&1 || { echo >&2 "I require docker but it's not installed.  Aborting."; exit 1; }

IMGNAME=circumcaeteraimg
CONNAME=circumcaeteracon

USERNAME=waf
PASSW=waf

EXTPORT=2222

#Create image if it has not been already built
if [[ -z "$(docker images |grep $IMGNAME)" ]] ; then
  docker build -t $IMGNAME --rm .
else
  echo "$IMGNAME already built"
fi

# Stop container
if [[ -n "$(docker ps |grep $CONNAME)" ]] ; then
  docker stop $CONNAME
fi

# Delete container
if [[ -n "$(docker ps -a |grep $CONNAME)" ]] ; then
  docker rm $CONNAME
fi

# Start container
docker run -d -p $EXTPORT:22 --name $CONNAME -l $CONNAME -h $CONNAME $IMGNAME

IP=$(docker-machine ip 2>/dev/null) 
[[ -n $IP ]] || IP='127.0.0.1'

# Delete previous SSH Host keys that match '[127.0.0.1]:2222'
sed -ie "/^\[$IP\]\:$EXTPORT/d" $HOME/.ssh/known_hosts

cat << EOF
---

SSH is listening on IP:'$IP', Port:'$EXTPORT'
Username/Password: $USERNAME/$PASSW
---
RUN:
  ssh -l $USERNAME -p $EXTPORT $IP
EOF
