---
author: Joy Paulsen
title: Image Thresholding with Otsu's Method
date: 2024-10-01
description: A simple, fast, and surprisingly useful image thresholding algorithm
math: true
ShowBreadCrumbs: true
draft: true
---

#

There are many situations where we are interested in separating an image into foreground - some kind of area of interest - and background. Thresholding is one of the simplest ways to accomplish this. The goal is to separate an image into 2 classes. A global threshold is going to classify each pixel according to whether they are below or above the threshold.

![A grayscale test image](./images/image.png#center "A grayscale test image")

![Histogram of the grayscale test image](./images/image_histogram.png#center "Histogram of the grayscale test image")

![Histogram of the grayscale test image](./images/image_histogram_classes.png#center "Histogram of the grayscale test image")

![Thresholded binary image](./images/binary_image.png#center "Thresholded binary image")

![Intra-class variance](./images/intraclass_variance.png#center "Intra-class variance")
