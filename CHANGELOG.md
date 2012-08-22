## 1.0.4 (Aug 22, 2012)

Bugfixes:
	- solved some errors that appears when the path of the config.yml file was introduced wrong
	- solved the null messages that was sent when the user was malformed
	- removed the --path option, now the path is inyected as an arg and in case that not explicited, it will be asked by the app
	- added some logger messages to info the number of tweets have been parsed (50 tweets/sec aprox.)
	- 

## 1.0.3 (Aug 21, 2012)

Bugfixes:

	- deletes an upset message of log that appears when a corrupt user was found
	- changes the config.example.yml file, the trackwords was wrong
	- changes the path of the log.txt, it seems like that was pretty problematic if the log folder hasn't been created at the moment of start the app
	
## 1.0.2 (Aug 18, 2012)

Bugfixes:

  - changes the logger level from `Debug` to `Warn`

## 1.0.1 (Aug 18, 2012)

Bugfixes:

  - fixes the url from the github page.