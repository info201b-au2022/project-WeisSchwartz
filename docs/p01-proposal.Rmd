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
An indirect stakeholder of our project are the Seattle Police Department or officials that collect and report the information for our dataset. Another indirect stakeholder are the people committing the crimes reported. “Fear of crime has the potential to be just as important as crime rates” (Helfgott, 2020). The system may indirectly affect these people depending on how the users of this data change their behavior.
### Harms
While our project is meant to aid people in safety, a potential harm it may cause is reinforcing harmful stereotypes pertaining to specific locations of Seattle. Users may interpret the information wrongfully and be prejudiced towards certain areas or groups or people. Additionally, our information must be accurate or else misinformation may aid in the reinforcement of harmful stereotypes, or influencing people to take more dangerous routes than they usually would. A crime prevention method known as Hot Spot Policing can contribute to harm. In its name, Hot Spot Policing is to “focus on crime hot spots and place-based policing” (CEBCP, 2020), essentially, the police department focuses more heavily on locations that have higher crime rates or crime reports, the harm in this is that such connotations of being a hot spot is further perpetuated by the increase of policing in location. While increased policing could mean decrease in crime it could also mean an increase in crime recorded. 
### Benefits
Despite the harms that our project may cause, there are many benefits. Our project is meant to aid users with easy access to information on crime in Seattle, specifically when, where, and what crimes are occurring. While the analysis of crime in Washington or even the whole country was viable, there are conclusions drawn that “we need to focus on small area trends as well” (Groff, E.R., Weisburd, D. & Yang, 2010). This can help users avoid certain times or places where crime is occurring the most. It will especially help users with information on types of crimes such as violent crimes that may want to be avoided the most.
## Research Questions
- **What are the most common types of violent crime in Seattle?** This question will be investigated by analyzing what are the most frequently occurring crimes that affect pedestrians. This is important for pedestrian safety as it will inform them of what crimes are most likely to affect them, which allows for preparation and precaution. 
- **How does the time of day impact crime committed?** This question can be investigated in terms of type of crime committed along with frequency of overall crime given a time. As the motive is to find ways to improve citizen safety, this is important because by identifying which times are most “unsafe,” safety can be improved by avoiding being out during such times. 
- **Where in Seattle do violent crimes occur most?** This question will be investigated by analyzing the coordinates at which violent crimes occurred, and determining if there are specific locations where these crimes cluster around. This will improve pedestrian safety as it will reveal where in Seattle crime is most likely to happen, and help users avoid these locations to reduce their risk of harm.
## Dataset
All of our research questions concern crime within the limited scope of Seattle. While our dataset comes from a larger database (NIBRS), all data within Seattle’s domain was extracted for both the Seattle Police Department and city public to access and use. This allows us to answer questions regarding trends and patterns in types of crime committed since there are 17 variables for each observation. More specifically, we can analyze trends in the relationship between crime rates and the time of day at which they were committed. Moreover, the location variable allows us to pinpoint which pockets of Seattle are most susceptible to high crime rates, and we can even intersect this location with time of day to see how criminal activity fluctuates across the city throughout the day. We can also directly answer the question regarding trends in types of crimes occurring at certain times of year since the data set includes the date in which the crimes were committed.  
  
|Element | Detail|
|--------| ----------
|Filename | SPD_Crime_Data__2008-Present|
|Number of observations | 1.01 million|
|Number of variables | 17|

### Provenence
**Collection of data:** All data within Seattle’s domain was extracted for both the Seattle Police Department and city public to access and use. This data has been collected from 2008 to present and only includes Uniform Crime Reporting System (UCRS) approved reports. The dataset is updated every 24 hours.  
**Data collection funding:** The collection of data is funded by the Seattle Police Department and subsequently the City of Seattle. While there is no direct monetary gain from collection of such data especially as this data is made public, the Seattle Police Department could potentially benefit from data collected if Data is used to improve efficiency within the police department.  
**Data validation:** The data is validated and held secure by utilizing the National Incident-Based Reporting System (NIBRS) in conjunction with UCRS. The collection of data is standardized through a clear set of definitions and classifications. Through such standardization of data collection allows for comparison over time.  
**Obtaining Data:** The city of Seattle provides an open data platform where anybody can find, analyze, and download data published by City departments. Such open data is meant to encourage public understanding, empower City employees to be more effective, and encourage the development of innovative technology solutions that improve quality of life. The dataset is included below. 

