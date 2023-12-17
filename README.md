MATLAB code used for computational analysis of the oculomotor neural integrator as described in:  

Anastasio TJ (1998) Nonuniformity in the linear network model of the oculomotor integrator produces approximately fractional-order dynamics and more realistic neuron behavior. Biological Cybernetics. 79:377-391  

The starting point is the neural network model of the oculomotor integrator originally proposed by Cannon, Robinson, and Shamma:  

Cannon SC, Robinson DA, Shamma S (1983) A proposed neural network for the integrator of the oculomotor system. Biological cybernetics. 49:127-136

The Cannon Integrator (for short) works through reciprocal inhibition, and each neuron in the network inhibits its neighbors using the same Gaussian profile. The very simple dynamic behavior of the Cannon Integrator results from the uniformity of these connections. As shown in Anastasio (1998), disruption of this uniformity unleashes the dynamic richness of the network and results in model neurons having much more realistic behavior. The mfiles in this repository construct the Cannon Integrator and analyze it using impulse and frequency responses and eigenmode decomposition. Users are invited to disrupt the uniformity of the connectivity matrix (a) in any way they wish.  

The following is a list of the mfiles and what they do:  

cansetup.m -- sets up the Cannon Integrator with and without circular boundary conditions  
(note: the original Cannon-Robinson-Shamma integrator had circular boundary conditions.)  



