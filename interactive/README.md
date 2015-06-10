# Interactive Activity Detector

## Brief overview

This project is a web application, consisting of two modules:

1. **accelerator page**, for tracking accelerator data on mobile device
2. **renderer**, for displaying the processed data

## Installation

First of all, you'll need [IOJS](https://iojs.org/en/index.html) and [Redis](http://redis.io). Follow instructions for your OS to get this done.

Then, install project dependency modules

    npm install

Next, install front-end dependencies:

    bower install

Now you are ready to run the system. First, run the webserver:

    iojs --use_strict --harmony_classes bin/www

And open two pages:

1. [YOUR_IP:3000](http://localhost:3000/) on the **desktop**
2. [YOUR_IP:3000/accel](http://localhost:3000/accel) on your **mobile phone**

The system will start gathering the data. To refresh the charts on the desktop, click the **Refresh** button. To reset the data gathered, click the **Reset** button on your cellphone.
