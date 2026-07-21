@echo off
echo Installing backend dependencies...
cd backend
call npm install
if not exist .env (
  copy .env.example .env
  echo Created backend\.env from .env.example
)
cd ..

echo Installing frontend dependencies...
cd frontend
call npm install
cd ..

echo.
echo Setup complete!
echo Next steps:
echo   1) Make sure MongoDB is running (or edit backend\.env with your Atlas URI)
echo   2) In one terminal: cd backend ^&^& npm start
echo   3) In another terminal: cd frontend ^&^& npm run dev
echo   4) Open http://localhost:5173
pause
