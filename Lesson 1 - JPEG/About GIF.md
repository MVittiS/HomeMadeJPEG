# GIF is a Lossless format

GIF is an ancient beast, and one that survives to this day solely due to its capability of looped animation; something both JPEG and PNG tried to emulate without success, and the only thing stopping PNG from completely obsoleting GIF. It might surprise most readers, but technically GIF is a **lossless** image codec, like PNG. All color data that comes in, comes out exactly the same: *without any quantization* applied to it; just some [LZW compression][wikipedia link].

GIF, however, has a severe limitation of only storing 256 colors of your choosing per frame (or 255 + one fully transparent color), and that's where all of GIF's "artifacts" come into sight. By the time GIF was conceived, very few computer displays could support 256 colors *at all*, let alone the millions (24-bit) or billions (30/32-bit) we have today. In order to turn an image (or an image sequence, a.k.a. video) into a GIF image, you first have to reduce its color space back to 256 (8-bit) colors - the loss is especially noticeable in images with lots of colors, almost imperceptible in images with few colors, and lossless in black and white images.

![Colorful image showing the heavy effects of dithering]()
![Colorless image showing little signs of dithering]()
![Monochromatic image showing no signs of dithering]()

Within those 256 colors, however, no further transforms are applied - which means that it **is** lossless; just with a severe legacy limitation. No wonder most GIF-sharing websites, such as 9gag or Imgur, usually try to send your browser .mp4 files compressed with H.264 (about 5x more efficient, and much better looking) first, and only falling back to GIF if your browser fails to decode them. All browsers shipped since 2011 or so decode .mp4s transparently.

GIF's days are numbered, but its legacy of short, looping, moving images on the internet will surely live on through newer formats.