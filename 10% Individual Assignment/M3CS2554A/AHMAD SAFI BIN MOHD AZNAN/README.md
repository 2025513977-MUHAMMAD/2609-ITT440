# AHMAD SAFI BIN MOHD AZNAN
# A Comparative Analysis of Image Enhancement Techniques

**Course:** ITT440 – Network Programming  
**Topic:** Image Processing with Python  
**Student:** Ahmad Safi Bin Mohd Aznan  
**Student ID:** 2025144435  

---

## 1. Introduction

Image processing is the use of computational techniques to transform, analyze, and extract useful information from digital images. A digital image is usually represented as an array of pixel values. In a color image, each pixel often contains three color channels, while a grayscale image typically contains one intensity value. Python provides libraries that make it possible to read, modify, and display images with relatively little code.

This article compares three commonly taught image-processing operations: **grayscale conversion**, **Gaussian blur**, and **edge detection**. They serve different purposes rather than being interchangeable enhancement methods. Grayscale conversion simplifies color information, Gaussian blur smooths local intensity variations, and edge detection emphasizes image boundaries. Together, they demonstrate how different transformations change the information available for subsequent analysis.

The proposed demonstration uses the open-source OpenCV library for image operations, NumPy for array representation, and Matplotlib for visualization. The example code is intended to be run on an image that the student has permission to use. Results depend on the chosen input image and parameters, so no numerical or visual findings are claimed without execution.

## 2. Objectives

1. Explain the fundamentals of digital image processing in Python.
2. Demonstrate grayscale conversion, Gaussian blurring, and edge detection using OpenCV.
3. Compare the purposes, outputs, and limitations of the three operations.
4. Describe how image properties and parameter choices influence the results.
5. Document a reproducible procedure that can be demonstrated in a GitHub article and video.

## 3. System and Software Requirements

| Component | Requirement |
|---|---|
| Operating system | Windows 10/11, macOS, or Linux |
| Programming language | Python 3 |
| Main library | OpenCV (`opencv-python`) |
| Supporting libraries | NumPy, Matplotlib |
| Editor | VS Code, IDLE, or Jupyter Notebook |
| Input | A locally saved image such as `sample.jpg` |
| Output | Three processed images and a comparison figure |

### 3.1 Installation

