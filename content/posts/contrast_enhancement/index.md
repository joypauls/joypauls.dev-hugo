---
author: Joy Paulsen
title: Contrast Enhancement for Beginners
date: 2024-06-22
description: A quick guide to the intuition and math behind a foundational image enhancement task
tags:
  - image processing
  - beginners
math: true
ShowBreadCrumbs: true
hideSummary: true
draft: false
---

## Contrast

Take a look at this photo of a Goldenbush plant growing among the boulders of Joshua Tree National Park. While there is nothing particularly terrible about the image, it does look a little dull and flat. It’s darkest regions are not very dark, and it’s brightest regions are not very bright. Another way to say this is that it lacks contrast. _Contrast_ can refer to several different artistic aspects of an image such as color or texture, but here we are specifically looking at contrast in terms of brightness.

![A grayscale test image](./images/original.jpg#center "A grayscale test image")

Let’s increase the contrast of the image a little bit:

![A grayscale test image](./images/contrast_enhanced.jpg#center "A grayscale test image")

Much better! Even with a small adjustment there is more depth to the image: darker shadows and brighter highlights. You may have noticed this using the contrast slider on Instagram, Photoshop, or virtually any other editing software. Increasing the contrast tends to make shadows and highlights pop and colors just a little bit more vibrant. What is happening to the image to achieve this effect?

## Histogram Stretching

Returning to the original image, we can check the histogram of pixel intensities to reveal why it feels flat and dull. Note that since a color image is more complex to work with, the [lightness](https://en.wikipedia.org/wiki/Lightness) histogram is used to illustrate the concept. If you're unfamiliar, think of lightness as a measure of how bright a pixel is, independent of its color. In a typical 8-bit grayscale image, there are 256 possible values a pixel can take on, so the x-axis shows that the darkest possible pixel has a value of 0 and the brightest possible pixel has a value of 255.

![A grayscale test image](./images/original_histogram.png#center "A grayscale test image")

This explains why we noticed the image had weak shadows and highlights. Most of the pixels have a “medium” brightness level, and so the histogram is clustered near the middle. The red shaded bars show the ranges of values that are completely missing from the image, in this case the darkest and lightest values. You could say that this photo is not making use of the full _dynamic range_ available. That can be perfectly fine for artistic purposes, but it does tend to leave a photo looking flat.

Now take a look at the histogram after simple contrast enhancement:

![A grayscale test image](./images/contrast_enhanced_histogram.png#center "A grayscale test image")

Indeed, the contrast-enhanced histogram is _stretched_ with values spread all the way toward 0 and toward 255. That is exactly what it means to increase contrast.

## Math

There are many different algorithms that exist for modifying the contrast of an image, and some are quite complicated. But what they all have in common is that they all have the same goal we already discovered: stretching and spreading out an image’s histogram. One of the most straightforward approaches is to apply a function to each of the pixels. This is know as a point operation and is one of the simplest image processing techniques.

For a given image $I$, suppose we apply a linear function to each pixel of $I$:

$$
f(I) = a * I + b
$$

Because $a > 1$, the image’s histogram will be stretched and we’ll see it’s contrast increase. You can think of this as the difference between pixels being multiplied so that they spread out. Modifying $b$ in the equation will directly add or remove brightness from the image - this is needed to offset the fact that a value of $a$ greater than 1 also increases the total brightness, and that may not be desired.

To create the contrast-enhanced image shown in the beginning, the following equation was used:

$$
f(I) = 1.7 * I - 90
$$

### Contrast Reduction

Can we use the same principles to reduce the contrast of an image? Yes we can! Instead of $a > 1$, we just need to pick a value between 0 and 1.

The equation

$$
f(I) = 0.35 * I + 80
$$

produces the following image and histogram showing pixels squeezed into an even narrower range of values than the original image.

![](./images/contrast_reduced.jpg#center)

![](./images/contrast_reduced_histogram.png#center)

## Beyond

Now, as always, things aren't this simple in the real world. One major issue with this method is that it is not easy to find the right values for $a$ and $b$, it requires experimentation to achieve the desired effect. Another issue is that using a _linear_ function like we have here is a bit of a blunt mathematical instrument. While there are methods to automatically choose the parameters to make the process a bit more user-friendly, more advanced techniques involve applying _non-linear_ functions for more subtle modifications. No matter what technique is used, the goal of stretching the histogram remains the same.
