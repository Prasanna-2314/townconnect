from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from .. import models, schemas
from ..database import get_db

router = APIRouter(prefix="/workers", tags=["workers"])

@router.get("/", response_model=List[schemas.WorkerProfileResponse])
def get_workers(skip: int = 0, limit: int = 10, category: str = None, db: Session = Depends(get_db)):
    query = db.query(models.WorkerProfile)
    if category:
        query = query.filter(models.WorkerProfile.profession == category)
    workers = query.offset(skip).limit(limit).all()
    return workers

@router.post("/profile", response_model=schemas.WorkerProfileResponse)
def create_worker_profile(profile: schemas.WorkerProfileCreate, db: Session = Depends(get_db)):
    # Note: normally we would extract user_id from the authenticated user token
    # This is a simplified endpoint for now
    new_profile = models.WorkerProfile(
        user_id=1, # Mock ID, replace with actual dependency injection in production
        profession=profile.profession,
        starting_price=profile.starting_price,
    )
    db.add(new_profile)
    db.commit()
    db.refresh(new_profile)
    return new_profile
