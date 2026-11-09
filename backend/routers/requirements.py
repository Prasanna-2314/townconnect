from fastapi import APIRouter, Depends, HTTPException
from sqlalchemy.orm import Session
from typing import List
from .. import models, schemas
from ..database import get_db

router = APIRouter(prefix="/requirements", tags=["requirements"])

@router.get("/", response_model=List[schemas.RequirementResponse])
def get_requirements(db: Session = Depends(get_db)):
    return db.query(models.Requirement).all()

@router.post("/", response_model=schemas.RequirementResponse)
def create_requirement(requirement: schemas.RequirementCreate, db: Session = Depends(get_db)):
    # Assuming authenticated user is a customer with ID 1 for demonstration
    new_req = models.Requirement(
        customer_id=1,
        service_category=requirement.service_category,
        description=requirement.description,
        date=requirement.date,
        time=requirement.time,
        budget=requirement.budget,
        status="Open"
    )
    db.add(new_req)
    db.commit()
    db.refresh(new_req)
    return new_req
