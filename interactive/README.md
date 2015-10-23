# Interactive Activity Detector

## Brief overview

This project is a web application, consisting of two modules:

1. **accelerator page**, for tracking accelerator data on mobile device
2. **renderer**, for displaying the processed data

## Installation

First of all, you'll need [NodeJS](https://nodejs.org/en/download/) v 4.0+ and [Redis](http://redis.io). Follow instructions for your OS to get this done.

Then, install project dependency modules

    npm install

Next, install front-end dependencies:

    bower install

Or with the newer versions of Node:

    node bin/www

Now, a bit of configuration - find out your local network IP and paste in `routes/accelerator.js`:

    var socket_params = {
        ip: 'YOUR_IP_HERE',
        port: '8080'
    };

And open two pages:

1. [YOUR_IP:3000](http://YOUR_IP:3000/) on the **desktop**
2. [YOUR_IP:3000/accel](http://YOUR_IP:3000/accel) on your **mobile phone**

The system will start gathering the data. To refresh the charts on the desktop, click the **Refresh** button. To reset the data gathered, click the **Reset** button on your cellphone.

## Importing sample data

Stop your redis server:

    redis-server stop
    
Copy the `redis_backup.rdb` to the redis config dir:

    sudo cp redis_backup.rdb /var/lib/redis/dump.rdb
    sudo chown redis: /var/lib/redis/dump.rdb
    
And start redis again:

    redis-server