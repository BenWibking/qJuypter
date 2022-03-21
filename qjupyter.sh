#!/usr/bin/env bash

if [ "$PBS_JOBID" == "" ]
then
  echo "Please run qjupyter.sh from an interactive PBS job"
  exit 1
fi

which jupyter 2>/dev/null 1>/dev/null
if [ $? -ne 0 ]
then
  echo "The jupyter or ipython command was not found in your \$PATH"
  exit 1
else
  port=8080
  echo
  echo
  echo "Launching Jupyter Notebook with port $port on $HOSTNAME"
  echo
  echo "Your SSH tunnel command on your desktop should look like the following"
  echo 
  echo "  ssh -L 9999:$HOSTNAME:$port $USER@$PBS_O_HOST"   
  echo
  echo "Then visit http://localhost:9999 on your desktop."
  echo
  echo "To terminate this notebook session press ctrl-C twice."
  echo
  jupyter notebook --no-browser --port=$port --ip='*'
fi
