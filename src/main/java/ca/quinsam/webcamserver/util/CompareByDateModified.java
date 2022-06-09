package ca.quinsam.webcamserver.util;

import java.io.File;
import java.util.Comparator;

/**
 * Comparator for sorting files from oldest to newest
 * @author Chad Humphries
 * Date Created: 2022-06-09
 */
public class CompareByDateModified implements Comparator<File> {
	@Override
	public int compare(File f1, File f2) {
		return Long.valueOf(f1.lastModified()).compareTo(f2.lastModified());
	}
}
