const express = require('express');
const { Pool } = require('pg');

const app = express();
app.use(express.json());

const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'tugas_camp',
    password: '#Putrianii24',
    port: 5432
});

// GET all users
app.get('/api/users', async (req, res) => {
    const result = await pool.query('SELECT * FROM users');
    res.json(result.rows);
});

// GET user by id
app.get('/api/users/:id', async (req, res) => {
    const result = await pool.query(
        'SELECT * FROM users WHERE id = $1',
        [req.params.id]
    );
    res.json(result.rows[0]);
});

// POST create user
app.post('/api/users', async (req, res) => {
    const { name, email } = req.body;
    const result = await pool.query(
        'INSERT INTO users (name, email) VALUES ($1, $2) RETURNING *',
        [name, email]
    );
    res.json(result.rows[0]);
});

// PUT update user
app.put('/api/users/:id', async (req, res) => {
    const { name, email } = req.body;
    const result = await pool.query(
        'UPDATE users SET name=$1, email=$2 WHERE id=$3 RETURNING *',
        [name, email, req.params.id]
    );
    res.json(result.rows[0]);
});

// DELETE user
app.delete('/api/users/:id', async (req, res) => {
    await pool.query(
        'DELETE FROM users WHERE id = $1',
        [req.params.id]
    );
    res.json({ message: 'User deleted successfully' });
});

app.listen(5000, () => {
    console.log('Server running on port 5000');
});