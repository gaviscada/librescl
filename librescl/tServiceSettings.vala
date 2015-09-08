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
 *  Copyright (c) 2013, 2014 Daniel Espinosa
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

namespace Lscl
{
  public class tServiceSettings : Serializable
  {
    [Description(nick="cbName", blurb="Control block name")]
    public tServiceSettingsEnum cb_name { get; set; default = tServiceSettingsEnum.FIX; }
    [Description(nick="datSet", blurb="Data set reference")]
    public tServiceSettingsEnum dat_set { get; set; default = tServiceSettingsEnum.FIX; }
  }
  public enum tServiceSettingsEnum
  {
    DYN,
    CONF,
    FIX
  }
}