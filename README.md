# HomeMade Image codec
#### (or HMI) for short

As of 2018, JPEG - an image compression codec unveiled in 1992, born as an amalgamation of many existing and new ideas by a ton of researchers from different companies and countries - is the most successful lossy image codec, and container format, by a large margin. Once only used by high-end professional equipment that had specialized hardware to decode and encode images, we're now at an age and time where almost *any* device can eat through JPEG in a fraction of a second, if not less than a milissecond.

But how does JPEG work? And if we were re-designing JPEG from scratch **today (in 2018)**, what would we be able to do differently? Could we somehow improve on a tried-and-true compression format, by replacing each of its processing stages with more modern equivalents?

Welcome to *HomeMade Image codec*. This is a step-by-step tutorial on how the classical JPEG codec and JFIF container work, and what could we do to redesign them using modern technologies and libraries not available at the time JPEG was first conceived, 26 years ago. We'll visit compression theory, we'll glide through DSP, and finally write some Octave, C, and Python code to glue all of our work together. I strongly recommend you to follow those through a Unix machine (macOS/Linux), though Windows (with the Linux Subsystem installed) should also work.

## Links to different lessons

### - Lesson 1 - JPEG

### - Lesson 2 - Color Transform

### - Lesson 3 - Downsampling

### - Lesson 4 - Macroblocks

### - Lesson 5 - Spatial Transform

### - Lesson 6 - Quantization

### - Lesson 7 - Run-Length Encoding

### - Lesson 8 - Entropy Coding

### - Lesson 9 - Stream Formatting

### - Lesson 10 - Putting it all together