# TestingChatGPT - MCQ Performance and Efficiency

This repository is a collection of all the code, files and documents I used and created while writing my master's thesis: Testing ChatGPT - MCQ Performance and Efficiency. 
My thesis focus was on evaluating ChatGPT's performance across several areas of knowlegde; this included comparing GPT-3.5 (API model: _gpt-3.5-turbo-1160_) with GPT-4 (API model: _gpt-4-0613_) as well as analysing in which subjects these versions performed better. Note that I used this models during March of 2024.
To be able to properly test ChatGPT, I selected different datasets (found online) consisting of multiple choice questions. Each dataset focused on a different subjet, making me able to test these LLMs in different areas, as I intended to. Not all the datasets I used had the same structure and some of them did not have the structure I desired. Therefore, I had to transform the datasets to give them the organization and shape I wanted. 
Once all the datasets had the desired structure, I reduced them in size before using OpenAI's APIs to get GPT-3.5 and GPT-4 to answer the multiple choice questions. 
To analyse the answers, I used both R and Excel. 

### Datasets 
To test ChatGPT, I used six different datasets:
* [CommonSenseQA Dataset](https://www.tau-nlp.sites.tau.ac.il/commonsenseqa) (last accessed: 2024-01-08)
* [MathQA Dataset](https://math-qa.github.io/math-QA/) (last accessed: 2024-01-08)
* [MedMCQA Dataset](https://github.com/medmcqa/medmcqa) (last accessed: 2024-01-08)
* [MMLU Dataset](https://huggingface.co/datasets/lighteval/mmlu) (last accessed: 2024-02-10)
* [SciQ Dataset](https://allenai.org/data/sciq) (last accessed: 2024-01-08)
* [ScienceQA Dataset](https://scienceqa.github.io/) (last accessed: 2024-02-10)

When a train file existed, I used that one; otherwise I tranformed and re-shaped the whole dataset. For the ScienceQA Dataset, I extracted only the questions related to Social and Language sciences.

### Folders In This Repository:
#### Code
In this folder you can find all the code files created during the proccess of re-structuring the datasets, sampling them, using the OpenAI's APIs and organizing the results with R. This folder contains both Pyhton and R files. 

Before passing the questions trhough the OpenAI's API's, I restructured all the datasets so they would be organized correctly and in a way that facilitated future processes. I also had to reduce the dataset's size so I would have 90 questions of each topic.

Once all the questions were asked the API's and the answerrs stored, I used R to create tables with the number of correct answers each model got in each topic along with the numbe rof incorrect answers and unanswered questions. R was also used to plot the binomial distributions of each topic for the GPT models.

#### Files
Here you will be able to find all the files that were exported in the Python files along with the Excel files I used for my analysis. This folder includes CSV and Excel files.

During the process of restructuring the datasets and reducing their size, I saved the resulting dataframes as CSV files. When justified, I exported the tables as Excel files; this happened specially after using R.
