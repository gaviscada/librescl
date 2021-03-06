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
	public class tTrgOps : Serializable
	{
		[Description(nick="dchg", blurb="dchg enabled means that a change in the value of that attribute should cause a report")]
		public SerializableBool dchg { get; set; }
		[Description(nick="qchg", blurb="dchg enabled means that a change in the value of the quality for that attribute should cause a report")]
		public SerializableBool qchg { get; set; }
		[Description(nick="dupd", blurb="dupd enabled A report or a log entry shall be generated due to freezing the value of a freezable attribute or updating the value of any other attribute")]
		public SerializableBool dupd { get; set; }
		[Description(nick="period", blurb="if it es enabled integrity period is relevant")]
		public SerializableBool period { get; set; }
		/* Edition 2.0 */
		[Description(nick="gi", blurb="general interrogation")]
		public SerializableBool gi { get; set; }

		public tTrgOps () { _property_edition.set ("gi", Edition.SECOND); }
	}
}

