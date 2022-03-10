#!/bin/bash

Rscript writexl.R > /dev/null
Rscript openxlsx.R > /dev/null

ls -al /target_folder
