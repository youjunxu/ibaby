package com.lhq.prj.bms.action;

import java.awt.Color;  
import java.awt.Font;  
import java.awt.Graphics;  
import java.awt.image.BufferedImage;  
import java.io.ByteArrayInputStream;  
import java.io.ByteArrayOutputStream;  
import java.util.Random;  
  
import javax.imageio.ImageIO;  
import javax.imageio.stream.ImageOutputStream;  
  
import com.opensymphony.xwork2.ActionContext;  
import com.opensymphony.xwork2.ActionSupport;  
  
public class RandomPictureAction extends ActionSupport {  
  
    /** 
     *  
     */  
    private static final long serialVersionUID = -6950908478971552308L;  
  
    private ByteArrayInputStream inputStream;  
  
    public String execute() throws Exception {  
        // ���ڴ��д���ͼ��  
        int width = 85, height = 20;  
  
        BufferedImage image = new BufferedImage(width, height,  
                BufferedImage.TYPE_INT_RGB);  
  
        // ��ȡͼ��������  
        Graphics g = image.getGraphics();   
        // ���������  
        Random random = new Random();  
  
        // �趨����ɫ  
        g.setColor(getRandColor(200, 250));  
        g.fillRect(0, 0, width, height);  
  
        // �趨����  
        g.setFont(new Font("Times New Roman", Font.PLAIN, 18));  
  
        // �������155�������ߣ�ʹͼ���е���֤�벻�ױ���������̽�⵽  
        g.setColor(getRandColor(160, 200));  
        for (int i = 0; i < 155; i++) {  
            int x = random.nextInt(width);  
            int y = random.nextInt(height);  
            int xl = random.nextInt(12);  
            int yl = random.nextInt(12);  
            g.drawLine(x, y, x + xl, y + yl);  
        }  
 
        // ȡ�����������֤��(6λ����)  
        String sRand = "";  
        for (int i = 0; i < 6; i++) {  
            String rand = String.valueOf(random.nextInt(10));  
            sRand += rand;  
            // ����֤����ʾ��ͼ����  
            g.setColor(new Color(20 + random.nextInt(110), 20 + random  
                    .nextInt(110), 20 + random.nextInt(110)));  
            // ���ú�����������ɫ��ͬ����������Ϊ����̫�ӽ�������ֻ��ֱ������  
            g.drawString(rand, 13 * i + 6, 16);  
        }  
  
        // ����֤�����SESSION  
        ActionContext.getContext().getSession().put("rand", sRand);  
  
        // ͼ����Ч  
        g.dispose();  
        ByteArrayOutputStream output = new ByteArrayOutputStream();  
        ImageOutputStream imageOut = ImageIO.createImageOutputStream(output);  
        ImageIO.write(image, "JPEG", imageOut);  
        imageOut.close();  
        ByteArrayInputStream input = new ByteArrayInputStream(output  
                .toByteArray());  
        this.setInputStream(input);  
        return SUCCESS;  
    }  
  
    /* 
     * ������Χ��������ɫ 
     */  
    private Color getRandColor(int fc, int bc) {  
        Random random = new Random();  
        if (fc > 255)  
            fc = 255;  
        if (bc > 255)  
            bc = 255;  
        int r = fc + random.nextInt(bc - fc);  
        int g = fc + random.nextInt(bc - fc);  
        int b = fc + random.nextInt(bc - fc);  
        return new Color(r, g, b);  
    }  
  
    public void setInputStream(ByteArrayInputStream inputStream) {  
       this.inputStream = inputStream;  
    }  
  
    public ByteArrayInputStream getInputStream() {  
        return inputStream;  
    }  
  
}  
