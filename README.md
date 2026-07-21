# Dynamic Multi-Platform Post Composer with Admin CRUD (MERN Stack)

A full-stack MERN application implementing the lab experiment: an Admin Dashboard
with full CRUD (Create, Read, Update, Delete) operations for posts, platform
selection (Twitter/X, Instagram, LinkedIn, Facebook), real-time character
counting, and platform-specific validation.

```
Admin
  │
  ▼
React Frontend (Dashboard + Post Composer)
  │  Axios / REST API
  ▼
Express.js Backend
  │  Mongoose
  ▼
MongoDB
```

## Folder structure

```
post-composer/
├── backend/          Express + Mongoose REST API
│   ├── config/db.js
│   ├── models/Post.js
│   ├── routes/posts.js
│   ├── server.js
│   ├── package.json
│   └── .env.example  → rename to .env
└── frontend/          React (Vite) app
    ├── src/
    │   ├── components/ (Dashboard, CreatePost, ViewPosts, EditPost, Navbar)
    │   ├── api/api.js
    │   ├── App.jsx
    │   └── main.jsx
    └── package.json
```

## Requirements

You need these installed on your machine before running the app:

- **Node.js** (v18 or later) — https://nodejs.org
- **MongoDB** — either:
  - MongoDB installed and running locally (default: `mongodb://127.0.0.1:27017`), or
  - A free MongoDB Atlas cluster (cloud, no install needed) — https://www.mongodb.com/cloud/atlas

## Quick start

### Option A — one-click setup script

**Mac / Linux:**
```bash
cd post-composer
./setup.sh
```

**Windows:**
```
cd post-composer
setup.bat
```

This installs dependencies for both backend and frontend, and creates `backend/.env`
for you. Then skip to "Running the app" below.

### Option B — manual setup

**1) Backend**
```bash
cd backend
npm install
cp .env.example .env
```
Open `backend/.env` and set `MONGO_URI` if you're using MongoDB Atlas instead of a
local database. The default works out of the box if MongoDB is installed locally.

**2) Frontend**
```bash
cd frontend
npm install
```

## Running the app

You need **two terminals** running at the same time — one for the backend, one for
the frontend.

**Terminal 1 — backend (port 5000):**
```bash
cd backend
npm start
```
You should see:
```
✅ MongoDB connected: mongodb://127.0.0.1:27017/post_composer
✅ Server running on http://localhost:5000
```

**Terminal 2 — frontend (port 5173):**
```bash
cd frontend
npm run dev
```
Then open **http://localhost:5173** in your browser.

## Don't have MongoDB installed locally?

Use a free MongoDB Atlas cluster instead:
1. Create a free account/cluster at https://www.mongodb.com/cloud/atlas
2. Get your connection string (looks like `mongodb+srv://user:pass@cluster0.mongodb.net/post_composer`)
3. Paste it into `backend/.env` as `MONGO_URI`
4. Restart the backend (`npm start`)

## API Endpoints

| Method | Endpoint              | Purpose                       |
|--------|------------------------|--------------------------------|
| GET    | /api/posts             | Fetch all posts                |
| GET    | /api/posts/:id         | Fetch a single post            |
| POST   | /api/posts             | Create a new post              |
| PUT    | /api/posts/:id         | Update a post                  |
| DELETE | /api/posts/:id         | Delete a post                  |
| GET    | /api/posts/meta/limits | Get platform character limits  |

## Platform validation rules

| Platform    | Character Limit |
|-------------|-----------------:|
| Twitter (X) | 280              |
| Instagram   | 2200             |
| LinkedIn    | 3000             |
| Facebook    | No strict limit  |

## Features implemented

- ✅ Admin Dashboard with post/platform statistics and recent posts
- ✅ Create Post — title, content, multi-platform selection, live character counter, validation
- ✅ View Posts — table of all posts with platform, character count, status, date
- ✅ Update Post — edit title/content/platforms/status, re-validated on save
- ✅ Delete Post — with confirm-before-delete step
- ✅ REST API built with Express.js + Mongoose
- ✅ MongoDB schema with timestamps (createdAt/updatedAt)
- ✅ Responsive navy/blue-themed UI

## Troubleshooting

- **"Could not reach the backend API"** in the browser → make sure `npm start` is
  running in `backend/` and that it printed `MongoDB connected`.
- **MongoDB connection error** → MongoDB isn't running locally. Either start it
  (`mongod`) or switch to an Atlas connection string in `backend/.env`.
- **Port already in use** → change `PORT` in `backend/.env`, or stop whatever else
  is using ports 5000 / 5173.
