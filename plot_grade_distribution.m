% plot_grade_distribution
%
% Takes a CSV file downloaded from UB Learns and plots a historgram of the
% grades. 

clear all;
close all;
clc


fileName = '~/Downloads/grades_spreadsheet.csv';
fId = fopen(fileName);
cellResult = textscan(fId,'%s%s%s%s%s%s%s','delimiter',',');


gradesCell = cellResult{end};
gradesStrip = strrep( gradesCell,'"','');
numGrades = size(gradesStrip,1);


recInd = 1;
for ii=2:numGrades

    curCell = gradesStrip(ii);
    if (isempty(curCell{:}))
        continue
    end
    gradesVec(recInd) = str2num(curCell{:});
    recInd = recInd + 1;
end

%% Plot 

centerVec = 25:5:100;

gradesMean = mean(gradesVec);
gradesStd = std(gradesVec);

hist(gradesVec,centerVec);
title(sprintf('Mean = %f, Stdev=%f',gradesMean,gradesStd))
xlim([23 102])
set(gca,'XTick',centerVec)
xlabel('Grade')
ylabel('Number of Students')
grid on
