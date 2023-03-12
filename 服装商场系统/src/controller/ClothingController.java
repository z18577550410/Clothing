package controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang.xwork.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import pojo.Clothing;
import service.ClothingService;
import util.Page;
import util.UploadedImageFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller

public class ClothingController {
    @Autowired
    ClothingService clothingService;

    @RequestMapping("clothing_list")
    public ModelAndView ClothingList(Page page) {
        ModelAndView mav = new ModelAndView();
        PageHelper.offsetPage(page.getStart(), 5);
        List<Clothing> cs = clothingService.list();
        int total = (int) new PageInfo<>(cs).getTotal();
        page.caculateLast(total);

        // 放入转发参数
        mav.addObject("cs", cs);
        // 放入jsp路径
        mav.setViewName("clothing");
        return mav;
    }

    @RequestMapping("clothing_add")
    public ModelAndView clothingAdd() throws Exception {
        ModelAndView mav = new ModelAndView("clothingAdd");
        return mav;
    }

    @RequestMapping("clothingAdd")
    public ModelAndView clothingAdd(Clothing clothing) throws Exception {
        clothingService.add(clothing);
        ModelAndView mav = new ModelAndView("redirect:/clothing_list");
        return mav;
    }


    @RequestMapping("upload")
    public ModelAndView upload(HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView("upload");
        mav.addObject("imageName", session.getAttribute("imageName"));
        session.removeAttribute("imageName");
        return mav;
    }

    @RequestMapping("/uploadImage")
    public ModelAndView upload(UploadedImageFile file, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

        String name = RandomStringUtils.randomAlphanumeric(6); //获取一个随机文件名
        String newFileName = name + ".jpg";

        //  获取到web目录下的image目录，用于存放上传后的文件.
        String realPath = request.getServletContext().getRealPath("/image");
        File f = new File(realPath, newFileName);

        // 为了避免上传文件的时候文件夹不存在 导致的异常
        f.getParentFile().mkdirs();

        //复制文件
        file.getImage().transferTo(f);

//        //无弹窗
//        ModelAndView mv = new ModelAndView("upload");
//        mv.addObject("imageName", newFileName);
//        return mv;

        //弹窗
        session.setAttribute("imageName", newFileName);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("<script>alert('上传成功');window.location='upload'; </script>");
        return null;
    }

    @RequestMapping("clothing_edit")
    public ModelAndView clothingEdit(int id) throws Exception {
        Clothing clothing = clothingService.get(id);
        ModelAndView mav = new ModelAndView();
        // 放入转发参数
        mav.addObject("c", clothing);
        // 放入jsp路径
        mav.setViewName("clothingUpdate");
        return mav;
    }

    @RequestMapping("clothing_update")
    public ModelAndView clothingUpdate(Clothing clothing,HttpServletResponse response) throws Exception {
        clothingService.update(clothing);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("<script>alert('修改成功!');window.location='clothing_list'; </script>");
        return null;
    }

    @RequestMapping("clothing_delete")
    public ModelAndView clothingDelete(int id,HttpServletResponse response) throws Exception {
        clothingService.delete(id);
        response.setContentType("text/html;charset=utf-8");
        response.getWriter().write("<script>alert('删除成功!');window.location='clothing_list'; </script>");
        return null;
    }

}
