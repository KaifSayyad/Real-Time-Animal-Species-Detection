FROM python:3.11

# Set the working directory in the container
WORKDIR /app

# Copy the dependencies file to the working directory
COPY requirements.txt .

RUN apt-get update && apt-get install -y libgl1-mesa-glx

# Install any dependencies
RUN pip install -r requirements.txt
RUN pip install opencv-python

# Copy the content of the local src directory to the working directory
COPY . .

# Command to run on container start
CMD [ "streamlit" ,"run", "./scripts/app.py" ]