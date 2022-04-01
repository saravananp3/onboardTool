package exportPdf;

public class waterMarkConditions {
	
	private String appName;
	private String oppId;
	private boolean showLogo;
	
	public waterMarkConditions(String appName, String oppId, boolean showLogo) {
		super();
		this.appName = appName;
		this.oppId = oppId;
		this.showLogo = showLogo;
	}

	public String getAppName() {
		return appName;
	}
	
	public void setAppName(String appName) {
		this.appName = appName;
	}
	
	public String getOppId() {
		return oppId;
	}
	
	public void setOppId(String oppId) {
		this.oppId = oppId;
	}

	public boolean isShowLogo() {
		return showLogo;
	}

	public void setShowLogo(boolean showLogo) {
		this.showLogo = showLogo;
	}
	
}
