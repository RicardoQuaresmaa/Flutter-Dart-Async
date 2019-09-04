import 'dart:async';
import 'dart:convert';
import 'dart:io';


class EMStatus{
  final bool erraticMasterStatus;
  final bool showControlStatus;
  final bool rideSystemStatus;

  EMStatus({this.erraticMasterStatus, this.rideSystemStatus, this.showControlStatus});

  factory EMStatus.fromJson( Map<String, dynamic> json )
  {
    return new EMStatus(
      erraticMasterStatus: json['erraticMasterStatus'],
      showControlStatus: json['showControlStatus'],
      rideSystemStatus: json['rideSystemStatus'],
    );
  }
}

class EM_SC_Cue{
  final int id;
  final String name;
  final double duration;

  EM_SC_Cue ({this.id, this.name, this.duration});

  factory EM_SC_Cue.fromJson( Map<String, dynamic> json)
  {
    return new EM_SC_Cue( 
      id: json['id'],
      name : json['name'],
      duration : json['duration'],
    );
  }
}

class RemoteApi{
  final HttpClient httpClient = HttpClient();
  final url = '127.0.0.1:6969';

  Future<String> getStatus() async {
    
    final uri = Uri.http(url,"/status");
    
    final httpRequest = await httpClient.getUrl(uri);
    final httpResponse = await httpRequest.close();

    if( httpResponse.statusCode != HttpStatus.OK){
      return null;
    }

    final responseBody = httpResponse.transform(utf8.decoder).join();

    return responseBody;
  }

  List<EM_SC_Cue> parseCues(String responseBody){
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<EM_SC_Cue>( (json) => new EM_SC_Cue.fromJson(json)).toList();
  }

  Future<List<EM_SC_Cue>> fetchShowControlCues() async {
    
    final uri = Uri.http(url,"/showControl/cues");
    
    final httpRequest = await httpClient.getUrl(uri);
    final httpResponse = await httpRequest.close();

    if( httpResponse.statusCode != HttpStatus.OK){
      return null;
    }

    final responseBody = await httpResponse.transform(utf8.decoder).join();

    return parseCues(responseBody);
  }

}