<html>

<head>
<title>Getting and Cleaning Data</title>
</head>

<body>
<h1>Introduction</h1>
<div>
    
<p>The script <code>run_analysis.R</code>performs the 5 steps described in the course project's definition.</p>

<ul>
<li>First, all the similar data is merged using the <code>rbind()</code> function. By similar, we address those files having the same number of columns and referring to the same entities.</li>

<li>Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from <code>features.txt</code>.</li>

<li>As activity data is addressed with values 1:6, we take the activity names and IDs from <code>activity_labels.txt</code> and they are substituted in the dataset.</li>

<li>On the entire merged dataset, remove the non-required columns names are corrected.</li>
<li>Finally, generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called <code>tidy_movement_data_1.txt</code>, and uploaded to this repository.</li>
</ul>

<h1>Variables</h1>

<ul>
<li><code>activityList</code>, <code>colNames</code>, <code>test.data , test.activity , test.subject</code>, <code>train.data, train.activity, train.subject</code> contain the data from the downloaded files.</li>
<li><code>mean.std.traindata</code> and  <code> mean.std.testdata</code>  merge the previous datasets to further analysis.</li>
<li><code>featureList/ colNames</code> contains the correct names for the <code>test.data</code> dataset, which are applied to the column names stored in <code>mean.std.testdata</code>, a numeric vector used to extract the desired data.</li>
<li>A similar approach is taken with activity names through the <code>activities</code> variable.</li>
<li><code>all_data</code> merges <code>mean.std.testdata</code>, <code>mean.std.traindata</code>  in a big dataset.</li>
<li>Finally, <code>averages_data</code> contains the relevant averages which will be later stored in a <code>.txt</code> file. <code>melt()</code> and <code> dcast() </code> are used to apply <code>colMeans()</code> and ease the development.</li>
</ul>
</article>
  </div>

</div>


</body>
</html>
