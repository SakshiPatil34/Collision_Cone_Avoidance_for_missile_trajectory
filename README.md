# 🚀 **Collision Avoidance of Missiles Using Collision Cone Approach**  

📍 **IIT Bombay Internship | May '23 - June '23**  

This repository contains work from my internship at **IIT Bombay**, focusing on the implementation and analysis of **collision avoidance algorithms** for missiles. The project primarily leverages the **Collision Cone Algorithm** combined with control strategies to ensure safe and efficient trajectory planning.  

---

## **Table of Contents**  
- 🌟 [Overview](#overview)  
- 🛠️ [Features](#features)  
- 📚 [Dependencies](#dependencies)  
- 📊 [Key Results](#key-results)  
- 🚀 [Getting Started](#getting-started)  
- 🔍 [Details of the Approach](#details-of-the-approach)  
- 📈 [Future Enhancements](#future-enhancements)  
- 🤝 [Contributions](#contributions)  
- 📜 [License](#license)  

---

## 🌟 **Overview**  
The goal of this project was to design and test a **collision avoidance system** for missiles using **geometry-based methods**. Key tasks included:  
- Conducting a comprehensive **literature review** of collision avoidance methods.  
- Integrating the **Collision Cone Algorithm** with a **Proportional Controller**.  
- Simulating **robot and obstacle trajectories** in MATLAB to validate the approach.  

---

## 🛠️ **Features**  
- **Geometry-Based Collision Avoidance**: Focused on simplicity and computational efficiency.  
- **Proportional Control Integration**: To dynamically adjust missile trajectories.  
- **MATLAB Simulations**: Visualizations of missile and obstacle paths.  
- Robust framework for evaluating safety in high-stakes environments.  

---

## 📚 **Dependencies**  
To run the MATLAB scripts, ensure you have:  
- **MATLAB R2021b** (or later)  
- Toolboxes:  
  - **Aerospace Toolbox**  
  - **Optimization Toolbox**  

Optional: `matplotlib` (Python) for additional visualizations.  

---

## 📊 **Key Results**  
- Successfully demonstrated **collision-free trajectories** for dynamic obstacles.  
- Validated the **efficiency of the collision cone algorithm** under varying conditions.  
- Generated visually intuitive **trajectories and collision scenarios** for analysis.  

---

## 🚀 **Getting Started**  
1. Clone the repository:  

   ```bash  
   git clone https://github.com/your-username/collision-cone-approach.git  
   cd collision-cone-approach  
   ```  

2. Open the MATLAB project file (`CollisionAvoidance.prj`).  
3. Run `main.m` to simulate the collision avoidance scenarios.  

---

## 🔍 **Details of the Approach**  
1. **Collision Cone Algorithm**  
   - Derived from the geometry of relative velocity.  
   - Defines a "cone of danger" to avoid.  

2. **Proportional Controller**  
   - Adjusts missile heading dynamically.  
   - Ensures quick convergence to a safe path.  

3. **Trajectory Generation**  
   - **Missile:** Starts from an initial position with a target in sight.  
   - **Obstacle:** Moves dynamically in pre-defined patterns.  

---

## 📈 **Future Enhancements**  
- Extend the approach to **3D collision avoidance**.  
- Incorporate **machine learning techniques** for adaptive trajectory planning.  
- Explore **nonlinear controllers** for faster and smoother responses.  
- Application to **multi-agent collision avoidance systems**.  

---

## 🤝 **Contributions**  
Contributions are welcome! Please feel free to open issues or suggest improvements.  

1. Fork this repository.  
2. Create your feature branch (`git checkout -b feature-name`).  
3. Commit your changes (`git commit -m 'Add feature'`).  
4. Push to the branch (`git push origin feature-name`).  
5. Open a pull request.  

---

## 📜 **License**  
This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.  
