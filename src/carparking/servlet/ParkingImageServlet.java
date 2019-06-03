package carparking.servlet;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import carparking.bean.*;
import carparking.dao.*;
import carparking.util.ImageUtil;
import carparking.util.Page;

public class ParkingImageServlet extends BaseBackServlet {
	public String add(HttpServletRequest request, HttpServletResponse response, Page page) {
		//上传文件的输入流
		InputStream is = null;
		//提交上传文件时的其他参数
		Map<String,String> params = new HashMap<>();

		//解析上传
        is = parseUpload(request, params);		
		
        //根据上传的参数生成productImage对象
		String type= params.get("type");
		int pid = Integer.parseInt(params.get("pid"));
		Parking p =parkingDAO.get(pid);
		
		ParkingImage pi = new ParkingImage();	
		pi.setType(type);
		pi.setParking(p);
		parkingImageDAO.add(pi);
		
		
		//生成文件
    	String fileName = pi.getId()+ ".jpg";
        String imageFolder;
        String imageFolder_small=null;
        String imageFolder_middle=null;
        if(ParkingImageDAO.type_single.equals(pi.getType())){
        	imageFolder= request.getSession().getServletContext().getRealPath("img/parkingSingle");
        	imageFolder_small= request.getSession().getServletContext().getRealPath("img/parkingSingle_small");
        	imageFolder_middle= request.getSession().getServletContext().getRealPath("img/parkingSingle_middle");
        }
        	
        
        else
        	imageFolder= request.getSession().getServletContext().getRealPath("img/parkingDetail");
        File f = new File(imageFolder, fileName);
        f.getParentFile().mkdirs();
        System.out.println("6");
        // 复制文件
		try {
	        System.out.println("4");

			if(null!=is && 0!=is.available()){
			    try(FileOutputStream fos = new FileOutputStream(f)){
			        byte b[] = new byte[1024 * 1024];
			        int length = 0;
			        while (-1 != (length = is.read(b))) {
			            fos.write(b, 0, length);
			        }
			        System.out.println("5");

			        fos.flush();
			        System.out.println("7");
			        //通过如下代码，把文件保存为jpg格式
			        BufferedImage img = ImageUtil.change2jpg(f);
			        System.out.println("8");
			        ImageIO.write(img, "jpg", f);		
			        System.out.println("2");

			        if(ParkingImageDAO.type_single.equals(pi.getType())){
			        	File f_small = new File(imageFolder_small, fileName);
			        	File f_middle = new File(imageFolder_middle, fileName);

			        	ImageUtil.resizeImage(f, 56, 56, f_small);
			        	ImageUtil.resizeImage(f, 217, 190, f_middle);
			            System.out.println("3");

			        }
			        	
			        
			    }
			    catch(Exception e){
			    	e.printStackTrace();
			    }
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        
		
		return "@admin_parkingImage_list?pid="+p.getId();
	}





	public String delete(HttpServletRequest request, HttpServletResponse response, Page page) {
		int id = Integer.parseInt(request.getParameter("id"));
		ParkingImage pi = parkingImageDAO.get(id);
		parkingImageDAO.delete(id);
		
        if(ParkingImageDAO.type_single.equals(pi.getType())){
        	String imageFolder_single= request.getSession().getServletContext().getRealPath("img/parkingSingle");
        	String imageFolder_small= request.getSession().getServletContext().getRealPath("img/parkingSingle_small");
        	String imageFolder_middle= request.getSession().getServletContext().getRealPath("img/parkingSingle_middle");
        	
        	File f_single =new File(imageFolder_single,pi.getId()+".jpg");
    		f_single.delete();
    		File f_small =new File(imageFolder_small,pi.getId()+".jpg");
    		f_small.delete();
    		File f_middle =new File(imageFolder_middle,pi.getId()+".jpg");
    		f_middle.delete();	
        }
        else{
        	String imageFolder_detail= request.getSession().getServletContext().getRealPath("img/parkingDetail");
    		File f_detail =new File(imageFolder_detail,pi.getId()+".jpg");
    		f_detail.delete();        	
        }
		return "@admin_parkingImage_list?pid="+pi.getParking().getId();
	}

	
	public String edit(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;		
	}

	
	public String update(HttpServletRequest request, HttpServletResponse response, Page page) {
		return null;	
	}

	
	public String list(HttpServletRequest request, HttpServletResponse response, Page page) {
		int pid = Integer.parseInt(request.getParameter("pid"));
		Parking p =parkingDAO.get(pid);
		List<ParkingImage> pisSingle = parkingImageDAO.list(p, parkingImageDAO.type_single);
		List<ParkingImage> pisDetail = parkingImageDAO.list(p, parkingImageDAO.type_detail);
		
		request.setAttribute("p", p);
		request.setAttribute("pisSingle", pisSingle);
		request.setAttribute("pisDetail", pisDetail);
		
		return "admin/listParkingImage.jsp";
	}
}
