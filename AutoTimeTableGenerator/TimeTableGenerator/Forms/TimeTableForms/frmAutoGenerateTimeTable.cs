using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using TimeTableGenerator.SourceCode;
using TimeTableGenerator.TimeTableCode;

namespace TimeTableGenerator.Forms.TimeTableForms
{
    public partial class frmAutoGenerateTimeTable : Form
    {
        public frmAutoGenerateTimeTable()
        {
            InitializeComponent();
        }

        private void frmAutoGenerateTimeTable_Load(object sender, EventArgs e)
        {
             
        }

        private void btnAutoGenerateAllTimeTable_Click(object sender, EventArgs e)
        {
            try
            {
                ep.Clear();
                string message = GenerateTimeTable.AutoGenerateTimeTable(dtpFromDate.Value, dtpToDate.Value);
                MessageBox.Show(message);
                return;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
