package ArchiveExecutionGovernanceModule.service;

public class ArchiveExecutionGovernanceTemplateDetails {
    
	 String seq_no, level, taskGroup, taskName;
	
	public ArchiveExecutionGovernanceTemplateDetails(String seq_no, String level, String taskGroup, String taskName) {	
		this.seq_no = seq_no;
		this.level = level;
		this.taskGroup = taskGroup;
		this.taskName = taskName;
	}
	
}
