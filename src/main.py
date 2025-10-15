from fastapi import FastAPI

app = FastAPI()

@app.get("/")
def read_index():
    """
    Return a python dictionary that support jSON serialization.
    """
    return {"Hello": "World"}

@app.get("/api/v1/hello-world")
def read_hello_world():
    """
    Return an API-Like response
    """
    return {"what": "road", "where": "kubernete", "version": "v1"}
