# -*- coding: iso-8859-1 -*-#!/usr/bin/env python##Copyright 2008 Jelle Feringa (jelleferinga@gmail.com)####This file is part of pythonOCC.####pythonOCC is free software: you can redistribute it and/or modify##it under the terms of the GNU General Public License as published by##the Free Software Foundation, either version 3 of the License, or##(at your option) any later version.####pythonOCC is distributed in the hope that it will be useful,##but WITHOUT ANY WARRANTY; without even the implied warranty of##MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the##GNU General Public License for more details.####You should have received a copy of the GNU General Public License##along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.# This module give information about a TopoDS_Shapefrom OCC.TopoDS import *from Explorer import HLExplorerfrom OCC.BRep import *from OCC.Geom import *def face_is_plane(face):    ''' Returns True if the TopoDS_Shape is a plane, False otherwise    '''    hs = BRep_Tool().Surface(face)    downcast_result = Handle_Geom_Plane().DownCast(hs)    # the handle is null if downcast failed or is not possible,    # that is to say the face is not a plane    if downcast_result.IsNull():        return False    else:        return Truedef face_is_cylinder(face):    ''' Returns True is the TopoDS_Shape is a cylinder, False otherwise    '''    hs = BRep_Tool().Surface(face)    handle_geom_plane = Handle_Geom_Cylinder().DownCast(hs)    if downcast_result.IsNull():        return False    else:        return True    if __name__=='__main__':    from OCC.BRepPrimAPI import *    ms = BRepPrimAPI_MakeCylinder(100,50).Shape()    faces = HLExplorer(ms).faces()    for face in faces:        print "Check plane for face %s:%s"%(face,face_is_plane(face))