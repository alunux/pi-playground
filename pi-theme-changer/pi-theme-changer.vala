using Gtk;
using Posix;

public class Application : Gtk.Window
{
	public Application (string img_path, string img_path2, string img_path3)
	{
		this.title = "Pi Look Changer";
		this.window_position = Gtk.WindowPosition.CENTER;
		this.destroy.connect (Gtk.main_quit);
		this.set_resizable (false);

		Gtk.Button pi_grey = new Gtk.Button.with_label ("Pi Grey");
		Gtk.Button pi_green = new Gtk.Button.with_label ("Pi Green");
		Gtk.Button pi_green_light = new Gtk.Button.with_label ("Pi Green Light");

		Gtk.Box box2 = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
		box2.pack_start (new Gtk.Image.from_file (img_path), false, false, 0);
		box2.pack_start (pi_grey, false, false, 0);
		
		Gtk.Box box4 = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
		box4.pack_start (new Gtk.Image.from_file(img_path3), false, false, 0);
		box4.pack_start (pi_green, false, false, 0);

		Gtk.Box box3 = new Gtk.Box (Gtk.Orientation.VERTICAL, 0);
		box3.pack_start (new Gtk.Image.from_file(img_path2), false, false, 0);
		box3.pack_start (pi_green_light, false, false, 0);

		Gtk.Box box = new Gtk.Box (Gtk.Orientation.HORIZONTAL, 0);
		box.pack_start (box2, false, false, 0);
		box.pack_start (box4, false, false, 0);
		box.pack_end (box3, false, false, 0);
		this.add (box);
		
		pi_grey.clicked.connect (() =>
		{
			Posix.system("pi-theme-script grey");
		});
		pi_green.clicked.connect (() =>
		{
			Posix.system("pi-theme-script green");
		});
		pi_green_light.clicked.connect (() =>
		{
			Posix.system("pi-theme-script green-light");
		});
	}

	public static int main (string[] args)
	{
		Gtk.init (ref args);

		string img_path = "/usr/share/pi-apps/pi-theme-changer/img/pi-grey.png";
		string img_path2 = "/usr/share/pi-apps/pi-theme-changer/img/pi-green-light.png";
		string img_path3 = "/usr/share/pi-apps/pi-theme-changer/img/pi-green.png";

		Application app = new Application (img_path, img_path2, img_path3);
		app.show_all ();
		Gtk.main ();
		return 0;
	}
}
