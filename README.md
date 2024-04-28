# TestingChatGPT - MCQ Performance and Efficiency

This repository is a collection of all the code, files and documents I used and created while writing my master's thesis. 
My thesis focus was on evaluating ChatGPT's performance across several areas of knowlegde; this inclued comparing GPT-3.5 with GPT-4 as well as analysing in which subjects these versions performed better.
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

### Code
Most of the code was done in Python as it made it easier to re-shape the datasets.
To be able to better organize myself and my workspace, I created several Python files to perform the change I had in mind.
Each folder has all the Python files used for the dataset mentioned.

