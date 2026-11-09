from fastapi import FastAPI
from .database import engine, Base
from .routers import auth, workers, requirements
from fastapi.middleware.cors import CORSMiddleware

# Create database tables
Base.metadata.create_all(bind=engine)

app = FastAPI(title="VillageConnect API", description="Python Backend for Local Worker & Service Finder")

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Include Routers
app.include_router(auth.router)
app.include_router(workers.router)
app.include_router(requirements.router)

@app.get("/")
def read_root():
    return {"message": "Welcome to the VillageConnect API"}
