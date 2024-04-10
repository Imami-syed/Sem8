#!/usr/bin/env python
# coding: utf-8

# In[25]:


import numpy as np
import matplotlib.pyplot as plt

def random_matrix(S, d, C, sigma):
    M = np.zeros((S, S))
    for i in range(S):
        for j in range(S):
            if i != j:
                p = np.random.uniform(0, 1)
                if p <= C:
                    M[i, j] = np.random.normal(0, sigma)
    np.fill_diagonal(M, -d)
    return M

def predator_prey_matrix(S, d, C, sigma):
    M = np.zeros((S, S))
    for i in range(S):
        for j in range(i+1, S):
            p1 = np.random.uniform(0, 1)
            if p1 <= C:
                p2 = np.random.uniform(0, 1)
                if p2 <= 0.5:
                    M[i, j] = np.abs(np.random.normal(0, sigma))
                    M[j, i] = -np.abs(np.random.normal(0, sigma))
                else:
                    M[i, j] = -np.abs(np.random.normal(0, sigma))
                    M[j, i] = np.abs(np.random.normal(0, sigma))
    np.fill_diagonal(M, -d)
    return M

def competition_mutualism_matrix(S, d, C, sigma):
    M = np.zeros((S, S))
    for i in range(S):
        for j in range(i+1, S):
            p1 = np.random.uniform(0, 1)
            if p1 <= C:
                p2 = np.random.uniform(0, 1)
                if p2 <= 0.5:
                    M[i, j] = np.abs(np.random.normal(0, sigma))
                    M[j, i] = np.abs(np.random.normal(0, sigma))
                else:
                    M[i, j] = -np.abs(np.random.normal(0, sigma))
                    M[j, i] = -np.abs(np.random.normal(0, sigma))
    np.fill_diagonal(M, -d)
    return M

def plot_eigenvalues(M, title):
    eigenvalues = np.linalg.eigvals(M)
    plt.scatter(np.real(eigenvalues), np.imag(eigenvalues), label=title, s=2)

# Parameters
S = 250
d = 1
C = 0.25
sigma = 1
num_matrices = 10




# In[28]:


for _ in range(num_matrices):
    M_random = random_matrix(S, d, C, sigma)
    plot_eigenvalues(M_random, 'Random')

# Add circle with radius sigma*(S*C)^1/2
circle_radius = sigma * np.sqrt(S * C)
circle = plt.Circle((-1*d, 0), radius=circle_radius, color='b', fill=False)
plt.gca().add_patch(circle)

plt.title('Eigenvalues of Random Matrices')
plt.xlabel('Real Part')
plt.ylabel('Imaginary Part')
plt.gca().set_aspect('equal', adjustable='box')
plt.xlim(-20, 20)
plt.ylim(-20, 20)
plt.show()


# In[37]:


for _ in range(num_matrices):
    M_predator_prey = predator_prey_matrix(S, d, C, sigma)
    plot_eigenvalues(M_predator_prey, 'Predator-Prey')

plt.title('Eigenvalues of Predator-Prey Matrices')
plt.xlabel('Real Part')
plt.ylabel('Imaginary Part')
plt.gca().set_aspect('equal', adjustable='box')
plt.xlim(-20, 20)
plt.ylim(-20, 20)
plt.show()


# In[38]:


for _ in range(num_matrices):
    M_competition_mutualism = competition_mutualism_matrix(S, d, C, sigma)
    plot_eigenvalues(M_competition_mutualism, 'Mixture')

plt.title('Eigenvalues of Mixture of Competition and Mutualism Matrices')
plt.xlabel('Real Part')
plt.ylabel('Imaginary Part')
plt.xlim(-20, 20)
plt.ylim(-20, 20)
plt.gca().set_aspect('equal', adjustable='box')
plt.show()


# In[9]:


import numpy as np
import matplotlib.pyplot as plt


