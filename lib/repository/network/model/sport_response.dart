class SportsResponse {
    String id;
    String name;

    SportsResponse({this.id, this.name});

    factory SportsResponse.fromJson(Map<String, dynamic> json) {
        return SportsResponse(
            id: json['id'],
            name: json['name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        data['name'] = this.name;
        return data;
    }
}