---
title: Introduction to differential privacy with OpenDP and DP Wizard
author: Chuck McCallum, software developer with the OpenDP Project at SEAS
---

## Outline

- Who cares about privacy?
- Class grades example
- **Coin flipping exercise**
- Models of differential privacy
- Privacy budgets
- **DP Wizard exercise**
- OpenDP intro
- **Is DP the right tool?**

## Who cares about privacy?

And what is my background?

### Harvard Herbaria (2013-2014)

Rare plants might only be known to grow in specific locations.
What geographic information can be public without giving too much away to poachers?

### Gehlenborg Lab at HMS (2016-2022)

Medical knowledge advances by generalizing from unique stories.
How can we respect the privacy of individuals while still supporting research?
Can labs without access to the original data still reproduce results?

### OpenDP Team at SEAS (2023-present)

Why I'm here!

### Old North Church (2023-present)

Debates about taxation and representation were central to the revolution! Taxes and the apportionment of representatives depend on personal information, information that people may be reluctant to volunteer. 

## Class grades problem

I'm in a class of 40 people, and the class average at midterm is 90.
I drop the class, and the teacher announces the average is now 91.
Can the other students figure out my grade?

## Class grades solution

I'm in a class of 40 people, and the class average at midterm is 90.
I drop the class, and the teacher announces the average is now 91.
Can the other students figure out my grade?

**Yes!**

```
>>> class_size = 40
>>> mean_with_me = 90.0
>>> mean_without_me = 91.0

>>> # total_without_me / (class_size - 1) = mean_without_me
>>> total_without_me = (class_size - 1) * mean_without_me

>>> # (me + total_without_me) / class_size = mean_with_me
>>> me = mean_with_me * class_size - total_without_me
>>> me
51.0

```

This "solution" is a problem! What could the teacher have done instead?

*Differential privacy* suggests adding calibrated noise before releasing statistics.

## Class grades solution problem solution problems!

Ok, but what does "adding calibrated noise" even mean?

- What probability distribution?
  - Typically Laplace or Gaussian, but hopefully this is handled for you.
- How is it calibrated?
  - There's a tradeoff between 