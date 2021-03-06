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
using Xml;

public class Lscl.SclDocument : Scl
{
  private File _file;
  private bool _backup;
  private bool _enable_private = true;
  /**
   * Signal for operation on a file.
   *
   * An operation in a File has stared and is in progress, for reading or writting.
   */
  public signal void file_operation_start (string path);
  /**
   * Signal for operation on a file.
   *
   * An operation in a File has been ended, for reading or writting.
   */
  public signal void file_operation_end (string path);

  public SclDocument () {
    string path = GLib.Environment.get_home_dir ()+"/generic.scd";
    _file  = File.new_for_path (path);
#if DEBUG
    GLib.message ("Default save file to is: "+path);
#endif
    _backup = false;
  }
  /**
   * If true, includes all {@link Lscl.tPrivate} from loading.
   */
  public bool get_enable_private () { return _enable_private; }
  /**
   * If false, excludes all {@link Lscl.tPrivate} from loading.
   */
  public void set_enable_private (bool enable) { _enable_private = enable; }
  /**
   * Get file as a {@link GLib.File}.
   */
  public GLib.File get_file () { return _file; }
  /**
   * Set file from a {@link GLib.File}.
   */
  public bool set_file (GLib.File file)
  {
    return_val_if_fail (file.query_exists (), false);
    _file = file;
    return true;
  }
  /**
   * Get file path.
   */
  public string get_file_path () { return _file.get_path (); }
  /**
   * Set file path. If file doesn't exist no change is made.
   */
  public void set_file_path (string path)
  {
    var f = File.new_for_path (path);
    if (f.query_exists ())
      _file = f;
  }
  /**
   * Get file a backup is saved before to save configuration.
   */
  public bool get_backup () { return _backup; }
  /**
   * Set file backup when saving a configuration.
   */
  public void set_backup (bool backup) { _backup = false; }
  /**
   * Saves SCL Document to the current file using the given IEC 61850 Edition version.
   */
  public bool save (Cancellable? cancellable = null) 
    throws GLib.Error
  {
    return_val_if_fail (_file != null, false);
    write_file (_file);
    return true;
  }
  /**
   * Saves SCL Document to given file using the given IEC 61850 Edition version
   * no change in file's name is made, then next {@link save()} operations will
   * save to original file setted by {@link set_file()}.
   */
  public bool save_as (GLib.File file, Lscl.Edition edition = Lscl.Edition.FIRST, Cancellable? cancellable = null) throws GLib.Error
  {
    return_val_if_fail (set_edition (edition), false);
    write_file (file);
    return true;
  }

  /**
   * Read an {@link Lscl.Scl} document from URI. Updates files used to save to
   * by default.
   */
  public bool read_from_uri (string uri) throws GLib.Error
  {
    var file = File.new_for_uri (uri);
    return_val_if_fail (file.query_exists (), false);
    _file = file;
    (this as GomElement).read_from_file (_file);
    return true;
  }
  /**
   * Read SCL Document from given {@link GLib.File}.
   */
  public bool read_from_path (string path) throws GLib.Error
  {
    var file = File.new_for_path (path);
    return_val_if_fail (file.query_exists (), false);
    _file = file;
    (this as GomElement).read_from_file (_file);
    return true;
  }
  /**
   * Read SCL Document from given {@link GLib.File} set by {@link set_file()}.
   */
  public bool read () throws GLib.Error
  {
    return_val_if_fail (_file != null, false);
    return_val_if_fail (_file.query_exists (), false);
    (this as GomElement).read_from_file (_file);
    return true;
  }
}
