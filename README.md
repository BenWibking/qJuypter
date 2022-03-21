# qJupyter

This script can be used to launch Jupyter notebooks directly from an interactive job using PBS.
It will suggest an SSH tunnel command if necessary.

## Submit interactive job
You can submit an interactive job for iPython just like a normal job.

* NOTE: even though it is possible to request more than one core in a job there is no guarantee that Python will be able to run your tasks in parallel.

```
[bw0729@gadi-login-08 ~]$ qsub -I -lwalltime=1:00:00,mem=190GB,ncpus=48,jobfs=400GB,storage=scratch/jh2+gdata/jh2
qsub: waiting for job 36968229.gadi-pbs to start
qsub: job 36968229.gadi-pbs ready

[bw0729@gadi-cpu-clx-2731 ~]$
```

## Launch iPython notebook
Once the interactive job is running run `qjupyter.sh` to launch the notebook and receive further instructions.

```
[bw0729@gadi-cpu-clx-2847 ~]$ sh qJuypter/qjupyter.sh

Launching Jupyter Notebook with port 8080 on gadi-cpu-clx-2847.gadi.nci.org.au

Your SSH tunnel command on your desktop should look like the following

  ssh -L 9999:gadi-cpu-clx-2847.gadi.nci.org.au:8080 bw0729@gadi.nci.org.au

Then visit http://localhost:9999 on your desktop.

To terminate this notebook session press ctrl-C twice.
```


## SSH Tunnels
If you cannot access the compute resource directly from your desktop you will need to setup an SSH tunnel.

On your desktop computer running either Linux or Mac OS X open a second terminal and run the SSH tunnel command shown in your `qjupyter.sh` output.

* NOTE: do not stop the SSH tunnel process or you will lose your connection to the Jupyter notebook

```
ssh -L 9999:gadi-cpu-clx-2731.gadi.nci.org.au:8080 bw0729@gadi.nci.org.au
```

Once the tunnel has been established you can connect directly to your Jupyter notebook running on the compute node by navigating your browser to `http://localhost:9999`.
