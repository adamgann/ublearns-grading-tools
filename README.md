# ublearns-grading-tools
A few tools for grading assignments submitted through UBlearns. Written to make TA life just a little bit easier. 

Don't expect this code to run perfectly. Always double check. 




## Dependencies
We'll use some common archive utilities such as unar and unzip, which may not be built in to your system. 
On Ubuntu:

```
sudo apt-get install unar
sudo apt-get install unzip
````


## unpack_assignments.sh
Some courses have students upload a compressed file containing code, figures, a report, etc. 
This utility will create a folder for each student (by UBIT name) into which the contents of their submitted file will be exctracted. 

To run SRC_DIR should be a .zip containing all assignments submitted by all students. 

This file can be found through Grade Center:

* In UB Learns, go to Full Grade Center. 
* In the column of the current Matlab assignment, click the arrow to expand the menu options for the current assignment.
* Click Assignment File Download.
* At the bottom of the list of names, click Show All
* Select All Users
* Select Last Attempt
* Click Submit
* Unzip the compressed file.
* Edit unpack_assignments.sh to include the path to that unzipped directory. 
* Run unpack_assignments.sh

The directory will now contain folders named with the student's UBIT name.


## generate_scoresheets.py
While electronic submission is useful, I find it helpful to have a physical paper to write on when grading. This script
takes an image of the score sheet (rubric) for the current assignment (a screenshot from the assignment PDF, for example) and generates one score sheet for each student. 

Edit the file paths in generate_scoresheets.py to point to the unzipped assignments directory, the image file, and an output directory for the generated .tex file. The script will write a .tex file which can be converted to PDF with any LATEX editor. 


## plot_grade_distribution.m
This script will generate the mean, variance, and a histogram of the grade distribution (binned to the nearest 5 points) of any assignment.

The variable fileName should point to a CSV file containing assignment grades. To obtain this file:

* In UB Learns, go to Full Grade Center. 
* Click Work Offline
* Under Select Data to Download, select the assignment you wish to plot.
* Change delimiter type to Comma
* Click Submit.
* Edit the script to point to the downloaded file. 
* Run the script from any standard MATLAB installation. 

The figure can then be saved or printed from the MATLAB menus. 


###### UBlearns and Blackboard Learn are copyrights of University at Buffalo and Blackboard Inc, respectively. This code is not a part of nor affiliated with UBlearns.
