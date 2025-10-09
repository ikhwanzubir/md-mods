# GEMINI.md

This file provides guidance to Gemini CLI when working with code in this repository.

## Project Overview

This is a project directory aimed to process existing structured markdown notes into various styles in new folder and files. The repository structure is:

```
basedir/
├── GEMINI.md
├── index.md
├── 01.md
├── 02.md
├── 03.md
├── ...
├── simplify/
│   ├── 01-simplified.md
│   ├── 02-simplified.md
│   └── ...
└── humor/
│   ├── 01-humor.md
│   ├── 02-humor.md
│   └── ...
└── important/
│   ├── 01-important.md
│   ├── 02-important.md
│   └── ...
```

## Repository Purpose

- Intended for markdown notes processing workflows. The markdown files are stored in the main directory consisting of index.md and subsequent notes arranged by number.
- The original note may contain medical contents that involve explicit, gore or sexual content. They are purely for healthcare purpose.

## File Operations

Standard file system operations apply:
- Original markdown files is located in the main directory.
- Processed markdown files are located in in their own directory according to their style of writing.

## Markdown file
- The markdown file contain appropriate headers according to the topic and subtopic.
- Main markdown file named `index.md` contains overview information about all the notes. 
- The notes are structured in point forms. Each point must be ended with a period (.).

## Conversion process
- The command consist of 2 parts separated by "-":
	- First part is number of notes to process:
		- "all": Means all notes inside the main directory. 
		- "pXX": Means only process the note number XX.
		- "pXXtoXX": Means only process from note number XX to XX.
	- Second part is the mod of style to convert to:
		- "sim": Simplify to easy-to-read point forms for reader in busy environment and lots of distractions. 
		- "hum": Make the sentences to be leisurely and humorous. Enough to make the sleepy reader engaged.
		- "imp": Simplify the sentence into important points.
		- "lay": Simplify the sentence structure and word selection for layman.
		- "mem": Make the key points easy to remember by giving analogy, using memory castle, repetition, humor or any other methods to help the reader memorize.
	- For each mod style, create a new folder with the following names:
		- "sim": "simplified"
		- "hum": "humor"
		- "imp": "important"
		- "lay": "layman"
		- "mem": "memory"
    - For each new markdown file, add the following as suffix after "-" for the file name:
		- "sim": "simplified"
		- "hum": "humor"
		- "imp": "important"
		- "lay": "layman"
		- "mem": "memory"


## Technical Implementation
- Read the markdown files to understand the structure and contents.
- Create structured markdown files with:
  - Appropriate headers and subheaders
  - Breakdown long paragraphs into point-form notes
  - Clear section organization
  - If the information is important, format the text using bold, underline or callouts.
  - Do not add any other information
- Clean up temporary raw text files after conversion.