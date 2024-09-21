# pdf-cutter

Pdf file cutter for slides where 2 pages are in one of the file

This program converts pdf like this:

![pdf with two slides on page](./readme_img/2022-10-20-162313_1867x990_scrot.png)

To this:
![pdf with one slide for page](./readme_img/2022-10-20-162345_1857x989_scrot.png)

## Installation

With the project cloned in a local directory:
```sh
pip install .  
```

## Usage

`pdf-cutter file1.pdf [file2.pdf ...] [-q N]`

This program allows you to convert more than one pdf file at execution. The
result pdfs are stored on the folder `result/` with the same name than the
original file. All the images used in the conversion are stored at the folder
`images/` and this folder and all its content is deleted at the end of the
execution.

### Quality option
The `-q / --quality` argument allows you to increase the resolution of the
output, by default is 1. Its range goes from 1 to 3.
### quality  = 1 | original_size * 1.2
![quality=1](readme_img/q1.png)
### quality = 2 | original_size * 3.2
![quality=2](readme_img/q2.png)
### quality = 3 | original_size * 5.6
![quality=3](readme_img/q3.png)

/!\\ Attention: In some cases the lowest quality can generate problems with
the detection of the borders when having images on the corners of the slide.
This can be resolved increasing the quality of the images.

## Requirements

- `pdf2image`
- `img2pdf`

You can install them using the command `pip install -r requirements.txt`

