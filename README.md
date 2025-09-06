# MDCF: Multi-Dimensional Conditional Fusion for High-Fidelity Synthetic Faces in Recognition Tasks


### Face Synthesis Model



### Installation

1. one-liner : `install.sh`

If above fails, then
```
pip install -r requirements.txt
# and download model weights from the link below
```

## Image generation

### Sample Code with given example images
We provide the sample code to generate images with the pretrained weights. 
The sample aligned images are provided in the repository.


- Download the pretrained weights from the [link]
- Place the `pretrained_models` directory under `MDCF` (same level as `src`)
- Run
```
cd MDCF/src
python synthesis.py --id_images_root sample_images/id_images/sample_57.png --style_images_root sample_images/style_images/woman
```

### Optional 
One can also generate new subject images and prepare custom style images.

#### 1. Creating ID Images (New Subjects)
Unconditional ID image generation is done in `MDCF/stage1/unconditional_generation`
Take a look at the `README.md` in that directory for instructions on how to generate new ID images.

#### 2. Creating Style Images
Any aligned images can serve as style images. We provive some sample images in `sample_images/style_images` directory.
For anyone who wants to use their own style images, one should align the images first.
Take a look at the `README.md` in `MDCF/stage1/style_bank` directory for instructions on how to align images.

#### 3. Using 1. and 2. to generate dataset

Assuming that you followed 1. and 2. you will have an `id_image` and `style_images` directory.
For the sake of explaination, let's say
- ID image is `<Project_root>/MDCF/stage1/unconditional_generation/unconditional_samples_aligned/00011.png`
- Style directory is `<Project_root>/MDCF/stage1/style_bank/style_images/raw_aligned`
Then to combine these run by pointing at these paths,
```
cd MDCF/src
python synthesis.py \
        --id_images_root <Project_root>/MDCF/stage1/unconditional_generation/unconditional_samples_aligned/00011.png \
        --style_images_root <Project_root>/MDCF/stage1/style_bank/style_images/raw_aligned
```
The result will be saved at `<Project_root>/MDCF/generated_images/`


### Training generator

#### Dataset preparation
- Download casia webface dataset from [insightface](https://github.com/deepinsight/insightface/tree/master/recognition/_datasets_)
    - Place it under `$DATA_ROOT` (ex: `/data/`). 
    - ex: `/data/faces_webface_112x112`

#### Download model weights
- Download all pretrained weights from the [link]
- Place the `pretrained_models` directory under `MDCF` (same level as `src`)

#### Run
```
cd MDCF/src/
bash train.sh
```


### Dataset Release
MDCF synthetic dataset can be downloaded from [link]


The format of the downloaded file is in `rec` format. 
- you can convert it to `png` using the script. 
- rec file will be useful for the face recognition training script provided in the repository. (to be released soon)

```bash
cd MDCF/convert
python record.py --rec_path <path_to_rec_file> --save_path <path_to_save_png>
# ex
# <path_to_rec_file> : dcface_0.5m_oversample_xid/record
# <path_to_save_png> : dcface_0.5m_oversample_xid/images
```

### Training Face Recognition Model

- to be released soon
