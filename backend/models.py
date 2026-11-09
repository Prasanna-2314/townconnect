from sqlalchemy import Boolean, Column, ForeignKey, Integer, String, Float
from sqlalchemy.orm import relationship
from .database import Base

class User(Base):
    __tablename__ = "users"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True)
    phone = Column(String, unique=True, index=True)
    hashed_password = Column(String)
    role = Column(String) # "Customer" or "Worker"
    
    worker_profile = relationship("WorkerProfile", back_populates="user", uselist=False)

class WorkerProfile(Base):
    __tablename__ = "worker_profiles"

    id = Column(Integer, primary_key=True, index=True)
    user_id = Column(Integer, ForeignKey("users.id"))
    profession = Column(String, index=True)
    rating = Column(Float, default=0.0)
    completed_jobs = Column(Integer, default=0)
    starting_price = Column(Float, default=0.0)
    is_available = Column(Boolean, default=True)
    location_lat = Column(Float, nullable=True)
    location_lng = Column(Float, nullable=True)

    user = relationship("User", back_populates="worker_profile")

class Requirement(Base):
    __tablename__ = "requirements"

    id = Column(Integer, primary_key=True, index=True)
    customer_id = Column(Integer, ForeignKey("users.id"))
    service_category = Column(String, index=True)
    description = Column(String)
    date = Column(String)
    time = Column(String)
    budget = Column(Float)
    status = Column(String, default="Open") # Open, Accepted, Completed
