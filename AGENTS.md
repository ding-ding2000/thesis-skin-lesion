# AGENTS.md

这是**硕士毕业课题的调研与规划工作区**，不是代码工程（当前无训练代码，也不是 git 仓库）。
产物是选题方案 + 论文库。实验代码将在 Linux GPU 服务器上另建。

## 当前结论（2026-10-01 定稿）

主推课题：**皮肤镜病变「分割 → 分割引导分类」两部分递进**

- 第一部分：ISIC 2018 Task1 皮肤病变分割。创新点 = 边界不确定性门控跳跃连接 / 频域子带解耦与可学习高频选择 / 面向标注歧义的软边界复合损失。
- 第二部分：HAM10000 七分类 + ISIC 2017 真配对实验。创新点 = U(x) 门控的双分支融合 / ABCD 形态学先验显式注入 / 稀有类导向的不平衡处理 + 边界带对比正则。
- 贯通接口：① 分割网络权重（给无标注图生成伪 mask）② 边界不确定图 U(x) ③ 形态学量。

**完整方案见 `paper/00_选题说明.md`（709 行）**，包含数据协议、消融清单、可填的实验表模板、算力预算、风险对策、5 周阅读顺序、30 天启动清单。
息肉方向的备选方案见 `paper/00b_备选方案_息肉详版.md`。

**不要重新论证选题**，除非用户提出新的约束变化。历史上已经切换过一次方向（息肉 → 皮肤病变），原因见下。

## 硬约束（用户明确说过）

- 单卡 GPU，16GB 显存。**代码编写与训练都在 Linux 服务器上**，本机是 Windows 仅用于规划。
- 目标是**硕士毕业，不强求 SCI 发表**。因此取舍标准是「迭代延迟 + 结果确定性 + 工作量够盲审」，**不是**新颖度或可发表性。
- 大论文需两部分工作，递进或并列关系。
- 每部分 2–3 个创新点；对比实验和消融实验不能缺；**每部分对比模型不少于 4 个**（现已定为各 4 个亲手复现 + 引用原文扩到 19 行）。
- 必须有成熟开源 baseline，不接受从零实现的方向。
- 对比模型要 3–4 个即可，但**不能都是老旧模型**，需有 2–3 个 2024/2025 的。

## 目录

```
paper/
├── 00_选题说明.md              主文档（皮肤镜方案）
├── 00b_备选方案_息肉详版.md     降级备选，顶部有新旧目录对照表
├── INDEX.md                    116 篇论文索引（脚本生成）
├── manifest.tsv                folder / filename / arxiv_id，供 tools/fetch_papers.py 还原 PDF
├── 01_foundations/             26 篇：分割骨干、Transformer分割、注意力、损失、分类backbone、优化器、可解释性
├── 02_part1_skin_seg/          29 篇：第一部分
├── 03_part2_skin_cls/          32 篇：第二部分
├── 04_alt_polyp_accuracy/      11 篇：备选B
├── 05_alt_polyp_generalization/ 13 篇：备选B
└── 06_alt_efficiency/           5 篇：备选C
tools/fetch_papers.py           按 manifest 重新下载全部 PDF（PDF 不进 git）
```

## 已实测核实的事实（重新查证很贵，直接用）

### 数据集

- ISIC 总入口 `https://challenge.isic-archive.com/data/`，**200、无需登录、直链 S3、支持 Range**。
- **ISIC 2018 Task1 = 2594 训练 / 100 验证 / 1000 测试**（⚠️ 验证集是 **100** 不是 1000）。训练图包 `ISIC2018_Task1-2_Training_Input.zip` 有 **11.17 GB**。
- **ISIC2018 Task1 与 HAM10000 的 image ID 交集为 0**（三个划分分别比对均为 0）。官方页面与 challenge 综述论文都**没有明文声明**这点，需靠 ID 比对支撑。
- **ISIC 2017 的 Task1 与 Task3 是同一批图像**（2000 个 ID 完全相同）→ 天然提供「图像 + 真 mask + 类别标签」三元组，是第二部分真配对实验（表 4-1b）的基础。
- HAM10000 = ISIC2018 Task3 = 10015 张 7 类，CC-BY-NC。分布 NV 6705 / MEL 1113 / BKL 1099 / BCC 514 / **AKIEC** 327 / VASC 142 / DF 115。⚠️ CSV 列名是 `AKIEC` 不是 `AK`。DOI `10.1038/sdata.2018.161`。
- Kaggle 镜像 `kmader/skin-cancer-mnist-ham10000`（2.90GB，在线）。⚠️ `kmader/skin-cancer9-class-isic` **已 404**。
- 新版 `www.isic-archive.com` **只能浏览器看图、不提供下载**；`api.isic-archive.com/api/v2/datasets/` **需鉴权**。批量拿数据走 challenge 页 zip。
- PH2 **只在 Dropbox 分发、无国内镜像**，大陆网络实测超时 → 拿不到就从计划删掉，ISIC2017 能替代其角色。
- 百度网盘提取码：BA-Transformer = `kmqr`（含 point maps 与数据划分）；MALUNet + EGE-UNet 共用 = `dybm`。息肉方向 Polyp-PVT = `x3jc`。

