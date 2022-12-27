# GLM_health_data
Using generalized linear modeling in R 

Question we are trying to answer:
People’s provider choice during pregnancy might be influenced by whether their community has frequent migration, their ethnicity, and the availability of modern health services within an hour of the city. The plan is to study the relationship of one’s provider choice with these predictor variables using multinomial analysis. The provider choices will be the outcome variable which consists of categories of provider types.

After looking at the descriptive statistics,, it appears that the mean number of women is highest for the midwife provider, but further analysis is needed to determine what influences the choice in providers.

Multinomial Logistic Regression:

We want to model the nominal outcome variables, where the log odds of the outcomes are modeled as a linear combination of the predictor variables.
First, we choose the level of our outcome that we want to use as our baseline by using the relevel function.  Then, we run our model using the multinom function. Since the multinom package does not include p-value calculation for the regression coefficients, we will calculate p-values using z tests separately.

We will start with a saturated model:

This model-running output includes some iteration history and includes a final negative log-likelihood 46.564.

The model summary output gives the coefficients and standard errors with each row of values corresponding to a model equation.
In interpreting the results of the model, we could say, as an example, that a one-unit increase in the variable ethindSpa is associated with the decrease in the log odds of having a doctor provider vs. midwife provider in the amount of .449.

The ratio of the probability of choosing one outcome category over the probability of choosing the baseline category is the relative risk.  The exponentiated regression coefficients are relative risk ratios for a unit change in the predictor variable. We can exponentiate the coefficients from our model to see these risk ratios 

As an example, the relative risk ratio for a one-unit increase in the variable ethindspan is .637 for having a doctor as a provider vs having a midwife as a provider.

The relative risk ratio switching from eth = indSpa to eth = ladino is .9834 for having a doctor as a provider vs having a midwife as a provider.
We can also better understand the model by calculating predicted probabilities for each of our outcome levels using the fitted function, which gives us the predicted probabilities for the observations in our dataset

Comparing this to the null model:
The model chi-square, which compares the current and null models, can be obtained by fitting the null model:
 
To test the goodness of fit of the null model, we compare it with the saturated model fitted earlier:
 
We get a deviance of 1.021129 on 12 d.f. with a P-value of 0.99998, so we have evidence that the model does fit the data.

Discussion:

Based on the full model analysis above, it looks like the availability of modern health services increases the odds of selecting a doctor over a midwife when holding all other variables constant.  

It would also appear that a living is a community where there is migration abroad decreases the odds of selecting a no provider over a midwife when holding all other variables constant.  

It also seems that being indigenous Spanish speaking over indigenous non-spanish speaking increases the odds of selecting a no provider over a midwife when holding all other variables constant.  

Some limitations/things to consider with our data and using multinomial modeling:

Multinomial regression uses a maximum likelihood estimation method, which requires a large sample size. It also uses multiple equations, which requires a larger sample size than ordinal or binary logistic regression.  I think we have a large enough sample size to meet the above assumptions, but it is something to think about when running multinomial analysis.

Unlike logistic regression where there are many statistics for performing model diagnostics, it is not as easy to do diagnostics with multinomial logistic regression models. We typically need to run separate logit (minimal, saturated, etc.) models and using the diagnostics tools on each model, which makes it more difficult and time-consuming to assess diagnostics to detect outliers or influential data points.

