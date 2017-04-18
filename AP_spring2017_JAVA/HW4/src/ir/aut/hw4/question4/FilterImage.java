package ir.aut.hw4.question4;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.Random;

/**
 *
 * Created by Rahimi on 3/16/17.
 */
public class FilterImage {


    private BufferedImage image;
    private File outFile;

    public FilterImage(String source, String result) {
        File img = new File(source);
        outFile = new File(result);
        try {
            image = ImageIO.read(img);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    private BufferedImage filterColor(int rgb) {
        BufferedImage img = image;
        for (int i = 0; i < img.getWidth(); i++) {
            for (int j = 0; j < img.getHeight(); j++) {
                img.setRGB(i, j, image.getRGB(i, j) & rgb);
            }
        }
        return img;
    }

    public BufferedImage filterRedColor() {
        return filterColor(0xFF00FFFF);
    }


    public BufferedImage filterGreenColor() {
        return filterColor(0xFFFF00FF);

    }

    public BufferedImage filterBlueColor() {
        return filterColor(0xFFFFFF00);
    }

    public BufferedImage blackAndWhite() {
        BufferedImage img = image;
        for (int i = 0; i < img.getWidth(); i++) {
            for (int j = 0; j < img.getHeight(); j++) {
                int r = (image.getRGB(i, j) & 0x00FF0000) >> 16;
                int g = (image.getRGB(i, j) & 0x0000FF00) >> 8;
                int b = (image.getRGB(i, j) & 0x000000FF);

                int mid = (r + g + b)/3;
                int rgb = (mid << 16) + (mid << 8) + mid;

                img.setRGB(i, j, rgb);
            }
        }
        return img;
    }

    public BufferedImage randomImage() {
        Random rand = new Random();
        BufferedImage img = new BufferedImage(200, 200, BufferedImage.TYPE_INT_RGB);
        for (int i = 0; i < img.getWidth(); i++) {
            for (int j = 0; j < img.getHeight(); j++) {
                img.setRGB(i, j, rand.nextInt(256));
            }
        }
        return img;

    }

    public BufferedImage duplicateImage() {
        BufferedImage img = new BufferedImage(image.getWidth(), image.getHeight()*2, image.getType());
        for (int i = 0; i < img.getWidth(); i++) {
            for (int j = 0; j < img.getHeight(); j++) {
                img.setRGB(i, j, image.getRGB(i, j%image.getHeight()));
            }
        }
        return img;
    }

    public BufferedImage negativeImage() {
        BufferedImage img = image;

        double [][] mask = new double[][] {
                {0.25, 0.25, 0.25},
                {0.25, 0.25, 0.25},
                {0.25, 0.25, 0.25}
        };

        maskImage(img, mask, 3);
        return img;
    }

    private void maskImage(BufferedImage img, double[][] mask, int size) {
        for (int i = 0; i < img.getWidth(); i++) {
            for (int j = 0; j < img.getHeight(); j++) {
                if (i > (size/2) && i < img.getWidth() - (size/2) - 1
                        && j > (size/2) && j < img.getHeight() - (size/2) - 1) {
                    int rgb = 0;
                    for (int k = 0; k < size; k++) {
                        for (int l = 0; l < size; l++) {
                            rgb += img.getRGB(i + k - 1, j + l - 1) * mask[k][l];
                        }
                    }
                    img.setRGB(i, j, rgb / 9);
                }
            }
        }
    }

    public BufferedImage motionBlurImage() {
        BufferedImage img = image;

        double [][] mask = new double[][] {
                {1, 0, 0, 0, 0},
                {0, 1, 0, 0, 0},
                {0, 0, 1, 0, 0},
                {0, 0, 0, 1, 0},
                {0, 0, 0, 0, 1}
        };

        maskImage(img, mask, 5);

        return img;
    }


    public void writeImage(BufferedImage img) {
        try {
            ImageIO.write(img, "jpg", outFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
