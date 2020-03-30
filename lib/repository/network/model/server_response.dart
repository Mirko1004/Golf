class ServerResponse {
    bool error;
    int errorCode;
    String errorText;
    Map<String, dynamic> result;

    ServerResponse({this.error, this.errorCode, this.errorText, this.result});

    factory ServerResponse.fromJson(Map<String, dynamic> json) {

        Map<String, dynamic> result = {};
        try {
            result = json['result'];
        } catch (e) {

        }

        return ServerResponse(
            error: json['error'],
            errorCode: json['error_code'],
            errorText: json['error_text'],
            result: result,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['error'] = this.error;
        data['error_code'] = this.errorCode;
        data['error_text'] = this.errorText;
        data['result'] = this.result;
        return data;
    }
}