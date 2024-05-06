

To SSH into the cluster:

```
ssh USERNAME@hoffman2.idre.ucla.edu
```

**On Hoffman2**, make folders for this test

```
ls -l               # Look at the directory
mkdir hoffman2-demo # Make a subdirectory
cd hoffman2-demo    # Enter the directory
mkdir output        # Make an outputs folder
pwd                 # Check which directory you're in
```

**On your laptop**, make a corresponding folder:

```
pwd                   # Check which directory you're in
ls -l                 # Look at the directory
# [CHANGE THE CURRENT DIRECTORY IF NEEDED] 
mkdir hoffman2-demo   # Make a subdirectory
cd    hoffman2-demo   # Enter the directory
mkdir output          # Make an outputs folder
```

**On your laptop**, make a new file. You can do this using `vim` or in R:

```
vim test_file.R # Open vim
# [TYPE OR EDIT YOUR CODE OR FILE]

cat(
  "This is a test. The time is ", 
  as.character(Sys.time()), 
  " and the working directory is ", 
  getwd(), 
  file = "~/repos/hoffman2-demo/output/test_file.txt"
)

:x # To save
:q # To quit without saving
```

**On your laptop**, run the R script from the terminal.

```
Rscript test_file.R
```


# OLD

Model output folders:

* Hoffman2 outputs are saved to the `$SCRATCH/outputs` folder:
    + Directory: `/u/scratch/r/ryanbaxt/outputs`
* These outputs are then copied from Hoffman2 to my personal laptop using `scp` run from my personal laptop. The local outputs folder is:
    + Directory: `~/repos/data/hoffman2-outputs/scaling-field-paper`

To run a model:

* Navigate to "Hoffman2 Files" folder
    + `cd repos/dbx-copy-COVID_Nationscape/code/rbk-explore/hoffman2-files`
* Edit parameters for the R Script (top of file)
    + `vim runjags-scaling-test.R`
* Edit any of the Hoffman2 job scheduling parameters
    + `vim runjags-scaling-test-submission-file`
* Schedule the job
    + `qsub runjags-scaling-test-submission-file`
   
To check on a model:

* List jobs in the queue: `myjob`
* Check on the status of active jobs: `check_usage`
   
To copy the output from Hoffman2 to the local folder:

* Navigate to local data folder
    + `cd ~/repos/data/hoffman2-outputs/scaling-field-paper`
* Copy the file
    + `scp ryanbaxt@hoffman2.idre.ucla.edu:/u/scratch/r/ryanbaxt/outputs/[MODEL NAME] .`
   
To copy a file from the local machine to Hoffman 2:

* Navigate to the LOCAL folder, for example:
    + `cd ~/repos/dbx-copy-COVID_Nationscape/code/rbk-explore/hoffman2-files`
* Copy the file to the Hoffman2 using a LOCAL terminal
    + `scp [OBJECT NAME] ryanbaxt@hoffman2.idre.ucla.edu:~/repos/dbx-copy-COVID_Nationscape/code/rbk-explore/hoffman2-files`