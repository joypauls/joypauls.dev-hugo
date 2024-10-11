---
author: Joy Paulsen
title: The Singular Value Decomposition
date: 2024-10-03
description: Understanding the SVD
tags:
  - math
  - signals
math: true
ShowBreadCrumbs: true
hideSummary: true
draft: true
---

The singular value

## The Big Idea

The SVD technique is specific to matrices, but it is a wonderful illustration of the core principle behind many techniques in science and engineering. At its heart, what it is doing is expressing data in an alternative and mathematically interesting representation, allowing us to study it through a different lens.

### The Math

$$
A = U\Sigma V^{T}
$$

### Orthogonal Basis

## Compression

### Low-Rank Matrix Approximation

## SVD In Practice

Although it does the job admirably, the SVD isn't used out in the wild for image compression (although its optimal low-rank matrix approximation capabilities do come in handy in certain types of [recommender systems](https://en.wikipedia.org/wiki/Recommender_system) in industry). However the core idea we explored - transforming a signal so that it is expressed in a convenient and useful basis - is fundamental to modern image compression techniques such as the JPEG standard.
