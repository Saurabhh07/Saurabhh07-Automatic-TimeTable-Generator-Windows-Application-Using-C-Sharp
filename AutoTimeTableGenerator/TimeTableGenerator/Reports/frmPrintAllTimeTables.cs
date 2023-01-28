using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace TimeTableGenerator.Reports
{
    public partial class frmPrintAllTimeTables : Form
    {
        public frmPrintAllTimeTables()
        {
            InitializeComponent();
            rpt_PrintAllTimeTables rpt = new rpt_PrintAllTimeTables();
            rpt.Refresh();
            crv.ReportSource = rpt;
        }

        private void frmPrintAllTimeTables_Load(object sender, EventArgs e)
        {

        }
    }
}
