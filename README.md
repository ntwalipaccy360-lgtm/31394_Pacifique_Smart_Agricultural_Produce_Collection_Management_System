# 🌾 Smart Agricultural Produce Collection and Management System

## Oracle Database Capstone Project

---

## Student Information

**Student Name:** Pacifique Ntwali

**Student ID:** 31394

**Institution:** University of Lay Adventists of Kigali (UNILAK)

**Faculty:** Faculty of Computing and Information Sciences

**Course:** DPR400210 – Database Programming

**Academic Year:** 2025–2026

**Instructor:** Eric Maniraguha

---

# Project Overview

The Smart Agricultural Produce Collection and Management System is an Oracle Database application developed to improve the management of agricultural produce collection activities.

The system replaces manual record keeping by providing a centralized database for managing farmers, buyers, produce, inventory, orders, payments, public holidays, and audit records.

The project demonstrates SQL, PL/SQL, database design, security implementation, auditing, triggers, packages, functions, procedures, cursors, and Oracle APEX concepts.

---

# Problem Statement

Many agricultural produce collection centers still rely on manual methods for recording farmers, produce collections, buyer information, inventory, orders, and payments. These manual processes often lead to:

- Data redundancy
- Loss of records
- Slow report generation
- Poor inventory tracking
- Human errors
- Weak security
- Lack of accountability

This project provides an automated Oracle Database solution that improves efficiency, accuracy, security, and reporting.

---

# Project Objectives

The objectives of this project are to:

- Design a normalized Oracle database.
- Manage farmer information.
- Manage buyers.
- Register produce categories.
- Record produce collections.
- Manage inventory.
- Process customer orders.
- Record payments.
- Implement business rules using PL/SQL.
- Implement database security using triggers.
- Implement audit logging.
- Demonstrate Oracle APEX as the innovation component.

---

# System Features

✅ Farmer Registration

✅ Buyer Registration

✅ Produce Category Management

✅ Produce Management

✅ Produce Collection

✅ Inventory Management

✅ Order Processing

✅ Payment Processing

✅ Public Holiday Management

✅ Audit Logging

✅ Database Security

✅ Reporting

---

# Database Tables

The project contains the following Oracle tables:

- FARMERS
- BUYERS
- PRODUCE_CATEGORIES
- PRODUCE
- PRODUCE_COLLECTIONS
- INVENTORY
- ORDERS
- PAYMENTS
- PUBLIC_HOLIDAYS
- AUDIT_LOG

---

# PL/SQL Components

The project implements:

### Procedures

- Register Farmer
- Record Produce Collection
- Process Orders

### Functions

- Calculate Order Total
- Check Available Stock

### Package

- AGRICULTURE_MANAGEMENT_PKG

### Triggers

- Audit Trigger
- Security Trigger

### Cursors

- Explicit Cursor
- Cursor FOR Loop

### Exception Handling

- Custom Exceptions
- Oracle Exception Handling

---

# Business Rules

The database enforces several business rules including:

- Every farmer must have a unique Farmer ID.
- Produce belongs to a valid category.
- Orders must reference existing buyers.
- Inventory cannot contain invalid produce.
- Database modifications are restricted according to security rules.
- User activities are recorded in the audit log.

---

# Security Implementation

The project uses Oracle Triggers to:

- Prevent unauthorized modifications.
- Enforce business rules.
- Record user activities.
- Maintain audit logs.

---

# Audit System

The system records:

- INSERT operations
- UPDATE operations
- DELETE operations

Audit information includes:

- User
- Date
- Table
- Operation performed

---

# Oracle APEX Innovation

Oracle APEX is proposed as the innovation component of the project.

The web application includes:

- Dashboard
- Farmer Management
- Buyer Management
- Inventory
- Orders
- Reports
- Audit Monitoring

This provides a modern web interface for interacting with the Oracle Database.

---

# Technologies Used

- Oracle Database 21c XE
- Oracle SQL Developer
- SQL
- PL/SQL
- Oracle APEX
- GitHub

---

# Repository Structure

```

Smart_Agricultural_Produce_Collection_Management_System

│

├── README.md

├── SQL_Scripts/

├── PLSQL/

├── ER_Diagram/

├── Documentation/

├── Report/

├── Presentation/

├── Screenshots/

├── Oracle_APEX/

└── Testing/

```

---

# SQL Scripts

The repository contains:

- Create Tables
- Insert Data
- Sequences
- Procedures
- Functions
- Packages
- Triggers
- Cursors
- Test Queries

---

# Documentation

The repository also includes:

- Final Report
- ER Diagram
- Business Process Model
- Database Dictionary
- Normalization
- Testing Documentation
- Presentation Slides

---

# Screenshots

Screenshots demonstrate:

- Table creation
- Sample data
- Procedures
- Functions
- Packages
- Triggers
- SQL Queries
- Oracle SQL Developer
- Oracle APEX

---

# Learning Outcomes

This project demonstrates knowledge in:

- Database Design
- SQL Programming
- PL/SQL Programming
- Oracle Database Administration
- Database Security
- Auditing
- Oracle APEX
- GitHub Version Control

---

# Future Improvements

Future enhancements include:

- Mobile Application
- SMS Notifications
- Email Notifications
- Online Farmer Portal
- Advanced Analytics Dashboard
- Artificial Intelligence Prediction
- Cloud Deployment

---

# Author

**Pacifique Ntwali**

University of Lay Adventists of Kigali (UNILAK)

Faculty of Computing and Information Sciences

Course: DPR400210 – Database Programming

Academic Year: 2025–2026

---

# License

This project was developed solely for academic purposes as part of the Database Programming Capstone Project at UNILAK.

© 2026 Pacifique Ntwali. All Rights Reserved.
