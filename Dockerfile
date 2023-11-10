# Use an official Python runtime as a parent image
FROM python:3.11

# Set the working directory to /app
WORKDIR /app

# Install Jupyter Notebook
RUN pip install jupyter

# Expose the port that Jupyter Notebook will run on
EXPOSE 8888

# Generate a Jupyter Notebook configuration
RUN jupyter notebook --generate-config

# Set a password for Jupyter Notebook (replace 'your_password' with your desired password)
RUN echo "c.NotebookApp.password = ''" >> ~/.jupyter/jupyter_notebook_config.py

# Start Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
