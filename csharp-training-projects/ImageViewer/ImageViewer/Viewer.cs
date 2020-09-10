using System.Drawing;
using System.Windows.Forms;

/**
 * @author Oguz Aktas
 */

namespace ImageViewer
{
    public partial class Viewer : Form
    {
        public Viewer()
        {
            InitializeComponent(); // Panel allows to scroll the image
        }

        public Image ImageBox
        {
            set
            {
                this.pictureBox1.Image = value;
                this.pictureBox1.Size = value.Size;
            }
        }

        private void Viewer_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (pictureBox1.Image != null)
            {
                pictureBox1.Dispose();
            }
        }
    }
}
