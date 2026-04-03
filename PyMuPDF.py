#!/usr/bin/env python3
# PDF-Twins - 智能 PDF 拆解器
# 作者： classronin + deepseek.com
# 仓库：https://github.com/classronin/PDF-Twins


import sys
import os
import pymupdf

def main():
    if len(sys.argv) != 4:
        print("用法: python PyMuPDF.py <PDF文件> <输出目录> <文件前缀>")
        sys.exit(1)
    
    pdf_path = sys.argv[1]
    output_dir = sys.argv[2]
    prefix = sys.argv[3]
    
    try:
        doc = pymupdf.open(pdf_path)
        total_pages = len(doc)
        digits = len(str(total_pages))  # 自动计算位数
        
        for page_num in range(total_pages):
            page = doc[page_num]
            pix = page.get_pixmap(dpi=150)
            # 生成补齐位数的文件名，如：前缀-001.png
            output_path = os.path.join(output_dir, f"{prefix}-{page_num + 1:0{digits}d}.png")
            pix.save(output_path)
            print(f"已保存: {output_path}")
        
        doc.close()
        print(f"转换完成！共 {total_pages} 页，保存在 {output_dir}/")
        
    except Exception as e:
        print(f"转换出错: {e}")
        sys.exit(1)

if __name__ == "__main__":
    main()
