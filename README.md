
# Basic Navigation Commands

To SSH into the cluster. You likely will not see your password typing in as the terminal hides the characters.

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

# Make a Test File

**On your laptop**, make a new file. You can do this using `vim` or in R.  

Type `i` to start editing the file. Press `escape` to stop editing, and get ready to save. Press `:x` to save.

```
vim test_file.R # Open vim
# [TYPE OR EDIT YOUR CODE OR FILE]

cat(
  "This is a test. The time is ",
  as.character(Sys.time()),
  " and the working directory is ",
  getwd(),
  file = paste0(
  "~/repos/hoffman2-demo/output/test_output_",
  gsub(pattern = "-| | [:]", replacement = "_", x = as.character(Sys.time())), ".txt"
  )
)

:x # To save, press escape first
:q # To quit without saving, press escape first

cat test_file.R # Print the file to the console to make sure it saved correctly.
```

**On your laptop**, run the R script from the terminal.

```
Rscript test_file.R # Run the file
ls output -l.       # Check whether the file ran
```

**On your laptop**, commit your files to git if that's something you're into

```
# git init                         # Initialize a git repository
git add -A                         # Stage the files
git commit -m "An update about..." # Save the files with a message
git log --pretty=oneline           # Check it went through
```

# Copying Files To and From the Hoffman2 Server

**On your laptop**, copy the files to the **Hoffman2** server

```
# Navigate to the folder with the file

# cd [DIRECTORY HERE]
pwd # Check you're in the right directory

# Copy the file to Hoffman2... but first let's make a copy for demo purposes

cp test_file.R test_file_COPY_NUMBER_1.R # Make a new copy of the file on the laptop
ls -l                                    # Look at the files in the directory

# Now copy the file to the version of this folder on Hoffman2. Note that it 
# will ask for your password again.

scp test_file_COPY_NUMBER_1.R ryanbaxt@hoffman2.idre.ucla.edu:~/hoffman2-demo
```

You can also copy files from **Hofman2** to your **laptop**

```
# On Hoffman2, make a copy of the file

cp test_file_COPY_NUMBER_1.R test_file_COPY_NUMBER_1_from_hoffman2.R

# On your laptop, run this command

scp ryanbaxt@hoffman2.idre.ucla.edu:~/hoffman2-demo/test_file_COPY_NUMBER_1_from_hoffman2.R . # Download the file from Hoffman2
ls -l # Check if the file arrived from Hoffman2
```

# Scheduling a Job

**On Hoffman2**, Make the scheduling file

```
# Make the scheduling file

vim scheduling_file.sh # Open a file
Rscript ~/hoffman2-demo/test_file_COPY_NUMBER_1.R # Add text to the file, change filename/number as appropriate
:x # Press escape first

# Check whether the file was created

pwd
ls -l
cat scheduling_file.sh # Prints out the file

# Schedule the job

qsub scheduling_file.sh

# Check whether the job was successfullly scheduled
myjobs
```