def random_matrix2(S, C, sigma):
    M = np.zeros((S, S))
    for i in range(S):
        for j in range(S):
            if i != j:
                p = np.random.uniform(0, 1)
                if p <= C:
                    M[i, j] = np.random.normal(0, sigma)
    np.fill_diagonal(M[:S//2, :S//2], -10)
    np.fill_diagonal(M[S//2:, S//2:], 10)
    return M

def predator_prey_matrix2(S, C, sigma):
    M = np.zeros((S, S))
    for i in range(S):
        for j in range(i+1, S):
            p1 = np.random.uniform(0, 1)
            if p1 <= C:
                p2 = np.random.uniform(0, 1)
                if p2 <= 0.5:
                    M[i, j] = np.abs(np.random.normal(0, sigma))
                    M[j, i] = -np.abs(np.random.normal(0, sigma))
                else:
                    M[i, j] = -np.abs(np.random.normal(0, sigma))
                    M[j, i] = np.abs(np.random.normal(0, sigma))
    np.fill_diagonal(M[:S//2, :S//2], -10)
    np.fill_diagonal(M[S//2:, S//2:], 10)
    return M

def competition_mutualism_matrix2(S, C, sigma):
    M = np.zeros((S, S))
    for i in range(S):
        for j in range(i+1, S):
            p1 = np.random.uniform(0, 1)
            if p1 <= C:
                p2 = np.random.uniform(0, 1)
                if p2 <= 0.5:
                    M[i, j] = np.abs(np.random.normal(0, sigma))
                    M[j, i] = np.abs(np.random.normal(0, sigma))
                else:
                    M[i, j] = -np.abs(np.random.normal(0, sigma))
                    M[j, i] = -np.abs(np.random.normal(0, sigma))
    np.fill_diagonal(M[:S//2, :S//2], -10)
    np.fill_diagonal(M[S//2:, S//2:], 10)
    return M

def plot_eigenvalues(M, title):
    eigenvalues = np.linalg.eigvals(M)
    plt.scatter(np.real(eigenvalues), np.imag(eigenvalues), label=title, s=2)


# In[23]:


S = 250
d = 1
C = 0.25
sigma = 1
num_matrices = 10

for _ in range(num_matrices):
    M_random = random_matrix2(S, C, sigma)
    plot_eigenvalues(M_random, 'Random')

plt.title('Eigenvalues of Random Matrices')
plt.xlabel('Real Part')
plt.ylabel('Imaginary Part')
plt.gca().set_aspect('equal', adjustable='box')
plt.xlim(-20, 20)
plt.ylim(-20, 20)
plt.show()

for _ in range(num_matrices):
    M_predator_prey = predator_prey_matrix2(S, C, sigma)
    plot_eigenvalues(M_predator_prey, 'Predator-Prey')

plt.title('Eigenvalues of Predator-Prey Matrices')
plt.xlabel('Real Part')
plt.ylabel('Imaginary Part')
plt.gca().set_aspect('equal', adjustable='box')
plt.xlim(-20, 20)
plt.ylim(-20, 20)
plt.show()

for _ in range(num_matrices):
    M_competition_mutualism = competition_mutualism_matrix2(S, C, sigma)
    plot_eigenvalues(M_competition_mutualism, 'Mixture')

plt.title('Eigenvalues of Mixture of Competition and Mutualism Matrices')
plt.xlabel('Real Part')
plt.ylabel('Imaginary Part')
plt.xlim(-25, 25)
plt.ylim(-25, 25)
plt.gca().set_aspect('equal', adjustable='box')
plt.show()


# In[19]:


def random_matrix3(S, C, sigma):
    M = np.zeros((S, S))
    for i in range(S):
        for j in range(S):
            if i != j:
                p = np.random.uniform(0, 1)
                if p <= C:
                    M[i, j] = np.random.normal(0, sigma)
    diag_values = np.random.exponential(scale = 5, size=S)
    M[np.diag_indices(S)] = diag_values
    return M

def predator_prey_matrix3(S, C, sigma):
    M = np.zeros((S, S))
    for i in range(S):
        for j in range(i+1, S):
            p1 = np.random.uniform(0, 1)
            if p1 <= C:
                p2 = np.random.uniform(0, 1)
                if p2 <= 0.5:
                    M[i, j] = np.abs(np.random.normal(0, sigma))
                    M[j, i] = -np.abs(np.random.normal(0, sigma))
                else:
                    M[i, j] = -np.abs(np.random.normal(0, sigma))
                    M[j, i] = np.abs(np.random.normal(0, sigma))
    diag_values = np.random.exponential(scale = 5, size=S)
    M[np.diag_indices(S)] = diag_values
    return M

def competition_mutualism_matrix3(S, C, sigma):
    M = np.zeros((S, S))
    for i in range(S):
        for j in range(i+1, S):
            p1 = np.random.uniform(0, 1)
            if p1 <= C:
                p2 = np.random.uniform(0, 1)
                if p2 <= 0.5:
                    M[i, j] = np.abs(np.random.normal(0, sigma))
                    M[j, i] = np.abs(np.random.normal(0, sigma))
                else:
                    M[i, j] = -np.abs(np.random.normal(0, sigma))
                    M[j, i] = -np.abs(np.random.normal(0, sigma))
    diag_values = np.random.exponential(scale = 5, size=S)
    M[np.diag_indices(S)] = diag_values
    return M


# In[22]:


S = 250
d = 1
C = 0.25
sigma = 1
num_matrices = 10

for _ in range(num_matrices):
    M_random = random_matrix3(S, C, sigma)
    plot_eigenvalues(M_random, 'Random')

plt.title('Eigenvalues of Random Matrices')
plt.xlabel('Real Part')
plt.ylabel('Imaginary Part')
plt.gca().set_aspect('equal', adjustable='box')
plt.show()

for _ in range(num_matrices):
    M_predator_prey = predator_prey_matrix3(S, C, sigma)
    plot_eigenvalues(M_predator_prey, 'Predator-Prey')

plt.title('Eigenvalues of Predator-Prey Matrices')
plt.xlabel('Real Part')
plt.ylabel('Imaginary Part')
plt.gca().set_aspect('equal', adjustable='box')
plt.show()

for _ in range(num_matrices):
    M_competition_mutualism = competition_mutualism_matrix3(S, C, sigma)
    plot_eigenvalues(M_competition_mutualism, 'Mixture')

plt.title('Eigenvalues of Mixture of Competition and Mutualism Matrices')
plt.xlabel('Real Part')
plt.ylabel('Imaginary Part')
plt.gca().set_aspect('equal', adjustable='box')
plt.show()

