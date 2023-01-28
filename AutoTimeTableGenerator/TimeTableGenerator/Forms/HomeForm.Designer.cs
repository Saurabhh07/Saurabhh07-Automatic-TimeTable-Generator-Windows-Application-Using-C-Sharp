namespace TimeTableGenerator.Forms
{
    partial class HomeForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.toolStrip1 = new System.Windows.Forms.ToolStrip();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.tsslblDateTime = new System.Windows.Forms.ToolStripStatusLabel();
            this.panelHeader = new System.Windows.Forms.Panel();
            this.toolStripButton2 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton3 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton4 = new System.Windows.Forms.ToolStripButton();
            this.toolStripButton5 = new System.Windows.Forms.ToolStripDropDownButton();
            this.newLecturesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.assignSubjectsToLectureToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripButton1 = new System.Windows.Forms.ToolStripDropDownButton();
            this.addRoomsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.addLabsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripButton6 = new System.Windows.Forms.ToolStripDropDownButton();
            this.newSemestersToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.addSemesterSectionsToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.assignSemesterToProgrameToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.assignSubjectToSemesterToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripDropDownButton1 = new System.Windows.Forms.ToolStripDropDownButton();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripDropDownButton2 = new System.Windows.Forms.ToolStripDropDownButton();
            this.manualTimeTableEntrytoolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.autoGenerateTimeTableToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripDropDownButton3 = new System.Windows.Forms.ToolStripDropDownButton();
            this.printAllTimeTablesToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.printAllTeacherTimeTablesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.printAllDaysWiseTimeTablesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.label1 = new System.Windows.Forms.Label();
            this.toolStrip1.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.panelHeader.SuspendLayout();
            this.SuspendLayout();
            // 
            // toolStrip1
            // 
            this.toolStrip1.ImageScalingSize = new System.Drawing.Size(32, 32);
            this.toolStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripButton2,
            this.toolStripButton3,
            this.toolStripButton4,
            this.toolStripButton5,
            this.toolStripButton1,
            this.toolStripButton6,
            this.toolStripDropDownButton1,
            this.toolStripDropDownButton2,
            this.toolStripDropDownButton3});
            this.toolStrip1.Location = new System.Drawing.Point(0, 0);
            this.toolStrip1.Name = "toolStrip1";
            this.toolStrip1.Size = new System.Drawing.Size(972, 54);
            this.toolStrip1.TabIndex = 0;
            this.toolStrip1.Text = "toolStrip1";
            // 
            // statusStrip1
            // 
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1,
            this.tsslblDateTime});
            this.statusStrip1.Location = new System.Drawing.Point(0, 505);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(972, 22);
            this.statusStrip1.TabIndex = 2;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(66, 17);
            this.toolStripStatusLabel1.Text = "      Ready...";
            // 
            // tsslblDateTime
            // 
            this.tsslblDateTime.Name = "tsslblDateTime";
            this.tsslblDateTime.Size = new System.Drawing.Size(891, 17);
            this.tsslblDateTime.Spring = true;
            this.tsslblDateTime.Text = "toolStripStatusLabel1";
            this.tsslblDateTime.TextAlign = System.Drawing.ContentAlignment.MiddleRight;
            // 
            // panelHeader
            // 
            this.panelHeader.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.panelHeader.BackgroundImage = global::TimeTableGenerator.Properties.Resources.timetablebackgournd;
            this.panelHeader.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.panelHeader.Controls.Add(this.label1);
            this.panelHeader.Location = new System.Drawing.Point(3, 54);
            this.panelHeader.Name = "panelHeader";
            this.panelHeader.Size = new System.Drawing.Size(967, 448);
            this.panelHeader.TabIndex = 1;
            // 
            // toolStripButton2
            // 
            this.toolStripButton2.Image = global::TimeTableGenerator.Properties.Resources.programicon;
            this.toolStripButton2.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton2.Name = "toolStripButton2";
            this.toolStripButton2.Size = new System.Drawing.Size(57, 51);
            this.toolStripButton2.Text = "Program";
            this.toolStripButton2.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolStripButton2.Click += new System.EventHandler(this.toolStripButton2_Click);
            // 
            // toolStripButton3
            // 
            this.toolStripButton3.Image = global::TimeTableGenerator.Properties.Resources.sessionicon;
            this.toolStripButton3.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton3.Name = "toolStripButton3";
            this.toolStripButton3.Size = new System.Drawing.Size(50, 51);
            this.toolStripButton3.Text = "Session";
            this.toolStripButton3.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolStripButton3.Click += new System.EventHandler(this.toolStripButton3_Click);
            // 
            // toolStripButton4
            // 
            this.toolStripButton4.Image = global::TimeTableGenerator.Properties.Resources.subjecticon;
            this.toolStripButton4.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton4.Name = "toolStripButton4";
            this.toolStripButton4.Size = new System.Drawing.Size(55, 51);
            this.toolStripButton4.Text = "Subjects";
            this.toolStripButton4.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.toolStripButton4.Click += new System.EventHandler(this.toolStripButton4_Click);
            // 
            // toolStripButton5
            // 
            this.toolStripButton5.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.newLecturesToolStripMenuItem,
            this.assignSubjectsToLectureToolStripMenuItem});
            this.toolStripButton5.Image = global::TimeTableGenerator.Properties.Resources.teachericon;
            this.toolStripButton5.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton5.Name = "toolStripButton5";
            this.toolStripButton5.Size = new System.Drawing.Size(64, 51);
            this.toolStripButton5.Text = "Lectures";
            this.toolStripButton5.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            // 
            // newLecturesToolStripMenuItem
            // 
            this.newLecturesToolStripMenuItem.Name = "newLecturesToolStripMenuItem";
            this.newLecturesToolStripMenuItem.Size = new System.Drawing.Size(212, 22);
            this.newLecturesToolStripMenuItem.Text = "New Lectures";
            this.newLecturesToolStripMenuItem.Click += new System.EventHandler(this.newLecturesToolStripMenuItem_Click);
            // 
            // assignSubjectsToLectureToolStripMenuItem
            // 
            this.assignSubjectsToLectureToolStripMenuItem.Name = "assignSubjectsToLectureToolStripMenuItem";
            this.assignSubjectsToLectureToolStripMenuItem.Size = new System.Drawing.Size(212, 22);
            this.assignSubjectsToLectureToolStripMenuItem.Text = "Assign Subjects to Lecture";
            this.assignSubjectsToLectureToolStripMenuItem.Click += new System.EventHandler(this.assignSubjectsToLectureToolStripMenuItem_Click);
            // 
            // toolStripButton1
            // 
            this.toolStripButton1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.addRoomsToolStripMenuItem,
            this.addLabsToolStripMenuItem});
            this.toolStripButton1.Image = global::TimeTableGenerator.Properties.Resources.roomsicon;
            this.toolStripButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton1.Name = "toolStripButton1";
            this.toolStripButton1.Size = new System.Drawing.Size(98, 51);
            this.toolStripButton1.Text = "Room\'s / Lab\'s";
            this.toolStripButton1.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            // 
            // addRoomsToolStripMenuItem
            // 
            this.addRoomsToolStripMenuItem.Name = "addRoomsToolStripMenuItem";
            this.addRoomsToolStripMenuItem.Size = new System.Drawing.Size(136, 22);
            this.addRoomsToolStripMenuItem.Text = "Add Rooms";
            this.addRoomsToolStripMenuItem.Click += new System.EventHandler(this.addRoomsToolStripMenuItem_Click);
            // 
            // addLabsToolStripMenuItem
            // 
            this.addLabsToolStripMenuItem.Name = "addLabsToolStripMenuItem";
            this.addLabsToolStripMenuItem.Size = new System.Drawing.Size(136, 22);
            this.addLabsToolStripMenuItem.Text = "Add Labs";
            this.addLabsToolStripMenuItem.Click += new System.EventHandler(this.addLabsToolStripMenuItem_Click);
            // 
            // toolStripButton6
            // 
            this.toolStripButton6.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.newSemestersToolStripMenuItem,
            this.addSemesterSectionsToolStripMenuItem,
            this.assignSemesterToProgrameToolStripMenuItem,
            this.assignSubjectToSemesterToolStripMenuItem});
            this.toolStripButton6.Image = global::TimeTableGenerator.Properties.Resources.semestericon;
            this.toolStripButton6.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripButton6.Name = "toolStripButton6";
            this.toolStripButton6.Size = new System.Drawing.Size(73, 51);
            this.toolStripButton6.Text = "Semesters";
            this.toolStripButton6.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            // 
            // newSemestersToolStripMenuItem
            // 
            this.newSemestersToolStripMenuItem.Name = "newSemestersToolStripMenuItem";
            this.newSemestersToolStripMenuItem.Size = new System.Drawing.Size(223, 22);
            this.newSemestersToolStripMenuItem.Text = "New Semesters";
            this.newSemestersToolStripMenuItem.Click += new System.EventHandler(this.newSemestersToolStripMenuItem_Click);
            // 
            // addSemesterSectionsToolStripMenuItem
            // 
            this.addSemesterSectionsToolStripMenuItem.Name = "addSemesterSectionsToolStripMenuItem";
            this.addSemesterSectionsToolStripMenuItem.Size = new System.Drawing.Size(223, 22);
            this.addSemesterSectionsToolStripMenuItem.Text = "Add Semester Sections";
            this.addSemesterSectionsToolStripMenuItem.Click += new System.EventHandler(this.addSemesterSectionsToolStripMenuItem_Click);
            // 
            // assignSemesterToProgrameToolStripMenuItem
            // 
            this.assignSemesterToProgrameToolStripMenuItem.Name = "assignSemesterToProgrameToolStripMenuItem";
            this.assignSemesterToProgrameToolStripMenuItem.Size = new System.Drawing.Size(223, 22);
            this.assignSemesterToProgrameToolStripMenuItem.Text = "Assign Semester to Program";
            this.assignSemesterToProgrameToolStripMenuItem.Click += new System.EventHandler(this.assignSemesterToProgrameToolStripMenuItem_Click);
            // 
            // assignSubjectToSemesterToolStripMenuItem
            // 
            this.assignSubjectToSemesterToolStripMenuItem.Name = "assignSubjectToSemesterToolStripMenuItem";
            this.assignSubjectToSemesterToolStripMenuItem.Size = new System.Drawing.Size(223, 22);
            this.assignSubjectToSemesterToolStripMenuItem.Text = "Assign Subject to Semester";
            this.assignSubjectToSemesterToolStripMenuItem.Click += new System.EventHandler(this.assignSubjectToSemesterToolStripMenuItem_Click);
            // 
            // toolStripDropDownButton1
            // 
            this.toolStripDropDownButton1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem1,
            this.toolStripMenuItem2});
            this.toolStripDropDownButton1.Image = global::TimeTableGenerator.Properties.Resources.daysicon;
            this.toolStripDropDownButton1.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripDropDownButton1.Name = "toolStripDropDownButton1";
            this.toolStripDropDownButton1.Size = new System.Drawing.Size(45, 51);
            this.toolStripDropDownButton1.Text = "Days";
            this.toolStripDropDownButton1.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(146, 22);
            this.toolStripMenuItem1.Text = "Add Days";
            this.toolStripMenuItem1.Click += new System.EventHandler(this.toolStripMenuItem1_Click);
            // 
            // toolStripMenuItem2
            // 
            this.toolStripMenuItem2.Name = "toolStripMenuItem2";
            this.toolStripMenuItem2.Size = new System.Drawing.Size(146, 22);
            this.toolStripMenuItem2.Text = "Day Time Slot";
            this.toolStripMenuItem2.Click += new System.EventHandler(this.toolStripMenuItem2_Click);
            // 
            // toolStripDropDownButton2
            // 
            this.toolStripDropDownButton2.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.manualTimeTableEntrytoolStripMenuItem,
            this.autoGenerateTimeTableToolStripMenuItem});
            this.toolStripDropDownButton2.Image = global::TimeTableGenerator.Properties.Resources.timetableicon;
            this.toolStripDropDownButton2.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripDropDownButton2.Name = "toolStripDropDownButton2";
            this.toolStripDropDownButton2.Size = new System.Drawing.Size(76, 51);
            this.toolStripDropDownButton2.Text = "Time Table";
            this.toolStripDropDownButton2.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            // 
            // manualTimeTableEntrytoolStripMenuItem
            // 
            this.manualTimeTableEntrytoolStripMenuItem.Name = "manualTimeTableEntrytoolStripMenuItem";
            this.manualTimeTableEntrytoolStripMenuItem.Size = new System.Drawing.Size(209, 22);
            this.manualTimeTableEntrytoolStripMenuItem.Text = "Manual Time Table Entry";
            this.manualTimeTableEntrytoolStripMenuItem.Visible = false;
            this.manualTimeTableEntrytoolStripMenuItem.Click += new System.EventHandler(this.manualTimeTableEntrytoolStripMenuItem_Click);
            // 
            // autoGenerateTimeTableToolStripMenuItem
            // 
            this.autoGenerateTimeTableToolStripMenuItem.Name = "autoGenerateTimeTableToolStripMenuItem";
            this.autoGenerateTimeTableToolStripMenuItem.Size = new System.Drawing.Size(209, 22);
            this.autoGenerateTimeTableToolStripMenuItem.Text = "Auto Generate Time Table";
            this.autoGenerateTimeTableToolStripMenuItem.Click += new System.EventHandler(this.autoGenerateTimeTableToolStripMenuItem_Click);
            // 
            // toolStripDropDownButton3
            // 
            this.toolStripDropDownButton3.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.printAllTimeTablesToolStripMenuItem1,
            this.printAllTeacherTimeTablesToolStripMenuItem,
            this.printAllDaysWiseTimeTablesToolStripMenuItem});
            this.toolStripDropDownButton3.Image = global::TimeTableGenerator.Properties.Resources.printsicon;
            this.toolStripDropDownButton3.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.toolStripDropDownButton3.Name = "toolStripDropDownButton3";
            this.toolStripDropDownButton3.Size = new System.Drawing.Size(77, 51);
            this.toolStripDropDownButton3.Text = "Print";
            // 
            // printAllTimeTablesToolStripMenuItem1
            // 
            this.printAllTimeTablesToolStripMenuItem1.Name = "printAllTimeTablesToolStripMenuItem1";
            this.printAllTimeTablesToolStripMenuItem1.Size = new System.Drawing.Size(236, 22);
            this.printAllTimeTablesToolStripMenuItem1.Text = "Print All Time Tables";
            this.printAllTimeTablesToolStripMenuItem1.Click += new System.EventHandler(this.printAllTimeTablesToolStripMenuItem1_Click);
            // 
            // printAllTeacherTimeTablesToolStripMenuItem
            // 
            this.printAllTeacherTimeTablesToolStripMenuItem.Name = "printAllTeacherTimeTablesToolStripMenuItem";
            this.printAllTeacherTimeTablesToolStripMenuItem.Size = new System.Drawing.Size(236, 22);
            this.printAllTeacherTimeTablesToolStripMenuItem.Text = "Print All Teacher Time Tables";
            this.printAllTeacherTimeTablesToolStripMenuItem.Click += new System.EventHandler(this.printAllTeacherTimeTablesToolStripMenuItem_Click);
            // 
            // printAllDaysWiseTimeTablesToolStripMenuItem
            // 
            this.printAllDaysWiseTimeTablesToolStripMenuItem.Name = "printAllDaysWiseTimeTablesToolStripMenuItem";
            this.printAllDaysWiseTimeTablesToolStripMenuItem.Size = new System.Drawing.Size(236, 22);
            this.printAllDaysWiseTimeTablesToolStripMenuItem.Text = "Print All Days Wise Time Tables";
            this.printAllDaysWiseTimeTablesToolStripMenuItem.Click += new System.EventHandler(this.printAllDaysWiseTimeTablesToolStripMenuItem_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Century Schoolbook", 50F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Italic))), System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.White;
            this.label1.Location = new System.Drawing.Point(74, 228);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(421, 162);
            this.label1.TabIndex = 0;
            this.label1.Text = "Time Table\r\n Generator";
            this.label1.Click += new System.EventHandler(this.label1_Click);
            // 
            // HomeForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(972, 527);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.panelHeader);
            this.Controls.Add(this.toolStrip1);
            this.Name = "HomeForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Auto Time Table Generator";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.HomeForm_Load);
            this.toolStrip1.ResumeLayout(false);
            this.toolStrip1.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.panelHeader.ResumeLayout(false);
            this.panelHeader.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ToolStrip toolStrip1;
        private System.Windows.Forms.ToolStripButton toolStripButton2;
        private System.Windows.Forms.ToolStripButton toolStripButton3;
        private System.Windows.Forms.ToolStripButton toolStripButton4;
        private System.Windows.Forms.ToolStripDropDownButton toolStripButton5;
        private System.Windows.Forms.ToolStripMenuItem newLecturesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem assignSubjectsToLectureToolStripMenuItem;
        private System.Windows.Forms.ToolStripDropDownButton toolStripButton1;
        private System.Windows.Forms.ToolStripMenuItem addRoomsToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem addLabsToolStripMenuItem;
        private System.Windows.Forms.ToolStripDropDownButton toolStripButton6;
        private System.Windows.Forms.ToolStripMenuItem newSemestersToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem assignSemesterToProgrameToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem assignSubjectToSemesterToolStripMenuItem;
        private System.Windows.Forms.ToolStripDropDownButton toolStripDropDownButton1;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem2;
        private System.Windows.Forms.ToolStripMenuItem addSemesterSectionsToolStripMenuItem;
        private System.Windows.Forms.ToolStripDropDownButton toolStripDropDownButton2;
        private System.Windows.Forms.ToolStripMenuItem manualTimeTableEntrytoolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem autoGenerateTimeTableToolStripMenuItem;
        private System.Windows.Forms.ToolStripDropDownButton toolStripDropDownButton3;
        private System.Windows.Forms.ToolStripMenuItem printAllTimeTablesToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem printAllTeacherTimeTablesToolStripMenuItem;
        private System.Windows.Forms.Panel panelHeader;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        private System.Windows.Forms.ToolStripStatusLabel tsslblDateTime;
        private System.Windows.Forms.ToolStripMenuItem printAllDaysWiseTimeTablesToolStripMenuItem;
        private System.Windows.Forms.Label label1;
    }
}