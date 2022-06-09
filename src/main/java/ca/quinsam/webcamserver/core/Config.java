package ca.quinsam.webcamserver.core;

import java.io.IOException;
import java.io.Reader;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;

import com.google.gson.Gson;

/**
 * Loads config data from file
 * @author Chad Humphries
 * Date Created: 2022-06-08
 */
public class Config {
	private static final String CONFIG_FILE = "/Users/quinsam/eclipse-workspace/WebcamServer/src/main/resources/config.json";
	private static final int WEEKS_TO_KEEP = 2;
	private static String URL;
	private static String root;
	private static String klemtuNorth;
	private static String klemtuSouth;
	private static String portHardy;
	
	private Config() {}
	
	/**
	 * Read file and load data into memory
	 * @throws IOException Issue reading file
	 */
	public static void readFile() throws IOException {
		Gson gson = new Gson();
		Reader reader = Files.newBufferedReader(Paths.get(CONFIG_FILE));
		Map<?, ?> configMap = gson.fromJson(reader, Map.class);
		
		for(Map.Entry<?, ?> entry : configMap.entrySet()) {
			switch(entry.getKey().toString()) {
				case "url":
					URL = entry.getValue().toString();
					break;
				case "root":
					root = entry.getValue().toString();
					break;
					
				// Locations
				case "klemtuNorth":
					klemtuNorth = entry.getValue().toString();
					break;
				case "klemtuSouth":
					klemtuSouth = entry.getValue().toString();
					break;
				case "portHardy":
					portHardy = entry.getValue().toString();
					break;
			}
		}
	}
	
	public static int getWeeksToKeep() {
		return WEEKS_TO_KEEP;
	}

	public static String getURL() {
		return URL;
	}
	
	public static String getRoot() {
		return root;
	}
	
	public static String getKlemtuNorth() {
		return klemtuNorth;
	}
	
	public static String getKlemtuSouth() {
		return klemtuSouth;
	}
	
	public static String getPortHardy() {
		return portHardy;
	}
}