### 代码可得性

**分割侧核心 4 个（都有 `train.py`、都跑 ISIC2017/2018）**：U-Net（smp）、`xuxuxuxuxuxjh/LB-UNet`（MICCAI 2024，45★，纯 PyTorch）、`wurenkai/UltraLight-VM-UNet`（Patterns 2024，364★，0.049M 参数，需 mamba_ssm）、`zs1314/SkinMamba`（ACCVW 2025 Oral，54★，需 mamba_ssm，提供权重）。

**分类侧核心 4 个**：ConvNeXt-V2-T（timm）、`JingyeChen/MT-TransUNet`（22★，2021）、`zylbuaa/ECL`（MICCAI 2023，30★，**就是 ISIC2018 七分类、纯 PyTorch、带预训练权重**）、`AnandK27/GS-TransUNet`（3★，2025）。

**确认无官方代码**：MDSkin-Net(`2609.30855`)、PLCRD(`2607.18773`)、LSSF-Net(`2409.01572`)、MSDUNet。MAKE(`SiyuanYan1/MAKE`, MICCAI'25) 有代码但是 zero-shot VLP，不适合与监督方法同表对比。MB-DCNN(TMI 2020) 有代码但依赖 Torch 1.4/CUDA 10。

**框架地址**：`qubvel-org/segmentation_models.pytorch`（11750★，MIT；⚠️ 旧地址 `qubvel/` 已 301 迁移）、`huggingface/pytorch-image-models`（timm，37182★，Apache-2.0）。

**皮肤镜方向不存在「一仓多法」的聚合代码库**（与息肉方向有 `taozh2017/Awesome-Polyp-Segmentation` 不同）→ 统一训练/评测框架必须自建。

### 拥挤度（arXiv API 计数）

| 关键词 | 2023 | 2024 | 2025.01–2026.09 |
|---|---|---|---|
| polyp segmentation | 50 | 55 | 74 |
| skin lesion segmentation | 30 | 12 | 28 |
| skin lesion classification | 20 | 13 | 41 |
| **skin lesion multi-task** | **1** | **1** | **5** |

⚠️ 皮肤镜工作多直投期刊不挂 arXiv，真实数被低估 2–3 倍。**相对结论成立，绝对数字别当准。**

## 工作约定（踩过的坑）

1. **arXiv 编号绝不凭记忆写**。历史上记错过 4 个（BA-Transformer 实为 `2110.03864`、MedSAM `2304.12306`、Boundary Loss `1812.07032`、LDAM `1906.07413`）。用 `export.arxiv.org/api/query` 按标题搜索核实，下载后校验 `%PDF` 魔数 + 体积下限。
2. **GitHub 仓库地址绝不凭记忆写**。历史上记错过 3 个（Polyp-PVT 是 `DengPingFan/` 不是 `DongPing-Chen/`；MALUNet 与 EGE-UNet 都在 `JCruan519/`）。
3. **核实「有没有代码」不能只靠仓库名搜索返回 0 就下结论**。MT-TransUNet 的 README 只有三行，按名搜会漏掉，实际有 69 个文件。要直接查全名或搜论文标题关键词。
4. **推荐方案前先确认用户的真实目标是「发表」还是「毕业」**，两者最优解可能相反。发表优化提升空间和故事性；毕业优化迭代速度和结果确定性。这次方向切换就是因为这个约束变了。
5. 文档里的链接、star 数、许可证、数据集规模都要标注是否实测核实过，未核实的明确写「未验证」。

## 当前状态与下一步

方案与论文库已完成。**尚未开始任何代码工作。**

下一步按 `paper/00_选题说明.md` §10 的 30 天清单执行，第一件事是在服务器上搭环境 + 挂后台下载 11.17GB 的 ISIC2018 Task1 训练图包，然后写统一评测脚本（D6–D10，这一步最值得投入，因为没有聚合代码库可复用）。
