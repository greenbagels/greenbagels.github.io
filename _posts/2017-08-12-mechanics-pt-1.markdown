---
layout: post
title:  "Mechanics, Part I: Generalized Coordinates, the Principle of Stationary Action, and the Lagrangian "
date:   2017-08-12 19:21:59 -0400
categories: physics college research
---
(**Note:** This is the first part of a series of blog posts accompanying my reading through L.D. Landau and E.M. Lifshits'z *Course of Theoretical Physics*)

We begin our discussion of mechanics by examining (systems of) particles whose positions in space can be described using a radius vector \\(\vec{r}\\) whose Cartesian components are the \\(x\\), \\(y\\), and \\(z\\) coordinates.
We further denote the *velocity* of a particle as the first time-derivative \\(\frac{\text{d}}{\text{d}t}(\vec{r})\\) and the *acceleration* of a particle as the second time-derivative \\(\frac{\text{d}^2}{\text{d}t^2}(\vec{r})\\).

Simple enough &mdash; most individuals who have been exposed to a calculus-based physics course (or just a calculus class in general) will remember similar definitions as basic applications of derivatives.
For consistency sake, we will adopt Newton's notation for differentiation (as is common in physics applications) by denoting time derivatives with dots over quantities (i.e. \\(\vec{v} \equiv \dot{\vec{r}}\\))

Naturally it arises that we must describe the state of a system with \\(N\\) particles as a function of some *degrees of freedom*, a number of quantities that completely determine a given system's state (quite a tautology, I know). To do so, we must specify \\(N\\) position vectors, or equivalently, \\(3N\\) coordinates. Note that such coordinates need not be Cartesian, as spherical, cylindrical, or any other curvilinear coordinate system would also work to represent particles in space (well, most curvilinear coordinates will require more delicate treatment, but we'll address those as we arrive).

A set of coordinates \\(\vec{q} \equiv (q_1, q_2, ..., q_n)\\) that uniquely define the state of a system (with \\(n\\) degrees of freedom) are known as *generalized coordinates*, and their time-derivatives are known as *generalized velocities*, as is expected.
While necessary, knowing the values of only the generalized cordinates of a system are not enough to fully determine the system's *mechanical state*.
For example, looking at a picture of billiard balls on a pool table is not enough to know the subsequent motion of all the balls on the table.

It turns out that the combined set of generalized coordinates and velocities *are*, however, sufficient to determine the mechanical state of the system as a result of the **principle of stationary action** (also known as the **principle of least action**).
Let's suppose there exists some function \\(L(\vec{q}, \dot{\vec{q}}, t)\\) that describes a mechanical system, and that the system occupies two configurations \\(\vec{q}({t_1})\\) and \\(\vec{q}({t_2})\\) at two distinct times \\(t_1\\) and \\(t_2\\).
Then, there also exists a functional \\(\mathcal{S} \equiv \int_{t_1}^{t_2} L(\vec{q},\dot{\vec{q}},t)\\) known as the **action**.

The function \\(L\\) is known as the Lagrangian of the system and is commonly defined for closed, mechanical systems to be \\(T-U\\), where \\(T\\) and \\(U\\) represent the system's kinetic and potential energy, respectively.
The principle of stationary action states that the system will evolve in such a way that the action \\(\mathcal{S}\\) is unchanging (stationary), which can only occur at an extremum or saddle point.

Now we start our derivation of the equations of motion.
If we let \\(\vec{q}(t)\\) be a function for which the action functional is minimal, then we can arbitrarily replace \\(\vec{q}(t)\\) with a function 

\\[
  \vec{q}(t) + \vec{\delta q}(t)
\\]

where \\(\vec{\delta q}(t)\\) is some arbitrary variation of \\(\vec{q}(t)\\) such that it is small and positive within \\((t_1, t_2)\\).
Our variation requirement that \\(\vec{q}(t_i)+\vec{q}(t_i) = \vec{q}(t_i)\\) for \\(t_i = t_1, t_2\\) means that \\(\delta\vec{q}(t_1) = \delta\vec{q}(t_2) = 0\\)

We could write write that \\(\mathcal{S}[\vec{q}(t)+\delta\vec{q}(t)]-\mathcal{S}[\vec{q}(t)]=0\\) to satisfy our condition of the action being stationary, but we elect to write it in the form

\\[
  \delta\mathcal{S} = \delta \int_{t_1}^{t_2}L(\vec{q},\dot{\vec{q}},t) = 0
\\]

We break down the problem into looking at one individual component for now, but we'll combine everything into the whole picture later.

\\[
  \int_{t_1}^{t_2}\left(\frac{\partial L}{\partial q}\delta q + \frac{\partial L}{\partial\dot q}\delta\dot{q}\right)\text{d}t = 0
\\]

Keeping in mind the fact that \\(\delta\dot{q}=\frac{d}{dt}(\delta q)\\), we can integrate the second term by parts to get

$$
\delta\mathcal{S}\left[q\right] = \left[\frac{\partial L}{\partial\dot{q}}\delta q\right]_{t_1}^{t_2} + \int_{t_1}^{t_2}\left(\frac{\partial L}{\partial q}-\frac{\text{d}}{\text{d}t}\frac{\partial L}{\partial \dot{q}}\right)\delta q\,\text{d}t = 0
$$

The first term in this equation must vanish, provided our earlier realization about \\(\delta q(t)\\) being zero at the endpoints of our interval.
Additionally, the requirement that the action be stationary means that the integral on the right must be zero regardless of our choice of \\(\delta q\\) in our small change of \\(\mathcal{S}\\).
The only solution is that the integrand itself is zero, which leaves us with

\\[
\frac{\text{d}}{\text{d}t}\left(\frac{\partial L}{\partial \dot{q}}\right) - \frac{\partial L}{\partial q} = 0
\\]

Naturally we can generalize this equation to some arbitrary \\(n\\) degrees of freedom, as we can vary the \\(n\\) different actions \\(\mathcal{S}[q_{i}(t)]\\). Then we obtain the \\(n\\) **Euler-Lagrange equations**

$$
\frac{\text{d}}{\text{d}t}\left(\frac{\partial L}{\partial \dot{q}_{i}}\right) - \frac{\partial L}{\partial q_{i}} = 0 \hspace{2em} \forall \, i \in \{1,2,...,n\})
$$

These equations are second-order differential equations that are an analogous formulation to Newton's second law.
In other words, "if the Lagrangian of a given mechanical system is known, the equations ... give the relations between accelerations, velocities, and coordinates, i.e. they are the equations of motion of the system" [^1].

In the near future the Lagrangian formulation of mechanics will allow us to solve mechanical problems without having to focus on constraining forces in problems like beads on hoops, which helps simplify the math greatly.
In the longer run I've been convinced that it reveals more elegance and symmetry about physical phenomena (something Noether something Feynman), but I've not enough knowledge or experience to actually comment on that first-hand.

[^1]: Landau, L.D., and Lifshitz, E.M., *Course of Theoretical Physics: Volume 1, Mechanics*, 3 (1960).
