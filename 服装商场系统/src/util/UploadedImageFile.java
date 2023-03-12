package util;

import org.springframework.web.multipart.MultipartFile;

/**
在UploadedImageFile中封装MultipartFile类型的字段 image ，用于接受页面的注入
**/
public class UploadedImageFile {


//    这里的字段 image必须和上传页面upload.jsp中的image同名
//    <input type="file" name="image" accept="image/*" />  保持一致

    MultipartFile image;

    public MultipartFile getImage() {
        return image;
    }
    public void setImage(MultipartFile image) {
        this.image = image;
    }
}
