
python main.py \
    --data_root /datalkf/data \
    --train_data_path /datalkf/data/faces_webface_112x112 \
    --val_data_path /datalkf/data/faces_webface_112x112 \
    --prefix casia_webface \
    --use_wandb \
    --gpus 1 \
    --use_16bit \
    --arch ir_50 \
    --batch_size 64 \
    --num_workers 4 \
    --epochs 26 \
    --lr_milestones 12,20,24 \
    --lr 0.1 \
    --head adaface \
    --m 0.4 \
    --h 0.333 \
    --low_res_augmentation_prob 0.2 \
    --crop_augmentation_prob 0.2 \
    --photometric_augmentation_prob 0.2

