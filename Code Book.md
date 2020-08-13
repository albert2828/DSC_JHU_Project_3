#Codebook for Human_activity_clean_ds

Human_activity_clean_ds.txt file contains a data set which is obtained from UCI HAR Datasets raw data.

This dataset is an array of dimensions 990x4. Column variables are labeled as "subject", "feature", "mean" and "std". This variables represents:
  - subject: the subject of the experiment from which the observation is taken. It is an integer vector with range 1:30

  - feature: feature which is measured. It is a character vector with descriptions:
    - "time body linear acceleration" divided into axis direction ("X", "Y", and "Z"): it is a time domain signal obtained from the accelerometer.  
    - "time gravity linear acceleration" divided into axis direction ("X", "Y" and "Z"): it is a time domain signal obtained from the accelerometer.  
    - "time body linear acceleration with jerk signal" divided into axis direction ("X", "Y" and "Z"): derived from "time body linear acceleration".  
    - "time body angular velocity" divided into axis direction ("X", "Y" and "Z"): it is a time domain signal obtained from the gyroscope.  
    - "time body angular velocity with jerk signal" divided into axis direction ("X", "Y" and "Z"): derived from "time body angular velocity".  
    - "time body linear acceleration magnitud": magnitud of the "time body linear acceleration" vector ((X,Y,Z) direction in a vector).  
    - "time gravity linear acceleration magnitud": magnitud of the "time gravity linear acceleration" vector ((X,Y,Z) direction's vector).  
    - "time body linear acceleration with jerk signal magnitud": magnitud of the "time body linear acceleration with jerk signal" vector ((X,Y,Z) direction's vector).  
    - "time body angular velocity magnitud":  magnitud of the "time body angular velocity" vector ((X,Y,Z) direction's vector).  
    - "time body angular velocity with jerk signal magnitud": magnitud of the "time body angular velocity with jerk signal" vector ((X,Y,Z) direction's vector).  
    - "frequency body linear acceleration" divided into axis direction ("X", "Y" and "Z"): obtained after applying a Fast Fourier Transform (FFT) to "body linear acceleration".  
    - "frequency body linear acceleration with jerk signal" divided into axis direction ("X", "Y" and "Z"): obtained after applying a Fast Fourier Transform (FFT) to "body linear acceleration with jerk signal".  
    - "frequency angular velocity" divided into axis direction ("X", "Y" and "Z"): obtained after applying a Fast Fourier Transform (FFT) to "angular velocity".  
    - "frequency body linear acceleration magnitud": magnitud of the "frequency body linear acceleration" vector ((X,Y,Z) direction's vector).  

  - mean: it is a numeric vector. Each observation is obtained my applying mean function to all of mean measures of al feature for each subject. All units are in Hertz (HZ).  

  - std: it is a numeric vector. Each observation is obtained my applying mean function to all of standard deviation (std) measures of al feature for each subject. All units are in Hertz (HZ).  
