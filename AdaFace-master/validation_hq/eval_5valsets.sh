DATAROOT=/home/vipuser/pj/AdaFace-master/data_lkf_webbaseline

python main.py \
    --data_root ${DATAROOT} \
    --train_data_path faces_webface_112x112/imgs \
    --val_data_path faces_webface_112x112 \
    --prefix baseline_epoch=10-step=85943.ckpt \
    --custom_num_class 10000 \
    --gpus 1 \
    --use_16bit \
    --start_from_model_statedict /home/vipuser/pj/AdaFace-master/pretrained/baseline_epoch=10-step=85943.ckpt \
    --arch ir_50 \
    --evaluate

