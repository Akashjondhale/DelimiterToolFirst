using System;
using System.IO;
using System.Web.UI;
using GemBox.Document;

public partial class World_to_pdf_converter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ComponentInfo.SetLicense("FREE-LIMITED-KEY");
    }

    protected void btnConvertToPDF_Click(object sender, EventArgs e)
    {

        if (fileUploadWord.HasFile)
        {
            string originalFileName = Path.GetFileNameWithoutExtension(fileUploadWord.FileName);
            string pdfFileName = originalFileName + ".pdf";

            // Read the Word file from the uploaded content
            using (Stream wordStream = fileUploadWord.PostedFile.InputStream)
            {
                // Load the Word document using GemBox.Document
                DocumentModel document = DocumentModel.Load(wordStream);

                // Save the document as a PDF
                using (MemoryStream pdfStream = new MemoryStream())
                {
                    document.Save(pdfStream, SaveOptions.PdfDefault); // Convert to PDF
                    pdfStream.Position = 0; // Reset the stream position for reading

                    // Send the PDF file to the browser for download
                    Response.Clear();
                    Response.ContentType = "application/pdf";
                    Response.AddHeader("Content-Disposition", $"attachment; filename={pdfFileName}");
                    Response.BinaryWrite(pdfStream.ToArray());
                    Response.Flush();
                    Response.End();
                }
            }
        }
        else
        {
            lblMessage.Text = "Please select a Word file to convert.";
        }
    }
}
