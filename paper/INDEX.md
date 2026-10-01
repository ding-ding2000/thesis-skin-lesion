# paper 目录索引

共 116 篇 PDF，分 6 个目录。选题理由、创新点设计、实验方案与阅读顺序见 [`00_选题说明.md`](00_选题说明.md)。

**主推方向**：皮肤镜病变「分割 → 分割引导分类」两部分递进（`01`–`03` 目录，共 87 篇）。
**备选方向**：息肉分割「精度 → 泛化 / 轻量化」（`04`–`06` 目录，共 29 篇）。

---

## `01_foundations/` — 通用基础

> 分割骨干 / Transformer分割 / 注意力模块 / 损失函数 / 分类backbone / 优化器 / 可解释性　**26 篇**

| 简称 | 年份 | arXiv | 大小 |
|---|---|---|---|
| AdamW_DecoupledWeightDecay | 2019 | [1711.05101](https://arxiv.org/abs/1711.05101) | 5.8 MB |
| AttentionUNet | 2018 | [1804.03999](https://arxiv.org/abs/1804.03999) | 3.5 MB |
| BoundaryLoss_Unbalanced | 2019 | [1812.07032](https://arxiv.org/abs/1812.07032) | 4.0 MB |
| CBAM | 2018 | [1807.06521](https://arxiv.org/abs/1807.06521) | 1.9 MB |
| ConvNeXt | 2022 | [2201.03545](https://arxiv.org/abs/2201.03545) | 734 KB |
| DeepLabv3+ | 2018 | [1802.02611](https://arxiv.org/abs/1802.02611) | 4.0 MB |
| EGEUNet | 2023 | [2307.08473](https://arxiv.org/abs/2307.08473) | 3.3 MB |
| EfficientNet | 2019 | [1905.11946](https://arxiv.org/abs/1905.11946) | 911 KB |
| FocalLoss | 2017 | [1708.02002](https://arxiv.org/abs/1708.02002) | 1.2 MB |
| GradCAM | 2017 | [1610.02391](https://arxiv.org/abs/1610.02391) | 6.9 MB |
| MALUNet | 2022 | [2211.01784](https://arxiv.org/abs/2211.01784) | 988 KB |
| OptimizingDiceJaccard | 2019 | [1911.01685](https://arxiv.org/abs/1911.01685) | 364 KB |
| ResNet | 2016 | [1512.03385](https://arxiv.org/abs/1512.03385) | 800 KB |
| SENet_SqueezeExcitation | 2018 | [1709.01507](https://arxiv.org/abs/1709.01507) | 2.1 MB |
| SGDR_CosineAnnealing | 2017 | [1608.03983](https://arxiv.org/abs/1608.03983) | 1.5 MB |
| SegFormer | 2021 | [2105.15203](https://arxiv.org/abs/2105.15203) | 5.5 MB |
| SwinTransformer | 2021 | [2103.14030](https://arxiv.org/abs/2103.14030) | 1.3 MB |
| SwinUnet | 2021 | [2105.05537](https://arxiv.org/abs/2105.05537) | 2.8 MB |
| TransUNet | 2021 | [2102.04306](https://arxiv.org/abs/2102.04306) | 629 KB |
| TverskyLoss | 2017 | [1706.05721](https://arxiv.org/abs/1706.05721) | 7.4 MB |
| U-Net | 2015 | [1505.04597](https://arxiv.org/abs/1505.04597) | 1.6 MB |
| UNeXt | 2022 | [2203.04967](https://arxiv.org/abs/2203.04967) | 1.4 MB |
| UNet++ | 2018 | [1807.10165](https://arxiv.org/abs/1807.10165) | 1.6 MB |
| UNet3+_FullScaleConnected | 2020 | [2004.08790](https://arxiv.org/abs/2004.08790) | 840 KB |
| VNet_DiceLoss | 2016 | [1606.04797](https://arxiv.org/abs/1606.04797) | 4.2 MB |
| ViT | 2021 | [2010.11929](https://arxiv.org/abs/2010.11929) | 3.6 MB |

## `02_part1_skin_seg/` — 第一部分：皮肤镜病变分割

> baseline + 边界路线 + 频域路线 + 轻量化 + 基础模型 + 综述　**29 篇**

| 简称 | 年份 | arXiv | 大小 |
|---|---|---|---|
| ASPVMUNet_AtrousShiftedParallel | 2025 | [2503.19427](https://arxiv.org/abs/2503.19427) | 4.0 MB |
| BATransformer_BoundaryAware | 2021 | [2110.03864](https://arxiv.org/abs/2110.03864) | 2.6 MB |
| CASCNet_ChannelAttnSeparableConv | 2023 | [2309.01072](https://arxiv.org/abs/2309.01072) | 698 KB |
| ConfWeightedSemiSup_HybridCNNTrans | 2025 | [2510.15354](https://arxiv.org/abs/2510.15354) | 888 KB |
| DONet_DualObjective | 2020 | [2008.08278](https://arxiv.org/abs/2008.08278) | 948 KB |
| DSNet_DermoscopicSeg | 2019 | [1907.04305](https://arxiv.org/abs/1907.04305) | 2.3 MB |
| DermoSegDiff_BoundaryDiffusion | 2023 | [2308.02959](https://arxiv.org/abs/2308.02959) | 2.3 MB |
| EALiteUNet_EdgeDermoscopic | 2026 | [2608.15537](https://arxiv.org/abs/2608.15537) | 1.9 MB |
| FreqSpatialSaliency_SkinLesion | 2020 | [2010.04022](https://arxiv.org/abs/2010.04022) | 561 KB |
| IlluminationTransform_SkinLesionSeg | 2020 | [2003.10111](https://arxiv.org/abs/2003.10111) | 1.5 MB |
| InterAnnotatorVariability | 2025 | [2508.09381](https://arxiv.org/abs/2508.09381) | 1.2 MB |
| LSSFNet_LightweightMobile | 2024 | [2409.01572](https://arxiv.org/abs/2409.01572) | 6.9 MB |
| MUCMNet_Mamba | 2024 | [2405.15925](https://arxiv.org/abs/2405.15925) | 1.0 MB |
| MedSAM_SegmentAnythingMedical | 2023 | [2304.12306](https://arxiv.org/abs/2304.12306) | 3.7 MB |
| MoSSGate_SSM_SkinLesion | 2026 | [2609.20181](https://arxiv.org/abs/2609.20181) | 5.6 MB |
| PEFTMedSAM_ExplainableSkinSeg | 2026 | [2606.18707](https://arxiv.org/abs/2606.18707) | 2.0 MB |
| SegFormer_HairArtifactRemoval | 2025 | [2509.02156](https://arxiv.org/abs/2509.02156) | 11.2 MB |
| SkinColorImpact_Segmentation | 2026 | [2603.29694](https://arxiv.org/abs/2603.29694) | 3.5 MB |
| SkinMamba_FreqBoundaryGuidance | 2024 | [2409.10890](https://arxiv.org/abs/2409.10890) | 774 KB |
| Survey_SkinLesionSeg | 2022 | [2206.00356](https://arxiv.org/abs/2206.00356) | 13.6 MB |
| Survey_SkinSegAndCls_Trends | 2022 | [2208.12232](https://arxiv.org/abs/2208.12232) | 2.4 MB |
| TAFMNet_FocalModulation | 2024 | [2411.17556](https://arxiv.org/abs/2411.17556) | 7.3 MB |
| TESLNet_TransEnhancedCNN | 2024 | [2408.09687](https://arxiv.org/abs/2408.09687) | 1.2 MB |
| UCMNet_LightweightMLP | 2023 | [2310.09457](https://arxiv.org/abs/2310.09457) | 3.6 MB |
| USLNet_UncertaintySelfLearning | 2023 | [2309.13289](https://arxiv.org/abs/2309.13289) | 5.6 MB |
| UltraLBMUNet_UltralightBiDirMamba | 2025 | [2512.21584](https://arxiv.org/abs/2512.21584) | 7.5 MB |
| WaveletHighFreqEnhancement_Transformer | 2023 | [2308.13442](https://arxiv.org/abs/2308.13442) | 3.2 MB |
| WaveletLBP_UNet_SkinLesion | 2018 | [1805.05239](https://arxiv.org/abs/1805.05239) | 1.3 MB |
| XBoundFormer_CrossScaleBoundary | 2022 | [2206.00806](https://arxiv.org/abs/2206.00806) | 11.6 MB |

## `03_part2_skin_cls/` — 第二部分：皮肤病变分类

> 多任务 / 类别不平衡 / ABCD规则 / 公平性 / 可解释性　**32 篇**

| 简称 | 年份 | arXiv | 大小 |
|---|---|---|---|
| AreExplanationsHelpful_XAIComparative | 2024 | [2412.03166](https://arxiv.org/abs/2412.03166) | 4.7 MB |
| CAMEO_FairRobustDiagnosis | 2026 | [2609.36400](https://arxiv.org/abs/2609.36400) | 17.1 MB |
| ClassBalancedLoss_EffectiveNumber | 2019 | [1901.05555](https://arxiv.org/abs/1901.05555) | 857 KB |
| ClassImbalance_BalancingTechniques | 2025 | [2512.15837](https://arxiv.org/abs/2512.15837) | 842 KB |
| ComparativeEval_PretrainedCNN_Melanoma | 2026 | [2609.11550](https://arxiv.org/abs/2609.11550) | 738 KB |
| DeConstructingBias_SkinLesionDatasets | 2019 | [1904.08818](https://arxiv.org/abs/1904.08818) | 8.0 MB |
| DemographicBias_SkinCls | 2026 | [2606.03214](https://arxiv.org/abs/2606.03214) | 1.6 MB |
| DerMAE_LatentDiffusionMAEDistill | 2026 | [2602.19848](https://arxiv.org/abs/2602.19848) | 1.3 MB |
| Derm1M_VisionLanguageDataset | 2025 | [2503.14911](https://arxiv.org/abs/2503.14911) | 13.4 MB |
| DermoDOCTOR_DualEncoder | 2021 | [2102.01824](https://arxiv.org/abs/2102.01824) | 2.4 MB |
| EnsembleLearning_SkinLesionDiagnosis | 2024 | [2409.04381](https://arxiv.org/abs/2409.04381) | 505 KB |
| FoProKD_FourierLongTailed | 2023 | [2305.17421](https://arxiv.org/abs/2305.17421) | 4.5 MB |
| GSTransUNet_SegCls | 2025 | [2502.16748](https://arxiv.org/abs/2502.16748) | 5.1 MB |
| GenAI_SkinToneBiasReduction | 2026 | [2602.14356](https://arxiv.org/abs/2602.14356) | 4.0 MB |
| JIADF_MultimodalAdaptiveFusion | 2026 | [2604.27343](https://arxiv.org/abs/2604.27343) | 1.5 MB |
| LDAM_LabelDistAwareMargin | 2019 | [1906.07413](https://arxiv.org/abs/1906.07413) | 1.3 MB |
| MDSkinNet_MultiTask | 2026 | [2609.30855](https://arxiv.org/abs/2609.30855) | 3.2 MB |
| MTTransUNet_MultiTaskTokens | 2021 | [2112.01767](https://arxiv.org/abs/2112.01767) | 892 KB |
| MachineVision_ABCD_Assessment | 2026 | [2601.15539](https://arxiv.org/abs/2601.15539) | 357 KB |
| MelanomaNet_Explainable | 2025 | [2512.09289](https://arxiv.org/abs/2512.09289) | 2.4 MB |
| MultiScaleFeatEnh_MultiTaskMedical | 2024 | [2412.00351](https://arxiv.org/abs/2412.00351) | 847 KB |
| MultiTask_SkinSegAndCls | 2017 | [1703.01025](https://arxiv.org/abs/1703.01025) | 181 KB |
| PLCRD_MaskFreeDistill | 2026 | [2607.18773](https://arxiv.org/abs/2607.18773) | 10.2 MB |
| PatchAttn_DiagnosisGuidedLossWeighting | 2019 | [1905.02793](https://arxiv.org/abs/1905.02793) | 620 KB |
| ProCo_LongTailedMedicalCls | 2022 | [2209.00183](https://arxiv.org/abs/2209.00183) | 793 KB |
| SegAndABCDRuleExtraction | 2021 | [2106.04372](https://arxiv.org/abs/2106.04372) | 4.6 MB |
| SemiSupOnlineKD_SkinCls | 2025 | [2508.11511](https://arxiv.org/abs/2508.11511) | 700 KB |
| SkinCLIPVL_MultimodalDiagnosis | 2026 | [2603.21010](https://arxiv.org/abs/2603.21010) | 5.7 MB |
| SkinGenBench_SyntheticAugmentation | 2025 | [2512.17585](https://arxiv.org/abs/2512.17585) | 4.4 MB |
| SuperCon_SupConImbalanced | 2022 | [2202.05685](https://arxiv.org/abs/2202.05685) | 1012 KB |
| SwinMetadataFusion_Multimodal | 2026 | [2608.07574](https://arxiv.org/abs/2608.07574) | 2.5 MB |
| UncertaintyExplainableEnsemble_SkinCls | 2026 | [2608.11280](https://arxiv.org/abs/2608.11280) | 1.7 MB |

## `04_alt_polyp_accuracy/` — 备选B第一部分：息肉分割精度

> baseline + 2025-2026 同类工作 + 综述　**11 篇**

| 简称 | 年份 | arXiv | 大小 |
|---|---|---|---|
| ASGNet_SpectrumGuidance | 2026 | [2604.14755](https://arxiv.org/abs/2604.14755) | 8.9 MB |
| Audit_EvaluationInconsistencies | 2026 | [2607.08203](https://arxiv.org/abs/2607.08203) | 5.2 MB |
| CSGMamba | 2026 | [2608.14146](https://arxiv.org/abs/2608.14146) | 3.0 MB |
| CaraNet | 2021 | [2108.07368](https://arxiv.org/abs/2108.07368) | 839 KB |
| MPCGNet_MultiscaleAggregation | 2025 | [2511.11032](https://arxiv.org/abs/2511.11032) | 816 KB |
| MicroAUNet_BoundaryKD | 2025 | [2511.01143](https://arxiv.org/abs/2511.01143) | 1.1 MB |
| PolypPVT | 2021 | [2108.06932](https://arxiv.org/abs/2108.06932) | 1.5 MB |
| PraNet | 2020 | [2006.11392](https://arxiv.org/abs/2006.11392) | 569 KB |
| RaBiT | 2023 | [2307.06420](https://arxiv.org/abs/2307.06420) | 3.3 MB |
| Survey_ColorectalPolypSeg | 2024 | [2401.11734](https://arxiv.org/abs/2401.11734) | 6.1 MB |
| Survey_PolypSeg | 2023 | [2311.18373](https://arxiv.org/abs/2311.18373) | 2.5 MB |

## `05_alt_polyp_generalization/` — 备选B第二部分：息肉泛化

> 域泛化 / 风格增强 / 测试时自适应　**13 篇**

| 简称 | 年份 | arXiv | 大小 |
|---|---|---|---|
| ConStyX_ContentStyleAug | 2025 | [2506.10675](https://arxiv.org/abs/2506.10675) | 10.7 MB |
| CurriculumAugFourierDA | 2023 | [2306.03511](https://arxiv.org/abs/2306.03511) | 2.0 MB |
| FDA_FourierDomainAdaptation | 2020 | [2004.05498](https://arxiv.org/abs/2004.05498) | 4.1 MB |
| FreqPriorGuidedMatching_Polyp | 2025 | [2508.06517](https://arxiv.org/abs/2508.06517) | 2.9 MB |
| FrequencyAdapter_SAM | 2026 | [2605.09925](https://arxiv.org/abs/2605.09925) | 363 KB |
| InduceToEmpower_FM_Induction_Polyp | 2026 | [2607.17208](https://arxiv.org/abs/2607.17208) | 16.9 MB |
| MambaSea_Global2LocalAug | 2025 | [2504.17515](https://arxiv.org/abs/2504.17515) | 6.2 MB |
| MedSegTTA_Benchmark | 2025 | [2512.02497](https://arxiv.org/abs/2512.02497) | 48.6 MB |
| ResUNet++_CRF_TTA_Study | 2021 | [2107.12435](https://arxiv.org/abs/2107.12435) | 3.1 MB |
| SemanticAwareRandConv_SourceMatching | 2025 | [2512.01510](https://arxiv.org/abs/2512.01510) | 16.9 MB |
| SmaRT_StyleModulatedTTA | 2025 | [2509.17925](https://arxiv.org/abs/2509.17925) | 4.4 MB |
| StructureAwareStylizedSynthesis | 2024 | [2412.04296](https://arxiv.org/abs/2412.04296) | 1.7 MB |
| TENT_TTA | 2020 | [2006.10726](https://arxiv.org/abs/2006.10726) | 6.1 MB |

## `06_alt_efficiency/` — 备选C第二部分：轻量化

> 知识蒸馏 / 剪枝 / 超轻量网络　**5 篇**

| 简称 | 年份 | arXiv | 大小 |
|---|---|---|---|
| DepthPolyp_Lightweight | 2026 | [2605.16519](https://arxiv.org/abs/2605.16519) | 8.4 MB |
| LightMIS_UltraLightweight | 2026 | [2609.28327](https://arxiv.org/abs/2609.28327) | 5.5 MB |
| LightweightPolyp_RecursiveController | 2026 | [2607.03062](https://arxiv.org/abs/2607.03062) | 1.1 MB |
| MISHCC_HierChannelClustering | 2026 | [2607.17329](https://arxiv.org/abs/2607.17329) | 1.2 MB |
| Med2DSegNet | 2025 | [2504.14715](https://arxiv.org/abs/2504.14715) | 8.5 MB |

