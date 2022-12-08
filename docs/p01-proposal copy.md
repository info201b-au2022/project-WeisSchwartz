# Crime in Seattle: Avoiding Assault as a Pedestrian
## Overview
Authors: Angela Menge, Ellen Huynh, Kensho Gendzwill, Nathan Lee  
Codename: Avoid Assault  
Affiliation: INFO-201: Technical Foundations of Informatics, The Information School, University of Washington  
Date: Autumn 2022   
Keywords: crime in Seattle; assault and robbery time-series data; public safety; crime avoidance  
## Abstract
Our main question is when and where do crimes that affect pedestrians are committed in Seattle. This question is important because as college students, we spend a lot of time walking around Seattle and would like to stay safe while doing so. To address the question, we will analyze the location time that crimes were committed in Seattle in past years. 
## Introduction
The Crime in Seattle project aims to provide a tool that makes it safer for college students to travel Seattle safely. Too often, pedestrians fall victim to incidents of robbery, battery and gun violence. Safety on the streets is a concern even near campus, where rates of violent crimes are increasing. This project will parse through the SPD Crime dataset to analyze where and when crimes against persons have happened in Seattle. We will then return a list of times and locations where violence is likely to happen. We will also provide a visualization in the form of a map to help users intuit our results. We hope that these statistics will inform students and pedestrians and help them avoid encounters with violent crime. 
## Problem Domain
### Project Farming
In this project we will be covering:
- why crime is a relevant issue
- information about our dataset
- discovery of our research questions
- three interactive visuals related to our dataset and research questions
-  the goal of this project
- why data on crime in Seattle is important
- what we learned
- implications and limitations
### Human Values
Our project involves human values such as:  
  
_Safety_: a state of being protected from potential harm or something that has been designed to protect and prevent harm. Our project is meant to aid in the safety of its users, specifically citizens of Seattle.  
  
_Usability_: a system’s effectiveness, efficiency and overall satisfaction of the user. We hope that our project can make the data easily accessible and understandable to users with visuals.
### Direct Stakeholders
A primary direct stakeholder of our project are the users of this system such as college students and commuters. They are directly interacting with the system and its data to inform their actions.
### Indirect Stakeholders
An indirect stakeholder of our project are the Seattle Police Department or officials that collect and report the information for our dataset. Another indirect stakeholder are the people committing the crimes reported. The system may indirectly affect these people depending on how the users of this data change their behavior.
### Harms
While our project is meant to aid people in safety, a potential harm it may cause is reinforcing harmful stereotypes pertaining to specific locations of Seattle. Users may interpret the information wrongfully and be prejudiced towards certain areas or groups or people. Additionally, our information must be accurate or else misinformation may aid in the reinforcement of harmful stereotypes, or influencing people to take more dangerous routes than they usually would.
### Benefits
Despite the harms that our project may cause, there are many benefits. Our project is meant to aid users with easy access to information on crime in Seattle, specifically when, where, and what crimes are occurring. This can help users avoid certain times or places where crime is occurring the most. It will especially help users with information on types of crimes such as violent crimes that may want to be avoided the most.
## Research Questions
- **How does the time of day impact crime committed?** This question can be investigated in terms of type of crime committed along with frequency of overall crime given a time. As the motive is to find ways to improve citizen safety, this is important because by identifying which times are most “unsafe,” safety can be improved by avoiding being out during such times. 
- **Where in Seattle do violent crimes occur most?** This question will be investigated by analyzing the coordinates at which violent crimes occurred, and determining if there are specific locations where these crimes cluster around. This will improve pedestrian safety as it will reveal where in Seattle crime is most likely to happen, and help users avoid these locations to reduce their risk of harm.
- **Where and when do violent crimes in Seattle occur most?** This question will be investigated by counting the number of crimes that occur at the same time _and_ location. This is possibly the most relevant and appliable part of the project, as it will inform users to avoid certain locations at specific times, which is much easier to do than to avoid going at out entirely at certain times or certain places.
- **Do certain types of violent crime occur more frequently depending on the time of year? If so, which crimes?** This question will be investigated by counting the total incidents of a certain type of crime by month and ranking the crime types in order of frequency. This will improve pedestrian safety as it will inform users on what type of crime is expected to happen at a given time of year, making them more aware and equipped to avoiding such crime.
- **What are the most common types of violent crime in Seattle?** This question will be investigated by analyzing what are the most frequently occurring crimes that affect pedestrians. This is important for pedestrian safety as it will inform them of what crimes are most likely to affect them, which allows for preparation and precaution. 
## Dataset
All of our research questions concern crime within the limited scope of Seattle. While our dataset comes from a larger database (NIBRS), all data within Seattle’s domain was extracted for both the Seattle Police Department and city public to access and use. This allows us to answer questions regarding trends and patterns in types of crime committed since there are 17 variables for each observation. More specifically, we can analyze trends in the relationship between crime rates and the time of day at which they were committed. Moreover, the location variable allows us to pinpoint which pockets of Seattle are most susceptible to high crime rates, and we can even intersect this location with time of day to see how criminal activity fluctuates across the city throughout the day. We can also directly answer the question regarding trends in types of crimes occurring at certain times of year since the data set includes the date in which the crimes were committed.  
  