### Citation
Spd. “SPD Crime Data: 2008-Present: City of Seattle Open Data Portal.” Seattle Open Data, 31 Oct. 2022, https://data.seattle.gov/Public-Safety/SPD-Crime-Data-2008-Present/tazs-3rd5.  
## Findings

**What are the most common types of violent crime in Seattle?**
SOMETHING IDK

**How does the time of day impact crime committed?**
SOMETHING IDK

**Where in Seattle do violent crimes occur most?**
Through the map visualization, across all crime types, there are significantly more crime occurrences in downtown Seattle, Belltown, the South end of Capitol Hill and International District. For person-on-person crimes such as assault and intimidation, more crime recordings are observed around the U District, Ballard and North Aurora Avenue as well. It’s interesting to note that these crime patterns have not changed much over time, with the exception of Ballard, which did not seem to have as high of a concentration of violent crime pre-2010. 

### Discussion
It is our hope that with our information, policymakers, technologists and designers will take steps to ultimately reduce crime and/or improve citizen safety. As a whole, city leaders (policymakers) can implement a number of crime prevention measures. If the use of the data from this project actually results in successful avoidance and a reduction of crime rates, policymakers should also consider increasing data collection efforts across Seattle so the tool can be improved and more people become informed. In terms of technologists and designers, the information highlighted will hopefully inspire the creation of improved methods of civilian crime reporting, or tools to alert individuals when entering a high crime area. Ultimately, our goal is to learn something new about crime in Seattle, leading us towards a reduction in crime.

In terms of our specific findings, 
With our findings that identified the most common type of crime, this information can be used to improve police training. Improved police response and action towards a specific crime can make all the difference. Depending on the crime, police can learn to de-escalate situations or roll out educational information towards identifying such crime. 

Next, with our finding that identifies how time of day impacts crime,  this information can be used to further reduce crime. Perhaps SOMETHING IDK

Lastly, with information on the geographical distribution of crime in Seattle, it is important to note that the data should not be used to increase patrolling of certain neighborhoods, as it will only create a biased positive feedback loop where "high crime" neighborhood designations result in more crimes being documented there disproportionately. Instead by encouraging community based efforts that promote non-violent communication and/or youth empowerment crime rates may actually decrease. 

### Conclusion

## References 
Helfgott, J.B., Parkin, W.S., Fisher, C., Diaz, A. "Misdemeanor arrests and community perceptions of fear of crime in Seattle." Journal of Criminal Justice 69 (2020). https://doi.org/10.1016/j.jcrimjus.2020.101695.  
Groff, E.R., Weisburd, D., Yang, SM. "Is it Important to Examine Crime Trends at a Local 'Micro' Level?: A Longitudinal Analysis of Street to Street Variability in Crime Trajectories." J Quant Criminol 26, 7–32 (2010). https://doi.org/10.1007/s10940-009-9081-y  
Pauley, Spencer. “Seattle Struggles with 'Reinventing' Policing as Crime Soars.” The Center Square, 20 July 2022, https://www.thecentersquare.com/washington/seattle-struggles-with-reinventing-policing-as-crime-soars/article_2bb0f8fe-0470-11ed-8d39-3b909b5d3301.html.  
“Seattle Police Case Study.” The Center for Evidence-Based Crime Policy (CEBCP), 7 Apr. 2020, https://cebcp.org/evidence-based-policing/what-works-in-policing/seattle-police-case-study/.  
“U Washington Students Defend Themselves from Potential Sex Offender Threat Following Assaults near Campus.” Fox News, 13 Oct. 2022, www.foxnews.com/us/u-washington-students-defend-themselves-from-potential-sex-offender-following-assaults-near-campus.
### Dataset:
Spd. “SPD Crime Data: 2008-Present: City of Seattle Open Data Portal.” Seattle Open Data, 31 Oct. 2022, https://data.seattle.gov/Public-Safety/SPD-Crime-Data-2008-Present/tazs-3rd5.  
