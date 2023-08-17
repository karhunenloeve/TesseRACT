# ocrTESSERACT

This repository is a tutorial for using the [Tesseract](https://github.com/tesseract-ocr/tesseract) software. It is a simple Shell script. You can run it simply over any of your directories. Before you start, please note, that a `config.json`is necessary to launch the script.

In the following I'll explain which properties you have to determine.

| Argument | config.json Attribute | Description  |
| ------------- |:-------------:| -----:|
| results      | resultFiles | directory of the image folder |
| createTXT      | createTXT      | `true`or `false` whether a `.txt` will be created or not|
| createPDF | createPDF      | `true`or `false` whether a searchable `.pdf` will be created or not|
| deleteIMG | deleteIMG      | `true`or `false` whether you want to delete the orig. image or not|

```shell
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

predictions=`jq '.predictionFiles' config.json | xargs -n 1`
results=`jq '.resultFiles' config.json | xargs -n 1`
createTXT=`jq '.createTXT' config.json | xargs -n 1`
createPDF=`jq '.createPDF' config.json | xargs -n 1`
deleteIMG=`jq '.deleteIMG' config.json | xargs -n 1`
```

After all insert the directory with the images to be recognized into the `results`-attribute in the `config.json`-file and run the script with the following command:

```shell
bash setup.sh
```

## Used tools

* [jq](https://github.com/stedolan/jq) - Reading and writing `.json` with shell script
* [Imagemagick](https://github.com/ImageMagick/ImageMagick/) – Imagemagick, image processing
* [Tesseract](https://github.com/tesseract-ocr/tesseract) – Tesseract - OCR tool