Install Python from [python.org](https://www.python.org/downloads/) and then run:

```bash
python -m pip install opencv-python numpy matplotlib
```

Save a sample image in the same folder as the script, naming it `sample.jpg`. Use an image you own or one with a suitable reuse license.

## 4. Methodology

The same source image is processed through three separate operations. Keeping the source image constant makes the visual differences easier to understand.

1. Read the original image from disk.
2. Convert it from OpenCV's BGR channel order to RGB for display.
3. Convert the original image to grayscale.
4. Apply a Gaussian filter to the grayscale image.
5. Apply the Canny edge detector to the grayscale image.
6. Save the outputs and assemble a comparison figure.
7. Describe which details each operation preserves, reduces, or emphasizes.

### 4.1 Technique 1: Grayscale Conversion

Grayscale conversion changes a color image into a single-channel intensity image. OpenCV's `cv2.cvtColor()` function can perform this transformation using `cv2.COLOR_BGR2GRAY`. The result reduces color information, which can simplify later operations that depend primarily on brightness differences. However, objects distinguishable only by color may become harder to separate after conversion.

```python
import cv2

image = cv2.imread("sample.jpg")
if image is None:
    raise FileNotFoundError("Place sample.jpg in the script folder")

gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
cv2.imwrite("grayscale.jpg", gray)
```

### 4.2 Technique 2: Gaussian Blur

Gaussian blur is a smoothing operation. It replaces each pixel's intensity with a weighted combination of nearby pixels, giving more weight to pixels closer to the center. This can reduce fine detail and some forms of noise. A larger kernel or stronger blur generally produces a smoother appearance, but may also remove important details.

The example below uses a **5 × 5 kernel** and lets OpenCV derive the Gaussian standard deviation.

```python
blurred = cv2.GaussianBlur(gray, (5, 5), 0)
cv2.imwrite("gaussian_blur.jpg", blurred)
```

### 4.3 Technique 3: Canny Edge Detection

Edge detection highlights regions where image intensity changes sharply. The Canny method includes stages for gradient estimation, thinning candidate edges, and using two thresholds to decide which edges to keep. Edge maps can help identify outlines and structural features, although texture and noise may also generate unwanted edges.

The two thresholds below are **illustrative starting values**, not universally optimal settings.

```python
edges = cv2.Canny(gray, 100, 200)
cv2.imwrite("edges.jpg", edges)
```

## 5. Complete Example Program

The following script combines the three operations and creates a four-panel comparison. It is adapted from standard usage patterns described in the OpenCV documentation; see the references below.

```python
import cv2
import matplotlib.pyplot as plt

image = cv2.imread("sample.jpg")
if image is None:
    raise FileNotFoundError("Could not find sample.jpg")

rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
blurred = cv2.GaussianBlur(gray, (5, 5), 0)
edges = cv2.Canny(gray, 100, 200)

cv2.imwrite("grayscale.jpg", gray)
cv2.imwrite("gaussian_blur.jpg", blurred)
cv2.imwrite("edges.jpg", edges)

fig, axes = plt.subplots(1, 4, figsize=(16, 4))
images = [rgb, gray, blurred, edges]
titles = ["Original", "Grayscale", "Gaussian Blur", "Canny Edges"]
for ax, img, title in zip(axes, images, titles):
    ax.imshow(img, cmap="gray" if img.ndim == 2 else None)
    ax.set_title(title)
    ax.axis("off")
plt.tight_layout()
plt.savefig("comparison.png", dpi=150)
plt.show()
```

### 5.1 How to Run

Save the program as `image_processing.py` and place `sample.jpg` in the same folder. Open Command Prompt in that folder and run:

```bash
python image_processing.py
```

If the dependencies are installed and the image is readable, the script will create `grayscale.jpg`, `gaussian_blur.jpg`, `edges.jpg`, and `comparison.png`.

## 6. Results and Comparison

**Status: Example procedure provided; no actual processing results are reported in this article.** The table below describes expected visual characteristics rather than observations from a completed experiment.

| Operation | Expected appearance | Main use | Important limitation |
|---|---|---|---|
| Grayscale | Shades of gray without original colors | Simplifying intensity-based analysis | Removes color distinctions |
| Gaussian blur | Smoother image with reduced fine detail | Noise reduction and preprocessing | Can soften meaningful edges |
| Canny edges | Thin lines around intensity boundaries | Boundary and shape analysis | Sensitive to thresholds and noise |

### 6.1 Image Comparison

After running the example, upload `comparison.png` into the GitHub repository and display it here:

```markdown
![Original image and three processing results](comparison.png)
```

*Do not present this placeholder as an actual experimental screenshot until the program has been run.*

### 6.2 Suggested Observations

For grayscale conversion, inspect whether areas with different colors become similar in brightness. For Gaussian blur, look for reduced fine texture and softened boundaries. For Canny edge detection, examine whether the major object outlines are visible and whether unwanted texture produces extra lines. These observations should be updated to describe the actual input image once results are available.

## 7. Conclusion

Image processing with Python offers a practical introduction to transforming and analyzing digital images. OpenCV provides ready-to-use functions for common operations, allowing students to focus on understanding what each transformation does and when it is appropriate.

This article compared grayscale conversion, Gaussian blur, and Canny edge detection. Grayscale conversion reduces color information, Gaussian blur smooths local intensity variations, and Canny edge detection identifies strong intensity boundaries. The methods are complementary rather than interchangeable, and each has limitations that must be considered when selecting an approach.

The article provides a reproducible example and a proposed framework for comparing visual outputs. A complete experimental report would additionally require running the program, inserting genuine output images, and discussing the observed results. These steps are necessary before claiming that any practical experiment has been completed.

## 8. References

1. Gonzalez, R. C., & Woods, R. E. (2018). *Digital Image Processing* (4th ed.). [Pearson](https://www.pearson.com).
2. Canny, J. (1986). A computational approach to edge detection. *IEEE Transactions on Pattern Analysis and Machine Learning*, PAMI-8(6), 679-698. [IEEE Xplore](https://ieeexplore.ieee.org/document/4767851).
3. Sonka, M., Hlavac, V., & Boyle, R. (2014). *Image Processing, Analysis, and Machine Learning* (4th ed.). [Cengage Learning](https://www.cengage.com).
4. OpenCV. (n.d.). Basic operations on images. *OpenCV Documentation*. https://docs.opencv.org/4.x/d3/df2/tutorial_py_basic_ops.html
5. OpenCV. (n.d.). Smoothing images. *OpenCV Documentation*. https://docs.opencv.org/4.x/d4/d13/tutorial_py_filtering.html
6. OpenCV. (n.d.). Canny edge detection. *OpenCV Documentation*. https://docs.opencv.org/4.x/da/d22/tutorial_py_canny.html

## 9. YouTube Demonstration

**Video link:** [Add your YouTube demonstration link here](https://www.youtube.com/)

A suitable demonstration would explain the selected image, show how the program runs, compare the generated outputs, and summarize the purpose of each technique.

---

**Submission note:** This is a research-based article draft, not a completed experimental report. Confirm that this image-processing topic is accepted for the relevant assignment before submitting.
