% Internet Take Rate Model
% Jason Rutberg

%% Data Import for "Training Data"
f1=fopen('Internet_Training_Data.txt','r');
c=textscan(f1,'%s %s %f %f %f %*f %f %*f %f','Delimiter',',','CommentStyle','#')
fclose(f1);

%% Assign Parameters
x1=c{3}; % Percent over 65 years old
x2=c{4}; % Percent who work at home
x3=c{5}; % Median household income
x4=c{6}; % Adjusted percent of population with 3+ internet providers (speed > 25/3 Mbps)
y=c{7}; % Adjusted observed take rate

%% Perform Linear Regression
X=[x1,x2,x3,x4] % create matrix using input data set
mdl=fitlm(X,y) % fit a linear regression model by using fitlm

mdl.Coefficients % displays coefficients
anova(mdl,'summary') % displays summary statistics

%% Display predicted values
pred=mdl.Fitted % displays predicted take rate for each state

%% Determine the residuals
resid=mdl.Residuals % residuals for each of the fifty states
raw_resid=resid(:,1) % displays only raw residuals 

%% Determine the confidence intervals for take rate
[Ypred,YCI]=predict(mdl, X) % displays take rate confidence interval for each state
YCI_lower=YCI(:,1) % displays lower bound of confidence interval
YCI_upper=YCI(:,2) % displays upper bound of confidence interval

%% Determine the prediction intervals for take rate
[Ypred,YPI]=predict(mdl,X,'Simultaneous',true) % displays take rate prediction interval for each state
YPI_lower=YPI(:,1) % displays lower bound of prediction interval
YPI_upper=YPI(:,2) % displays upper bound of prediction interval

%% Determine confidence intervals for coefficients
CI=coefCI(mdl) % first row is confidence itnerval for intercept, 2nd-5th rows correspond to x1-x4

%
%

%% Data Import for "Test Data"
f2=fopen('Internet_Testing_Data.txt','r');
d=textscan(f2, '%s %s %f %f %f %*f %f %*f %f','Delimiter',',')
fclose(f2);

%% Assign Parameters
x1_test=d{3}; % Percent over 65 years old
x2_test=d{4}; % Percent who work at home
x3_test=d{5}; % Median household income
x4_test=d{6}; % Adjusted percent of population with 3+ internet providers (speed > 25/3 Mbps)
y_test=d{7}; % Observed take rate

%% Using linear regression model to determine predicted values
X_test=[x1_test,x2_test,x3_test,x4_test] % create matrix using test data
Ypred_test=predict(mdl,X_test) % displays predicted take rate

%% Determine the residuals
resid_test=y_test-Ypred_test % residual = observed value - predicted value

%% Determine the confidence intervals for take rate
[Ypred_test,YCI_test]=predict(mdl,X_test)
YCI_test_lower=YCI_test(:,1) % displays lower bound of confidence interval
YCI_test_upper=YCI_test(:,2) % displays upper bound of confidence interval

%% Determine the prediction intervals for take rate
[Ypred_test,YPI_test]=predict(mdl,X_test,'Simultaneous',true) % displays take rate prediction interval
YPI_test_lower=YPI_test(:,1) % displays lower bound of prediction interval
YPI_Test_upper=YPI_test(:,2) % displays upper bound of prediction interval
