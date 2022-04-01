package NewArchiveRequirements.LegacyApplicationInfo.Service;

public class archiveReqLegacyTemplateInfo {

	int seq_num;
	String label,column,options,type,mandatory,value;
	
	public archiveReqLegacyTemplateInfo(int seq_num, String options, String label, String column, String type, String mandatory, String value) {
		
				this.seq_num = seq_num;
				this.options = options;
				this.label = label;
				this.column = column;
				this.type = type;
				this.mandatory = mandatory;
				this.value = value;		
	}

}
