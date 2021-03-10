# Tips on using the Biowulf cluster at NIH.
*Check out the **wiki** and settings in `bashrc.sh`*


## Ways to interact with Biowulf
1. ssh
2. Jupyter server https://hpc.nih.gov/apps/jupyter.html
3. VSCode
4. NoMachine
5. TurboVNC https://hpc.nih.gov/docs/svis.html

## Workflow using `ssh` and `jupyter-lab`
```bash
ssh -Y biowulf
screen -S Bw1
sinteractive -TT -t 36:00:00 -c 14 --mem=64g --gres=gpu:k80:1
module load tmux jupyter git
# Copy the displayed command e.g.: ssh -L 12345:localhost:12345 -L 67890:localhost:67890 $USER@biowulf.nih.gov
# Open another terminal on local machine and execute the above: ssh -L 12345:...
# Leave terminal 2 open(!) and return to terminal 1.
tmux
jupyter lab --no-browser --port $PORT1
# Copy the displayed URL e.g.: http://localhost:12345
# ...and open in a web browser on your local machine.
# You can set and enter a locally stored, permanent Jupyter password...
# To be continued.
```
