package ca.quinsam.webcamserver.io;

import java.io.File;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;

import ca.quinsam.webcamserver.core.Config;
import ca.quinsam.webcamserver.util.CompareByDateModified;

/**
 * Handles Image IO for FTP webcams
 * @author Chad Humphries
 * Date Created: 2022-06-09
 */
public class ImageIO {
	private static ArrayList<File> files;
	private static LocalDate currentDate;
	private static LocalDate keepDate;
	private static int imageCount;
	private static int maxImages;
	
	private ImageIO() {}
	
	/**
	 * Load Images from file system
	 * @param path Webcam image path
	 */
	public static void loadImages(String path) {
		imageCount = 0;
		File[] filesArray = flushImages(new File(Config.getRoot() + "/" + path).listFiles());
		files = new java.util.ArrayList<>();
		for(int i = 0; i < filesArray.length; i++) {
			if(filesArray[i] != null && !filesArray[i].getName().equalsIgnoreCase(".DS_Store") && !filesArray[i].getName().equalsIgnoreCase("DS_Store")) {
				files.add(filesArray[i]);
				imageCount++;
			}
		}
		maxImages = imageCount;
		files.sort(new CompareByDateModified());
	}
	
	/**
	 * Flush out images older than a certain date (configured in Config class)
	 * @param filesArray Array of files from webcam
	 * @return Array of non outdated files from webcam
	 */
	public static File[] flushImages(File[] filesArray) {
		currentDate = LocalDate.now();
		keepDate = currentDate.minusWeeks(Config.getWeeksToKeep());
		
		int deleted = 0;
		for(int i = 0; i < filesArray.length; i++) {
			LocalDate fileAge = Instant.ofEpochMilli(filesArray[i].lastModified()).atZone(ZoneId.systemDefault()).toLocalDate();
			if(fileAge.isBefore(keepDate)) {
				filesArray[i].delete();
				filesArray[i] = null;
				deleted++;
			}
		}
		
		File[] output = new File[filesArray.length - deleted];
		int outputIndex = 0;
		for(int i = 0; i < filesArray.length; i++) {
			if(filesArray[i] != null) {
				output[outputIndex] = filesArray[i];
				outputIndex++;
			}
		}
		return output;
	}
	
	public static int getImageCount() {
		return imageCount;
	}
	
	public static int getMaxImages() {
		return maxImages;
	}
	
	public static File getImage(int index) {
		return files.get(index);
	}
}
