---
author: Joy Paulsen
title: The Idea Behind GANs
date: 2024-03-24
description: Get an intuitive understanding of a foundational generative model
math: true
ShowBreadCrumbs: true
draft: true
---

# Intro

Generative Adversarial Networks (GANs from here on out) were one of the first generative models to attract attention from outside the ML community because of impressive results, making it foundational to understanding today's generative model landscape. Originally [proposed in 2014](https://arxiv.org/abs/1406.2661), this general deep learning framework has acheived success in multiple modalities. Arguably, the most well-known examples have been image generation models, so that's what we'll look at today.

The key distinguishing feature of GANs and other generative models from other types of models is that they are often attempting to generate a product to be consumed, rather than the typical regression or classification task in ML. Using the example of an image - the model's goal would be to generate an image, rather than classify that image, detect objects within the image, or any other standard computer vision task.


## The Learning Game

One of the reasons GANs are a fun topic to study is that at its core is an incredibly clever idea: an *adversarial* learning process. 

Imagine that we have successfully designed a deep neural network that can generate realistic images. Great! But... how do we train it? We would need some way to quantify how realistic an image looks to implement a training process, otherwise there would be no way to formulate a loss function to iteratively minimize. This presents a real challenge because with a generative model we don't want to just reproduce existing images, we want to generate images that didn't previously exist - entirely new samples. Needless to say, there is not one single metric that captures the "realness" of an image.

The solution the creators of GANs came up with was to add another model to the mix, but this one has a simpler job. We want it to learn to classify an image as one of two classes, real or fake. To do this we need to gather some extra training data in the form of real images. Then we will feed both real samples and fake sample produced by the Generator, and train the two models alongside each other. The Generator provides the Discriminator with training data, and the Discriminator forms a feedback loop to tell the Generator if its output is realistic or not.




You might notice when thinking about this learning setup that there needs to be a balance struck between our two models. If our Generator is really good at producing realistic images, then our Discriminator will be fooled every time from the start and no learning will happen. On the other hand if our Discriminator expertly classifies each images correctly from the start, the Generator won’t get any useful feedback. We need both models to be good at their tasks, but we can’t let either one outpace the other. 

To balance these conflicting goals need a learning game. This is where the Adversarial in Generative Adversarial Network comes in! Both models get trained simultaneously, continuously learning to outsmart the other one. The Discriminator will gradually get better at spotting fakes as the Generator gradually produces better fakes. The term adversarial is used to describe the fact that these two models have competing goals that work together.


Sharon Zhou art forger and critic


# High-Level Model Architecture


## The Generator

Let’s flesh out the image generation example a little more. And instead of starting from the beginning, let’s start in the middle: imagine that we have built a neural network that can generate images for the real world us (think of images that resemble photos, like images of realistic looking people or objects). We’ll call it the Generator. To train it, we need to someway to measure how realistic the images look. But there’s a problem - how can we quantify that? With our eyes we can judge how realistic its output looks but that’s not scalable (or reliable). We need some way to measure our network’s ability to generate realistic output that can be integrated into the training process so the Generator can iteratively improve itself and produce more realistic output. Why not throw another network at the problem while we’re at it?



## The Discrimator

We are going to add another model to the mix, but this one has a simpler job. We want it to learn to classify an image as one of two classes, real or fake. To do this we need to gather some extra training data in the form of real images. Then we will feed both real samples and fake sample produced by the Generator, and train the two models alongside each other. The Generator provides the Discriminator with training data, and the Discriminator forms a feedback loop to tell the Generator if its output is realistic or not.


When the models have been trained, we usually are just interested in the Generator because our original goal was to produce realistic looking images and that what it does! Although we likely won’t use the Discriminator after training is complete, it play an incredibly important role in the training process. Although this is only the most basic setup for a GAN, much of the research surrounding them has been stabilizing the training process and extending them to generate different kinds of outputs (they are not just for images!), so the core of the problem remains an essential piece.

How Good are They?

References

- Original Gan paper



# Out in the Wild


## The Bad and the Ugly

cautionary tales
Obama upsampling fiasco

