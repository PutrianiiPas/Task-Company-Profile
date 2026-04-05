# REST API Users - ExpressJS & PostgreSQL

## Description
REST API CRUD sederhana menggunakan ExpressJS dan PostgreSQL untuk tabel `users`.

## Features
- GET all users
- GET user by ID
- POST create user
- PUT update user
- DELETE user

## Endpoints
| Method | Endpoint |
|---|---|
| GET | /api/users |
| GET | /api/users/:id |
| POST | /api/users |
| PUT | /api/users/:id |
| DELETE | /api/users/:id |

## Run Project
```bash
npm init -y
npm install express pg
node server.js
```

## Database
Gunakan file `database.sql` dari tugas sebelumnya.
