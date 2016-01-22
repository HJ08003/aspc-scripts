### #################
### Read Env Variable
### #################
jid <- Sys.getenv("SLURM_JOB_ID")

aid <- Sys.getenv("SLURM_ARRAY_TASK_ID")
                                        #
                                        #

### ##################
### SLURM Env Variable
### ##################
cat(paste("This is job: ", jid, ".\n", sep = ""))
cat(paste("My sub-id is: ", aid, ".\n\n", sep = ""))
                                        #
                                        #


### #########
### Use Index
### #########
letters[as.integer(aid)]
                                        #
                                        #






