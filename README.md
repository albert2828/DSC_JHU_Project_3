# Data Science Coursera Project, Getting and Cleaning Data

In this package are available
  - "Human_activity_clean_ds.txt" file: tidy dataset obtained from raw data. It is tidy since has: one column for each variable, every raw is an observation and the table only contains one type of ovservational unit.  It should be read in r with code
  ```
  data <- read.table(file_path, header = TRUE) #if they used some other way of saving the file than a default write.table, this step will be different
    View(data)
  ```
  - "run_analysis.r" file: file containing the code to generate "Human_activity_clean_ds.txt" dataset. Some process are inspired from H. Wickham's article "Tidy Data", https://www.jstatsoft.org/article/view/v059i10.  
  - "Code Book.md": Mark Down file that describes every observation in the "Human_activity_clean_ds.txt" dataset.  

  Some ideas are inspired from David Hood's post "Getting and Cleaning the Assignment", https://thoughtfulbloke.wordpress.com/2015/09/09/getting-and-cleaning-the-assignment/.  
