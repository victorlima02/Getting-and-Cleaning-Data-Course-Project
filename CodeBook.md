#Codebook

The data is organized in subjects that came from the original dataset, while grouping the individuals that belong to train and test groups in a unique database. Additionally, the information about groups was not lost.

Identification:

- Subject: A numeric representation of a volunteer in the experiment;
- Activity: The activity performed;
- Group: Classification of the subjects as belonging to the train or test group.

Variables:

- TimeBodyAccelerometerMean-X
- TimeBodyAccelerometerMean-Y
- TimeBodyAccelerometerMean-Z
- TimeBodyAccelerometerStd-X
- TimeBodyAccelerometerStd-Y
- TimeBodyAccelerometerStd-Z
- TimeGravityAccelerometerMean-X
- TimeGravityAccelerometerMean-Y
- TimeGravityAccelerometerMean-Z
- TimeGravityAccelerometerStd-X
- TimeGravityAccelerometerStd-Y
- TimeGravityAccelerometerStd-Z
- TimeBodyAccelerometerJerkMean-X
- TimeBodyAccelerometerJerkMean-Y
- TimeBodyAccelerometerJerkMean-Z
- TimeBodyAccelerometerJerkStd-X
- TimeBodyAccelerometerJerkStd-Y
- TimeBodyAccelerometerJerkStd-Z
- TimeBodyGyroscopeMean-X
- TimeBodyGyroscopeMean-Y
- TimeBodyGyroscopeMean-Z
- TimeBodyGyroscopeStd-X
- TimeBodyGyroscopeStd-Y
- TimeBodyGyroscopeStd-Z
- TimeBodyGyroscopeJerkMean-X
- TimeBodyGyroscopeJerkMean-Y
- TimeBodyGyroscopeJerkMean-Z
- TimeBodyGyroscopeJerkStd-X
- TimeBodyGyroscopeJerkStd-Y
- TimeBodyGyroscopeJerkStd-Z
- TimeBodyAccelerometerMagnitudeMean
- TimeBodyAccelerometerMagnitudeStd
- TimeGravityAccelerometerMagnitudeMean
- TimeGravityAccelerometerMagnitudeStd
- TimeBodyAccelerometerJerkMagnitudeMean
- TimeBodyAccelerometerJerkMagnitudeStd
- TimeBodyGyroscopeMagnitudeMean
- TimeBodyGyroscopeMagnitudeStd
- TimeBodyGyroscopeJerkMagnitudeMean
- TimeBodyGyroscopeJerkMagnitudeStd
- FrequencyBodyAccelerometerMean-X
- FrequencyBodyAccelerometerMean-Y
- FrequencyBodyAccelerometerMean-Z
- FrequencyBodyAccelerometerStd-X
- FrequencyBodyAccelerometerStd-Y
- FrequencyBodyAccelerometerStd-Z
- FrequencyBodyAccelerometerJerkMean-X
- FrequencyBodyAccelerometerJerkMean-Y
- FrequencyBodyAccelerometerJerkMean-Z
- FrequencyBodyAccelerometerJerkStd-X
- FrequencyBodyAccelerometerJerkStd-Y
- FrequencyBodyAccelerometerJerkStd-Z
- FrequencyBodyGyroscopeMean-X
- FrequencyBodyGyroscopeMean-Y
- FrequencyBodyGyroscopeMean-Z
- FrequencyBodyGyroscopeStd-X
- FrequencyBodyGyroscopeStd-Y
- FrequencyBodyGyroscopeStd-Z
- FrequencyBodyAccelerometerMagnitudeMean
- FrequencyBodyAccelerometerMagnitudeStd
- FrequencyBodyAccelerometerJerkMagnitudeMean
- FrequencyBodyAccelerometerJerkMagnitudeStd
- FrequencyBodyGyroscopeMagnitudeMean
- FrequencyBodyGyroscopeMagnitudeStd
- FrequencyBodyGyroscopeJerkMagnitudeMean
- FrequencyBodyGyroscopeJerkMagnitudeStd

Each variable was built as the average of the features represented by its name, where the division between frequency and time domains are in accordance with the original dataset.	

Furthermore, Body and Gravity represent the same as the original dataset and the following abbreviations were replaced from the original dataset:

-  The prefix ‘t’  was replaced by Time;
-  ‘f’, which indicates frequency domain signals, was replaced by Frequency;
-  Acc was replaced by Accelerometer;
-  Gyro was replaced by Gyroscope;
-  mean() was replaced by Mean;
-  std() was replaced by Std.

The original representation and the physical meaning of each variable can be found in the original dataset's  features_info.txt file. 

