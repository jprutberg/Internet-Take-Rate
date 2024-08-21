% Internet Take Rate Model
% Jason Rutberg

%% Data Import
f1=fopen('Testing_Data.txt','r');
c=textscan(f1,'%s %s %f %f %f %f %f %f %f %f %f %f %f','Delimiter',',','CommentStyle','#')
fclose(f1);

%% Assign Parameters
x1=c{3}; % Population
x2=c{4}; % Median age
x3=c{5}; % Percent under 21 years old
x4=c{6}; % Percent over 65 years old
x5=c{7}; % Percent who own their own home
x6=c{8}; % Percent with high school degree (or higher)
x7=c{9}; % Percent with bachelors degree (or higher)
x8=c{10}; % Work at home
x9=c{11}; % Median household income
x10=c{12}; % Percent of population with 3+ internet providers (speed > 25/3 Mbps)
y=c{13}; % Observed take rate

%% Perform linear regression (all variables)
X=[x1,x2,x3,x4,x5,x6,x7,x8,x9,x10] % create matrix using input data set
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
CI=coefCI(mdl) % first row is confidence itnerval for intercept, 2nd-11th rows correspond to x1-x10

%
%
%
%

%% Perform revised linear regression (including x1, x4, x9, x10)
X_rev=[x1,x4,x9,x10] % create matrix using input data set
mdl_rev=fitlm(X_rev,y) % fit a linear regression model by using fitlm

mdl_rev.Coefficients % displays coefficients
anova(mdl_rev, 'summary') % displays summary statistics

%% Display predicted values for revised linear regression
pred_rev=mdl_rev.Fitted % displays predicted take rate for each state

%% Determine the residuals for revised linear regression
resid_rev=mdl_rev.Residuals % residuals for each of the fifty states
raw_resid_rev=resid_rev(:,1) % displays only raw residuals

%% Determine the confidence intervals for take rate for revised linear regression
[Ypred_rev,YCI_rev]=predict(mdl_rev, X_rev) % displays take rate confidence interval for each state
YCI_lower_rev=YCI_rev(:,1) % displays lower bound of confidence interval
YCI_upper_rev=YCI_rev(:,2) % displays upper bound of confidence interval

%% Determine the prediction intervals for take rate for revised linear regression
[Ypred_rev,YPI_rev]=predict(mdl_rev,X_rev,'Simultaneous',true) % displays take rate prediction interval for each state
YPI_lower_rev=YPI_rev(:,1) % displays lower bound of prediction interval
YPI_upper_rev=YPI_rev(:,2) % displays upper bound of prediction interval

%% Determine confidence intervals for coefficients for revised linear regression
CI_rev=coefCI(mdl_rev) % first row is confidence itnerval for intercept, 2nd-5th rows correspond to x1,x4,x9,x10