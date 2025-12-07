# 📊 Návrh databáze – Fotbalový turnaj

Tento projekt představuje návrh databáze pro správu fotbalového turnaje.  
Obsahuje informace o týmech, hráčích, zápasech, událostech a přestupech.

---

## 🗄️ ERD – Databázový model

Níže je vizuální návrh databáze provedený v dbdiagram.io:

<p align="center">
  <img src="Fotbalovy turnaj.png" width="900">
</p>

---

## 📌 Popis tabulek

| Tabulka | Účel |
|--------|------|
| **hrac** | Informace o hráčích (jméno, tým, pozice, góly…) |
| **tym** | Seznam týmů a počty hráčů |
| **zapas** | Odehrané zápasy, čas a výsledky |
| **udalosti** | Gól, karta nebo střídání v konkrétním zápase |
| **hraci_v_zapase** | Evidence minut odehraných každým hráčem |
| **prestup** | Informace o přestupech hráčů do nových týmů |

---

## 🧱 Použité technologie

- MySQL / MariaDB
- dbdiagram.io (vizuální návrh)
- phpMyAdmin – export SQL

---

## ▶️ Instalace databáze

1️⃣ Vytvoř databázi:
```sql
CREATE DATABASE fotbalovy_turnaj;
USE fotbalovy_turnaj;
