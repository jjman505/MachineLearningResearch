%parameters for user to change
%global stack;

%data is assumed to have an x and a y variable, both of which are nX1 vectors(you need to change your data
%accordingly)
fileName='synthetic data/1.mat'; %path to your file
from=1; %beginning indice in your data
to=15; %end indice in your data
windowradius=5; %window radius for runPreds function

%parameters for user to change


%run our prediction function
[predictions, resid, SSEours, SSEbad]=runPreds(fileName, from, to, windowradius);

%display our results
disp(sprintf('%s%s', 'predictions = ', mat2str(predictions)));
disp(sprintf('%s%s', 'SSEours = ', num2str(SSEours)));
disp(sprintf('%s%s', 'SSEbad = ', num2str(SSEbad)));