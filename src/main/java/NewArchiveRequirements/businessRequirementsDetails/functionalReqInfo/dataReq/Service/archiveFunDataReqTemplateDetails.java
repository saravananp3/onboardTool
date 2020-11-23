package NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Service;

public class archiveFunDataReqTemplateDetails {

	int seq_num ;
	String reqId, reqInScope, reqType, req, additionInfo;
	
	public archiveFunDataReqTemplateDetails(int seq_num, String reqId, String reqInScope, String reqType, String req, String additionInfo) {
		
		this.seq_num = seq_num;
		this.reqId = reqId;
		this.reqInScope = reqInScope;
		this.reqType = reqType;
		this.req = req;
		this.additionInfo = additionInfo;
	}
	
}
