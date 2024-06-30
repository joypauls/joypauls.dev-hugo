---
author: Joy Paulsen
title: Contrast Enhancement
date: 2024-06-22
description: A quick guide to the intuition behind a foundational image enhancement task
math: true
ShowBreadCrumbs: true
hideSummary: true
draft: true
---

## Contrast

Take a look at this image of a plant growing among the boulders of Joshua Tree National Park. While there is nothing particularly terrible about, it does look a little dull and flat. It’s darkest regions are not very dark, and it’s brightest regions are not very bright. Another way to say this is that it lacks contrast. Contrast can refer to several different artistic aspects of an image such as color or texture, but here we are specifically looking at contrast in terms of pixel brightness.

![A grayscale test image](./images/original.jpg#center "A grayscale test image")

Let’s increase the contrast of the image a little bit:

![A grayscale test image](./images/contrast_enhanced.jpg#center "A grayscale test image")

Much better! Even with a small adjustment there is more depth to the image. Darker shadows and brighter highlights.

## The Histogram

Returning to the original image, checking the histogram of pixel intensities reveals why it feels flat and dull. Since a color image is more complex to work with, the luminance (footnote) histogram is used here to demonstrate. In a typical 8-bit grayscale image, there are 256 possible values a pixel can take on.

![A grayscale test image](./images/original_histogram.png#center "A grayscale test image")

This explains why we noticed the image had weak shadows and highlights. Most of the pixels have a “medium” brightness level, and so the histogram is crowded near the middle.

The histogram of the contrast-enhanced image has the answer:

![A grayscale test image](./images/contrast_enhanced_histogram.png#center "A grayscale test image")

Indeed, the contrast-enhanced histogram is *stretched* with values spread toward 0 and toward 255. That is exactly what it means to increase contrast.

## Math

There are many different algorithms that exist for modifying the contrast of an image, and some are quite complicated. But what they all have in common is that they all have the same goal we already discovered: stretching an image’s histogram. The simplest approach is to simply apply a function to each of the pixels in the image. This is know as a **point operation** and is one of the simplest way to modify an image.

For a given image $I$, suppose we apply a linear function:

$$
f(I) = a * I + b
$$

When a is greater than 1, the image’s histogram will be stretched and we’ll see it’s contrast increase. You can think of this as the difference between pixels being multiplied. Modifying b in the equation will directly add or remove brightness from the image - this is needed to offset the fact that a positive value of a also increases the total brightness and that might not be desired.

To create the contrast-enhanced image from the beginning, the following equation was used:

$$
f(I) = 1.7 * I -90
$$

One issue with this method is that it is not easy to find the right values for a and b, it requires experimentation. While there are methods to automatically choose them, more advanced methods involve applying non-linear functions for more subtle effects.


