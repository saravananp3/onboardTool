package File_Utility;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
public class FileUtils {
	private String path;

    public FileUtils() {
    }

    public FileUtils(String path){
        this.path = path;
    }

    public String getPath() {
        return path;
    }

    public static File createFile(String path){
        return new File(path);
    }
    
    public static FileOutputStream createFileOut(String path) throws FileNotFoundException{
        return new FileOutputStream(path);
    }
}
