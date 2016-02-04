/**
 *
 *  LibreSCL
 *
 *  Authors:
 *
 *       Daniel Espinosa <esodan@gmail.com>
 *       PowerMedia Consulting <pwmediaconsulting@gmail.com>
 *
 *
 *  Copyright (c) 2013 Daniel Espinosa
 *  Copyright (c) 2014 PowerMedia Consulting
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU Lesser General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Lesser General Public License for more details.
 *
 *  You should have received a copy of the GNU Lesser General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
using GXml;
namespace Lscl
{
	public class tSDO : tNaming, SerializableMapKey<string>
	{
		[Description(nick="type", blurb="References the DOType defining the contents of the SDO.")]	
		public string do_type { get; set; }
		// SerializableMapId
		public string get_map_key () { return name; }

		public class HashMap : SerializableHashMap<string,tSDO> {
			public new tSDO @get (string name) { return base.get (name); }
      public new GLib.List<string> list_keys () { return (GLib.List<string>) base.list_keys (); }
      public new GLib.List<tSDO> list_values () { return (GLib.List<tSDO>) base.list_values (); }
		}
	}
}