|Element | Detail|
|--------| ----------
|Filename | SPD_Crime_Data__2008-Present|
|Number of observations | 1.01 million|
|Number of variables | 17|

### Provenence
In 2019, the Seattle Police Department replaced its Records Management System, and in an effort to maintain continuity between their records, they relied on this data set which was collected by the FBI’s National Incident Based Reporting System (NIBRS). Data was collected starting in 2008 and has been updated daily. The data collection effort was funded by the public via federal taxes.  
These reports are far more thorough than previous crime report formats used by the Seattle Police Department. It includes profiles of victims and offenders and contains details regarding the context of the crime such as location, time of offense, and whether the incident was cleared. Moreover, it reports up to 10 offenses that were committed per incident across 24 offense categories.  
2021 was the first year that the FBI relied solely on NIBRS data for federal estimated crime reports. Due to this reliance on the data set, only reports that are validated by the federal government’s Uniform Crime Reporting Program are included in the dataset. Reports that are awaiting approval are excluded. This deems the dataset as credible. All NIBR data is made available to the public through the FBI’s official website. However, we found Seattle’s crime data through Seattle’s official website.  
The improvement in quality of data has allowed the Seattle Police Department to benefit from the data as it standardized the classification of crime in their records, allowing Seattle’s law enforcement to observe and analyze crime patterns in the city over the last decade. As such, Seattle’s public has also become a beneficiary of this data set.  
### Citation
Spd. “SPD Crime Data: 2008-Present: City of Seattle Open Data Portal.” Seattle Open Data, 31 Oct. 2022, https://data.seattle.gov/Public-Safety/SPD-Crime-Data-2008-Present/tazs-3rd5.  
## Implications
Through our research questions we will be able to highlight the many patterns of crime. It is our hope that with our information, policymakers, technologists and designers will take steps to ultimately reduce crime and/or improve citizen safety. City leaders (policymakers) can implement a number of crime prevention measures such as improving training of law enforcement on the most common crime. If the use of the data from this project actually results in successful avoidance and a reduction of crime rates, policymakers should also consider increasing data collection efforts across Seattle so the tool can be improved and more people become informed. It is important to note however, the data should not be used to increase patrolling of certain neighborhoods, as it will only create a biased positive feedback loop where "high crime" neighborhood designations result in more crimes being documented there disproportionately. In terms of technologists and designers, the information highlighted will hopefully inspire the creation of improved methods of civilian crime reporting, or tools to alert individuals when entering a high crime area. Ultimately, our goal is to learn something new about crime in Seattle, leading us towards a reduction in crime. 
## Limitations
Some possible limitations involve the categorization of crime. For example, the “crime against” column can only be differentiated between two categories, crime against society or property. There are many crimes that fall in a gray area but are ultimately categorized because they must be. Also to protect privacy, there is a lack of information on the demographics of crimes committed. While this is understood, we believe that the demographics of the criminal would be helpful in terms of further investigating the data and finding intersectionality through patterns. Another limitation would be the fact that not all crime is reported. In addition to the fact that only finalized reports are part of the data set, many crimes are committed but community members choose to not report it to the police to avoid complication. While these limitations are recognized, we plan to utilize the information we have to create the most impactful findings. 
## References 
Helfgott, J.B., Parkin, W.S., Fisher, C., Diaz, A. "Misdemeanor arrests and community perceptions of fear of crime in Seattle." Journal of Criminal Justice 69 (2020). https://doi.org/10.1016/j.jcrimjus.2020.101695.  
Groff, E.R., Weisburd, D., Yang, SM. "Is it Important to Examine Crime Trends at a Local 'Micro' Level?: A Longitudinal Analysis of Street to Street Variability in Crime Trajectories." J Quant Criminol 26, 7–32 (2010). https://doi.org/10.1007/s10940-009-9081-y  
Pauley, Spencer. “Seattle Struggles with 'Reinventing' Policing as Crime Soars.” The Center Square, 20 July 2022, https://www.thecentersquare.com/washington/seattle-struggles-with-reinventing-policing-as-crime-soars/article_2bb0f8fe-0470-11ed-8d39-3b909b5d3301.html. 
### Dataset:
Spd. “SPD Crime Data: 2008-Present: City of Seattle Open Data Portal.” Seattle Open Data, 31 Oct. 2022, https://data.seattle.gov/Public-Safety/SPD-Crime-Data-2008-Present/tazs-3rd5.  
