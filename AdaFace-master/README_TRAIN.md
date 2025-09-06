
# Data Preparation

## 1. InsightFace Dataset


InsightFace provides a variety of labeled face dataset preprocessed to 112x112 size. 

[insightface link](https://github.com/deepinsight/insightface/tree/master/recognition/_datasets_)

The unzipped dataset looks as follows
```
example: faces_webface_112x112
└── train.rec   
├── train.idx                                                                                       │
├── train.lst                                                                                       │
├── agedb_30.bin                                                                                    │
├── calfw.bin                                                                                       │
├── cfp_ff.bin                                                                                      │
├── cfp_fp.bin                                                                                      │
├── cplfw.bin                                                                                       │
├── lfw.bin                                                                                         │
```

`train.rec` contains all the training dataset images and `rec` format combines all data to a single file 
whilst allowing indexed access. 
`rec` file is good when one does not one to create millions of individual image files in storage. 


## 2. Using Image Folder Dataset

To extract out all images from the InsightFace train.rec file. 
It uses the directory as label structure, and you can swap it with your own dataset. 

#### Dataset preparation steps for InsightFace dataset

1. Download the dataset from [insightface link](https://github.com/deepinsight/insightface/tree/master/recognition/_datasets_)
2. Unzip it to a desired location, `DATASET_ROOT`  _ex)_ `/data/`.
3. The result folder we will call `DATASET_NAME`, ex) `faces_webface_112x112`.
4. For preprocessing run
   1. `python convert.py --rec_path <DATASET_ROOT>/<DATASET_NAME> --make_image_files --make_validation_memfiles`
5. During training,
   1. **do not** turn on the option `--use_mxrecord`
   2. Rest are the same.
   3. set `--data_root` equal to `DATASET_ROOT`
   4. set `--train_data_path` to the `DATASET_NAME`.
   5. set `--val_data_path` to the `DATASET_NAME`.

### Custom Dataset

1If you want to use your custom training dataset, prepare images in folder (as label) structure 
and change the `--data_root` and `--train_data_path` accordingly. The custom dataset should be located at `<data_root>/<train_data_path>`


# Train 
- Sample run scripts are provided in `scritps`
- EX) Run `bash script/run_ir50_ms1mv2.sh` after changing the `--data_root` and `--train_data_path` to fit your needs. 
- If you are using ImageFolder dataset, then remove `--use_mxrecord`.
* [IMPORTANT] Once the training script has started, check if your image color channel is correct by looking at the sample stored in `<RUN_DIR>/training_samples`. 
