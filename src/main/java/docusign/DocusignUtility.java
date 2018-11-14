package docusign;

import com.docusign.esign.api.EnvelopesApi;
import com.docusign.esign.client.ApiClient;
import com.docusign.esign.client.ApiException;
import com.docusign.esign.client.Configuration;
import com.docusign.esign.client.auth.OAuth;
import com.docusign.esign.model.*;
import com.migcomponents.migbase64.Base64;
import org.junit.*;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.*;
import java.util.List;

public class DocusignUtility {

    private static final String RedirectURI = "https://appdemo.docusign.com";
    private static final String OAuthBaseUrl = "account-d.docusign.com";
    private static final String BaseUrl = "https://demo.docusign.net/restapi";
    private static final String IntegratorKey = "9a87f67e-1079-44b2-9309-f64ed4a4cc6e";
    private static final String UserId = "82ee6844-85fd-4716-986f-f8a4b6921c22";
    private static final String publicKeyFilename = "D:\\shankar\\officeproject\\onboarding_gradle_project\\src\\main\\webapp\\docs\\publickey.txt";
    private static final String privateKeyFilename = "D:\\shankar\\officeproject\\onboarding_gradle_project\\src\\main\\webapp\\docs\\privatekey.txt";
    //private static final String UserName = "jn.shankarganesh@gmail.com";
    //private static final String SignTest1File = "/src/test/docs/SignTest1.pdf";
    //private static final String PdfSample = "/src/test/docs/Intake_review.pdf";
    //private static final String TemplateId = "d54ffe5b-216a-4f73-b62e-c7fba66227a4\n";
    //private String EnvelopeId = "5dee8599-13e1-46e4-891b-ee6de60519e8\n";
    public void requestDocumentSigning(ByteArrayOutputStream fileOutputStream, Map.Entry<String,String> users) {
        System.out.println("\nRequestASignatureTest:\n" + "===========================================");
        byte[] fileBytes = null;
            String currentDir = System.getProperty("user.dir");
            fileBytes = fileOutputStream.toByteArray();

        // create an envelope to be signed
        EnvelopeDefinition envDef = new EnvelopeDefinition();
        envDef.setEmailSubject("Please Sign the Document");
        envDef.setEmailBlurb("Please Sign the document");

        // add a document to the envelope
        Document doc = new Document();
        String base64Doc = Base64.encodeToString(fileBytes, false);
        doc.setDocumentBase64(base64Doc);
        doc.setName("IntakeReview.pdf");
        doc.setDocumentId("1");

        Document doc1 = new Document();
        String base64Doc1 = Base64.encodeToString(fileBytes, false);
        doc1.setDocumentBase64(base64Doc1);
        doc1.setName("IntakeReview.pdf");
        doc1.setDocumentId("2");

        List<Document> docs = new ArrayList<Document>();
        docs.add(doc);
        //docs.add(doc1);
        envDef.setDocuments(docs);

        // Add a recipient to sign the document

        List<Signer> signerListTabs=new ArrayList();
            Signer signer = new Signer();
            signer.setEmail(users.getKey());
            signer.setName(users.getValue());
            signer.setRecipientId(UUID.randomUUID().toString());

        // Create a SignHere tab somewhere on the document for the signer to
        // sign
        SignHere signHere = new SignHere();
        signHere.setDocumentId("1");
        signHere.setPageNumber("1");
        signHere.setRecipientId("1");
        signHere.setXPosition("100");
        signHere.setYPosition("100");
        signHere.setScaleValue("0.5");

        List<SignHere> signHereTabs = new ArrayList<SignHere>();
         //signHereTabs.add(signHere);
        Tabs tabs = new Tabs();
        tabs.setSignHereTabs(signHereTabs);

            signer.setTabs(tabs);
            signerListTabs.add(signer);


        // Above causes issue
        envDef.setRecipients(new Recipients());
        envDef.getRecipients().setSigners(new ArrayList<Signer>());
        signerListTabs.forEach(s->envDef.getRecipients().getSigners().add(s));


        // send the envelope (otherwise it will be "created" in the Draft folder
        envDef.setStatus("sent");

        ApiClient apiClient = new ApiClient(BaseUrl);

        try {
            // IMPORTANT NOTE:
            // the first time you ask for a JWT access token, you should grant access by making the following call
            // get DocuSign OAuth authorization url:
            //String oauthLoginUrl = apiClient.getJWTUri(IntegratorKey, RedirectURI, OAuthBaseUrl);
            // open DocuSign OAuth authorization url in the browser, login and grant access
            //Desktop.getDesktop().browse(URI.create(oauthLoginUrl));
            // END OF NOTE

            apiClient.configureJWTAuthorizationFlow(publicKeyFilename, privateKeyFilename, OAuthBaseUrl, IntegratorKey, UserId, 3600);

            // now that the API client has an OAuth token, let's use it in all
            // DocuSign APIs
            OAuth.UserInfo userInfo = apiClient.getUserInfo(apiClient.getAccessToken());
            Assert.assertNotSame(null, userInfo);
            Assert.assertNotNull(userInfo.getAccounts());
            Assert.assertTrue(userInfo.getAccounts().size() > 0);

            System.out.println("UserInfo: " + userInfo);
            // parse first account's baseUrl
            // below code required for production, no effect in demo (same
            // domain)
            apiClient.setBasePath(userInfo.getAccounts().get(0).getBaseUri() + "/restapi");
            Configuration.setDefaultApiClient(apiClient);
            String accountId = userInfo.getAccounts().get(0).getAccountId();

            EnvelopesApi envelopesApi = new EnvelopesApi();

            EnvelopeSummary envelopeSummary = envelopesApi.createEnvelope(accountId, envDef);

            Assert.assertNotNull(envelopeSummary);
            Assert.assertNotNull(envelopeSummary.getEnvelopeId());
            Assert.assertEquals("sent", envelopeSummary.getStatus());

            System.out.println("EnvelopeSummary: " + envelopeSummary);

        } catch (ApiException ex) {
            ex.printStackTrace();
            //System.out.println("Exception: " + ex);
        } catch (Exception e) {
            e.printStackTrace();
            //System.out.println("Exception: " + e.getLocalizedMessage());
        }
    }



}


