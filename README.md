
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to My Web Site</title>
    <style>
        body {
            background-color: #2E3436;
            color: #FFFFFF;
            font-family: 'Courier New', Courier, monospace;
            margin: 0;
            padding: 0;
        }
        .terminal {
            background-color: #000000;
            padding: 20px;
            border-radius: 10px;
            max-width: 600px;
            margin: 50px auto;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
        .terminal-header {
            background-color: #4E9A06;
            padding: 10px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
        }
        .terminal-header span {
            display: inline-block;
            margin-right: 10px;
            border-radius: 50%;
            width: 10px;
            height: 10px;
        }
        .terminal-header .close {
            background-color: #FF5F56;
        }
        .terminal-header .minimize {
            background-color: #FFBD2E;
        }
        .terminal-header .maximize {
            background-color: #27C93F;
        }
        .content {
            padding: 20px;
        }
        .social-links a {
            color: #4E9A06;
            text-decoration: none;
            margin-right: 10px;
        }
        .social-links a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="terminal">
        <div class="terminal-header">
            <span class="close"></span>
            <span class="minimize"></span>
            <span class="maximize"></span>
        </div>
        <div class="content">
            <h1>Welcome to My Web Site!</h1>
            <p>Hello! I'm Roman Fandrich, a Devops Engineer with a passion for open-source and Linux. Below you can find links to my Portfolio and social networks:</p>
            <div class="social-links">
                <a href="https://github.com/romancete85" target="_blank">GitHub</a>
                <a href="https://www.linkedin.com/in/grf1985" target="_blank">LinkedIn</a>
                <a href="https://linktr.ee/romanfandrich" target="_blank">Kinktree</a>
                <!-- Add more links as needed -->
            </div>
        </div>
    </div>
</body>
</html>
