from pathlib import Path
from PIL import Image, ImageOps, ImageEnhance

root=Path('/home/ubuntu/CMS_Prep')
paths=sorted((root/'assets/images/accounting').glob('archive_handwritten_fa_*.jpeg'))
assert len(paths)==36, len(paths)
pages=[]
for p in paths:
    im=Image.open(p).convert('RGB')
    # Keep the full handwritten page, lightly improve contrast, and fit it on A4 with white margins.
    im=ImageEnhance.Contrast(im).enhance(1.08)
    im=ImageOps.contain(im,(1500,2050),Image.Resampling.LANCZOS)
    canvas=Image.new('RGB',(1654,2339),'white')
    x=(canvas.width-im.width)//2; y=(canvas.height-im.height)//2
    canvas.paste(im,(x,y))
    pages.append(canvas)
out=root/'assets/content/Financial_Accounting/FA_Handwritten_Notes_Ordered.pdf'
pages[0].save(out,'PDF',resolution=150.0,save_all=True,append_images=pages[1:])
print(out)
