# flutter_submitcatch

This project demonstrates the use case of catching an error from REST calls that aren't limited to response codes.

For items like invalid domains, socket issues, etc., the snapshot.error handling doesn't appear to cover them.

2 buttons are available, and a "return to home" button in the drawer menu to allow for switching between good/bad domains.

There is minimal logging to capture when/where items are being handled.

eg:

From Consumer List Rendering:
```
2019-07-28 22:44:51.244 5933-5949/org.alevine.flutter_submitcatch I/flutter: userlist:  nothing else happened with the snapshot
```
From async that makes the REST call
```
2019-07-28 22:44:51.474 5933-5949/org.alevine.flutter_submitcatch I/flutter: caught a larger exception SocketException: Failed host lookup: '123jsonplaceholder.typicode.com' (OS Error: No address associated with hostname, errno = 7)
2019-07-28 22:44:51.474 5933-5949/org.alevine.flutter_submitcatch I/flutter: About to send back a future.error SocketException: Failed host lookup: '123jsonplaceholder.typicode.com' (OS Error: No address associated with hostname, errno = 7)
```
From the engine itself (not me printing this)
```
2019-07-28 22:44:51.489 5933-5949/org.alevine.flutter_submitcatch E/flutter: [ERROR:flutter/lib/ui/ui_dart_state.cc(148)] Unhandled Exception: SocketException: Failed host lookup: '123jsonplaceholder.typicode.com' (OS Error: No address associated with hostname, errno = 7)
```
