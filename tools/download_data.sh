#!/usr/bin/env bash
# 在 GPU 服务器上下载全部数据集。URL 于 2026-10-01 经 curl 实测返回 200。
#
#   bash tools/download_data.sh            # 下全部
#   bash tools/download_data.sh seg        # 只下第一部分（分割）
#   bash tools/download_data.sh cls        # 只下第二部分（分类）
#   bash tools/download_data.sh ph2        # 只试 PH2（大陆网络大概率失败）
#
# 全部用 -C - 断点续传，中断后重跑即可。11.17GB 那个包建议 nohup 挂后台。

set -uo pipefail

BASE="https://challenge.isic-archive.com"
DEST="${DATA_DIR:-$PWD/data}"
mkdir -p "$DEST"/{isic2018_task1,isic2018_task3,isic2017,ph2}

# -L 跟随跳转（challenge 页会 302 到 isic-archive.s3.amazonaws.com）
get() {
  local url="$1" out="$2"
  if [[ -s "$out" ]]; then
    echo "[skip] 已存在 $(basename "$out")  ($(du -h "$out" | cut -f1))"
    return 0
  fi
  echo "[get ] $url"
  curl -fL -C - --retry 5 --retry-delay 10 -o "$out" "$url" \
    && echo "[ok  ] $(basename "$out")  ($(du -h "$out" | cut -f1))" \
    || echo "[FAIL] $(basename "$out")  <- 去 $BASE/data/ 页面核对当前直链"
}

seg() {
  echo "=== ISIC 2018 Task1（分割主 benchmark，2594/100/1000）==="
  # ⚠️ 11.17 GB，最大的一个文件。建议： nohup bash tools/download_data.sh seg > dl.log 2>&1 &
  get "$BASE/challenges/2018/ISIC2018_Task1-2_Training_Input.zip"      "$DEST/isic2018_task1/train_input.zip"
  get "$BASE/challenges/2018/ISIC2018_Task1_Training_GroundTruth.zip"   "$DEST/isic2018_task1/train_gt.zip"
  get "$BASE/challenges/2018/ISIC2018_Task1_Validation_GroundTruth.zip" "$DEST/isic2018_task1/val_gt.zip"
  get "$BASE/challenges/2018/ISIC2018_Task1_Test_GroundTruth.zip"       "$DEST/isic2018_task1/test_gt.zip"

  echo "=== ISIC 2017 Task1（分割跨数据集测试，2000/150/600）==="
  get "$BASE/challenges/2017/ISIC-2017_Training_Data.zip"                 "$DEST/isic2017/train_data.zip"
  get "$BASE/challenges/2017/ISIC-2017_Training_Part1_GroundTruth.zip"    "$DEST/isic2017/train_part1_gt.zip"
  get "$BASE/challenges/2017/ISIC-2017_Validation_Data.zip"               "$DEST/isic2017/val_data.zip"
  get "$BASE/challenges/2017/ISIC-2017_Validation_Part1_GroundTruth.zip"  "$DEST/isic2017/val_part1_gt.zip"
  get "$BASE/challenges/2017/ISIC-2017_Test_v2_Data.zip"                  "$DEST/isic2017/test_data.zip"
  get "$BASE/challenges/2017/ISIC-2017_Test_v2_Part1_GroundTruth.zip"     "$DEST/isic2017/test_part1_gt.zip"
}

cls() {
  echo "=== HAM10000 / ISIC 2018 Task3（分类主 benchmark，10015 张 7 类）==="
  get "$BASE/challenges/2018/ISIC2018_Task3_Training_Input.zip"        "$DEST/isic2018_task3/train_input.zip"
  get "$BASE/challenges/2018/ISIC2018_Task3_Training_GroundTruth.zip"  "$DEST/isic2018_task3/train_gt.zip"
  get "$BASE/challenges/2018/ISIC2018_Task3_Training_LesionGroupings.csv" "$DEST/isic2018_task3/lesion_groupings.csv"

  echo "=== ISIC 2017 Task3（★真配对：与 Task1 同一批 2000 张图，有官方 mask）==="
  get "$BASE/challenges/2017/ISIC-2017_Training_Part3_GroundTruth.csv"   "$DEST/isic2017/train_part3_gt.csv"
  get "$BASE/challenges/2017/ISIC-2017_Validation_Part3_GroundTruth.csv" "$DEST/isic2017/val_part3_gt.csv"
  get "$BASE/challenges/2017/ISIC-2017_Test_v2_Part3_GroundTruth.csv"    "$DEST/isic2017/test_part3_gt.csv"
  # 图像复用 seg() 里下的 isic2017/*.zip，不重复下载
}

ph2() {
  echo "=== PH2（200 张，仅补充测试）==="
  echo "⚠️ 只在 Dropbox 分发、无国内镜像。大陆服务器大概率超时——失败就直接从实验计划删掉，"
  echo "   ISIC2017 已能承担跨数据集测试的角色。官方页：https://www.fc.up.pt/addi/ph2%20database.html"
  get "https://www.dropbox.com/s/k88qukc20ljnbuo/PH2Dataset.rar?dl=1" "$DEST/ph2/PH2Dataset.rar"
}

verify() {
  echo
  echo "=== 校验 ==="
  echo "解压后应满足（用 python 或 ls | wc -l 核对）："
  echo "  isic2018_task1/train_input   -> 2594 张图"
  echo "  isic2018_task1/train_gt      -> 2594 张 mask"
  echo "  isic2018_task1/val_gt        -> 100 张（⚠️ 是 100 不是 1000）"
  echo "  isic2018_task1/test_gt       -> 1000 张"
  echo "  isic2018_task3/train_gt.csv  -> 10015 行，列名 image,MEL,NV,BCC,AKIEC,BKL,DF,VASC"
  echo "                                 （⚠️ 是 AKIEC 不是 AK）"
  echo "                                 分布 NV 6705 / MEL 1113 / BKL 1099 / BCC 514 / AKIEC 327 / VASC 142 / DF 115"
  echo "  isic2017 train_part1_gt      -> 2000 个 mask ID"
  echo "  isic2017 train_part3_gt.csv  -> 2000 个 image_id，且与 part1 的 ID 集合完全相同"
  echo
  echo "HAM10000 也可从 Kaggle 镜像取（2.90GB，CC BY-NC-SA 4.0）："
  echo "  kaggle datasets download -d kmader/skin-cancer-mnist-ham10000"
  echo "  ⚠️ 旧 slug kmader/skin-cancer9-class-isic 已 404"
}

case "${1:-all}" in
  seg)  seg ;;
  cls)  cls ;;
  ph2)  ph2 ;;
  all)  seg; cls; ph2 ;;
  *)    echo "用法: bash tools/download_data.sh [seg|cls|ph2|all]"; exit 1 ;;
esac

verify
