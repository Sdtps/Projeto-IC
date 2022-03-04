from ipaddress import ip_address
from os import statvfs_result
from typing import Optional

from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "World"}

@app.get("/status", status_code=200)
def read_root():
    return {"http status cod 200"}

@app.get("/items/{item_id}")
def read_item(item_id: str, q: Optional[str] = None):
    return {"item_id": item_id, "q": q}