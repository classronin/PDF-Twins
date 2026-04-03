# PDF-Twins 🐍📄

> 一对双胞胎命令行工具：PDF ⇄ 图片 互转，智能排序，零依赖部署

## 特性

- ✨ **智能数字补齐**：自动 001, 002... 确保排序正确
- 🔒 **防覆盖设计**：检测已存在文件/文件夹，安全第一
- 🚀 **静默执行**：无交互，适合脚本调用
- 📦 **零配置**：放入 PATH 即可全局使用

## 安装

```bash
git clone https://github.com/classronin/PDF-Twins.git
# 将 PDF.bat 和 PyMuPDF.py 放入 PATH 目录
```


### 用法
```
pdf 文档.pdf    # 拆解 PDF → 图片
pdf             # 合并图片 → PDF
```

依赖
```
scoop install uv 
uv tool install img2pdf
uv tool install PyMuPDF
```




