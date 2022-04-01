package NewArchiveRequirements.LegacyApplicationInfo.retentionDetails.Service;

public class archiveRetentionTemplateService {

	int seq_num;
	String retentionCheck, retentionLevel, condition, dateUsedType, dateUsed, desc;
	
	public archiveRetentionTemplateService(int seq_num, String retentionCheck, String retentionLevel, String condition, String dateUsedType, String dateUsed, String desc) {
		
				this.seq_num = seq_num;
				this.retentionCheck = retentionCheck;
				this.retentionLevel = retentionLevel;
				this.condition = condition;
				this.dateUsedType = dateUsedType;
				this.dateUsed = dateUsed;
				this.desc = desc;		
	}
	
	
}
