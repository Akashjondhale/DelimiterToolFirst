using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tool : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void processButton_Click(object sender, EventArgs e)
    {

    }
    protected void crossDeleteButton_Click(object sender, EventArgs e)
    {

    }
    protected void btnConvert_Click(object sender, EventArgs e)
    {
        // Get the column data from the textarea
        string columnData = txtColumnData.Value.Trim();
        if (string.IsNullOrEmpty(columnData))
        {
            txtDelimitedData.Text = "No column data provided.";
            return;
        }

        // Get the selected delimiter
        string delimiter = ddlDelimiter.SelectedValue;
        if (delimiter == "\\n")
        {
            delimiter = Environment.NewLine;
        }

        // Split the column data into lines
        string[] lines = columnData.Split(new[] { Environment.NewLine }, StringSplitOptions.None);

        // Join the lines using the selected delimiter
        string delimitedData = string.Join(delimiter, lines);

        // Output the result in the second textarea
        txtDelimitedData.Text = delimitedData;
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        // Clear both textareas
        txtColumnData.Value = string.Empty;
        txtDelimitedData.Text = string.Empty;
    }
}