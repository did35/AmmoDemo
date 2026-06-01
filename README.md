# Ammunition Stock Simulation Dashboard

A SwiftUI dashboard prototype built with **Swift 6**, **SwiftUI**, **MVVM**, and **Apple Charts** to simulate ammunition consumption and remaining stock over time.

The purpose of this project is educational:

- Practice SwiftUI architecture
- Explore simulation logic
- Learn Apple Charts
- Apply high-level Swift functions
- Visualize resource depletion and endurance

---

# MARK: - Features

✅ Initial stock configuration

✅ Daily ammunition consumption configuration

✅ Remaining stock simulation

✅ Total ammunition used

✅ Operational endurance estimate

✅ Daily consumption chart

✅ Stock depletion chart

✅ MVVM architecture

✅ Apple Charts integration

---

# MARK: - Technologies

## Swift 6

Used for the simulation logic and application structure.

## SwiftUI

Provides the declarative user interface.

## Apple Charts

Used to visualize:

- ammunition usage
- remaining stock
- depletion trends

## MVVM

Separates:

```text
Model
↓
ViewModel
↓
View
```

Improving readability and maintainability.

---

# MARK: - Project Structure

```text
AmmoDashboard
│
├── Models
│   └── AmmoDay.swift
│
├── ViewModels
│   └── AmmoDashboardViewModel.swift
│
├── Views
│   ├── AmmoDashboardView.swift
│   ├── MetricCard.swift
│   └── GlassCard.swift
│
└── Resources
```

---

# MARK: - Data Model

The simulation uses a simple model:

```swift
struct AmmoDay: Identifiable {

    let id = UUID()

    let day: String
    let used: Int
    let remaining: Int
}
```

Each instance represents one simulated day.

---

# MARK: - ViewModel

The ViewModel contains the simulation logic.

```swift
@Observable
@MainActor
final class AmmoDashboardViewModel
```

Responsibilities:

- stock calculations
- simulation generation
- endurance estimation
- chart data preparation

---

# MARK: - Simulation Logic

The simulation starts with:

```swift
initialStock
```

and subtracts:

```swift
dailyUsage
```

for each day.

Example:

```text
Initial Stock: 10000

Day 1
Used: 850
Remaining: 9150

Day 2
Used: 850
Remaining: 8300

Day 3
Used: 850
Remaining: 7450
```

until the simulation period ends.

---

# MARK: - High-Level Swift Functions

This project intentionally uses modern Swift data transformation techniques.

---

## map()

Generates simulation entries.

```swift
(1...14).map { day in
    ...
}
```

Transforms:

```text
Day Number
↓
AmmoDay
```

---

## reduce()

Calculates total ammunition used.

```swift
simulation.reduce(0) { $0 + $1.used }
```

Transforms:

```text
Many Values
↓
One Total
```

---

## filter()

Calculates operational endurance.

```swift
simulation
    .filter { $0.remaining > 0 }
    .count
```

Keeps only valid operational days.

---

# MARK: - User Interface

The dashboard contains:

## Header

Provides context for the simulation.

---

## Controls

Allows modification of:

- Initial stock
- Daily consumption

using SwiftUI steppers.

---

## Metrics

Displays:

- Initial stock
- Total used
- Remaining stock
- Endurance

using reusable cards.

---

## Charts

Visualizes simulation results.

---

# MARK: - Daily Usage Chart

Uses:

```swift
BarMark
```

Example:

```swift
BarMark(
    x: .value("Day", item.day),
    y: .value("Used", item.used)
)
```

Displays ammunition consumption per day.

---

# MARK: - Remaining Stock Chart

Uses:

```swift
LineMark
```

and

```swift
PointMark
```

Example:

```swift
LineMark(
    x: .value("Day", item.day),
    y: .value("Remaining", item.remaining)
)
```

Displays depletion over time.

---

# MARK: - Reusable Components

The project includes reusable UI elements.

## GlassCard

Reusable dashboard container.

```swift
GlassCard {
    content
}
```

Provides:

- padding
- ultra-thin material background
- rounded corners
- border styling

---

## MetricCard

Reusable KPI display component.

Used for:

- Initial Stock
- Used
- Remaining
- Endurance

---

# MARK: - Learning Objectives

This project demonstrates:

- SwiftUI composition
- MVVM architecture
- Data-driven interfaces
- Apple Charts
- Functional programming
- Reusable UI components
- Simulation modelling

---

# MARK: - Future Improvements

Potential enhancements:

- Multiple ammunition types
- Supply chain modelling
- Replenishment events
- Forecasted consumption
- Scenario presets
- Export to PDF
- Historical comparisons
- Map-based logistics visualization

---

# MARK: - Inspiration

The project was inspired by discussions surrounding logistics, sustainment, and resource management often highlighted by strategic studies organizations such as the Center for Strategic and International Studies (CSIS).

The objective is not operational planning but understanding how software can model resource consumption and endurance concepts through simulation and visualization.

---

# MARK: - Final Thought

Small SwiftUI projects are excellent vehicles for exploring large concepts.

In this case:

```text
Resource Management
+
Simulation
+
Visualization
+
Systems Thinking
```

combined into a concise educational dashboard built with modern SwiftUI techniques.

---

# Screenshot

<img width="300" height="650" alt="Simulator Screenshot - iPhone 17 Pro - 2026-06-01 at 16 45 17" src="https://github.com/user-attachments/assets/8a4c4cfd-80b7-4b1d-a1a5-8627f8457ce3" />

