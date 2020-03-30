
class FileUploadResponseNew {
    List<FileUploadResponse> uploadedItems;

    FileUploadResponseNew({this.uploadedItems});

    factory FileUploadResponseNew.fromJson(UploadFileType uploadFileType, Map<String, dynamic> json) {
        return FileUploadResponseNew(
            uploadedItems: json['uploaded_items'] != null ? (json['uploaded_items'] as List).map((i) => FileUploadResponse.fromJson(uploadFileType, i)).toList() : null,
        );
    }
}

enum UploadFileType {
    IMAGE,
    VIDEO,
    GIF
}

class FileUploadResponse {
    String fileId;
    String fileUrl;
    String uploaderUid;
    UploadFileType uploadFileType;

    FileUploadResponse({this.fileId, this.fileUrl, this.uploaderUid, this.uploadFileType});

    factory FileUploadResponse.fromJson(UploadFileType uploadFileType, Map<String, dynamic> json) {
        return FileUploadResponse(
            fileId: json['file_id'],
            fileUrl: json['file_url'],
            uploaderUid: json['uploader_uid'],
            uploadFileType: uploadFileType,
        );
    }
}

class GetVideoDataResponse {
    String video;
    String videoHd;
    String videoPoster;
    String videoPosterPreview;

    GetVideoDataResponse({this.video, this.videoHd, this.videoPoster, this.videoPosterPreview});

    factory GetVideoDataResponse.fromJson(Map<String, dynamic> json) {
        return GetVideoDataResponse(
            video: json['video'],
            videoHd: json['video_hd'],
            videoPoster: json['video_poster'],
            videoPosterPreview: json['video_poster_preview'],
        );
    }
}