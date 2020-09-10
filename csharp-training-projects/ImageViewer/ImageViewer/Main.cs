using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Windows.Forms;

/**
 * @author Oguz Aktas
 */

namespace ImageViewer
{
    public partial class Main : Form
    {
        List<string> files = new List<string>();
        public Main()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (OpenFileDialog ofd = new OpenFileDialog() { Multiselect = true, ValidateNames = true, Filter = "JPEG|*.jpg" })
            {
                if (ofd.ShowDialog() == DialogResult.OK)
                {
                    files.Clear();
                    listView1.Items.Clear();
                    foreach (string file in ofd.FileNames)
                    {
                        FileInfo fi = new FileInfo(file);
                        files.Add(fi.FullName);
                        listView1.Items.Add(fi.Name, 0);
                    }
                }
            }
        }

        private void listView1_ItemActivate(object sender, EventArgs e)
        {
            if (listView1.FocusedItem != null)
            {
                using (Viewer viewer = new Viewer())
                {
                    Image img = Image.FromFile(files[listView1.FocusedItem.Index]);
                    viewer.ImageBox = img;
                    viewer.ShowDialog();
                }
            }
        }
    }
}
