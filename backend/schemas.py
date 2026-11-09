from pydantic import BaseModel
from typing import Optional

class UserBase(BaseModel):
    name: str
    phone: str
    role: str

class UserCreate(UserBase):
    password: str
    
class UserResponse(UserBase):
    id: int
    class Config:
        from_attributes = True

class WorkerProfileBase(BaseModel):
    profession: str
    starting_price: float

class WorkerProfileCreate(WorkerProfileBase):
    pass

class WorkerProfileResponse(WorkerProfileBase):
    id: int
    user_id: int
    rating: float
    completed_jobs: int
    is_available: bool
    
    class Config:
        from_attributes = True

class RequirementBase(BaseModel):
    service_category: str
    description: str
    date: str
    time: str
    budget: float

class RequirementCreate(RequirementBase):
    pass

class RequirementResponse(RequirementBase):
    id: int
    customer_id: int
    status: str

    class Config:
        from_attributes = True

class Token(BaseModel):
    access_token: str
    token_type: str
