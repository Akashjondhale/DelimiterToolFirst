using iText.Kernel.Pdf.Canvas.Parser;
using iText.Kernel.Pdf;
using System;
using System.Collections.Generic;
//using System.IO;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using Xceed.Words.NET;
using System;
using System.IO;
using System.Web.UI;
using GemBox.Document;

public partial class Converter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ComponentInfo.SetLicense("FREE-LIMITED-KEY");
    }
    protected void btnConvert_Click(object sender, EventArgs e)
    {
        //if (fileUploadPDF.HasFile)
        //{
        //    string originalFileName = Path.GetFileNameWithoutExtension(fileUploadPDF.FileName);
        //    string wordFileName = originalFileName + ".docx";
        //    // Read the PDF file from the uploaded content
        //    using (Stream pdfStream = fileUploadPDF.PostedFile.InputStream)
        //    {
        //        // Extract text from PDF using iText 7
        //        string extractedText = ExtractTextFromPDF(pdfStream);

        //        // Create a Word document using DocX
        //        using (MemoryStream wordStream = new MemoryStream())
        //        {
        //            using (DocX wordDocument = DocX.Create(wordStream))
        //            {
        //                // Add extracted text to the Word document
        //                wordDocument.InsertParagraph(extractedText);

        //                // Save the Word document
        //                wordDocument.Save();
        //            }

        //            wordStream.Position = 0;

        //            // Send the Word file to the browser for download
        //            Response.ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
        //            //   Response.AddHeader("content-disposition", "attachment;filename=ConvertedFile.docx");
        //            Response.AddHeader("content-disposition", $"attachment;filename={wordFileName}");
        //            Response.BinaryWrite(wordStream.ToArray());
        //            Response.End();
        //        }
        //    }
        //}
        //else
        //{
        //    lblMessage.Text = "Please select a PDF file to convert.";
        //}
        if (fileUploadPDF.HasFile)
        {
            string originalFileName = Path.GetFileNameWithoutExtension(fileUploadPDF.FileName);
            string wordFileName = originalFileName + ".docx";

            // Read the PDF file from the uploaded content
            using (Stream pdfStream = fileUploadPDF.PostedFile.InputStream)
            {
                // Load the PDF document
                var document = DocumentModel.Load(pdfStream, LoadOptions.PdfDefault);

                // Save the document as a Word file
                using (MemoryStream wordStream = new MemoryStream())
                {
                    document.Save(wordStream, SaveOptions.DocxDefault); // Convert to Word
                    wordStream.Position = 0; // Reset the stream position for reading

                    // Send the Word file to the browser for download
                    Response.Clear();
                    Response.ContentType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
                    Response.AddHeader("Content-Disposition", $"attachment; filename={wordFileName}");
                    Response.BinaryWrite(wordStream.ToArray());
                    Response.Flush();
                    Response.End();
                }
            }
        }
        else
        {
            lblMessage.Text = "Please select a PDF file to convert.";
        }
    }

    // Helper function to extract text from PDF using iText 7
    //private string ExtractTextFromPDF(Stream pdfStream)
    //{
    //    PdfDocument pdfDoc = new PdfDocument(new PdfReader(pdfStream));
    //    StringWriter textWriter = new StringWriter();
    //    for (int i = 1; i <= pdfDoc.GetNumberOfPages(); i++)
    //    {
    //        textWriter.WriteLine(PdfTextExtractor.GetTextFromPage(pdfDoc.GetPage(i)));
    //    }
    //    pdfDoc.Close();
    //    return textWriter.ToString();
    //}
}