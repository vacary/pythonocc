/*

Copyright 2008-2009 Thomas Paviot (thomas.paviot@free.fr)

This file is part of pythonOCC.

pythonOCC is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

pythonOCC is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with pythonOCC.  If not, see <http://www.gnu.org/licenses/>.

*/
%module StepBasic

%include typemaps.i
%include cmalloc.i
%include cpointer.i
%include carrays.i
%include exception.i

#ifndef _Standard_TypeDef_HeaderFile
#define _Standard_TypeDef_HeaderFile
#define Standard_False (Standard_Boolean) 0
#define Standard_True  (Standard_Boolean) 1
#endif

/*
Exception handling
*/
%{#include <Standard_Failure.hxx>%}
%exception
{
    try
    {
        $action
    } 
    catch(Standard_Failure)
    {
        SWIG_exception(SWIG_RuntimeError,Standard_Failure::Caught()->DynamicType()->Name());
    }
}

/*
Standard_Real & function transformation
*/
%typemap(argout) Standard_Real &OutValue {
    PyObject *o, *o2, *o3;
    o = PyFloat_FromDouble(*$1);
    if ((!$result) || ($result == Py_None)) {
        $result = o;
    } else {
        if (!PyTuple_Check($result)) {
            PyObject *o2 = $result;
            $result = PyTuple_New(1);
            PyTuple_SetItem($result,0,o2);
        }
        o3 = PyTuple_New(1);
        PyTuple_SetItem(o3,0,o);
        o2 = $result;
        $result = PySequence_Concat(o2,o3);
        Py_DECREF(o2);
        Py_DECREF(o3);
    }
}

%typemap(in,numinputs=0) Standard_Real &OutValue(Standard_Real temp) {
    $1 = &temp;
}

/*
Standard_Integer & function transformation
*/
%typemap(argout) Standard_Integer &OutValue {
    PyObject *o, *o2, *o3;
    o = PyInt_FromLong(*$1);
    if ((!$result) || ($result == Py_None)) {
        $result = o;
    } else {
        if (!PyTuple_Check($result)) {
            PyObject *o2 = $result;
            $result = PyTuple_New(1);
            PyTuple_SetItem($result,0,o2);
        }
        o3 = PyTuple_New(1);
        PyTuple_SetItem(o3,0,o);
        o2 = $result;
        $result = PySequence_Concat(o2,o3);
        Py_DECREF(o2);
        Py_DECREF(o3);
    }
}

%typemap(in,numinputs=0) Standard_Integer &OutValue(Standard_Integer temp) {
    $1 = &temp;
}


%include StepBasic_dependencies.i


%include StepBasic_headers.i


enum StepBasic_SiUnitName {
	StepBasic_sunMetre,
	StepBasic_sunGram,
	StepBasic_sunSecond,
	StepBasic_sunAmpere,
	StepBasic_sunKelvin,
	StepBasic_sunMole,
	StepBasic_sunCandela,
	StepBasic_sunRadian,
	StepBasic_sunSteradian,
	StepBasic_sunHertz,
	StepBasic_sunNewton,
	StepBasic_sunPascal,
	StepBasic_sunJoule,
	StepBasic_sunWatt,
	StepBasic_sunCoulomb,
	StepBasic_sunVolt,
	StepBasic_sunFarad,
	StepBasic_sunOhm,
	StepBasic_sunSiemens,
	StepBasic_sunWeber,
	StepBasic_sunTesla,
	StepBasic_sunHenry,
	StepBasic_sunDegreeCelsius,
	StepBasic_sunLumen,
	StepBasic_sunLux,
	StepBasic_sunBecquerel,
	StepBasic_sunGray,
	StepBasic_sunSievert,
	};

enum StepBasic_SiPrefix {
	StepBasic_spExa,
	StepBasic_spPeta,
	StepBasic_spTera,
	StepBasic_spGiga,
	StepBasic_spMega,
	StepBasic_spKilo,
	StepBasic_spHecto,
	StepBasic_spDeca,
	StepBasic_spDeci,
	StepBasic_spCenti,
	StepBasic_spMilli,
	StepBasic_spMicro,
	StepBasic_spNano,
	StepBasic_spPico,
	StepBasic_spFemto,
	StepBasic_spAtto,
	};

enum StepBasic_Source {
	StepBasic_sMade,
	StepBasic_sBought,
	StepBasic_sNotKnown,
	};

enum StepBasic_AheadOrBehind {
	StepBasic_aobAhead,
	StepBasic_aobExact,
	StepBasic_aobBehind,
	};



%nodefaultctor Handle_StepBasic_Person;
class Handle_StepBasic_Person : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_Person();
		%feature("autodoc", "1");
		Handle_StepBasic_Person(const Handle_StepBasic_Person &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_Person(const StepBasic_Person *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_Person const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Person {
	StepBasic_Person* GetObject() {
	return (StepBasic_Person*)$self->Access();
	}
};
%extend Handle_StepBasic_Person {
	~Handle_StepBasic_Person() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_Person\n");}
	}
};

%nodefaultctor Handle_StepBasic_IdentificationRole;
class Handle_StepBasic_IdentificationRole : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_IdentificationRole();
		%feature("autodoc", "1");
		Handle_StepBasic_IdentificationRole(const Handle_StepBasic_IdentificationRole &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_IdentificationRole(const StepBasic_IdentificationRole *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_IdentificationRole const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_IdentificationRole {
	StepBasic_IdentificationRole* GetObject() {
	return (StepBasic_IdentificationRole*)$self->Access();
	}
};
%extend Handle_StepBasic_IdentificationRole {
	~Handle_StepBasic_IdentificationRole() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_IdentificationRole\n");}
	}
};

%nodefaultctor Handle_StepBasic_ApplicationContextElement;
class Handle_StepBasic_ApplicationContextElement : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ApplicationContextElement();
		%feature("autodoc", "1");
		Handle_StepBasic_ApplicationContextElement(const Handle_StepBasic_ApplicationContextElement &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ApplicationContextElement(const StepBasic_ApplicationContextElement *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ApplicationContextElement const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApplicationContextElement {
	StepBasic_ApplicationContextElement* GetObject() {
	return (StepBasic_ApplicationContextElement*)$self->Access();
	}
};
%extend Handle_StepBasic_ApplicationContextElement {
	~Handle_StepBasic_ApplicationContextElement() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ApplicationContextElement\n");}
	}
};

%nodefaultctor Handle_StepBasic_MeasureWithUnit;
class Handle_StepBasic_MeasureWithUnit : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_MeasureWithUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_MeasureWithUnit(const Handle_StepBasic_MeasureWithUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_MeasureWithUnit(const StepBasic_MeasureWithUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_MeasureWithUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_MeasureWithUnit {
	StepBasic_MeasureWithUnit* GetObject() {
	return (StepBasic_MeasureWithUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_MeasureWithUnit {
	~Handle_StepBasic_MeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_MeasureWithUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_PlaneAngleMeasureWithUnit;
class Handle_StepBasic_PlaneAngleMeasureWithUnit : public Handle_StepBasic_MeasureWithUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_PlaneAngleMeasureWithUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_PlaneAngleMeasureWithUnit(const Handle_StepBasic_PlaneAngleMeasureWithUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_PlaneAngleMeasureWithUnit(const StepBasic_PlaneAngleMeasureWithUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_PlaneAngleMeasureWithUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_PlaneAngleMeasureWithUnit {
	StepBasic_PlaneAngleMeasureWithUnit* GetObject() {
	return (StepBasic_PlaneAngleMeasureWithUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_PlaneAngleMeasureWithUnit {
	~Handle_StepBasic_PlaneAngleMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_PlaneAngleMeasureWithUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_Document;
class Handle_StepBasic_Document : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_Document();
		%feature("autodoc", "1");
		Handle_StepBasic_Document(const Handle_StepBasic_Document &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_Document(const StepBasic_Document *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_Document const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Document {
	StepBasic_Document* GetObject() {
	return (StepBasic_Document*)$self->Access();
	}
};
%extend Handle_StepBasic_Document {
	~Handle_StepBasic_Document() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_Document\n");}
	}
};

%nodefaultctor Handle_StepBasic_NamedUnit;
class Handle_StepBasic_NamedUnit : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_NamedUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_NamedUnit(const Handle_StepBasic_NamedUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_NamedUnit(const StepBasic_NamedUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_NamedUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_NamedUnit {
	StepBasic_NamedUnit* GetObject() {
	return (StepBasic_NamedUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_NamedUnit {
	~Handle_StepBasic_NamedUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_NamedUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_SiUnit;
class Handle_StepBasic_SiUnit : public Handle_StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnit(const Handle_StepBasic_SiUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnit(const StepBasic_SiUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnit {
	StepBasic_SiUnit* GetObject() {
	return (StepBasic_SiUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_SiUnit {
	~Handle_StepBasic_SiUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SiUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit;
class Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit : public Handle_StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit(const Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit(const StepBasic_SiUnitAndThermodynamicTemperatureUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit {
	StepBasic_SiUnitAndThermodynamicTemperatureUnit* GetObject() {
	return (StepBasic_SiUnitAndThermodynamicTemperatureUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit {
	~Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_ApprovalRelationship;
class Handle_StepBasic_ApprovalRelationship : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalRelationship();
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalRelationship(const Handle_StepBasic_ApprovalRelationship &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalRelationship(const StepBasic_ApprovalRelationship *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalRelationship const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApprovalRelationship {
	StepBasic_ApprovalRelationship* GetObject() {
	return (StepBasic_ApprovalRelationship*)$self->Access();
	}
};
%extend Handle_StepBasic_ApprovalRelationship {
	~Handle_StepBasic_ApprovalRelationship() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ApprovalRelationship\n");}
	}
};

%nodefaultctor Handle_StepBasic_ApprovalAssignment;
class Handle_StepBasic_ApprovalAssignment : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalAssignment(const Handle_StepBasic_ApprovalAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalAssignment(const StepBasic_ApprovalAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApprovalAssignment {
	StepBasic_ApprovalAssignment* GetObject() {
	return (StepBasic_ApprovalAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_ApprovalAssignment {
	~Handle_StepBasic_ApprovalAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ApprovalAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_ApprovalStatus;
class Handle_StepBasic_ApprovalStatus : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalStatus();
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalStatus(const Handle_StepBasic_ApprovalStatus &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalStatus(const StepBasic_ApprovalStatus *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalStatus const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApprovalStatus {
	StepBasic_ApprovalStatus* GetObject() {
	return (StepBasic_ApprovalStatus*)$self->Access();
	}
};
%extend Handle_StepBasic_ApprovalStatus {
	~Handle_StepBasic_ApprovalStatus() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ApprovalStatus\n");}
	}
};

%nodefaultctor Handle_StepBasic_ActionMethod;
class Handle_StepBasic_ActionMethod : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ActionMethod();
		%feature("autodoc", "1");
		Handle_StepBasic_ActionMethod(const Handle_StepBasic_ActionMethod &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ActionMethod(const StepBasic_ActionMethod *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ActionMethod const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ActionMethod {
	StepBasic_ActionMethod* GetObject() {
	return (StepBasic_ActionMethod*)$self->Access();
	}
};
%extend Handle_StepBasic_ActionMethod {
	~Handle_StepBasic_ActionMethod() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ActionMethod\n");}
	}
};

%nodefaultctor Handle_StepBasic_SiUnitAndSolidAngleUnit;
class Handle_StepBasic_SiUnitAndSolidAngleUnit : public Handle_StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndSolidAngleUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndSolidAngleUnit(const Handle_StepBasic_SiUnitAndSolidAngleUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndSolidAngleUnit(const StepBasic_SiUnitAndSolidAngleUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndSolidAngleUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndSolidAngleUnit {
	StepBasic_SiUnitAndSolidAngleUnit* GetObject() {
	return (StepBasic_SiUnitAndSolidAngleUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_SiUnitAndSolidAngleUnit {
	~Handle_StepBasic_SiUnitAndSolidAngleUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SiUnitAndSolidAngleUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_Approval;
class Handle_StepBasic_Approval : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_Approval();
		%feature("autodoc", "1");
		Handle_StepBasic_Approval(const Handle_StepBasic_Approval &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_Approval(const StepBasic_Approval *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_Approval const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Approval {
	StepBasic_Approval* GetObject() {
	return (StepBasic_Approval*)$self->Access();
	}
};
%extend Handle_StepBasic_Approval {
	~Handle_StepBasic_Approval() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_Approval\n");}
	}
};

%nodefaultctor Handle_StepBasic_SiUnitAndTimeUnit;
class Handle_StepBasic_SiUnitAndTimeUnit : public Handle_StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndTimeUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndTimeUnit(const Handle_StepBasic_SiUnitAndTimeUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndTimeUnit(const StepBasic_SiUnitAndTimeUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndTimeUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndTimeUnit {
	StepBasic_SiUnitAndTimeUnit* GetObject() {
	return (StepBasic_SiUnitAndTimeUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_SiUnitAndTimeUnit {
	~Handle_StepBasic_SiUnitAndTimeUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SiUnitAndTimeUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_ActionRequestAssignment;
class Handle_StepBasic_ActionRequestAssignment : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ActionRequestAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_ActionRequestAssignment(const Handle_StepBasic_ActionRequestAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ActionRequestAssignment(const StepBasic_ActionRequestAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ActionRequestAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ActionRequestAssignment {
	StepBasic_ActionRequestAssignment* GetObject() {
	return (StepBasic_ActionRequestAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_ActionRequestAssignment {
	~Handle_StepBasic_ActionRequestAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ActionRequestAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_IdentificationAssignment;
class Handle_StepBasic_IdentificationAssignment : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_IdentificationAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_IdentificationAssignment(const Handle_StepBasic_IdentificationAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_IdentificationAssignment(const StepBasic_IdentificationAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_IdentificationAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_IdentificationAssignment {
	StepBasic_IdentificationAssignment* GetObject() {
	return (StepBasic_IdentificationAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_IdentificationAssignment {
	~Handle_StepBasic_IdentificationAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_IdentificationAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_ExternalIdentificationAssignment;
class Handle_StepBasic_ExternalIdentificationAssignment : public Handle_StepBasic_IdentificationAssignment {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ExternalIdentificationAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_ExternalIdentificationAssignment(const Handle_StepBasic_ExternalIdentificationAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ExternalIdentificationAssignment(const StepBasic_ExternalIdentificationAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ExternalIdentificationAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ExternalIdentificationAssignment {
	StepBasic_ExternalIdentificationAssignment* GetObject() {
	return (StepBasic_ExternalIdentificationAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_ExternalIdentificationAssignment {
	~Handle_StepBasic_ExternalIdentificationAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ExternalIdentificationAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_ProductDefinition;
class Handle_StepBasic_ProductDefinition : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinition();
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinition(const Handle_StepBasic_ProductDefinition &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinition(const StepBasic_ProductDefinition *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinition const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinition {
	StepBasic_ProductDefinition* GetObject() {
	return (StepBasic_ProductDefinition*)$self->Access();
	}
};
%extend Handle_StepBasic_ProductDefinition {
	~Handle_StepBasic_ProductDefinition() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ProductDefinition\n");}
	}
};

%nodefaultctor Handle_StepBasic_ProductDefinitionWithAssociatedDocuments;
class Handle_StepBasic_ProductDefinitionWithAssociatedDocuments : public Handle_StepBasic_ProductDefinition {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionWithAssociatedDocuments();
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionWithAssociatedDocuments(const Handle_StepBasic_ProductDefinitionWithAssociatedDocuments &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionWithAssociatedDocuments(const StepBasic_ProductDefinitionWithAssociatedDocuments *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionWithAssociatedDocuments const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinitionWithAssociatedDocuments {
	StepBasic_ProductDefinitionWithAssociatedDocuments* GetObject() {
	return (StepBasic_ProductDefinitionWithAssociatedDocuments*)$self->Access();
	}
};
%extend Handle_StepBasic_ProductDefinitionWithAssociatedDocuments {
	~Handle_StepBasic_ProductDefinitionWithAssociatedDocuments() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ProductDefinitionWithAssociatedDocuments\n");}
	}
};

%nodefaultctor Handle_StepBasic_Date;
class Handle_StepBasic_Date : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_Date();
		%feature("autodoc", "1");
		Handle_StepBasic_Date(const Handle_StepBasic_Date &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_Date(const StepBasic_Date *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_Date const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Date {
	StepBasic_Date* GetObject() {
	return (StepBasic_Date*)$self->Access();
	}
};
%extend Handle_StepBasic_Date {
	~Handle_StepBasic_Date() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_Date\n");}
	}
};

%nodefaultctor Handle_StepBasic_OrdinalDate;
class Handle_StepBasic_OrdinalDate : public Handle_StepBasic_Date {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_OrdinalDate();
		%feature("autodoc", "1");
		Handle_StepBasic_OrdinalDate(const Handle_StepBasic_OrdinalDate &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_OrdinalDate(const StepBasic_OrdinalDate *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_OrdinalDate const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_OrdinalDate {
	StepBasic_OrdinalDate* GetObject() {
	return (StepBasic_OrdinalDate*)$self->Access();
	}
};
%extend Handle_StepBasic_OrdinalDate {
	~Handle_StepBasic_OrdinalDate() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_OrdinalDate\n");}
	}
};

%nodefaultctor Handle_StepBasic_ProductContext;
class Handle_StepBasic_ProductContext : public Handle_StepBasic_ApplicationContextElement {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ProductContext();
		%feature("autodoc", "1");
		Handle_StepBasic_ProductContext(const Handle_StepBasic_ProductContext &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductContext(const StepBasic_ProductContext *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductContext const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductContext {
	StepBasic_ProductContext* GetObject() {
	return (StepBasic_ProductContext*)$self->Access();
	}
};
%extend Handle_StepBasic_ProductContext {
	~Handle_StepBasic_ProductContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ProductContext\n");}
	}
};

%nodefaultctor Handle_StepBasic_MechanicalContext;
class Handle_StepBasic_MechanicalContext : public Handle_StepBasic_ProductContext {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_MechanicalContext();
		%feature("autodoc", "1");
		Handle_StepBasic_MechanicalContext(const Handle_StepBasic_MechanicalContext &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_MechanicalContext(const StepBasic_MechanicalContext *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_MechanicalContext const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_MechanicalContext {
	StepBasic_MechanicalContext* GetObject() {
	return (StepBasic_MechanicalContext*)$self->Access();
	}
};
%extend Handle_StepBasic_MechanicalContext {
	~Handle_StepBasic_MechanicalContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_MechanicalContext\n");}
	}
};

%nodefaultctor Handle_StepBasic_MassMeasureWithUnit;
class Handle_StepBasic_MassMeasureWithUnit : public Handle_StepBasic_MeasureWithUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_MassMeasureWithUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_MassMeasureWithUnit(const Handle_StepBasic_MassMeasureWithUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_MassMeasureWithUnit(const StepBasic_MassMeasureWithUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_MassMeasureWithUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_MassMeasureWithUnit {
	StepBasic_MassMeasureWithUnit* GetObject() {
	return (StepBasic_MassMeasureWithUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_MassMeasureWithUnit {
	~Handle_StepBasic_MassMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_MassMeasureWithUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_ProductDefinitionContext;
class Handle_StepBasic_ProductDefinitionContext : public Handle_StepBasic_ApplicationContextElement {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionContext();
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionContext(const Handle_StepBasic_ProductDefinitionContext &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionContext(const StepBasic_ProductDefinitionContext *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionContext const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinitionContext {
	StepBasic_ProductDefinitionContext* GetObject() {
	return (StepBasic_ProductDefinitionContext*)$self->Access();
	}
};
%extend Handle_StepBasic_ProductDefinitionContext {
	~Handle_StepBasic_ProductDefinitionContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ProductDefinitionContext\n");}
	}
};

%nodefaultctor Handle_StepBasic_DesignContext;
class Handle_StepBasic_DesignContext : public Handle_StepBasic_ProductDefinitionContext {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DesignContext();
		%feature("autodoc", "1");
		Handle_StepBasic_DesignContext(const Handle_StepBasic_DesignContext &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DesignContext(const StepBasic_DesignContext *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DesignContext const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DesignContext {
	StepBasic_DesignContext* GetObject() {
	return (StepBasic_DesignContext*)$self->Access();
	}
};
%extend Handle_StepBasic_DesignContext {
	~Handle_StepBasic_DesignContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DesignContext\n");}
	}
};

%nodefaultctor Handle_StepBasic_DateAndTimeAssignment;
class Handle_StepBasic_DateAndTimeAssignment : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DateAndTimeAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_DateAndTimeAssignment(const Handle_StepBasic_DateAndTimeAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DateAndTimeAssignment(const StepBasic_DateAndTimeAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DateAndTimeAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DateAndTimeAssignment {
	StepBasic_DateAndTimeAssignment* GetObject() {
	return (StepBasic_DateAndTimeAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_DateAndTimeAssignment {
	~Handle_StepBasic_DateAndTimeAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DateAndTimeAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_ProductCategoryRelationship;
class Handle_StepBasic_ProductCategoryRelationship : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ProductCategoryRelationship();
		%feature("autodoc", "1");
		Handle_StepBasic_ProductCategoryRelationship(const Handle_StepBasic_ProductCategoryRelationship &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductCategoryRelationship(const StepBasic_ProductCategoryRelationship *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductCategoryRelationship const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductCategoryRelationship {
	StepBasic_ProductCategoryRelationship* GetObject() {
	return (StepBasic_ProductCategoryRelationship*)$self->Access();
	}
};
%extend Handle_StepBasic_ProductCategoryRelationship {
	~Handle_StepBasic_ProductCategoryRelationship() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ProductCategoryRelationship\n");}
	}
};

%nodefaultctor Handle_StepBasic_ObjectRole;
class Handle_StepBasic_ObjectRole : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ObjectRole();
		%feature("autodoc", "1");
		Handle_StepBasic_ObjectRole(const Handle_StepBasic_ObjectRole &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ObjectRole(const StepBasic_ObjectRole *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ObjectRole const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ObjectRole {
	StepBasic_ObjectRole* GetObject() {
	return (StepBasic_ObjectRole*)$self->Access();
	}
};
%extend Handle_StepBasic_ObjectRole {
	~Handle_StepBasic_ObjectRole() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ObjectRole\n");}
	}
};

%nodefaultctor Handle_StepBasic_SecurityClassification;
class Handle_StepBasic_SecurityClassification : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassification();
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassification(const Handle_StepBasic_SecurityClassification &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassification(const StepBasic_SecurityClassification *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassification const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SecurityClassification {
	StepBasic_SecurityClassification* GetObject() {
	return (StepBasic_SecurityClassification*)$self->Access();
	}
};
%extend Handle_StepBasic_SecurityClassification {
	~Handle_StepBasic_SecurityClassification() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SecurityClassification\n");}
	}
};

%nodefaultctor Handle_StepBasic_ConversionBasedUnit;
class Handle_StepBasic_ConversionBasedUnit : public Handle_StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnit(const Handle_StepBasic_ConversionBasedUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnit(const StepBasic_ConversionBasedUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnit {
	StepBasic_ConversionBasedUnit* GetObject() {
	return (StepBasic_ConversionBasedUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_ConversionBasedUnit {
	~Handle_StepBasic_ConversionBasedUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ConversionBasedUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndRatioUnit;
class Handle_StepBasic_ConversionBasedUnitAndRatioUnit : public Handle_StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndRatioUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndRatioUnit(const Handle_StepBasic_ConversionBasedUnitAndRatioUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndRatioUnit(const StepBasic_ConversionBasedUnitAndRatioUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndRatioUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndRatioUnit {
	StepBasic_ConversionBasedUnitAndRatioUnit* GetObject() {
	return (StepBasic_ConversionBasedUnitAndRatioUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_ConversionBasedUnitAndRatioUnit {
	~Handle_StepBasic_ConversionBasedUnitAndRatioUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ConversionBasedUnitAndRatioUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_PersonAndOrganization;
class Handle_StepBasic_PersonAndOrganization : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganization();
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganization(const Handle_StepBasic_PersonAndOrganization &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganization(const StepBasic_PersonAndOrganization *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganization const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_PersonAndOrganization {
	StepBasic_PersonAndOrganization* GetObject() {
	return (StepBasic_PersonAndOrganization*)$self->Access();
	}
};
%extend Handle_StepBasic_PersonAndOrganization {
	~Handle_StepBasic_PersonAndOrganization() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_PersonAndOrganization\n");}
	}
};

%nodefaultctor Handle_StepBasic_ActionRequestSolution;
class Handle_StepBasic_ActionRequestSolution : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ActionRequestSolution();
		%feature("autodoc", "1");
		Handle_StepBasic_ActionRequestSolution(const Handle_StepBasic_ActionRequestSolution &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ActionRequestSolution(const StepBasic_ActionRequestSolution *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ActionRequestSolution const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ActionRequestSolution {
	StepBasic_ActionRequestSolution* GetObject() {
	return (StepBasic_ActionRequestSolution*)$self->Access();
	}
};
%extend Handle_StepBasic_ActionRequestSolution {
	~Handle_StepBasic_ActionRequestSolution() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ActionRequestSolution\n");}
	}
};

%nodefaultctor Handle_StepBasic_DocumentReference;
class Handle_StepBasic_DocumentReference : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentReference();
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentReference(const Handle_StepBasic_DocumentReference &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentReference(const StepBasic_DocumentReference *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentReference const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentReference {
	StepBasic_DocumentReference* GetObject() {
	return (StepBasic_DocumentReference*)$self->Access();
	}
};
%extend Handle_StepBasic_DocumentReference {
	~Handle_StepBasic_DocumentReference() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DocumentReference\n");}
	}
};

%nodefaultctor Handle_StepBasic_CoordinatedUniversalTimeOffset;
class Handle_StepBasic_CoordinatedUniversalTimeOffset : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_CoordinatedUniversalTimeOffset();
		%feature("autodoc", "1");
		Handle_StepBasic_CoordinatedUniversalTimeOffset(const Handle_StepBasic_CoordinatedUniversalTimeOffset &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_CoordinatedUniversalTimeOffset(const StepBasic_CoordinatedUniversalTimeOffset *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_CoordinatedUniversalTimeOffset const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_CoordinatedUniversalTimeOffset {
	StepBasic_CoordinatedUniversalTimeOffset* GetObject() {
	return (StepBasic_CoordinatedUniversalTimeOffset*)$self->Access();
	}
};
%extend Handle_StepBasic_CoordinatedUniversalTimeOffset {
	~Handle_StepBasic_CoordinatedUniversalTimeOffset() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_CoordinatedUniversalTimeOffset\n");}
	}
};

%nodefaultctor Handle_StepBasic_SolidAngleUnit;
class Handle_StepBasic_SolidAngleUnit : public Handle_StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SolidAngleUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_SolidAngleUnit(const Handle_StepBasic_SolidAngleUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SolidAngleUnit(const StepBasic_SolidAngleUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SolidAngleUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SolidAngleUnit {
	StepBasic_SolidAngleUnit* GetObject() {
	return (StepBasic_SolidAngleUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_SolidAngleUnit {
	~Handle_StepBasic_SolidAngleUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SolidAngleUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_MeasureValueMember;
class Handle_StepBasic_MeasureValueMember : public Handle_StepData_SelectReal {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_MeasureValueMember();
		%feature("autodoc", "1");
		Handle_StepBasic_MeasureValueMember(const Handle_StepBasic_MeasureValueMember &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_MeasureValueMember(const StepBasic_MeasureValueMember *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_MeasureValueMember const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_MeasureValueMember {
	StepBasic_MeasureValueMember* GetObject() {
	return (StepBasic_MeasureValueMember*)$self->Access();
	}
};
%extend Handle_StepBasic_MeasureValueMember {
	~Handle_StepBasic_MeasureValueMember() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_MeasureValueMember\n");}
	}
};

%nodefaultctor Handle_StepBasic_SiUnitAndAreaUnit;
class Handle_StepBasic_SiUnitAndAreaUnit : public Handle_StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndAreaUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndAreaUnit(const Handle_StepBasic_SiUnitAndAreaUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndAreaUnit(const StepBasic_SiUnitAndAreaUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndAreaUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndAreaUnit {
	StepBasic_SiUnitAndAreaUnit* GetObject() {
	return (StepBasic_SiUnitAndAreaUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_SiUnitAndAreaUnit {
	~Handle_StepBasic_SiUnitAndAreaUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SiUnitAndAreaUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_DocumentType;
class Handle_StepBasic_DocumentType : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentType();
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentType(const Handle_StepBasic_DocumentType &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentType(const StepBasic_DocumentType *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentType const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentType {
	StepBasic_DocumentType* GetObject() {
	return (StepBasic_DocumentType*)$self->Access();
	}
};
%extend Handle_StepBasic_DocumentType {
	~Handle_StepBasic_DocumentType() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DocumentType\n");}
	}
};

%nodefaultctor Handle_StepBasic_HArray1OfProductDefinition;
class Handle_StepBasic_HArray1OfProductDefinition : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfProductDefinition();
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfProductDefinition(const Handle_StepBasic_HArray1OfProductDefinition &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfProductDefinition(const StepBasic_HArray1OfProductDefinition *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfProductDefinition const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfProductDefinition {
	StepBasic_HArray1OfProductDefinition* GetObject() {
	return (StepBasic_HArray1OfProductDefinition*)$self->Access();
	}
};
%extend Handle_StepBasic_HArray1OfProductDefinition {
	~Handle_StepBasic_HArray1OfProductDefinition() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_HArray1OfProductDefinition\n");}
	}
};

%nodefaultctor Handle_StepBasic_ProductDefinitionFormation;
class Handle_StepBasic_ProductDefinitionFormation : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormation();
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormation(const Handle_StepBasic_ProductDefinitionFormation &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormation(const StepBasic_ProductDefinitionFormation *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormation const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinitionFormation {
	StepBasic_ProductDefinitionFormation* GetObject() {
	return (StepBasic_ProductDefinitionFormation*)$self->Access();
	}
};
%extend Handle_StepBasic_ProductDefinitionFormation {
	~Handle_StepBasic_ProductDefinitionFormation() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ProductDefinitionFormation\n");}
	}
};

%nodefaultctor Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource;
class Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource : public Handle_StepBasic_ProductDefinitionFormation {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource();
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource(const Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource(const StepBasic_ProductDefinitionFormationWithSpecifiedSource *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource {
	StepBasic_ProductDefinitionFormationWithSpecifiedSource* GetObject() {
	return (StepBasic_ProductDefinitionFormationWithSpecifiedSource*)$self->Access();
	}
};
%extend Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource {
	~Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource\n");}
	}
};

%nodefaultctor Handle_StepBasic_RatioUnit;
class Handle_StepBasic_RatioUnit : public Handle_StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_RatioUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_RatioUnit(const Handle_StepBasic_RatioUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_RatioUnit(const StepBasic_RatioUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_RatioUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_RatioUnit {
	StepBasic_RatioUnit* GetObject() {
	return (StepBasic_RatioUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_RatioUnit {
	~Handle_StepBasic_RatioUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_RatioUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_DocumentRepresentationType;
class Handle_StepBasic_DocumentRepresentationType : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentRepresentationType();
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentRepresentationType(const Handle_StepBasic_DocumentRepresentationType &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentRepresentationType(const StepBasic_DocumentRepresentationType *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentRepresentationType const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentRepresentationType {
	StepBasic_DocumentRepresentationType* GetObject() {
	return (StepBasic_DocumentRepresentationType*)$self->Access();
	}
};
%extend Handle_StepBasic_DocumentRepresentationType {
	~Handle_StepBasic_DocumentRepresentationType() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DocumentRepresentationType\n");}
	}
};

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
class Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit : public Handle_StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit(const Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit(const StepBasic_ConversionBasedUnitAndPlaneAngleUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit {
	StepBasic_ConversionBasedUnitAndPlaneAngleUnit* GetObject() {
	return (StepBasic_ConversionBasedUnitAndPlaneAngleUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit {
	~Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_EffectivityAssignment;
class Handle_StepBasic_EffectivityAssignment : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_EffectivityAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_EffectivityAssignment(const Handle_StepBasic_EffectivityAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_EffectivityAssignment(const StepBasic_EffectivityAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_EffectivityAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_EffectivityAssignment {
	StepBasic_EffectivityAssignment* GetObject() {
	return (StepBasic_EffectivityAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_EffectivityAssignment {
	~Handle_StepBasic_EffectivityAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_EffectivityAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_SecurityClassificationAssignment;
class Handle_StepBasic_SecurityClassificationAssignment : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassificationAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassificationAssignment(const Handle_StepBasic_SecurityClassificationAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassificationAssignment(const StepBasic_SecurityClassificationAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassificationAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SecurityClassificationAssignment {
	StepBasic_SecurityClassificationAssignment* GetObject() {
	return (StepBasic_SecurityClassificationAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_SecurityClassificationAssignment {
	~Handle_StepBasic_SecurityClassificationAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SecurityClassificationAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_ProductCategory;
class Handle_StepBasic_ProductCategory : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ProductCategory();
		%feature("autodoc", "1");
		Handle_StepBasic_ProductCategory(const Handle_StepBasic_ProductCategory &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductCategory(const StepBasic_ProductCategory *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductCategory const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductCategory {
	StepBasic_ProductCategory* GetObject() {
	return (StepBasic_ProductCategory*)$self->Access();
	}
};
%extend Handle_StepBasic_ProductCategory {
	~Handle_StepBasic_ProductCategory() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ProductCategory\n");}
	}
};

%nodefaultctor Handle_StepBasic_PersonAndOrganizationRole;
class Handle_StepBasic_PersonAndOrganizationRole : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganizationRole();
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganizationRole(const Handle_StepBasic_PersonAndOrganizationRole &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganizationRole(const StepBasic_PersonAndOrganizationRole *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganizationRole const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_PersonAndOrganizationRole {
	StepBasic_PersonAndOrganizationRole* GetObject() {
	return (StepBasic_PersonAndOrganizationRole*)$self->Access();
	}
};
%extend Handle_StepBasic_PersonAndOrganizationRole {
	~Handle_StepBasic_PersonAndOrganizationRole() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_PersonAndOrganizationRole\n");}
	}
};

%nodefaultctor Handle_StepBasic_HArray1OfApproval;
class Handle_StepBasic_HArray1OfApproval : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfApproval();
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfApproval(const Handle_StepBasic_HArray1OfApproval &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfApproval(const StepBasic_HArray1OfApproval *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfApproval const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfApproval {
	StepBasic_HArray1OfApproval* GetObject() {
	return (StepBasic_HArray1OfApproval*)$self->Access();
	}
};
%extend Handle_StepBasic_HArray1OfApproval {
	~Handle_StepBasic_HArray1OfApproval() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_HArray1OfApproval\n");}
	}
};

%nodefaultctor Handle_StepBasic_DocumentProductAssociation;
class Handle_StepBasic_DocumentProductAssociation : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentProductAssociation();
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentProductAssociation(const Handle_StepBasic_DocumentProductAssociation &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentProductAssociation(const StepBasic_DocumentProductAssociation *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentProductAssociation const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentProductAssociation {
	StepBasic_DocumentProductAssociation* GetObject() {
	return (StepBasic_DocumentProductAssociation*)$self->Access();
	}
};
%extend Handle_StepBasic_DocumentProductAssociation {
	~Handle_StepBasic_DocumentProductAssociation() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DocumentProductAssociation\n");}
	}
};

%nodefaultctor Handle_StepBasic_RoleAssociation;
class Handle_StepBasic_RoleAssociation : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_RoleAssociation();
		%feature("autodoc", "1");
		Handle_StepBasic_RoleAssociation(const Handle_StepBasic_RoleAssociation &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_RoleAssociation(const StepBasic_RoleAssociation *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_RoleAssociation const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_RoleAssociation {
	StepBasic_RoleAssociation* GetObject() {
	return (StepBasic_RoleAssociation*)$self->Access();
	}
};
%extend Handle_StepBasic_RoleAssociation {
	~Handle_StepBasic_RoleAssociation() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_RoleAssociation\n");}
	}
};

%nodefaultctor Handle_StepBasic_DocumentProductEquivalence;
class Handle_StepBasic_DocumentProductEquivalence : public Handle_StepBasic_DocumentProductAssociation {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentProductEquivalence();
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentProductEquivalence(const Handle_StepBasic_DocumentProductEquivalence &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentProductEquivalence(const StepBasic_DocumentProductEquivalence *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentProductEquivalence const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentProductEquivalence {
	StepBasic_DocumentProductEquivalence* GetObject() {
	return (StepBasic_DocumentProductEquivalence*)$self->Access();
	}
};
%extend Handle_StepBasic_DocumentProductEquivalence {
	~Handle_StepBasic_DocumentProductEquivalence() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DocumentProductEquivalence\n");}
	}
};

%nodefaultctor Handle_StepBasic_ProductRelatedProductCategory;
class Handle_StepBasic_ProductRelatedProductCategory : public Handle_StepBasic_ProductCategory {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ProductRelatedProductCategory();
		%feature("autodoc", "1");
		Handle_StepBasic_ProductRelatedProductCategory(const Handle_StepBasic_ProductRelatedProductCategory &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductRelatedProductCategory(const StepBasic_ProductRelatedProductCategory *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductRelatedProductCategory const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductRelatedProductCategory {
	StepBasic_ProductRelatedProductCategory* GetObject() {
	return (StepBasic_ProductRelatedProductCategory*)$self->Access();
	}
};
%extend Handle_StepBasic_ProductRelatedProductCategory {
	~Handle_StepBasic_ProductRelatedProductCategory() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ProductRelatedProductCategory\n");}
	}
};

%nodefaultctor Handle_StepBasic_DateRole;
class Handle_StepBasic_DateRole : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DateRole();
		%feature("autodoc", "1");
		Handle_StepBasic_DateRole(const Handle_StepBasic_DateRole &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DateRole(const StepBasic_DateRole *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DateRole const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DateRole {
	StepBasic_DateRole* GetObject() {
	return (StepBasic_DateRole*)$self->Access();
	}
};
%extend Handle_StepBasic_DateRole {
	~Handle_StepBasic_DateRole() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DateRole\n");}
	}
};

%nodefaultctor Handle_StepBasic_GeneralProperty;
class Handle_StepBasic_GeneralProperty : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_GeneralProperty();
		%feature("autodoc", "1");
		Handle_StepBasic_GeneralProperty(const Handle_StepBasic_GeneralProperty &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_GeneralProperty(const StepBasic_GeneralProperty *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_GeneralProperty const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_GeneralProperty {
	StepBasic_GeneralProperty* GetObject() {
	return (StepBasic_GeneralProperty*)$self->Access();
	}
};
%extend Handle_StepBasic_GeneralProperty {
	~Handle_StepBasic_GeneralProperty() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_GeneralProperty\n");}
	}
};

%nodefaultctor Handle_StepBasic_DigitalDocument;
class Handle_StepBasic_DigitalDocument : public Handle_StepBasic_Document {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DigitalDocument();
		%feature("autodoc", "1");
		Handle_StepBasic_DigitalDocument(const Handle_StepBasic_DigitalDocument &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DigitalDocument(const StepBasic_DigitalDocument *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DigitalDocument const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DigitalDocument {
	StepBasic_DigitalDocument* GetObject() {
	return (StepBasic_DigitalDocument*)$self->Access();
	}
};
%extend Handle_StepBasic_DigitalDocument {
	~Handle_StepBasic_DigitalDocument() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DigitalDocument\n");}
	}
};

%nodefaultctor Handle_StepBasic_TimeUnit;
class Handle_StepBasic_TimeUnit : public Handle_StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_TimeUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_TimeUnit(const Handle_StepBasic_TimeUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_TimeUnit(const StepBasic_TimeUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_TimeUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_TimeUnit {
	StepBasic_TimeUnit* GetObject() {
	return (StepBasic_TimeUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_TimeUnit {
	~Handle_StepBasic_TimeUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_TimeUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_ExternalSource;
class Handle_StepBasic_ExternalSource : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ExternalSource();
		%feature("autodoc", "1");
		Handle_StepBasic_ExternalSource(const Handle_StepBasic_ExternalSource &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ExternalSource(const StepBasic_ExternalSource *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ExternalSource const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ExternalSource {
	StepBasic_ExternalSource* GetObject() {
	return (StepBasic_ExternalSource*)$self->Access();
	}
};
%extend Handle_StepBasic_ExternalSource {
	~Handle_StepBasic_ExternalSource() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ExternalSource\n");}
	}
};

%nodefaultctor Handle_StepBasic_CertificationAssignment;
class Handle_StepBasic_CertificationAssignment : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_CertificationAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_CertificationAssignment(const Handle_StepBasic_CertificationAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_CertificationAssignment(const StepBasic_CertificationAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_CertificationAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_CertificationAssignment {
	StepBasic_CertificationAssignment* GetObject() {
	return (StepBasic_CertificationAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_CertificationAssignment {
	~Handle_StepBasic_CertificationAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_CertificationAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_SiUnitAndRatioUnit;
class Handle_StepBasic_SiUnitAndRatioUnit : public Handle_StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndRatioUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndRatioUnit(const Handle_StepBasic_SiUnitAndRatioUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndRatioUnit(const StepBasic_SiUnitAndRatioUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndRatioUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndRatioUnit {
	StepBasic_SiUnitAndRatioUnit* GetObject() {
	return (StepBasic_SiUnitAndRatioUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_SiUnitAndRatioUnit {
	~Handle_StepBasic_SiUnitAndRatioUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SiUnitAndRatioUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_HArray1OfProduct;
class Handle_StepBasic_HArray1OfProduct : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfProduct();
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfProduct(const Handle_StepBasic_HArray1OfProduct &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfProduct(const StepBasic_HArray1OfProduct *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfProduct const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfProduct {
	StepBasic_HArray1OfProduct* GetObject() {
	return (StepBasic_HArray1OfProduct*)$self->Access();
	}
};
%extend Handle_StepBasic_HArray1OfProduct {
	~Handle_StepBasic_HArray1OfProduct() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_HArray1OfProduct\n");}
	}
};

%nodefaultctor Handle_StepBasic_Group;
class Handle_StepBasic_Group : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_Group();
		%feature("autodoc", "1");
		Handle_StepBasic_Group(const Handle_StepBasic_Group &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_Group(const StepBasic_Group *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_Group const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Group {
	StepBasic_Group* GetObject() {
	return (StepBasic_Group*)$self->Access();
	}
};
%extend Handle_StepBasic_Group {
	~Handle_StepBasic_Group() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_Group\n");}
	}
};

%nodefaultctor Handle_StepBasic_SolidAngleMeasureWithUnit;
class Handle_StepBasic_SolidAngleMeasureWithUnit : public Handle_StepBasic_MeasureWithUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SolidAngleMeasureWithUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_SolidAngleMeasureWithUnit(const Handle_StepBasic_SolidAngleMeasureWithUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SolidAngleMeasureWithUnit(const StepBasic_SolidAngleMeasureWithUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SolidAngleMeasureWithUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SolidAngleMeasureWithUnit {
	StepBasic_SolidAngleMeasureWithUnit* GetObject() {
	return (StepBasic_SolidAngleMeasureWithUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_SolidAngleMeasureWithUnit {
	~Handle_StepBasic_SolidAngleMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SolidAngleMeasureWithUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_ProductDefinitionFormationRelationship;
class Handle_StepBasic_ProductDefinitionFormationRelationship : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormationRelationship();
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormationRelationship(const Handle_StepBasic_ProductDefinitionFormationRelationship &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormationRelationship(const StepBasic_ProductDefinitionFormationRelationship *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormationRelationship const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinitionFormationRelationship {
	StepBasic_ProductDefinitionFormationRelationship* GetObject() {
	return (StepBasic_ProductDefinitionFormationRelationship*)$self->Access();
	}
};
%extend Handle_StepBasic_ProductDefinitionFormationRelationship {
	~Handle_StepBasic_ProductDefinitionFormationRelationship() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ProductDefinitionFormationRelationship\n");}
	}
};

%nodefaultctor Handle_StepBasic_NameAssignment;
class Handle_StepBasic_NameAssignment : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_NameAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_NameAssignment(const Handle_StepBasic_NameAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_NameAssignment(const StepBasic_NameAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_NameAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_NameAssignment {
	StepBasic_NameAssignment* GetObject() {
	return (StepBasic_NameAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_NameAssignment {
	~Handle_StepBasic_NameAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_NameAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_MassUnit;
class Handle_StepBasic_MassUnit : public Handle_StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_MassUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_MassUnit(const Handle_StepBasic_MassUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_MassUnit(const StepBasic_MassUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_MassUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_MassUnit {
	StepBasic_MassUnit* GetObject() {
	return (StepBasic_MassUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_MassUnit {
	~Handle_StepBasic_MassUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_MassUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_Address;
class Handle_StepBasic_Address : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_Address();
		%feature("autodoc", "1");
		Handle_StepBasic_Address(const Handle_StepBasic_Address &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_Address(const StepBasic_Address *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_Address const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Address {
	StepBasic_Address* GetObject() {
	return (StepBasic_Address*)$self->Access();
	}
};
%extend Handle_StepBasic_Address {
	~Handle_StepBasic_Address() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_Address\n");}
	}
};

%nodefaultctor Handle_StepBasic_PersonalAddress;
class Handle_StepBasic_PersonalAddress : public Handle_StepBasic_Address {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_PersonalAddress();
		%feature("autodoc", "1");
		Handle_StepBasic_PersonalAddress(const Handle_StepBasic_PersonalAddress &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_PersonalAddress(const StepBasic_PersonalAddress *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_PersonalAddress const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_PersonalAddress {
	StepBasic_PersonalAddress* GetObject() {
	return (StepBasic_PersonalAddress*)$self->Access();
	}
};
%extend Handle_StepBasic_PersonalAddress {
	~Handle_StepBasic_PersonalAddress() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_PersonalAddress\n");}
	}
};

%nodefaultctor Handle_StepBasic_DocumentRelationship;
class Handle_StepBasic_DocumentRelationship : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentRelationship();
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentRelationship(const Handle_StepBasic_DocumentRelationship &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentRelationship(const StepBasic_DocumentRelationship *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentRelationship const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentRelationship {
	StepBasic_DocumentRelationship* GetObject() {
	return (StepBasic_DocumentRelationship*)$self->Access();
	}
};
%extend Handle_StepBasic_DocumentRelationship {
	~Handle_StepBasic_DocumentRelationship() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DocumentRelationship\n");}
	}
};

%nodefaultctor Handle_StepBasic_DerivedUnitElement;
class Handle_StepBasic_DerivedUnitElement : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DerivedUnitElement();
		%feature("autodoc", "1");
		Handle_StepBasic_DerivedUnitElement(const Handle_StepBasic_DerivedUnitElement &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DerivedUnitElement(const StepBasic_DerivedUnitElement *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DerivedUnitElement const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DerivedUnitElement {
	StepBasic_DerivedUnitElement* GetObject() {
	return (StepBasic_DerivedUnitElement*)$self->Access();
	}
};
%extend Handle_StepBasic_DerivedUnitElement {
	~Handle_StepBasic_DerivedUnitElement() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DerivedUnitElement\n");}
	}
};

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndVolumeUnit;
class Handle_StepBasic_ConversionBasedUnitAndVolumeUnit : public Handle_StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndVolumeUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndVolumeUnit(const Handle_StepBasic_ConversionBasedUnitAndVolumeUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndVolumeUnit(const StepBasic_ConversionBasedUnitAndVolumeUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndVolumeUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndVolumeUnit {
	StepBasic_ConversionBasedUnitAndVolumeUnit* GetObject() {
	return (StepBasic_ConversionBasedUnitAndVolumeUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_ConversionBasedUnitAndVolumeUnit {
	~Handle_StepBasic_ConversionBasedUnitAndVolumeUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ConversionBasedUnitAndVolumeUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndMassUnit;
class Handle_StepBasic_ConversionBasedUnitAndMassUnit : public Handle_StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndMassUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndMassUnit(const Handle_StepBasic_ConversionBasedUnitAndMassUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndMassUnit(const StepBasic_ConversionBasedUnitAndMassUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndMassUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndMassUnit {
	StepBasic_ConversionBasedUnitAndMassUnit* GetObject() {
	return (StepBasic_ConversionBasedUnitAndMassUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_ConversionBasedUnitAndMassUnit {
	~Handle_StepBasic_ConversionBasedUnitAndMassUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ConversionBasedUnitAndMassUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_ActionAssignment;
class Handle_StepBasic_ActionAssignment : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ActionAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_ActionAssignment(const Handle_StepBasic_ActionAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ActionAssignment(const StepBasic_ActionAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ActionAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ActionAssignment {
	StepBasic_ActionAssignment* GetObject() {
	return (StepBasic_ActionAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_ActionAssignment {
	~Handle_StepBasic_ActionAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ActionAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_SiUnitAndPlaneAngleUnit;
class Handle_StepBasic_SiUnitAndPlaneAngleUnit : public Handle_StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndPlaneAngleUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndPlaneAngleUnit(const Handle_StepBasic_SiUnitAndPlaneAngleUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndPlaneAngleUnit(const StepBasic_SiUnitAndPlaneAngleUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndPlaneAngleUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndPlaneAngleUnit {
	StepBasic_SiUnitAndPlaneAngleUnit* GetObject() {
	return (StepBasic_SiUnitAndPlaneAngleUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_SiUnitAndPlaneAngleUnit {
	~Handle_StepBasic_SiUnitAndPlaneAngleUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SiUnitAndPlaneAngleUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_ThermodynamicTemperatureUnit;
class Handle_StepBasic_ThermodynamicTemperatureUnit : public Handle_StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ThermodynamicTemperatureUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_ThermodynamicTemperatureUnit(const Handle_StepBasic_ThermodynamicTemperatureUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ThermodynamicTemperatureUnit(const StepBasic_ThermodynamicTemperatureUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ThermodynamicTemperatureUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ThermodynamicTemperatureUnit {
	StepBasic_ThermodynamicTemperatureUnit* GetObject() {
	return (StepBasic_ThermodynamicTemperatureUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_ThermodynamicTemperatureUnit {
	~Handle_StepBasic_ThermodynamicTemperatureUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ThermodynamicTemperatureUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_DateAndTime;
class Handle_StepBasic_DateAndTime : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DateAndTime();
		%feature("autodoc", "1");
		Handle_StepBasic_DateAndTime(const Handle_StepBasic_DateAndTime &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DateAndTime(const StepBasic_DateAndTime *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DateAndTime const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DateAndTime {
	StepBasic_DateAndTime* GetObject() {
	return (StepBasic_DateAndTime*)$self->Access();
	}
};
%extend Handle_StepBasic_DateAndTime {
	~Handle_StepBasic_DateAndTime() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DateAndTime\n");}
	}
};

%nodefaultctor Handle_StepBasic_SiUnitAndVolumeUnit;
class Handle_StepBasic_SiUnitAndVolumeUnit : public Handle_StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndVolumeUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndVolumeUnit(const Handle_StepBasic_SiUnitAndVolumeUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndVolumeUnit(const StepBasic_SiUnitAndVolumeUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndVolumeUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndVolumeUnit {
	StepBasic_SiUnitAndVolumeUnit* GetObject() {
	return (StepBasic_SiUnitAndVolumeUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_SiUnitAndVolumeUnit {
	~Handle_StepBasic_SiUnitAndVolumeUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SiUnitAndVolumeUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_LengthUnit;
class Handle_StepBasic_LengthUnit : public Handle_StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_LengthUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_LengthUnit(const Handle_StepBasic_LengthUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_LengthUnit(const StepBasic_LengthUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_LengthUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_LengthUnit {
	StepBasic_LengthUnit* GetObject() {
	return (StepBasic_LengthUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_LengthUnit {
	~Handle_StepBasic_LengthUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_LengthUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_DateAssignment;
class Handle_StepBasic_DateAssignment : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DateAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_DateAssignment(const Handle_StepBasic_DateAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DateAssignment(const StepBasic_DateAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DateAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DateAssignment {
	StepBasic_DateAssignment* GetObject() {
	return (StepBasic_DateAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_DateAssignment {
	~Handle_StepBasic_DateAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DateAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_Effectivity;
class Handle_StepBasic_Effectivity : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_Effectivity();
		%feature("autodoc", "1");
		Handle_StepBasic_Effectivity(const Handle_StepBasic_Effectivity &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_Effectivity(const StepBasic_Effectivity *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_Effectivity const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Effectivity {
	StepBasic_Effectivity* GetObject() {
	return (StepBasic_Effectivity*)$self->Access();
	}
};
%extend Handle_StepBasic_Effectivity {
	~Handle_StepBasic_Effectivity() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_Effectivity\n");}
	}
};

%nodefaultctor Handle_StepBasic_PlaneAngleUnit;
class Handle_StepBasic_PlaneAngleUnit : public Handle_StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_PlaneAngleUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_PlaneAngleUnit(const Handle_StepBasic_PlaneAngleUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_PlaneAngleUnit(const StepBasic_PlaneAngleUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_PlaneAngleUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_PlaneAngleUnit {
	StepBasic_PlaneAngleUnit* GetObject() {
	return (StepBasic_PlaneAngleUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_PlaneAngleUnit {
	~Handle_StepBasic_PlaneAngleUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_PlaneAngleUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_Product;
class Handle_StepBasic_Product : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_Product();
		%feature("autodoc", "1");
		Handle_StepBasic_Product(const Handle_StepBasic_Product &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_Product(const StepBasic_Product *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_Product const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Product {
	StepBasic_Product* GetObject() {
	return (StepBasic_Product*)$self->Access();
	}
};
%extend Handle_StepBasic_Product {
	~Handle_StepBasic_Product() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_Product\n");}
	}
};

%nodefaultctor Handle_StepBasic_GroupRelationship;
class Handle_StepBasic_GroupRelationship : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_GroupRelationship();
		%feature("autodoc", "1");
		Handle_StepBasic_GroupRelationship(const Handle_StepBasic_GroupRelationship &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_GroupRelationship(const StepBasic_GroupRelationship *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_GroupRelationship const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_GroupRelationship {
	StepBasic_GroupRelationship* GetObject() {
	return (StepBasic_GroupRelationship*)$self->Access();
	}
};
%extend Handle_StepBasic_GroupRelationship {
	~Handle_StepBasic_GroupRelationship() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_GroupRelationship\n");}
	}
};

%nodefaultctor Handle_StepBasic_HArray1OfDerivedUnitElement;
class Handle_StepBasic_HArray1OfDerivedUnitElement : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfDerivedUnitElement();
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfDerivedUnitElement(const Handle_StepBasic_HArray1OfDerivedUnitElement &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfDerivedUnitElement(const StepBasic_HArray1OfDerivedUnitElement *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfDerivedUnitElement const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfDerivedUnitElement {
	StepBasic_HArray1OfDerivedUnitElement* GetObject() {
	return (StepBasic_HArray1OfDerivedUnitElement*)$self->Access();
	}
};
%extend Handle_StepBasic_HArray1OfDerivedUnitElement {
	~Handle_StepBasic_HArray1OfDerivedUnitElement() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_HArray1OfDerivedUnitElement\n");}
	}
};

%nodefaultctor Handle_StepBasic_CharacterizedObject;
class Handle_StepBasic_CharacterizedObject : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_CharacterizedObject();
		%feature("autodoc", "1");
		Handle_StepBasic_CharacterizedObject(const Handle_StepBasic_CharacterizedObject &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_CharacterizedObject(const StepBasic_CharacterizedObject *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_CharacterizedObject const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_CharacterizedObject {
	StepBasic_CharacterizedObject* GetObject() {
	return (StepBasic_CharacterizedObject*)$self->Access();
	}
};
%extend Handle_StepBasic_CharacterizedObject {
	~Handle_StepBasic_CharacterizedObject() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_CharacterizedObject\n");}
	}
};

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndLengthUnit;
class Handle_StepBasic_ConversionBasedUnitAndLengthUnit : public Handle_StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndLengthUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndLengthUnit(const Handle_StepBasic_ConversionBasedUnitAndLengthUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndLengthUnit(const StepBasic_ConversionBasedUnitAndLengthUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndLengthUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndLengthUnit {
	StepBasic_ConversionBasedUnitAndLengthUnit* GetObject() {
	return (StepBasic_ConversionBasedUnitAndLengthUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_ConversionBasedUnitAndLengthUnit {
	~Handle_StepBasic_ConversionBasedUnitAndLengthUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ConversionBasedUnitAndLengthUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_OrganizationRole;
class Handle_StepBasic_OrganizationRole : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_OrganizationRole();
		%feature("autodoc", "1");
		Handle_StepBasic_OrganizationRole(const Handle_StepBasic_OrganizationRole &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_OrganizationRole(const StepBasic_OrganizationRole *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_OrganizationRole const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_OrganizationRole {
	StepBasic_OrganizationRole* GetObject() {
	return (StepBasic_OrganizationRole*)$self->Access();
	}
};
%extend Handle_StepBasic_OrganizationRole {
	~Handle_StepBasic_OrganizationRole() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_OrganizationRole\n");}
	}
};

%nodefaultctor Handle_StepBasic_VersionedActionRequest;
class Handle_StepBasic_VersionedActionRequest : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_VersionedActionRequest();
		%feature("autodoc", "1");
		Handle_StepBasic_VersionedActionRequest(const Handle_StepBasic_VersionedActionRequest &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_VersionedActionRequest(const StepBasic_VersionedActionRequest *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_VersionedActionRequest const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_VersionedActionRequest {
	StepBasic_VersionedActionRequest* GetObject() {
	return (StepBasic_VersionedActionRequest*)$self->Access();
	}
};
%extend Handle_StepBasic_VersionedActionRequest {
	~Handle_StepBasic_VersionedActionRequest() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_VersionedActionRequest\n");}
	}
};

%nodefaultctor Handle_StepBasic_OrganizationAssignment;
class Handle_StepBasic_OrganizationAssignment : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_OrganizationAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_OrganizationAssignment(const Handle_StepBasic_OrganizationAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_OrganizationAssignment(const StepBasic_OrganizationAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_OrganizationAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_OrganizationAssignment {
	StepBasic_OrganizationAssignment* GetObject() {
	return (StepBasic_OrganizationAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_OrganizationAssignment {
	~Handle_StepBasic_OrganizationAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_OrganizationAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit;
class Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit : public Handle_StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit(const Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit(const StepBasic_ConversionBasedUnitAndSolidAngleUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit {
	StepBasic_ConversionBasedUnitAndSolidAngleUnit* GetObject() {
	return (StepBasic_ConversionBasedUnitAndSolidAngleUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit {
	~Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_CalendarDate;
class Handle_StepBasic_CalendarDate : public Handle_StepBasic_Date {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_CalendarDate();
		%feature("autodoc", "1");
		Handle_StepBasic_CalendarDate(const Handle_StepBasic_CalendarDate &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_CalendarDate(const StepBasic_CalendarDate *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_CalendarDate const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_CalendarDate {
	StepBasic_CalendarDate* GetObject() {
	return (StepBasic_CalendarDate*)$self->Access();
	}
};
%extend Handle_StepBasic_CalendarDate {
	~Handle_StepBasic_CalendarDate() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_CalendarDate\n");}
	}
};

%nodefaultctor Handle_StepBasic_HArray1OfPerson;
class Handle_StepBasic_HArray1OfPerson : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfPerson();
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfPerson(const Handle_StepBasic_HArray1OfPerson &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfPerson(const StepBasic_HArray1OfPerson *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfPerson const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfPerson {
	StepBasic_HArray1OfPerson* GetObject() {
	return (StepBasic_HArray1OfPerson*)$self->Access();
	}
};
%extend Handle_StepBasic_HArray1OfPerson {
	~Handle_StepBasic_HArray1OfPerson() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_HArray1OfPerson\n");}
	}
};

%nodefaultctor Handle_StepBasic_ContractType;
class Handle_StepBasic_ContractType : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ContractType();
		%feature("autodoc", "1");
		Handle_StepBasic_ContractType(const Handle_StepBasic_ContractType &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ContractType(const StepBasic_ContractType *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ContractType const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ContractType {
	StepBasic_ContractType* GetObject() {
	return (StepBasic_ContractType*)$self->Access();
	}
};
%extend Handle_StepBasic_ContractType {
	~Handle_StepBasic_ContractType() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ContractType\n");}
	}
};

%nodefaultctor Handle_StepBasic_ProductDefinitionEffectivity;
class Handle_StepBasic_ProductDefinitionEffectivity : public Handle_StepBasic_Effectivity {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionEffectivity();
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionEffectivity(const Handle_StepBasic_ProductDefinitionEffectivity &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionEffectivity(const StepBasic_ProductDefinitionEffectivity *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionEffectivity const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinitionEffectivity {
	StepBasic_ProductDefinitionEffectivity* GetObject() {
	return (StepBasic_ProductDefinitionEffectivity*)$self->Access();
	}
};
%extend Handle_StepBasic_ProductDefinitionEffectivity {
	~Handle_StepBasic_ProductDefinitionEffectivity() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ProductDefinitionEffectivity\n");}
	}
};

%nodefaultctor Handle_StepBasic_ProductConceptContext;
class Handle_StepBasic_ProductConceptContext : public Handle_StepBasic_ApplicationContextElement {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ProductConceptContext();
		%feature("autodoc", "1");
		Handle_StepBasic_ProductConceptContext(const Handle_StepBasic_ProductConceptContext &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductConceptContext(const StepBasic_ProductConceptContext *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductConceptContext const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductConceptContext {
	StepBasic_ProductConceptContext* GetObject() {
	return (StepBasic_ProductConceptContext*)$self->Access();
	}
};
%extend Handle_StepBasic_ProductConceptContext {
	~Handle_StepBasic_ProductConceptContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ProductConceptContext\n");}
	}
};

%nodefaultctor Handle_StepBasic_Certification;
class Handle_StepBasic_Certification : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_Certification();
		%feature("autodoc", "1");
		Handle_StepBasic_Certification(const Handle_StepBasic_Certification &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_Certification(const StepBasic_Certification *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_Certification const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Certification {
	StepBasic_Certification* GetObject() {
	return (StepBasic_Certification*)$self->Access();
	}
};
%extend Handle_StepBasic_Certification {
	~Handle_StepBasic_Certification() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_Certification\n");}
	}
};

%nodefaultctor Handle_StepBasic_AreaUnit;
class Handle_StepBasic_AreaUnit : public Handle_StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_AreaUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_AreaUnit(const Handle_StepBasic_AreaUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_AreaUnit(const StepBasic_AreaUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_AreaUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_AreaUnit {
	StepBasic_AreaUnit* GetObject() {
	return (StepBasic_AreaUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_AreaUnit {
	~Handle_StepBasic_AreaUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_AreaUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_SecurityClassificationLevel;
class Handle_StepBasic_SecurityClassificationLevel : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassificationLevel();
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassificationLevel(const Handle_StepBasic_SecurityClassificationLevel &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassificationLevel(const StepBasic_SecurityClassificationLevel *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassificationLevel const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SecurityClassificationLevel {
	StepBasic_SecurityClassificationLevel* GetObject() {
	return (StepBasic_SecurityClassificationLevel*)$self->Access();
	}
};
%extend Handle_StepBasic_SecurityClassificationLevel {
	~Handle_StepBasic_SecurityClassificationLevel() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SecurityClassificationLevel\n");}
	}
};

%nodefaultctor Handle_StepBasic_HArray1OfProductContext;
class Handle_StepBasic_HArray1OfProductContext : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfProductContext();
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfProductContext(const Handle_StepBasic_HArray1OfProductContext &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfProductContext(const StepBasic_HArray1OfProductContext *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfProductContext const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfProductContext {
	StepBasic_HArray1OfProductContext* GetObject() {
	return (StepBasic_HArray1OfProductContext*)$self->Access();
	}
};
%extend Handle_StepBasic_HArray1OfProductContext {
	~Handle_StepBasic_HArray1OfProductContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_HArray1OfProductContext\n");}
	}
};

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndAreaUnit;
class Handle_StepBasic_ConversionBasedUnitAndAreaUnit : public Handle_StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndAreaUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndAreaUnit(const Handle_StepBasic_ConversionBasedUnitAndAreaUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndAreaUnit(const StepBasic_ConversionBasedUnitAndAreaUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndAreaUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndAreaUnit {
	StepBasic_ConversionBasedUnitAndAreaUnit* GetObject() {
	return (StepBasic_ConversionBasedUnitAndAreaUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_ConversionBasedUnitAndAreaUnit {
	~Handle_StepBasic_ConversionBasedUnitAndAreaUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ConversionBasedUnitAndAreaUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_HArray1OfNamedUnit;
class Handle_StepBasic_HArray1OfNamedUnit : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfNamedUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfNamedUnit(const Handle_StepBasic_HArray1OfNamedUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfNamedUnit(const StepBasic_HArray1OfNamedUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfNamedUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfNamedUnit {
	StepBasic_HArray1OfNamedUnit* GetObject() {
	return (StepBasic_HArray1OfNamedUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_HArray1OfNamedUnit {
	~Handle_StepBasic_HArray1OfNamedUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_HArray1OfNamedUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_HArray1OfOrganization;
class Handle_StepBasic_HArray1OfOrganization : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfOrganization();
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfOrganization(const Handle_StepBasic_HArray1OfOrganization &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfOrganization(const StepBasic_HArray1OfOrganization *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfOrganization const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfOrganization {
	StepBasic_HArray1OfOrganization* GetObject() {
	return (StepBasic_HArray1OfOrganization*)$self->Access();
	}
};
%extend Handle_StepBasic_HArray1OfOrganization {
	~Handle_StepBasic_HArray1OfOrganization() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_HArray1OfOrganization\n");}
	}
};

%nodefaultctor Handle_StepBasic_ConversionBasedUnitAndTimeUnit;
class Handle_StepBasic_ConversionBasedUnitAndTimeUnit : public Handle_StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndTimeUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndTimeUnit(const Handle_StepBasic_ConversionBasedUnitAndTimeUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndTimeUnit(const StepBasic_ConversionBasedUnitAndTimeUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ConversionBasedUnitAndTimeUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ConversionBasedUnitAndTimeUnit {
	StepBasic_ConversionBasedUnitAndTimeUnit* GetObject() {
	return (StepBasic_ConversionBasedUnitAndTimeUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_ConversionBasedUnitAndTimeUnit {
	~Handle_StepBasic_ConversionBasedUnitAndTimeUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ConversionBasedUnitAndTimeUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_OrganizationalAddress;
class Handle_StepBasic_OrganizationalAddress : public Handle_StepBasic_Address {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_OrganizationalAddress();
		%feature("autodoc", "1");
		Handle_StepBasic_OrganizationalAddress(const Handle_StepBasic_OrganizationalAddress &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_OrganizationalAddress(const StepBasic_OrganizationalAddress *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_OrganizationalAddress const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_OrganizationalAddress {
	StepBasic_OrganizationalAddress* GetObject() {
	return (StepBasic_OrganizationalAddress*)$self->Access();
	}
};
%extend Handle_StepBasic_OrganizationalAddress {
	~Handle_StepBasic_OrganizationalAddress() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_OrganizationalAddress\n");}
	}
};

%nodefaultctor Handle_StepBasic_ExternallyDefinedItem;
class Handle_StepBasic_ExternallyDefinedItem : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ExternallyDefinedItem();
		%feature("autodoc", "1");
		Handle_StepBasic_ExternallyDefinedItem(const Handle_StepBasic_ExternallyDefinedItem &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ExternallyDefinedItem(const StepBasic_ExternallyDefinedItem *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ExternallyDefinedItem const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ExternallyDefinedItem {
	StepBasic_ExternallyDefinedItem* GetObject() {
	return (StepBasic_ExternallyDefinedItem*)$self->Access();
	}
};
%extend Handle_StepBasic_ExternallyDefinedItem {
	~Handle_StepBasic_ExternallyDefinedItem() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ExternallyDefinedItem\n");}
	}
};

%nodefaultctor Handle_StepBasic_WeekOfYearAndDayDate;
class Handle_StepBasic_WeekOfYearAndDayDate : public Handle_StepBasic_Date {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_WeekOfYearAndDayDate();
		%feature("autodoc", "1");
		Handle_StepBasic_WeekOfYearAndDayDate(const Handle_StepBasic_WeekOfYearAndDayDate &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_WeekOfYearAndDayDate(const StepBasic_WeekOfYearAndDayDate *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_WeekOfYearAndDayDate const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_WeekOfYearAndDayDate {
	StepBasic_WeekOfYearAndDayDate* GetObject() {
	return (StepBasic_WeekOfYearAndDayDate*)$self->Access();
	}
};
%extend Handle_StepBasic_WeekOfYearAndDayDate {
	~Handle_StepBasic_WeekOfYearAndDayDate() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_WeekOfYearAndDayDate\n");}
	}
};

%nodefaultctor Handle_StepBasic_SiUnitAndMassUnit;
class Handle_StepBasic_SiUnitAndMassUnit : public Handle_StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndMassUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndMassUnit(const Handle_StepBasic_SiUnitAndMassUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndMassUnit(const StepBasic_SiUnitAndMassUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndMassUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndMassUnit {
	StepBasic_SiUnitAndMassUnit* GetObject() {
	return (StepBasic_SiUnitAndMassUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_SiUnitAndMassUnit {
	~Handle_StepBasic_SiUnitAndMassUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SiUnitAndMassUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_UncertaintyMeasureWithUnit;
class Handle_StepBasic_UncertaintyMeasureWithUnit : public Handle_StepBasic_MeasureWithUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_UncertaintyMeasureWithUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_UncertaintyMeasureWithUnit(const Handle_StepBasic_UncertaintyMeasureWithUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_UncertaintyMeasureWithUnit(const StepBasic_UncertaintyMeasureWithUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_UncertaintyMeasureWithUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_UncertaintyMeasureWithUnit {
	StepBasic_UncertaintyMeasureWithUnit* GetObject() {
	return (StepBasic_UncertaintyMeasureWithUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_UncertaintyMeasureWithUnit {
	~Handle_StepBasic_UncertaintyMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_UncertaintyMeasureWithUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_ProductDefinitionRelationship;
class Handle_StepBasic_ProductDefinitionRelationship : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionRelationship();
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionRelationship(const Handle_StepBasic_ProductDefinitionRelationship &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionRelationship(const StepBasic_ProductDefinitionRelationship *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionRelationship const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductDefinitionRelationship {
	StepBasic_ProductDefinitionRelationship* GetObject() {
	return (StepBasic_ProductDefinitionRelationship*)$self->Access();
	}
};
%extend Handle_StepBasic_ProductDefinitionRelationship {
	~Handle_StepBasic_ProductDefinitionRelationship() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ProductDefinitionRelationship\n");}
	}
};

%nodefaultctor Handle_StepBasic_ContractAssignment;
class Handle_StepBasic_ContractAssignment : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ContractAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_ContractAssignment(const Handle_StepBasic_ContractAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ContractAssignment(const StepBasic_ContractAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ContractAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ContractAssignment {
	StepBasic_ContractAssignment* GetObject() {
	return (StepBasic_ContractAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_ContractAssignment {
	~Handle_StepBasic_ContractAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ContractAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_LengthMeasureWithUnit;
class Handle_StepBasic_LengthMeasureWithUnit : public Handle_StepBasic_MeasureWithUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_LengthMeasureWithUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_LengthMeasureWithUnit(const Handle_StepBasic_LengthMeasureWithUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_LengthMeasureWithUnit(const StepBasic_LengthMeasureWithUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_LengthMeasureWithUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_LengthMeasureWithUnit {
	StepBasic_LengthMeasureWithUnit* GetObject() {
	return (StepBasic_LengthMeasureWithUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_LengthMeasureWithUnit {
	~Handle_StepBasic_LengthMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_LengthMeasureWithUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_CertificationType;
class Handle_StepBasic_CertificationType : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_CertificationType();
		%feature("autodoc", "1");
		Handle_StepBasic_CertificationType(const Handle_StepBasic_CertificationType &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_CertificationType(const StepBasic_CertificationType *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_CertificationType const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_CertificationType {
	StepBasic_CertificationType* GetObject() {
	return (StepBasic_CertificationType*)$self->Access();
	}
};
%extend Handle_StepBasic_CertificationType {
	~Handle_StepBasic_CertificationType() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_CertificationType\n");}
	}
};

%nodefaultctor Handle_StepBasic_ApprovalRole;
class Handle_StepBasic_ApprovalRole : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalRole();
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalRole(const Handle_StepBasic_ApprovalRole &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalRole(const StepBasic_ApprovalRole *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalRole const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApprovalRole {
	StepBasic_ApprovalRole* GetObject() {
	return (StepBasic_ApprovalRole*)$self->Access();
	}
};
%extend Handle_StepBasic_ApprovalRole {
	~Handle_StepBasic_ApprovalRole() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ApprovalRole\n");}
	}
};

%nodefaultctor Handle_StepBasic_DerivedUnit;
class Handle_StepBasic_DerivedUnit : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DerivedUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_DerivedUnit(const Handle_StepBasic_DerivedUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DerivedUnit(const StepBasic_DerivedUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DerivedUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DerivedUnit {
	StepBasic_DerivedUnit* GetObject() {
	return (StepBasic_DerivedUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_DerivedUnit {
	~Handle_StepBasic_DerivedUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DerivedUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_HArray1OfDocument;
class Handle_StepBasic_HArray1OfDocument : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfDocument();
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfDocument(const Handle_StepBasic_HArray1OfDocument &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfDocument(const StepBasic_HArray1OfDocument *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfDocument const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfDocument {
	StepBasic_HArray1OfDocument* GetObject() {
	return (StepBasic_HArray1OfDocument*)$self->Access();
	}
};
%extend Handle_StepBasic_HArray1OfDocument {
	~Handle_StepBasic_HArray1OfDocument() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_HArray1OfDocument\n");}
	}
};

%nodefaultctor Handle_StepBasic_VolumeUnit;
class Handle_StepBasic_VolumeUnit : public Handle_StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_VolumeUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_VolumeUnit(const Handle_StepBasic_VolumeUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_VolumeUnit(const StepBasic_VolumeUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_VolumeUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_VolumeUnit {
	StepBasic_VolumeUnit* GetObject() {
	return (StepBasic_VolumeUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_VolumeUnit {
	~Handle_StepBasic_VolumeUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_VolumeUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_SizeMember;
class Handle_StepBasic_SizeMember : public Handle_StepData_SelectReal {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SizeMember();
		%feature("autodoc", "1");
		Handle_StepBasic_SizeMember(const Handle_StepBasic_SizeMember &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SizeMember(const StepBasic_SizeMember *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SizeMember const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SizeMember {
	StepBasic_SizeMember* GetObject() {
	return (StepBasic_SizeMember*)$self->Access();
	}
};
%extend Handle_StepBasic_SizeMember {
	~Handle_StepBasic_SizeMember() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SizeMember\n");}
	}
};

%nodefaultctor Handle_StepBasic_EulerAngles;
class Handle_StepBasic_EulerAngles : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_EulerAngles();
		%feature("autodoc", "1");
		Handle_StepBasic_EulerAngles(const Handle_StepBasic_EulerAngles &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_EulerAngles(const StepBasic_EulerAngles *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_EulerAngles const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_EulerAngles {
	StepBasic_EulerAngles* GetObject() {
	return (StepBasic_EulerAngles*)$self->Access();
	}
};
%extend Handle_StepBasic_EulerAngles {
	~Handle_StepBasic_EulerAngles() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_EulerAngles\n");}
	}
};

%nodefaultctor Handle_StepBasic_DocumentFile;
class Handle_StepBasic_DocumentFile : public Handle_StepBasic_Document {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentFile();
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentFile(const Handle_StepBasic_DocumentFile &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentFile(const StepBasic_DocumentFile *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentFile const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentFile {
	StepBasic_DocumentFile* GetObject() {
	return (StepBasic_DocumentFile*)$self->Access();
	}
};
%extend Handle_StepBasic_DocumentFile {
	~Handle_StepBasic_DocumentFile() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DocumentFile\n");}
	}
};

%nodefaultctor Handle_StepBasic_LocalTime;
class Handle_StepBasic_LocalTime : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_LocalTime();
		%feature("autodoc", "1");
		Handle_StepBasic_LocalTime(const Handle_StepBasic_LocalTime &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_LocalTime(const StepBasic_LocalTime *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_LocalTime const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_LocalTime {
	StepBasic_LocalTime* GetObject() {
	return (StepBasic_LocalTime*)$self->Access();
	}
};
%extend Handle_StepBasic_LocalTime {
	~Handle_StepBasic_LocalTime() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_LocalTime\n");}
	}
};

%nodefaultctor Handle_StepBasic_ProductType;
class Handle_StepBasic_ProductType : public Handle_StepBasic_ProductRelatedProductCategory {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ProductType();
		%feature("autodoc", "1");
		Handle_StepBasic_ProductType(const Handle_StepBasic_ProductType &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductType(const StepBasic_ProductType *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductType const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ProductType {
	StepBasic_ProductType* GetObject() {
	return (StepBasic_ProductType*)$self->Access();
	}
};
%extend Handle_StepBasic_ProductType {
	~Handle_StepBasic_ProductType() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ProductType\n");}
	}
};

%nodefaultctor Handle_StepBasic_SiUnitAndLengthUnit;
class Handle_StepBasic_SiUnitAndLengthUnit : public Handle_StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndLengthUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndLengthUnit(const Handle_StepBasic_SiUnitAndLengthUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndLengthUnit(const StepBasic_SiUnitAndLengthUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_SiUnitAndLengthUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_SiUnitAndLengthUnit {
	StepBasic_SiUnitAndLengthUnit* GetObject() {
	return (StepBasic_SiUnitAndLengthUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_SiUnitAndLengthUnit {
	~Handle_StepBasic_SiUnitAndLengthUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_SiUnitAndLengthUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit;
class Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit(const Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit(const StepBasic_HArray1OfUncertaintyMeasureWithUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit {
	StepBasic_HArray1OfUncertaintyMeasureWithUnit* GetObject() {
	return (StepBasic_HArray1OfUncertaintyMeasureWithUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit {
	~Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_Action;
class Handle_StepBasic_Action : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_Action();
		%feature("autodoc", "1");
		Handle_StepBasic_Action(const Handle_StepBasic_Action &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_Action(const StepBasic_Action *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_Action const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Action {
	StepBasic_Action* GetObject() {
	return (StepBasic_Action*)$self->Access();
	}
};
%extend Handle_StepBasic_Action {
	~Handle_StepBasic_Action() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_Action\n");}
	}
};

%nodefaultctor Handle_StepBasic_Organization;
class Handle_StepBasic_Organization : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_Organization();
		%feature("autodoc", "1");
		Handle_StepBasic_Organization(const Handle_StepBasic_Organization &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_Organization(const StepBasic_Organization *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_Organization const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Organization {
	StepBasic_Organization* GetObject() {
	return (StepBasic_Organization*)$self->Access();
	}
};
%extend Handle_StepBasic_Organization {
	~Handle_StepBasic_Organization() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_Organization\n");}
	}
};

%nodefaultctor Handle_StepBasic_TimeMeasureWithUnit;
class Handle_StepBasic_TimeMeasureWithUnit : public Handle_StepBasic_MeasureWithUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_TimeMeasureWithUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_TimeMeasureWithUnit(const Handle_StepBasic_TimeMeasureWithUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_TimeMeasureWithUnit(const StepBasic_TimeMeasureWithUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_TimeMeasureWithUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_TimeMeasureWithUnit {
	StepBasic_TimeMeasureWithUnit* GetObject() {
	return (StepBasic_TimeMeasureWithUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_TimeMeasureWithUnit {
	~Handle_StepBasic_TimeMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_TimeMeasureWithUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_ApprovalDateTime;
class Handle_StepBasic_ApprovalDateTime : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalDateTime();
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalDateTime(const Handle_StepBasic_ApprovalDateTime &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalDateTime(const StepBasic_ApprovalDateTime *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalDateTime const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApprovalDateTime {
	StepBasic_ApprovalDateTime* GetObject() {
	return (StepBasic_ApprovalDateTime*)$self->Access();
	}
};
%extend Handle_StepBasic_ApprovalDateTime {
	~Handle_StepBasic_ApprovalDateTime() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ApprovalDateTime\n");}
	}
};

%nodefaultctor Handle_StepBasic_DimensionalExponents;
class Handle_StepBasic_DimensionalExponents : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DimensionalExponents();
		%feature("autodoc", "1");
		Handle_StepBasic_DimensionalExponents(const Handle_StepBasic_DimensionalExponents &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DimensionalExponents(const StepBasic_DimensionalExponents *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DimensionalExponents const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DimensionalExponents {
	StepBasic_DimensionalExponents* GetObject() {
	return (StepBasic_DimensionalExponents*)$self->Access();
	}
};
%extend Handle_StepBasic_DimensionalExponents {
	~Handle_StepBasic_DimensionalExponents() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DimensionalExponents\n");}
	}
};

%nodefaultctor Handle_StepBasic_ApprovalPersonOrganization;
class Handle_StepBasic_ApprovalPersonOrganization : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalPersonOrganization();
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalPersonOrganization(const Handle_StepBasic_ApprovalPersonOrganization &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalPersonOrganization(const StepBasic_ApprovalPersonOrganization *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalPersonOrganization const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApprovalPersonOrganization {
	StepBasic_ApprovalPersonOrganization* GetObject() {
	return (StepBasic_ApprovalPersonOrganization*)$self->Access();
	}
};
%extend Handle_StepBasic_ApprovalPersonOrganization {
	~Handle_StepBasic_ApprovalPersonOrganization() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ApprovalPersonOrganization\n");}
	}
};

%nodefaultctor Handle_StepBasic_RatioMeasureWithUnit;
class Handle_StepBasic_RatioMeasureWithUnit : public Handle_StepBasic_MeasureWithUnit {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_RatioMeasureWithUnit();
		%feature("autodoc", "1");
		Handle_StepBasic_RatioMeasureWithUnit(const Handle_StepBasic_RatioMeasureWithUnit &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_RatioMeasureWithUnit(const StepBasic_RatioMeasureWithUnit *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_RatioMeasureWithUnit const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_RatioMeasureWithUnit {
	StepBasic_RatioMeasureWithUnit* GetObject() {
	return (StepBasic_RatioMeasureWithUnit*)$self->Access();
	}
};
%extend Handle_StepBasic_RatioMeasureWithUnit {
	~Handle_StepBasic_RatioMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_RatioMeasureWithUnit\n");}
	}
};

%nodefaultctor Handle_StepBasic_ApplicationProtocolDefinition;
class Handle_StepBasic_ApplicationProtocolDefinition : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ApplicationProtocolDefinition();
		%feature("autodoc", "1");
		Handle_StepBasic_ApplicationProtocolDefinition(const Handle_StepBasic_ApplicationProtocolDefinition &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ApplicationProtocolDefinition(const StepBasic_ApplicationProtocolDefinition *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ApplicationProtocolDefinition const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApplicationProtocolDefinition {
	StepBasic_ApplicationProtocolDefinition* GetObject() {
	return (StepBasic_ApplicationProtocolDefinition*)$self->Access();
	}
};
%extend Handle_StepBasic_ApplicationProtocolDefinition {
	~Handle_StepBasic_ApplicationProtocolDefinition() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ApplicationProtocolDefinition\n");}
	}
};

%nodefaultctor Handle_StepBasic_ApplicationContext;
class Handle_StepBasic_ApplicationContext : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_ApplicationContext();
		%feature("autodoc", "1");
		Handle_StepBasic_ApplicationContext(const Handle_StepBasic_ApplicationContext &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_ApplicationContext(const StepBasic_ApplicationContext *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_ApplicationContext const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_ApplicationContext {
	StepBasic_ApplicationContext* GetObject() {
	return (StepBasic_ApplicationContext*)$self->Access();
	}
};
%extend Handle_StepBasic_ApplicationContext {
	~Handle_StepBasic_ApplicationContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_ApplicationContext\n");}
	}
};

%nodefaultctor Handle_StepBasic_DateTimeRole;
class Handle_StepBasic_DateTimeRole : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DateTimeRole();
		%feature("autodoc", "1");
		Handle_StepBasic_DateTimeRole(const Handle_StepBasic_DateTimeRole &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DateTimeRole(const StepBasic_DateTimeRole *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DateTimeRole const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DateTimeRole {
	StepBasic_DateTimeRole* GetObject() {
	return (StepBasic_DateTimeRole*)$self->Access();
	}
};
%extend Handle_StepBasic_DateTimeRole {
	~Handle_StepBasic_DateTimeRole() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DateTimeRole\n");}
	}
};

%nodefaultctor Handle_StepBasic_GroupAssignment;
class Handle_StepBasic_GroupAssignment : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_GroupAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_GroupAssignment(const Handle_StepBasic_GroupAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_GroupAssignment(const StepBasic_GroupAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_GroupAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_GroupAssignment {
	StepBasic_GroupAssignment* GetObject() {
	return (StepBasic_GroupAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_GroupAssignment {
	~Handle_StepBasic_GroupAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_GroupAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_PersonAndOrganizationAssignment;
class Handle_StepBasic_PersonAndOrganizationAssignment : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganizationAssignment();
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganizationAssignment(const Handle_StepBasic_PersonAndOrganizationAssignment &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganizationAssignment(const StepBasic_PersonAndOrganizationAssignment *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganizationAssignment const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_PersonAndOrganizationAssignment {
	StepBasic_PersonAndOrganizationAssignment* GetObject() {
	return (StepBasic_PersonAndOrganizationAssignment*)$self->Access();
	}
};
%extend Handle_StepBasic_PersonAndOrganizationAssignment {
	~Handle_StepBasic_PersonAndOrganizationAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_PersonAndOrganizationAssignment\n");}
	}
};

%nodefaultctor Handle_StepBasic_PhysicallyModeledProductDefinition;
class Handle_StepBasic_PhysicallyModeledProductDefinition : public Handle_StepBasic_ProductDefinition {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_PhysicallyModeledProductDefinition();
		%feature("autodoc", "1");
		Handle_StepBasic_PhysicallyModeledProductDefinition(const Handle_StepBasic_PhysicallyModeledProductDefinition &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_PhysicallyModeledProductDefinition(const StepBasic_PhysicallyModeledProductDefinition *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_PhysicallyModeledProductDefinition const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_PhysicallyModeledProductDefinition {
	StepBasic_PhysicallyModeledProductDefinition* GetObject() {
	return (StepBasic_PhysicallyModeledProductDefinition*)$self->Access();
	}
};
%extend Handle_StepBasic_PhysicallyModeledProductDefinition {
	~Handle_StepBasic_PhysicallyModeledProductDefinition() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_PhysicallyModeledProductDefinition\n");}
	}
};

%nodefaultctor Handle_StepBasic_DocumentUsageConstraint;
class Handle_StepBasic_DocumentUsageConstraint : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentUsageConstraint();
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentUsageConstraint(const Handle_StepBasic_DocumentUsageConstraint &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentUsageConstraint(const StepBasic_DocumentUsageConstraint *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentUsageConstraint const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_DocumentUsageConstraint {
	StepBasic_DocumentUsageConstraint* GetObject() {
	return (StepBasic_DocumentUsageConstraint*)$self->Access();
	}
};
%extend Handle_StepBasic_DocumentUsageConstraint {
	~Handle_StepBasic_DocumentUsageConstraint() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_DocumentUsageConstraint\n");}
	}
};

%nodefaultctor Handle_StepBasic_Contract;
class Handle_StepBasic_Contract : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		Handle_StepBasic_Contract();
		%feature("autodoc", "1");
		Handle_StepBasic_Contract(const Handle_StepBasic_Contract &aHandle);
		%feature("autodoc", "1");
		Handle_StepBasic_Contract(const StepBasic_Contract *anItem);
		%feature("autodoc", "1");
		Handle_StepBasic_Contract const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_StepBasic_Contract {
	StepBasic_Contract* GetObject() {
	return (StepBasic_Contract*)$self->Access();
	}
};
%extend Handle_StepBasic_Contract {
	~Handle_StepBasic_Contract() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_StepBasic_Contract\n");}
	}
};

%nodefaultctor StepBasic_NameAssignment;
class StepBasic_NameAssignment : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_NameAssignment();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aAssignedName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString AssignedName() const;
		%feature("autodoc", "1");
		void SetAssignedName(const Handle_TCollection_HAsciiString &AssignedName);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_NameAssignment {
	Handle_StepBasic_NameAssignment GetHandle() {
	return *(Handle_StepBasic_NameAssignment*) &$self;
	}
};
%extend StepBasic_NameAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_NameAssignment {
	~StepBasic_NameAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_NameAssignment\n");}
	}
};

%nodefaultctor StepBasic_SecurityClassificationLevel;
class StepBasic_SecurityClassificationLevel : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_SecurityClassificationLevel();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SecurityClassificationLevel {
	Handle_StepBasic_SecurityClassificationLevel GetHandle() {
	return *(Handle_StepBasic_SecurityClassificationLevel*) &$self;
	}
};
%extend StepBasic_SecurityClassificationLevel {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SecurityClassificationLevel {
	~StepBasic_SecurityClassificationLevel() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SecurityClassificationLevel\n");}
	}
};

%nodefaultctor StepBasic_GeneralProperty;
class StepBasic_GeneralProperty : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_GeneralProperty();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aId, const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasDescription, const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Id() const;
		%feature("autodoc", "1");
		void SetId(const Handle_TCollection_HAsciiString &Id);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		Standard_Boolean HasDescription() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_GeneralProperty {
	Handle_StepBasic_GeneralProperty GetHandle() {
	return *(Handle_StepBasic_GeneralProperty*) &$self;
	}
};
%extend StepBasic_GeneralProperty {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_GeneralProperty {
	~StepBasic_GeneralProperty() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_GeneralProperty\n");}
	}
};

%nodefaultctor StepBasic_DateAndTimeAssignment;
class StepBasic_DateAndTimeAssignment : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_DateAndTimeAssignment();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DateAndTime &aAssignedDateAndTime, const Handle_StepBasic_DateTimeRole &aRole);
		%feature("autodoc", "1");
		void SetAssignedDateAndTime(const Handle_StepBasic_DateAndTime &aAssignedDateAndTime);
		%feature("autodoc", "1");
		Handle_StepBasic_DateAndTime AssignedDateAndTime() const;
		%feature("autodoc", "1");
		void SetRole(const Handle_StepBasic_DateTimeRole &aRole);
		%feature("autodoc", "1");
		Handle_StepBasic_DateTimeRole Role() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DateAndTimeAssignment {
	Handle_StepBasic_DateAndTimeAssignment GetHandle() {
	return *(Handle_StepBasic_DateAndTimeAssignment*) &$self;
	}
};
%extend StepBasic_DateAndTimeAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DateAndTimeAssignment {
	~StepBasic_DateAndTimeAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DateAndTimeAssignment\n");}
	}
};

%nodefaultctor StepBasic_NamedUnit;
class StepBasic_NamedUnit : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_NamedUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		void SetDimensions(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		Handle_StepBasic_DimensionalExponents Dimensions() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_NamedUnit {
	Handle_StepBasic_NamedUnit GetHandle() {
	return *(Handle_StepBasic_NamedUnit*) &$self;
	}
};
%extend StepBasic_NamedUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_NamedUnit {
	~StepBasic_NamedUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_NamedUnit\n");}
	}
};

%nodefaultctor StepBasic_ConversionBasedUnit;
class StepBasic_ConversionBasedUnit : public StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_ConversionBasedUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions, const Handle_TCollection_HAsciiString &aName, const Handle_StepBasic_MeasureWithUnit &aConversionFactor);
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetConversionFactor(const Handle_StepBasic_MeasureWithUnit &aConversionFactor);
		%feature("autodoc", "1");
		Handle_StepBasic_MeasureWithUnit ConversionFactor() const;

};
%extend StepBasic_ConversionBasedUnit {
	Handle_StepBasic_ConversionBasedUnit GetHandle() {
	return *(Handle_StepBasic_ConversionBasedUnit*) &$self;
	}
};
%extend StepBasic_ConversionBasedUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ConversionBasedUnit {
	~StepBasic_ConversionBasedUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ConversionBasedUnit\n");}
	}
};

%nodefaultctor StepBasic_ConversionBasedUnitAndAreaUnit;
class StepBasic_ConversionBasedUnitAndAreaUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_ConversionBasedUnitAndAreaUnit();
		%feature("autodoc", "1");
		void SetAreaUnit(const Handle_StepBasic_AreaUnit &anAreaUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_AreaUnit AreaUnit() const;

};
%extend StepBasic_ConversionBasedUnitAndAreaUnit {
	Handle_StepBasic_ConversionBasedUnitAndAreaUnit GetHandle() {
	return *(Handle_StepBasic_ConversionBasedUnitAndAreaUnit*) &$self;
	}
};
%extend StepBasic_ConversionBasedUnitAndAreaUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ConversionBasedUnitAndAreaUnit {
	~StepBasic_ConversionBasedUnitAndAreaUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ConversionBasedUnitAndAreaUnit\n");}
	}
};

%nodefaultctor StepBasic_MeasureWithUnit;
class StepBasic_MeasureWithUnit : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_MeasureWithUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_MeasureValueMember &aValueComponent, const StepBasic_Unit &aUnitComponent);
		%feature("autodoc", "1");
		void SetValueComponent(const Standard_Real aValueComponent);
		%feature("autodoc", "1");
		Standard_Real ValueComponent() const;
		%feature("autodoc", "1");
		Handle_StepBasic_MeasureValueMember ValueComponentMember() const;
		%feature("autodoc", "1");
		void SetValueComponentMember(const Handle_StepBasic_MeasureValueMember &val);
		%feature("autodoc", "1");
		void SetUnitComponent(const StepBasic_Unit &aUnitComponent);
		%feature("autodoc", "1");
		StepBasic_Unit UnitComponent() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_MeasureWithUnit {
	Handle_StepBasic_MeasureWithUnit GetHandle() {
	return *(Handle_StepBasic_MeasureWithUnit*) &$self;
	}
};
%extend StepBasic_MeasureWithUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_MeasureWithUnit {
	~StepBasic_MeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_MeasureWithUnit\n");}
	}
};

%nodefaultctor StepBasic_MassMeasureWithUnit;
class StepBasic_MassMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_MassMeasureWithUnit();

};
%extend StepBasic_MassMeasureWithUnit {
	Handle_StepBasic_MassMeasureWithUnit GetHandle() {
	return *(Handle_StepBasic_MassMeasureWithUnit*) &$self;
	}
};
%extend StepBasic_MassMeasureWithUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_MassMeasureWithUnit {
	~StepBasic_MassMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_MassMeasureWithUnit\n");}
	}
};

%nodefaultctor StepBasic_DocumentUsageConstraint;
class StepBasic_DocumentUsageConstraint : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_DocumentUsageConstraint();
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Document &aSource, const Handle_TCollection_HAsciiString &ase, const Handle_TCollection_HAsciiString &asev);
		%feature("autodoc", "1");
		Handle_StepBasic_Document Source() const;
		%feature("autodoc", "1");
		void SetSource(const Handle_StepBasic_Document &aSource);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString SubjectElement() const;
		%feature("autodoc", "1");
		void SetSubjectElement(const Handle_TCollection_HAsciiString &ase);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString SubjectElementValue() const;
		%feature("autodoc", "1");
		void SetSubjectElementValue(const Handle_TCollection_HAsciiString &asev);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DocumentUsageConstraint {
	Handle_StepBasic_DocumentUsageConstraint GetHandle() {
	return *(Handle_StepBasic_DocumentUsageConstraint*) &$self;
	}
};
%extend StepBasic_DocumentUsageConstraint {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DocumentUsageConstraint {
	~StepBasic_DocumentUsageConstraint() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DocumentUsageConstraint\n");}
	}
};

%nodefaultctor StepBasic_Array1OfProduct;
class StepBasic_Array1OfProduct {
	public:
		%feature("autodoc", "1");
		StepBasic_Array1OfProduct(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_Array1OfProduct(const Handle_StepBasic_Product &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Product &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const StepBasic_Array1OfProduct & Assign(const StepBasic_Array1OfProduct &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_Product &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_Product & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_StepBasic_Product & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_Product & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_StepBasic_Product & operator()(const Standard_Integer Index);

};
%extend StepBasic_Array1OfProduct {
	~StepBasic_Array1OfProduct() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Array1OfProduct\n");}
	}
};

%nodefaultctor StepBasic_SizeMember;
class StepBasic_SizeMember : public StepData_SelectReal {
	public:
		%feature("autodoc", "1");
		StepBasic_SizeMember();
		%feature("autodoc", "1");
		virtual		Standard_Boolean HasName() const;
		%feature("autodoc", "1");
		virtual		Standard_CString Name() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean SetName(const char * name);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SizeMember {
	Handle_StepBasic_SizeMember GetHandle() {
	return *(Handle_StepBasic_SizeMember*) &$self;
	}
};
%extend StepBasic_SizeMember {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SizeMember {
	~StepBasic_SizeMember() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SizeMember\n");}
	}
};

%nodefaultctor StepBasic_TimeMeasureWithUnit;
class StepBasic_TimeMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_TimeMeasureWithUnit();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_TimeMeasureWithUnit {
	Handle_StepBasic_TimeMeasureWithUnit GetHandle() {
	return *(Handle_StepBasic_TimeMeasureWithUnit*) &$self;
	}
};
%extend StepBasic_TimeMeasureWithUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_TimeMeasureWithUnit {
	~StepBasic_TimeMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_TimeMeasureWithUnit\n");}
	}
};

%nodefaultctor StepBasic_ProductCategory;
class StepBasic_ProductCategory : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductCategory();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasAdescription, const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		void UnSetDescription();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		Standard_Boolean HasDescription() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ProductCategory {
	Handle_StepBasic_ProductCategory GetHandle() {
	return *(Handle_StepBasic_ProductCategory*) &$self;
	}
};
%extend StepBasic_ProductCategory {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ProductCategory {
	~StepBasic_ProductCategory() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductCategory\n");}
	}
};

%nodefaultctor StepBasic_DateRole;
class StepBasic_DateRole : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_DateRole();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DateRole {
	Handle_StepBasic_DateRole GetHandle() {
	return *(Handle_StepBasic_DateRole*) &$self;
	}
};
%extend StepBasic_DateRole {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DateRole {
	~StepBasic_DateRole() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DateRole\n");}
	}
};

%nodefaultctor StepBasic_HArray1OfOrganization;
class StepBasic_HArray1OfOrganization : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_HArray1OfOrganization(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_HArray1OfOrganization(const Standard_Integer Low, const Standard_Integer Up, const Handle_StepBasic_Organization &V);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Organization &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_Organization &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_Organization & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_Organization & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const StepBasic_Array1OfOrganization & Array1() const;
		%feature("autodoc", "1");
		StepBasic_Array1OfOrganization & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_HArray1OfOrganization {
	Handle_StepBasic_HArray1OfOrganization GetHandle() {
	return *(Handle_StepBasic_HArray1OfOrganization*) &$self;
	}
};
%extend StepBasic_HArray1OfOrganization {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_HArray1OfOrganization {
	~StepBasic_HArray1OfOrganization() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_HArray1OfOrganization\n");}
	}
};

%nodefaultctor StepBasic_DateTimeSelect;
class StepBasic_DateTimeSelect : public StepData_SelectType {
	public:
		%feature("autodoc", "1");
		StepBasic_DateTimeSelect();
		%feature("autodoc", "1");
		virtual		Standard_Integer CaseNum(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Handle_StepBasic_Date Date() const;
		%feature("autodoc", "1");
		Handle_StepBasic_LocalTime LocalTime() const;
		%feature("autodoc", "1");
		Handle_StepBasic_DateAndTime DateAndTime() const;

};
%extend StepBasic_DateTimeSelect {
	~StepBasic_DateTimeSelect() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DateTimeSelect\n");}
	}
};

%nodefaultctor StepBasic_RoleSelect;
class StepBasic_RoleSelect : public StepData_SelectType {
	public:
		%feature("autodoc", "1");
		StepBasic_RoleSelect();
		%feature("autodoc", "1");
		virtual		Standard_Integer CaseNum(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Handle_StepBasic_ActionAssignment ActionAssignment() const;
		%feature("autodoc", "1");
		Handle_StepBasic_ActionRequestAssignment ActionRequestAssignment() const;
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalAssignment ApprovalAssignment() const;
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalDateTime ApprovalDateTime() const;
		%feature("autodoc", "1");
		Handle_StepBasic_CertificationAssignment CertificationAssignment() const;
		%feature("autodoc", "1");
		Handle_StepBasic_ContractAssignment ContractAssignment() const;
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentReference DocumentReference() const;
		%feature("autodoc", "1");
		Handle_StepBasic_EffectivityAssignment EffectivityAssignment() const;
		%feature("autodoc", "1");
		Handle_StepBasic_GroupAssignment GroupAssignment() const;
		%feature("autodoc", "1");
		Handle_StepBasic_NameAssignment NameAssignment() const;
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassificationAssignment SecurityClassificationAssignment() const;

};
%extend StepBasic_RoleSelect {
	~StepBasic_RoleSelect() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_RoleSelect\n");}
	}
};

%nodefaultctor StepBasic_VersionedActionRequest;
class StepBasic_VersionedActionRequest : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_VersionedActionRequest();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aId, const Handle_TCollection_HAsciiString &aVersion, const Handle_TCollection_HAsciiString &aPurpose, const Standard_Boolean hasDescription, const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Id() const;
		%feature("autodoc", "1");
		void SetId(const Handle_TCollection_HAsciiString &Id);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Version() const;
		%feature("autodoc", "1");
		void SetVersion(const Handle_TCollection_HAsciiString &Version);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Purpose() const;
		%feature("autodoc", "1");
		void SetPurpose(const Handle_TCollection_HAsciiString &Purpose);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		Standard_Boolean HasDescription() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_VersionedActionRequest {
	Handle_StepBasic_VersionedActionRequest GetHandle() {
	return *(Handle_StepBasic_VersionedActionRequest*) &$self;
	}
};
%extend StepBasic_VersionedActionRequest {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_VersionedActionRequest {
	~StepBasic_VersionedActionRequest() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_VersionedActionRequest\n");}
	}
};

%nodefaultctor StepBasic_RatioUnit;
class StepBasic_RatioUnit : public StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_RatioUnit();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_RatioUnit {
	Handle_StepBasic_RatioUnit GetHandle() {
	return *(Handle_StepBasic_RatioUnit*) &$self;
	}
};
%extend StepBasic_RatioUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_RatioUnit {
	~StepBasic_RatioUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_RatioUnit\n");}
	}
};

%nodefaultctor StepBasic_Array1OfProductDefinition;
class StepBasic_Array1OfProductDefinition {
	public:
		%feature("autodoc", "1");
		StepBasic_Array1OfProductDefinition(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_Array1OfProductDefinition(const Handle_StepBasic_ProductDefinition &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_ProductDefinition &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const StepBasic_Array1OfProductDefinition & Assign(const StepBasic_Array1OfProductDefinition &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_ProductDefinition &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_ProductDefinition & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_StepBasic_ProductDefinition & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinition & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinition & operator()(const Standard_Integer Index);

};
%extend StepBasic_Array1OfProductDefinition {
	~StepBasic_Array1OfProductDefinition() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Array1OfProductDefinition\n");}
	}
};

%nodefaultctor StepBasic_Date;
class StepBasic_Date : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_Date();
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Integer aYearComponent);
		%feature("autodoc", "1");
		void SetYearComponent(const Standard_Integer aYearComponent);
		%feature("autodoc", "1");
		Standard_Integer YearComponent() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_Date {
	Handle_StepBasic_Date GetHandle() {
	return *(Handle_StepBasic_Date*) &$self;
	}
};
%extend StepBasic_Date {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_Date {
	~StepBasic_Date() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Date\n");}
	}
};

%nodefaultctor StepBasic_ApplicationContextElement;
class StepBasic_ApplicationContextElement : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ApplicationContextElement();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName, const Handle_StepBasic_ApplicationContext &aFrameOfReference);
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetFrameOfReference(const Handle_StepBasic_ApplicationContext &aFrameOfReference);
		%feature("autodoc", "1");
		Handle_StepBasic_ApplicationContext FrameOfReference() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ApplicationContextElement {
	Handle_StepBasic_ApplicationContextElement GetHandle() {
	return *(Handle_StepBasic_ApplicationContextElement*) &$self;
	}
};
%extend StepBasic_ApplicationContextElement {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ApplicationContextElement {
	~StepBasic_ApplicationContextElement() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ApplicationContextElement\n");}
	}
};

%nodefaultctor StepBasic_ProductDefinitionContext;
class StepBasic_ProductDefinitionContext : public StepBasic_ApplicationContextElement {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductDefinitionContext();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName, const Handle_StepBasic_ApplicationContext &aFrameOfReference, const Handle_TCollection_HAsciiString &aLifeCycleStage);
		%feature("autodoc", "1");
		void SetLifeCycleStage(const Handle_TCollection_HAsciiString &aLifeCycleStage);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString LifeCycleStage() const;

};
%extend StepBasic_ProductDefinitionContext {
	Handle_StepBasic_ProductDefinitionContext GetHandle() {
	return *(Handle_StepBasic_ProductDefinitionContext*) &$self;
	}
};
%extend StepBasic_ProductDefinitionContext {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ProductDefinitionContext {
	~StepBasic_ProductDefinitionContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductDefinitionContext\n");}
	}
};

%nodefaultctor StepBasic_DesignContext;
class StepBasic_DesignContext : public StepBasic_ProductDefinitionContext {
	public:
		%feature("autodoc", "1");
		StepBasic_DesignContext();

};
%extend StepBasic_DesignContext {
	Handle_StepBasic_DesignContext GetHandle() {
	return *(Handle_StepBasic_DesignContext*) &$self;
	}
};
%extend StepBasic_DesignContext {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DesignContext {
	~StepBasic_DesignContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DesignContext\n");}
	}
};

%nodefaultctor StepBasic_ActionRequestSolution;
class StepBasic_ActionRequestSolution : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ActionRequestSolution();
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_ActionMethod &aMethod, const Handle_StepBasic_VersionedActionRequest &aRequest);
		%feature("autodoc", "1");
		Handle_StepBasic_ActionMethod Method() const;
		%feature("autodoc", "1");
		void SetMethod(const Handle_StepBasic_ActionMethod &Method);
		%feature("autodoc", "1");
		Handle_StepBasic_VersionedActionRequest Request() const;
		%feature("autodoc", "1");
		void SetRequest(const Handle_StepBasic_VersionedActionRequest &Request);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ActionRequestSolution {
	Handle_StepBasic_ActionRequestSolution GetHandle() {
	return *(Handle_StepBasic_ActionRequestSolution*) &$self;
	}
};
%extend StepBasic_ActionRequestSolution {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ActionRequestSolution {
	~StepBasic_ActionRequestSolution() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ActionRequestSolution\n");}
	}
};

%nodefaultctor StepBasic_SiUnit;
class StepBasic_SiUnit : public StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_SiUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);
		%feature("autodoc", "1");
		void SetPrefix(const StepBasic_SiPrefix aPrefix);
		%feature("autodoc", "1");
		void UnSetPrefix();
		%feature("autodoc", "1");
		StepBasic_SiPrefix Prefix() const;
		%feature("autodoc", "1");
		Standard_Boolean HasPrefix() const;
		%feature("autodoc", "1");
		void SetName(const StepBasic_SiUnitName aName);
		%feature("autodoc", "1");
		StepBasic_SiUnitName Name() const;
		%feature("autodoc", "1");
		virtual		void SetDimensions(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		Handle_StepBasic_DimensionalExponents Dimensions() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SiUnit {
	Handle_StepBasic_SiUnit GetHandle() {
	return *(Handle_StepBasic_SiUnit*) &$self;
	}
};
%extend StepBasic_SiUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SiUnit {
	~StepBasic_SiUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SiUnit\n");}
	}
};

%nodefaultctor StepBasic_SiUnitAndPlaneAngleUnit;
class StepBasic_SiUnitAndPlaneAngleUnit : public StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_SiUnitAndPlaneAngleUnit();
		%feature("autodoc", "1");
		void SetPlaneAngleUnit(const Handle_StepBasic_PlaneAngleUnit &aPlaneAngleUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_PlaneAngleUnit PlaneAngleUnit() const;

};
%extend StepBasic_SiUnitAndPlaneAngleUnit {
	Handle_StepBasic_SiUnitAndPlaneAngleUnit GetHandle() {
	return *(Handle_StepBasic_SiUnitAndPlaneAngleUnit*) &$self;
	}
};
%extend StepBasic_SiUnitAndPlaneAngleUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SiUnitAndPlaneAngleUnit {
	~StepBasic_SiUnitAndPlaneAngleUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SiUnitAndPlaneAngleUnit\n");}
	}
};

%nodefaultctor StepBasic_DocumentRelationship;
class StepBasic_DocumentRelationship : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_DocumentRelationship();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aName, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_Document &aRelating, const Handle_StepBasic_Document &aRelated);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_StepBasic_Document RelatingDocument() const;
		%feature("autodoc", "1");
		void SetRelatingDocument(const Handle_StepBasic_Document &aRelating);
		%feature("autodoc", "1");
		Handle_StepBasic_Document RelatedDocument() const;
		%feature("autodoc", "1");
		void SetRelatedDocument(const Handle_StepBasic_Document &aRelated);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DocumentRelationship {
	Handle_StepBasic_DocumentRelationship GetHandle() {
	return *(Handle_StepBasic_DocumentRelationship*) &$self;
	}
};
%extend StepBasic_DocumentRelationship {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DocumentRelationship {
	~StepBasic_DocumentRelationship() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DocumentRelationship\n");}
	}
};

%nodefaultctor StepBasic_LengthUnit;
class StepBasic_LengthUnit : public StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_LengthUnit();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_LengthUnit {
	Handle_StepBasic_LengthUnit GetHandle() {
	return *(Handle_StepBasic_LengthUnit*) &$self;
	}
};
%extend StepBasic_LengthUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_LengthUnit {
	~StepBasic_LengthUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_LengthUnit\n");}
	}
};

%nodefaultctor StepBasic_ConversionBasedUnitAndMassUnit;
class StepBasic_ConversionBasedUnitAndMassUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_ConversionBasedUnitAndMassUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions, const Handle_TCollection_HAsciiString &aName, const Handle_StepBasic_MeasureWithUnit &aConversionFactor);
		%feature("autodoc", "1");
		void SetMassUnit(const Handle_StepBasic_MassUnit &aMassUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_MassUnit MassUnit() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ConversionBasedUnitAndMassUnit {
	Handle_StepBasic_ConversionBasedUnitAndMassUnit GetHandle() {
	return *(Handle_StepBasic_ConversionBasedUnitAndMassUnit*) &$self;
	}
};
%extend StepBasic_ConversionBasedUnitAndMassUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ConversionBasedUnitAndMassUnit {
	~StepBasic_ConversionBasedUnitAndMassUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ConversionBasedUnitAndMassUnit\n");}
	}
};

%nodefaultctor StepBasic_AreaUnit;
class StepBasic_AreaUnit : public StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_AreaUnit();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_AreaUnit {
	Handle_StepBasic_AreaUnit GetHandle() {
	return *(Handle_StepBasic_AreaUnit*) &$self;
	}
};
%extend StepBasic_AreaUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_AreaUnit {
	~StepBasic_AreaUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_AreaUnit\n");}
	}
};

%nodefaultctor StepBasic_Array1OfApproval;
class StepBasic_Array1OfApproval {
	public:
		%feature("autodoc", "1");
		StepBasic_Array1OfApproval(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_Array1OfApproval(const Handle_StepBasic_Approval &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Approval &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const StepBasic_Array1OfApproval & Assign(const StepBasic_Array1OfApproval &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_Approval &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_Approval & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_StepBasic_Approval & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_Approval & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_StepBasic_Approval & operator()(const Standard_Integer Index);

};
%extend StepBasic_Array1OfApproval {
	~StepBasic_Array1OfApproval() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Array1OfApproval\n");}
	}
};

%nodefaultctor StepBasic_HArray1OfProductContext;
class StepBasic_HArray1OfProductContext : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_HArray1OfProductContext(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_HArray1OfProductContext(const Standard_Integer Low, const Standard_Integer Up, const Handle_StepBasic_ProductContext &V);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_ProductContext &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_ProductContext &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_ProductContext & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_ProductContext & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const StepBasic_Array1OfProductContext & Array1() const;
		%feature("autodoc", "1");
		StepBasic_Array1OfProductContext & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_HArray1OfProductContext {
	Handle_StepBasic_HArray1OfProductContext GetHandle() {
	return *(Handle_StepBasic_HArray1OfProductContext*) &$self;
	}
};
%extend StepBasic_HArray1OfProductContext {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_HArray1OfProductContext {
	~StepBasic_HArray1OfProductContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_HArray1OfProductContext\n");}
	}
};

%nodefaultctor StepBasic_ApplicationProtocolDefinition;
class StepBasic_ApplicationProtocolDefinition : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ApplicationProtocolDefinition();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aStatus, const Handle_TCollection_HAsciiString &aApplicationInterpretedModelSchemaName, const Standard_Integer aApplicationProtocolYear, const Handle_StepBasic_ApplicationContext &aApplication);
		%feature("autodoc", "1");
		void SetStatus(const Handle_TCollection_HAsciiString &aStatus);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Status() const;
		%feature("autodoc", "1");
		void SetApplicationInterpretedModelSchemaName(const Handle_TCollection_HAsciiString &aApplicationInterpretedModelSchemaName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString ApplicationInterpretedModelSchemaName() const;
		%feature("autodoc", "1");
		void SetApplicationProtocolYear(const Standard_Integer aApplicationProtocolYear);
		%feature("autodoc", "1");
		Standard_Integer ApplicationProtocolYear() const;
		%feature("autodoc", "1");
		void SetApplication(const Handle_StepBasic_ApplicationContext &aApplication);
		%feature("autodoc", "1");
		Handle_StepBasic_ApplicationContext Application() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ApplicationProtocolDefinition {
	Handle_StepBasic_ApplicationProtocolDefinition GetHandle() {
	return *(Handle_StepBasic_ApplicationProtocolDefinition*) &$self;
	}
};
%extend StepBasic_ApplicationProtocolDefinition {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ApplicationProtocolDefinition {
	~StepBasic_ApplicationProtocolDefinition() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ApplicationProtocolDefinition\n");}
	}
};

%nodefaultctor StepBasic_Array1OfOrganization;
class StepBasic_Array1OfOrganization {
	public:
		%feature("autodoc", "1");
		StepBasic_Array1OfOrganization(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_Array1OfOrganization(const Handle_StepBasic_Organization &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Organization &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const StepBasic_Array1OfOrganization & Assign(const StepBasic_Array1OfOrganization &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_Organization &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_Organization & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_StepBasic_Organization & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_Organization & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_StepBasic_Organization & operator()(const Standard_Integer Index);

};
%extend StepBasic_Array1OfOrganization {
	~StepBasic_Array1OfOrganization() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Array1OfOrganization\n");}
	}
};

%nodefaultctor StepBasic_PlaneAngleUnit;
class StepBasic_PlaneAngleUnit : public StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_PlaneAngleUnit();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_PlaneAngleUnit {
	Handle_StepBasic_PlaneAngleUnit GetHandle() {
	return *(Handle_StepBasic_PlaneAngleUnit*) &$self;
	}
};
%extend StepBasic_PlaneAngleUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_PlaneAngleUnit {
	~StepBasic_PlaneAngleUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_PlaneAngleUnit\n");}
	}
};

%nodefaultctor StepBasic_Address;
class StepBasic_Address : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_Address();
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Boolean hasAinternalLocation, const Handle_TCollection_HAsciiString &aInternalLocation, const Standard_Boolean hasAstreetNumber, const Handle_TCollection_HAsciiString &aStreetNumber, const Standard_Boolean hasAstreet, const Handle_TCollection_HAsciiString &aStreet, const Standard_Boolean hasApostalBox, const Handle_TCollection_HAsciiString &aPostalBox, const Standard_Boolean hasAtown, const Handle_TCollection_HAsciiString &aTown, const Standard_Boolean hasAregion, const Handle_TCollection_HAsciiString &aRegion, const Standard_Boolean hasApostalCode, const Handle_TCollection_HAsciiString &aPostalCode, const Standard_Boolean hasAcountry, const Handle_TCollection_HAsciiString &aCountry, const Standard_Boolean hasAfacsimileNumber, const Handle_TCollection_HAsciiString &aFacsimileNumber, const Standard_Boolean hasAtelephoneNumber, const Handle_TCollection_HAsciiString &aTelephoneNumber, const Standard_Boolean hasAelectronicMailAddress, const Handle_TCollection_HAsciiString &aElectronicMailAddress, const Standard_Boolean hasAtelexNumber, const Handle_TCollection_HAsciiString &aTelexNumber);
		%feature("autodoc", "1");
		void SetInternalLocation(const Handle_TCollection_HAsciiString &aInternalLocation);
		%feature("autodoc", "1");
		void UnSetInternalLocation();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString InternalLocation() const;
		%feature("autodoc", "1");
		Standard_Boolean HasInternalLocation() const;
		%feature("autodoc", "1");
		void SetStreetNumber(const Handle_TCollection_HAsciiString &aStreetNumber);
		%feature("autodoc", "1");
		void UnSetStreetNumber();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString StreetNumber() const;
		%feature("autodoc", "1");
		Standard_Boolean HasStreetNumber() const;
		%feature("autodoc", "1");
		void SetStreet(const Handle_TCollection_HAsciiString &aStreet);
		%feature("autodoc", "1");
		void UnSetStreet();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Street() const;
		%feature("autodoc", "1");
		Standard_Boolean HasStreet() const;
		%feature("autodoc", "1");
		void SetPostalBox(const Handle_TCollection_HAsciiString &aPostalBox);
		%feature("autodoc", "1");
		void UnSetPostalBox();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString PostalBox() const;
		%feature("autodoc", "1");
		Standard_Boolean HasPostalBox() const;
		%feature("autodoc", "1");
		void SetTown(const Handle_TCollection_HAsciiString &aTown);
		%feature("autodoc", "1");
		void UnSetTown();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Town() const;
		%feature("autodoc", "1");
		Standard_Boolean HasTown() const;
		%feature("autodoc", "1");
		void SetRegion(const Handle_TCollection_HAsciiString &aRegion);
		%feature("autodoc", "1");
		void UnSetRegion();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Region() const;
		%feature("autodoc", "1");
		Standard_Boolean HasRegion() const;
		%feature("autodoc", "1");
		void SetPostalCode(const Handle_TCollection_HAsciiString &aPostalCode);
		%feature("autodoc", "1");
		void UnSetPostalCode();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString PostalCode() const;
		%feature("autodoc", "1");
		Standard_Boolean HasPostalCode() const;
		%feature("autodoc", "1");
		void SetCountry(const Handle_TCollection_HAsciiString &aCountry);
		%feature("autodoc", "1");
		void UnSetCountry();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Country() const;
		%feature("autodoc", "1");
		Standard_Boolean HasCountry() const;
		%feature("autodoc", "1");
		void SetFacsimileNumber(const Handle_TCollection_HAsciiString &aFacsimileNumber);
		%feature("autodoc", "1");
		void UnSetFacsimileNumber();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString FacsimileNumber() const;
		%feature("autodoc", "1");
		Standard_Boolean HasFacsimileNumber() const;
		%feature("autodoc", "1");
		void SetTelephoneNumber(const Handle_TCollection_HAsciiString &aTelephoneNumber);
		%feature("autodoc", "1");
		void UnSetTelephoneNumber();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString TelephoneNumber() const;
		%feature("autodoc", "1");
		Standard_Boolean HasTelephoneNumber() const;
		%feature("autodoc", "1");
		void SetElectronicMailAddress(const Handle_TCollection_HAsciiString &aElectronicMailAddress);
		%feature("autodoc", "1");
		void UnSetElectronicMailAddress();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString ElectronicMailAddress() const;
		%feature("autodoc", "1");
		Standard_Boolean HasElectronicMailAddress() const;
		%feature("autodoc", "1");
		void SetTelexNumber(const Handle_TCollection_HAsciiString &aTelexNumber);
		%feature("autodoc", "1");
		void UnSetTelexNumber();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString TelexNumber() const;
		%feature("autodoc", "1");
		Standard_Boolean HasTelexNumber() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_Address {
	Handle_StepBasic_Address GetHandle() {
	return *(Handle_StepBasic_Address*) &$self;
	}
};
%extend StepBasic_Address {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_Address {
	~StepBasic_Address() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Address\n");}
	}
};

%nodefaultctor StepBasic_Organization;
class StepBasic_Organization : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_Organization();
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Boolean hasAid, const Handle_TCollection_HAsciiString &aId, const Handle_TCollection_HAsciiString &aName, const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		void SetId(const Handle_TCollection_HAsciiString &aId);
		%feature("autodoc", "1");
		void UnSetId();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Id() const;
		%feature("autodoc", "1");
		Standard_Boolean HasId() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_Organization {
	Handle_StepBasic_Organization GetHandle() {
	return *(Handle_StepBasic_Organization*) &$self;
	}
};
%extend StepBasic_Organization {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_Organization {
	~StepBasic_Organization() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Organization\n");}
	}
};

%nodefaultctor StepBasic_ApplicationContext;
class StepBasic_ApplicationContext : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ApplicationContext();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aApplication);
		%feature("autodoc", "1");
		void SetApplication(const Handle_TCollection_HAsciiString &aApplication);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Application() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ApplicationContext {
	Handle_StepBasic_ApplicationContext GetHandle() {
	return *(Handle_StepBasic_ApplicationContext*) &$self;
	}
};
%extend StepBasic_ApplicationContext {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ApplicationContext {
	~StepBasic_ApplicationContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ApplicationContext\n");}
	}
};

%nodefaultctor StepBasic_ConversionBasedUnitAndTimeUnit;
class StepBasic_ConversionBasedUnitAndTimeUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_ConversionBasedUnitAndTimeUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions, const Handle_TCollection_HAsciiString &aName, const Handle_StepBasic_MeasureWithUnit &aConversionFactor);
		%feature("autodoc", "1");
		void SetTimeUnit(const Handle_StepBasic_TimeUnit &aTimeUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_TimeUnit TimeUnit() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ConversionBasedUnitAndTimeUnit {
	Handle_StepBasic_ConversionBasedUnitAndTimeUnit GetHandle() {
	return *(Handle_StepBasic_ConversionBasedUnitAndTimeUnit*) &$self;
	}
};
%extend StepBasic_ConversionBasedUnitAndTimeUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ConversionBasedUnitAndTimeUnit {
	~StepBasic_ConversionBasedUnitAndTimeUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ConversionBasedUnitAndTimeUnit\n");}
	}
};

%nodefaultctor StepBasic_Approval;
class StepBasic_Approval : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_Approval();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_ApprovalStatus &aStatus, const Handle_TCollection_HAsciiString &aLevel);
		%feature("autodoc", "1");
		void SetStatus(const Handle_StepBasic_ApprovalStatus &aStatus);
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalStatus Status() const;
		%feature("autodoc", "1");
		void SetLevel(const Handle_TCollection_HAsciiString &aLevel);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Level() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_Approval {
	Handle_StepBasic_Approval GetHandle() {
	return *(Handle_StepBasic_Approval*) &$self;
	}
};
%extend StepBasic_Approval {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_Approval {
	~StepBasic_Approval() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Approval\n");}
	}
};

%nodefaultctor StepBasic_ProductRelatedProductCategory;
class StepBasic_ProductRelatedProductCategory : public StepBasic_ProductCategory {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductRelatedProductCategory();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasAdescription, const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasAdescription, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_HArray1OfProduct &aProducts);
		%feature("autodoc", "1");
		void SetProducts(const Handle_StepBasic_HArray1OfProduct &aProducts);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfProduct Products() const;
		%feature("autodoc", "1");
		Handle_StepBasic_Product ProductsValue(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Integer NbProducts() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ProductRelatedProductCategory {
	Handle_StepBasic_ProductRelatedProductCategory GetHandle() {
	return *(Handle_StepBasic_ProductRelatedProductCategory*) &$self;
	}
};
%extend StepBasic_ProductRelatedProductCategory {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ProductRelatedProductCategory {
	~StepBasic_ProductRelatedProductCategory() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductRelatedProductCategory\n");}
	}
};

%nodefaultctor StepBasic_ProductType;
class StepBasic_ProductType : public StepBasic_ProductRelatedProductCategory {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductType();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ProductType {
	Handle_StepBasic_ProductType GetHandle() {
	return *(Handle_StepBasic_ProductType*) &$self;
	}
};
%extend StepBasic_ProductType {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ProductType {
	~StepBasic_ProductType() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductType\n");}
	}
};

%nodefaultctor StepBasic_DateAndTime;
class StepBasic_DateAndTime : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_DateAndTime();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_Date &aDateComponent, const Handle_StepBasic_LocalTime &aTimeComponent);
		%feature("autodoc", "1");
		void SetDateComponent(const Handle_StepBasic_Date &aDateComponent);
		%feature("autodoc", "1");
		Handle_StepBasic_Date DateComponent() const;
		%feature("autodoc", "1");
		void SetTimeComponent(const Handle_StepBasic_LocalTime &aTimeComponent);
		%feature("autodoc", "1");
		Handle_StepBasic_LocalTime TimeComponent() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DateAndTime {
	Handle_StepBasic_DateAndTime GetHandle() {
	return *(Handle_StepBasic_DateAndTime*) &$self;
	}
};
%extend StepBasic_DateAndTime {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DateAndTime {
	~StepBasic_DateAndTime() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DateAndTime\n");}
	}
};

%nodefaultctor StepBasic_DocumentType;
class StepBasic_DocumentType : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_DocumentType();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &apdt);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString ProductDataType() const;
		%feature("autodoc", "1");
		void SetProductDataType(const Handle_TCollection_HAsciiString &apdt);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DocumentType {
	Handle_StepBasic_DocumentType GetHandle() {
	return *(Handle_StepBasic_DocumentType*) &$self;
	}
};
%extend StepBasic_DocumentType {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DocumentType {
	~StepBasic_DocumentType() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DocumentType\n");}
	}
};

%nodefaultctor StepBasic_Effectivity;
class StepBasic_Effectivity : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_Effectivity();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aid);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Id() const;
		%feature("autodoc", "1");
		void SetId(const Handle_TCollection_HAsciiString &aid);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_Effectivity {
	Handle_StepBasic_Effectivity GetHandle() {
	return *(Handle_StepBasic_Effectivity*) &$self;
	}
};
%extend StepBasic_Effectivity {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_Effectivity {
	~StepBasic_Effectivity() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Effectivity\n");}
	}
};

%nodefaultctor StepBasic_EulerAngles;
class StepBasic_EulerAngles : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_EulerAngles();
		%feature("autodoc", "1");
		void Init(const Handle_TColStd_HArray1OfReal &aAngles);
		%feature("autodoc", "1");
		Handle_TColStd_HArray1OfReal Angles() const;
		%feature("autodoc", "1");
		void SetAngles(const Handle_TColStd_HArray1OfReal &Angles);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_EulerAngles {
	Handle_StepBasic_EulerAngles GetHandle() {
	return *(Handle_StepBasic_EulerAngles*) &$self;
	}
};
%extend StepBasic_EulerAngles {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_EulerAngles {
	~StepBasic_EulerAngles() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_EulerAngles\n");}
	}
};

%nodefaultctor StepBasic_CalendarDate;
class StepBasic_CalendarDate : public StepBasic_Date {
	public:
		%feature("autodoc", "1");
		StepBasic_CalendarDate();
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Integer aYearComponent);
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Integer aYearComponent, const Standard_Integer aDayComponent, const Standard_Integer aMonthComponent);
		%feature("autodoc", "1");
		void SetDayComponent(const Standard_Integer aDayComponent);
		%feature("autodoc", "1");
		Standard_Integer DayComponent() const;
		%feature("autodoc", "1");
		void SetMonthComponent(const Standard_Integer aMonthComponent);
		%feature("autodoc", "1");
		Standard_Integer MonthComponent() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_CalendarDate {
	Handle_StepBasic_CalendarDate GetHandle() {
	return *(Handle_StepBasic_CalendarDate*) &$self;
	}
};
%extend StepBasic_CalendarDate {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_CalendarDate {
	~StepBasic_CalendarDate() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_CalendarDate\n");}
	}
};

%nodefaultctor StepBasic_ActionAssignment;
class StepBasic_ActionAssignment : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ActionAssignment();
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Action &aAssignedAction);
		%feature("autodoc", "1");
		Handle_StepBasic_Action AssignedAction() const;
		%feature("autodoc", "1");
		void SetAssignedAction(const Handle_StepBasic_Action &AssignedAction);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ActionAssignment {
	Handle_StepBasic_ActionAssignment GetHandle() {
	return *(Handle_StepBasic_ActionAssignment*) &$self;
	}
};
%extend StepBasic_ActionAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ActionAssignment {
	~StepBasic_ActionAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ActionAssignment\n");}
	}
};

%nodefaultctor StepBasic_OrganizationRole;
class StepBasic_OrganizationRole : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_OrganizationRole();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_OrganizationRole {
	Handle_StepBasic_OrganizationRole GetHandle() {
	return *(Handle_StepBasic_OrganizationRole*) &$self;
	}
};
%extend StepBasic_OrganizationRole {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_OrganizationRole {
	~StepBasic_OrganizationRole() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_OrganizationRole\n");}
	}
};

%nodefaultctor StepBasic_DerivedUnitElement;
class StepBasic_DerivedUnitElement : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_DerivedUnitElement();
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_NamedUnit &aUnit, const Standard_Real aExponent);
		%feature("autodoc", "1");
		void SetUnit(const Handle_StepBasic_NamedUnit &aUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_NamedUnit Unit() const;
		%feature("autodoc", "1");
		void SetExponent(const Standard_Real aExponent);
		%feature("autodoc", "1");
		Standard_Real Exponent() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DerivedUnitElement {
	Handle_StepBasic_DerivedUnitElement GetHandle() {
	return *(Handle_StepBasic_DerivedUnitElement*) &$self;
	}
};
%extend StepBasic_DerivedUnitElement {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DerivedUnitElement {
	~StepBasic_DerivedUnitElement() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DerivedUnitElement\n");}
	}
};

%nodefaultctor StepBasic_SiUnitAndThermodynamicTemperatureUnit;
class StepBasic_SiUnitAndThermodynamicTemperatureUnit : public StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_SiUnitAndThermodynamicTemperatureUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);
		%feature("autodoc", "1");
		void SetThermodynamicTemperatureUnit(const Handle_StepBasic_ThermodynamicTemperatureUnit &aThermodynamicTemperatureUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_ThermodynamicTemperatureUnit ThermodynamicTemperatureUnit() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SiUnitAndThermodynamicTemperatureUnit {
	Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit GetHandle() {
	return *(Handle_StepBasic_SiUnitAndThermodynamicTemperatureUnit*) &$self;
	}
};
%extend StepBasic_SiUnitAndThermodynamicTemperatureUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SiUnitAndThermodynamicTemperatureUnit {
	~StepBasic_SiUnitAndThermodynamicTemperatureUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SiUnitAndThermodynamicTemperatureUnit\n");}
	}
};

%nodefaultctor StepBasic_Unit;
class StepBasic_Unit : public StepData_SelectType {
	public:
		%feature("autodoc", "1");
		StepBasic_Unit();
		%feature("autodoc", "1");
		virtual		Standard_Integer CaseNum(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Handle_StepBasic_NamedUnit NamedUnit() const;
		%feature("autodoc", "1");
		Handle_StepBasic_DerivedUnit DerivedUnit() const;

};
%extend StepBasic_Unit {
	~StepBasic_Unit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Unit\n");}
	}
};

%nodefaultctor StepBasic_IdentificationRole;
class StepBasic_IdentificationRole : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_IdentificationRole();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasDescription, const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		Standard_Boolean HasDescription() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_IdentificationRole {
	Handle_StepBasic_IdentificationRole GetHandle() {
	return *(Handle_StepBasic_IdentificationRole*) &$self;
	}
};
%extend StepBasic_IdentificationRole {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_IdentificationRole {
	~StepBasic_IdentificationRole() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_IdentificationRole\n");}
	}
};

%nodefaultctor StepBasic_ApprovalStatus;
class StepBasic_ApprovalStatus : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ApprovalStatus();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ApprovalStatus {
	Handle_StepBasic_ApprovalStatus GetHandle() {
	return *(Handle_StepBasic_ApprovalStatus*) &$self;
	}
};
%extend StepBasic_ApprovalStatus {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ApprovalStatus {
	~StepBasic_ApprovalStatus() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ApprovalStatus\n");}
	}
};

%nodefaultctor StepBasic_LocalTime;
class StepBasic_LocalTime : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_LocalTime();
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Integer aHourComponent, const Standard_Boolean hasAminuteComponent, const Standard_Integer aMinuteComponent, const Standard_Boolean hasAsecondComponent, const Standard_Real aSecondComponent, const Handle_StepBasic_CoordinatedUniversalTimeOffset &aZone);
		%feature("autodoc", "1");
		void SetHourComponent(const Standard_Integer aHourComponent);
		%feature("autodoc", "1");
		Standard_Integer HourComponent() const;
		%feature("autodoc", "1");
		void SetMinuteComponent(const Standard_Integer aMinuteComponent);
		%feature("autodoc", "1");
		void UnSetMinuteComponent();
		%feature("autodoc", "1");
		Standard_Integer MinuteComponent() const;
		%feature("autodoc", "1");
		Standard_Boolean HasMinuteComponent() const;
		%feature("autodoc", "1");
		void SetSecondComponent(const Standard_Real aSecondComponent);
		%feature("autodoc", "1");
		void UnSetSecondComponent();
		%feature("autodoc", "1");
		Standard_Real SecondComponent() const;
		%feature("autodoc", "1");
		Standard_Boolean HasSecondComponent() const;
		%feature("autodoc", "1");
		void SetZone(const Handle_StepBasic_CoordinatedUniversalTimeOffset &aZone);
		%feature("autodoc", "1");
		Handle_StepBasic_CoordinatedUniversalTimeOffset Zone() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_LocalTime {
	Handle_StepBasic_LocalTime GetHandle() {
	return *(Handle_StepBasic_LocalTime*) &$self;
	}
};
%extend StepBasic_LocalTime {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_LocalTime {
	~StepBasic_LocalTime() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_LocalTime\n");}
	}
};

%nodefaultctor StepBasic_PlaneAngleMeasureWithUnit;
class StepBasic_PlaneAngleMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_PlaneAngleMeasureWithUnit();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_PlaneAngleMeasureWithUnit {
	Handle_StepBasic_PlaneAngleMeasureWithUnit GetHandle() {
	return *(Handle_StepBasic_PlaneAngleMeasureWithUnit*) &$self;
	}
};
%extend StepBasic_PlaneAngleMeasureWithUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_PlaneAngleMeasureWithUnit {
	~StepBasic_PlaneAngleMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_PlaneAngleMeasureWithUnit\n");}
	}
};

%nodefaultctor StepBasic_SiUnitAndMassUnit;
class StepBasic_SiUnitAndMassUnit : public StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_SiUnitAndMassUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);
		%feature("autodoc", "1");
		void SetMassUnit(const Handle_StepBasic_MassUnit &aMassUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_MassUnit MassUnit() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SiUnitAndMassUnit {
	Handle_StepBasic_SiUnitAndMassUnit GetHandle() {
	return *(Handle_StepBasic_SiUnitAndMassUnit*) &$self;
	}
};
%extend StepBasic_SiUnitAndMassUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SiUnitAndMassUnit {
	~StepBasic_SiUnitAndMassUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SiUnitAndMassUnit\n");}
	}
};

%nodefaultctor StepBasic_PersonalAddress;
class StepBasic_PersonalAddress : public StepBasic_Address {
	public:
		%feature("autodoc", "1");
		StepBasic_PersonalAddress();
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Boolean hasAinternalLocation, const Handle_TCollection_HAsciiString &aInternalLocation, const Standard_Boolean hasAstreetNumber, const Handle_TCollection_HAsciiString &aStreetNumber, const Standard_Boolean hasAstreet, const Handle_TCollection_HAsciiString &aStreet, const Standard_Boolean hasApostalBox, const Handle_TCollection_HAsciiString &aPostalBox, const Standard_Boolean hasAtown, const Handle_TCollection_HAsciiString &aTown, const Standard_Boolean hasAregion, const Handle_TCollection_HAsciiString &aRegion, const Standard_Boolean hasApostalCode, const Handle_TCollection_HAsciiString &aPostalCode, const Standard_Boolean hasAcountry, const Handle_TCollection_HAsciiString &aCountry, const Standard_Boolean hasAfacsimileNumber, const Handle_TCollection_HAsciiString &aFacsimileNumber, const Standard_Boolean hasAtelephoneNumber, const Handle_TCollection_HAsciiString &aTelephoneNumber, const Standard_Boolean hasAelectronicMailAddress, const Handle_TCollection_HAsciiString &aElectronicMailAddress, const Standard_Boolean hasAtelexNumber, const Handle_TCollection_HAsciiString &aTelexNumber);
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Boolean hasAinternalLocation, const Handle_TCollection_HAsciiString &aInternalLocation, const Standard_Boolean hasAstreetNumber, const Handle_TCollection_HAsciiString &aStreetNumber, const Standard_Boolean hasAstreet, const Handle_TCollection_HAsciiString &aStreet, const Standard_Boolean hasApostalBox, const Handle_TCollection_HAsciiString &aPostalBox, const Standard_Boolean hasAtown, const Handle_TCollection_HAsciiString &aTown, const Standard_Boolean hasAregion, const Handle_TCollection_HAsciiString &aRegion, const Standard_Boolean hasApostalCode, const Handle_TCollection_HAsciiString &aPostalCode, const Standard_Boolean hasAcountry, const Handle_TCollection_HAsciiString &aCountry, const Standard_Boolean hasAfacsimileNumber, const Handle_TCollection_HAsciiString &aFacsimileNumber, const Standard_Boolean hasAtelephoneNumber, const Handle_TCollection_HAsciiString &aTelephoneNumber, const Standard_Boolean hasAelectronicMailAddress, const Handle_TCollection_HAsciiString &aElectronicMailAddress, const Standard_Boolean hasAtelexNumber, const Handle_TCollection_HAsciiString &aTelexNumber, const Handle_StepBasic_HArray1OfPerson &aPeople, const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		void SetPeople(const Handle_StepBasic_HArray1OfPerson &aPeople);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfPerson People() const;
		%feature("autodoc", "1");
		Handle_StepBasic_Person PeopleValue(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Integer NbPeople() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_PersonalAddress {
	Handle_StepBasic_PersonalAddress GetHandle() {
	return *(Handle_StepBasic_PersonalAddress*) &$self;
	}
};
%extend StepBasic_PersonalAddress {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_PersonalAddress {
	~StepBasic_PersonalAddress() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_PersonalAddress\n");}
	}
};

%nodefaultctor StepBasic_CertificationType;
class StepBasic_CertificationType : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_CertificationType();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_CertificationType {
	Handle_StepBasic_CertificationType GetHandle() {
	return *(Handle_StepBasic_CertificationType*) &$self;
	}
};
%extend StepBasic_CertificationType {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_CertificationType {
	~StepBasic_CertificationType() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_CertificationType\n");}
	}
};

%nodefaultctor StepBasic_MeasureValueMember;
class StepBasic_MeasureValueMember : public StepData_SelectReal {
	public:
		%feature("autodoc", "1");
		StepBasic_MeasureValueMember();
		%feature("autodoc", "1");
		virtual		Standard_Boolean HasName() const;
		%feature("autodoc", "1");
		virtual		Standard_CString Name() const;
		%feature("autodoc", "1");
		virtual		Standard_Boolean SetName(const char * name);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_MeasureValueMember {
	Handle_StepBasic_MeasureValueMember GetHandle() {
	return *(Handle_StepBasic_MeasureValueMember*) &$self;
	}
};
%extend StepBasic_MeasureValueMember {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_MeasureValueMember {
	~StepBasic_MeasureValueMember() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_MeasureValueMember\n");}
	}
};

%nodefaultctor StepBasic_ProductDefinitionRelationship;
class StepBasic_ProductDefinitionRelationship : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductDefinitionRelationship();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aId, const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasDescription, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_ProductDefinition &aRelatingProductDefinition, const Handle_StepBasic_ProductDefinition &aRelatedProductDefinition);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Id() const;
		%feature("autodoc", "1");
		void SetId(const Handle_TCollection_HAsciiString &Id);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		Standard_Boolean HasDescription() const;
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinition RelatingProductDefinition() const;
		%feature("autodoc", "1");
		void SetRelatingProductDefinition(const Handle_StepBasic_ProductDefinition &RelatingProductDefinition);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinition RelatedProductDefinition() const;
		%feature("autodoc", "1");
		void SetRelatedProductDefinition(const Handle_StepBasic_ProductDefinition &RelatedProductDefinition);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ProductDefinitionRelationship {
	Handle_StepBasic_ProductDefinitionRelationship GetHandle() {
	return *(Handle_StepBasic_ProductDefinitionRelationship*) &$self;
	}
};
%extend StepBasic_ProductDefinitionRelationship {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ProductDefinitionRelationship {
	~StepBasic_ProductDefinitionRelationship() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductDefinitionRelationship\n");}
	}
};

%nodefaultctor StepBasic_Product;
class StepBasic_Product : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_Product();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aId, const Handle_TCollection_HAsciiString &aName, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_HArray1OfProductContext &aFrameOfReference);
		%feature("autodoc", "1");
		void SetId(const Handle_TCollection_HAsciiString &aId);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Id() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetFrameOfReference(const Handle_StepBasic_HArray1OfProductContext &aFrameOfReference);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfProductContext FrameOfReference() const;
		%feature("autodoc", "1");
		Handle_StepBasic_ProductContext FrameOfReferenceValue(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Integer NbFrameOfReference() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_Product {
	Handle_StepBasic_Product GetHandle() {
	return *(Handle_StepBasic_Product*) &$self;
	}
};
%extend StepBasic_Product {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_Product {
	~StepBasic_Product() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Product\n");}
	}
};

%nodefaultctor StepBasic_ConversionBasedUnitAndVolumeUnit;
class StepBasic_ConversionBasedUnitAndVolumeUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_ConversionBasedUnitAndVolumeUnit();
		%feature("autodoc", "1");
		void SetVolumeUnit(const Handle_StepBasic_VolumeUnit &aVolumeUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_VolumeUnit VolumeUnit() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ConversionBasedUnitAndVolumeUnit {
	Handle_StepBasic_ConversionBasedUnitAndVolumeUnit GetHandle() {
	return *(Handle_StepBasic_ConversionBasedUnitAndVolumeUnit*) &$self;
	}
};
%extend StepBasic_ConversionBasedUnitAndVolumeUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ConversionBasedUnitAndVolumeUnit {
	~StepBasic_ConversionBasedUnitAndVolumeUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ConversionBasedUnitAndVolumeUnit\n");}
	}
};

%nodefaultctor StepBasic_CoordinatedUniversalTimeOffset;
class StepBasic_CoordinatedUniversalTimeOffset : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_CoordinatedUniversalTimeOffset();
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Integer aHourOffset, const Standard_Boolean hasAminuteOffset, const Standard_Integer aMinuteOffset, const StepBasic_AheadOrBehind aSense);
		%feature("autodoc", "1");
		void SetHourOffset(const Standard_Integer aHourOffset);
		%feature("autodoc", "1");
		Standard_Integer HourOffset() const;
		%feature("autodoc", "1");
		void SetMinuteOffset(const Standard_Integer aMinuteOffset);
		%feature("autodoc", "1");
		void UnSetMinuteOffset();
		%feature("autodoc", "1");
		Standard_Integer MinuteOffset() const;
		%feature("autodoc", "1");
		Standard_Boolean HasMinuteOffset() const;
		%feature("autodoc", "1");
		void SetSense(const StepBasic_AheadOrBehind aSense);
		%feature("autodoc", "1");
		StepBasic_AheadOrBehind Sense() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_CoordinatedUniversalTimeOffset {
	Handle_StepBasic_CoordinatedUniversalTimeOffset GetHandle() {
	return *(Handle_StepBasic_CoordinatedUniversalTimeOffset*) &$self;
	}
};
%extend StepBasic_CoordinatedUniversalTimeOffset {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_CoordinatedUniversalTimeOffset {
	~StepBasic_CoordinatedUniversalTimeOffset() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_CoordinatedUniversalTimeOffset\n");}
	}
};

%nodefaultctor StepBasic_Group;
class StepBasic_Group : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_Group();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasDescription, const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		Standard_Boolean HasDescription() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_Group {
	Handle_StepBasic_Group GetHandle() {
	return *(Handle_StepBasic_Group*) &$self;
	}
};
%extend StepBasic_Group {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_Group {
	~StepBasic_Group() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Group\n");}
	}
};

%nodefaultctor StepBasic_ApprovalRole;
class StepBasic_ApprovalRole : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ApprovalRole();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aRole);
		%feature("autodoc", "1");
		void SetRole(const Handle_TCollection_HAsciiString &aRole);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Role() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ApprovalRole {
	Handle_StepBasic_ApprovalRole GetHandle() {
	return *(Handle_StepBasic_ApprovalRole*) &$self;
	}
};
%extend StepBasic_ApprovalRole {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ApprovalRole {
	~StepBasic_ApprovalRole() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ApprovalRole\n");}
	}
};

%nodefaultctor StepBasic_GroupRelationship;
class StepBasic_GroupRelationship : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_GroupRelationship();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasDescription, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_Group &aRelatingGroup, const Handle_StepBasic_Group &aRelatedGroup);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		Standard_Boolean HasDescription() const;
		%feature("autodoc", "1");
		Handle_StepBasic_Group RelatingGroup() const;
		%feature("autodoc", "1");
		void SetRelatingGroup(const Handle_StepBasic_Group &RelatingGroup);
		%feature("autodoc", "1");
		Handle_StepBasic_Group RelatedGroup() const;
		%feature("autodoc", "1");
		void SetRelatedGroup(const Handle_StepBasic_Group &RelatedGroup);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_GroupRelationship {
	Handle_StepBasic_GroupRelationship GetHandle() {
	return *(Handle_StepBasic_GroupRelationship*) &$self;
	}
};
%extend StepBasic_GroupRelationship {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_GroupRelationship {
	~StepBasic_GroupRelationship() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_GroupRelationship\n");}
	}
};

%nodefaultctor StepBasic_CertificationAssignment;
class StepBasic_CertificationAssignment : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_CertificationAssignment();
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Certification &aAssignedCertification);
		%feature("autodoc", "1");
		Handle_StepBasic_Certification AssignedCertification() const;
		%feature("autodoc", "1");
		void SetAssignedCertification(const Handle_StepBasic_Certification &AssignedCertification);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_CertificationAssignment {
	Handle_StepBasic_CertificationAssignment GetHandle() {
	return *(Handle_StepBasic_CertificationAssignment*) &$self;
	}
};
%extend StepBasic_CertificationAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_CertificationAssignment {
	~StepBasic_CertificationAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_CertificationAssignment\n");}
	}
};

%nodefaultctor StepBasic_ProductContext;
class StepBasic_ProductContext : public StepBasic_ApplicationContextElement {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductContext();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName, const Handle_StepBasic_ApplicationContext &aFrameOfReference);
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName, const Handle_StepBasic_ApplicationContext &aFrameOfReference, const Handle_TCollection_HAsciiString &aDisciplineType);
		%feature("autodoc", "1");
		void SetDisciplineType(const Handle_TCollection_HAsciiString &aDisciplineType);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString DisciplineType() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ProductContext {
	Handle_StepBasic_ProductContext GetHandle() {
	return *(Handle_StepBasic_ProductContext*) &$self;
	}
};
%extend StepBasic_ProductContext {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ProductContext {
	~StepBasic_ProductContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductContext\n");}
	}
};

%nodefaultctor StepBasic_MechanicalContext;
class StepBasic_MechanicalContext : public StepBasic_ProductContext {
	public:
		%feature("autodoc", "1");
		StepBasic_MechanicalContext();

};
%extend StepBasic_MechanicalContext {
	Handle_StepBasic_MechanicalContext GetHandle() {
	return *(Handle_StepBasic_MechanicalContext*) &$self;
	}
};
%extend StepBasic_MechanicalContext {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_MechanicalContext {
	~StepBasic_MechanicalContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_MechanicalContext\n");}
	}
};

%nodefaultctor StepBasic_MassUnit;
class StepBasic_MassUnit : public StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_MassUnit();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_MassUnit {
	Handle_StepBasic_MassUnit GetHandle() {
	return *(Handle_StepBasic_MassUnit*) &$self;
	}
};
%extend StepBasic_MassUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_MassUnit {
	~StepBasic_MassUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_MassUnit\n");}
	}
};

%nodefaultctor StepBasic_SecurityClassificationAssignment;
class StepBasic_SecurityClassificationAssignment : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_SecurityClassificationAssignment();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_SecurityClassification &aAssignedSecurityClassification);
		%feature("autodoc", "1");
		void SetAssignedSecurityClassification(const Handle_StepBasic_SecurityClassification &aAssignedSecurityClassification);
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassification AssignedSecurityClassification() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SecurityClassificationAssignment {
	Handle_StepBasic_SecurityClassificationAssignment GetHandle() {
	return *(Handle_StepBasic_SecurityClassificationAssignment*) &$self;
	}
};
%extend StepBasic_SecurityClassificationAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SecurityClassificationAssignment {
	~StepBasic_SecurityClassificationAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SecurityClassificationAssignment\n");}
	}
};

%nodefaultctor StepBasic_SiUnitAndSolidAngleUnit;
class StepBasic_SiUnitAndSolidAngleUnit : public StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_SiUnitAndSolidAngleUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);
		%feature("autodoc", "1");
		void SetSolidAngleUnit(const Handle_StepBasic_SolidAngleUnit &aSolidAngleUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_SolidAngleUnit SolidAngleUnit() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SiUnitAndSolidAngleUnit {
	Handle_StepBasic_SiUnitAndSolidAngleUnit GetHandle() {
	return *(Handle_StepBasic_SiUnitAndSolidAngleUnit*) &$self;
	}
};
%extend StepBasic_SiUnitAndSolidAngleUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SiUnitAndSolidAngleUnit {
	~StepBasic_SiUnitAndSolidAngleUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SiUnitAndSolidAngleUnit\n");}
	}
};

%nodefaultctor StepBasic_ThermodynamicTemperatureUnit;
class StepBasic_ThermodynamicTemperatureUnit : public StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_ThermodynamicTemperatureUnit();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ThermodynamicTemperatureUnit {
	Handle_StepBasic_ThermodynamicTemperatureUnit GetHandle() {
	return *(Handle_StepBasic_ThermodynamicTemperatureUnit*) &$self;
	}
};
%extend StepBasic_ThermodynamicTemperatureUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ThermodynamicTemperatureUnit {
	~StepBasic_ThermodynamicTemperatureUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ThermodynamicTemperatureUnit\n");}
	}
};

%nodefaultctor StepBasic_Document;
class StepBasic_Document : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_Document();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aId, const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasDescription, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_DocumentType &aKind);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Id() const;
		%feature("autodoc", "1");
		void SetId(const Handle_TCollection_HAsciiString &Id);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		Standard_Boolean HasDescription() const;
		%feature("autodoc", "1");
		Handle_StepBasic_DocumentType Kind() const;
		%feature("autodoc", "1");
		void SetKind(const Handle_StepBasic_DocumentType &Kind);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_Document {
	Handle_StepBasic_Document GetHandle() {
	return *(Handle_StepBasic_Document*) &$self;
	}
};
%extend StepBasic_Document {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_Document {
	~StepBasic_Document() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Document\n");}
	}
};

%nodefaultctor StepBasic_SolidAngleMeasureWithUnit;
class StepBasic_SolidAngleMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_SolidAngleMeasureWithUnit();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SolidAngleMeasureWithUnit {
	Handle_StepBasic_SolidAngleMeasureWithUnit GetHandle() {
	return *(Handle_StepBasic_SolidAngleMeasureWithUnit*) &$self;
	}
};
%extend StepBasic_SolidAngleMeasureWithUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SolidAngleMeasureWithUnit {
	~StepBasic_SolidAngleMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SolidAngleMeasureWithUnit\n");}
	}
};

%nodefaultctor StepBasic_OrganizationalAddress;
class StepBasic_OrganizationalAddress : public StepBasic_Address {
	public:
		%feature("autodoc", "1");
		StepBasic_OrganizationalAddress();
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Boolean hasAinternalLocation, const Handle_TCollection_HAsciiString &aInternalLocation, const Standard_Boolean hasAstreetNumber, const Handle_TCollection_HAsciiString &aStreetNumber, const Standard_Boolean hasAstreet, const Handle_TCollection_HAsciiString &aStreet, const Standard_Boolean hasApostalBox, const Handle_TCollection_HAsciiString &aPostalBox, const Standard_Boolean hasAtown, const Handle_TCollection_HAsciiString &aTown, const Standard_Boolean hasAregion, const Handle_TCollection_HAsciiString &aRegion, const Standard_Boolean hasApostalCode, const Handle_TCollection_HAsciiString &aPostalCode, const Standard_Boolean hasAcountry, const Handle_TCollection_HAsciiString &aCountry, const Standard_Boolean hasAfacsimileNumber, const Handle_TCollection_HAsciiString &aFacsimileNumber, const Standard_Boolean hasAtelephoneNumber, const Handle_TCollection_HAsciiString &aTelephoneNumber, const Standard_Boolean hasAelectronicMailAddress, const Handle_TCollection_HAsciiString &aElectronicMailAddress, const Standard_Boolean hasAtelexNumber, const Handle_TCollection_HAsciiString &aTelexNumber);
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Boolean hasAinternalLocation, const Handle_TCollection_HAsciiString &aInternalLocation, const Standard_Boolean hasAstreetNumber, const Handle_TCollection_HAsciiString &aStreetNumber, const Standard_Boolean hasAstreet, const Handle_TCollection_HAsciiString &aStreet, const Standard_Boolean hasApostalBox, const Handle_TCollection_HAsciiString &aPostalBox, const Standard_Boolean hasAtown, const Handle_TCollection_HAsciiString &aTown, const Standard_Boolean hasAregion, const Handle_TCollection_HAsciiString &aRegion, const Standard_Boolean hasApostalCode, const Handle_TCollection_HAsciiString &aPostalCode, const Standard_Boolean hasAcountry, const Handle_TCollection_HAsciiString &aCountry, const Standard_Boolean hasAfacsimileNumber, const Handle_TCollection_HAsciiString &aFacsimileNumber, const Standard_Boolean hasAtelephoneNumber, const Handle_TCollection_HAsciiString &aTelephoneNumber, const Standard_Boolean hasAelectronicMailAddress, const Handle_TCollection_HAsciiString &aElectronicMailAddress, const Standard_Boolean hasAtelexNumber, const Handle_TCollection_HAsciiString &aTelexNumber, const Handle_StepBasic_HArray1OfOrganization &aOrganizations, const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		void SetOrganizations(const Handle_StepBasic_HArray1OfOrganization &aOrganizations);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfOrganization Organizations() const;
		%feature("autodoc", "1");
		Handle_StepBasic_Organization OrganizationsValue(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Integer NbOrganizations() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_OrganizationalAddress {
	Handle_StepBasic_OrganizationalAddress GetHandle() {
	return *(Handle_StepBasic_OrganizationalAddress*) &$self;
	}
};
%extend StepBasic_OrganizationalAddress {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_OrganizationalAddress {
	~StepBasic_OrganizationalAddress() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_OrganizationalAddress\n");}
	}
};

%nodefaultctor StepBasic_DocumentFile;
class StepBasic_DocumentFile : public StepBasic_Document {
	public:
		%feature("autodoc", "1");
		StepBasic_DocumentFile();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aDocument_Id, const Handle_TCollection_HAsciiString &aDocument_Name, const Standard_Boolean hasDocument_Description, const Handle_TCollection_HAsciiString &aDocument_Description, const Handle_StepBasic_DocumentType &aDocument_Kind, const Handle_TCollection_HAsciiString &aCharacterizedObject_Name, const Standard_Boolean hasCharacterizedObject_Description, const Handle_TCollection_HAsciiString &aCharacterizedObject_Description);
		%feature("autodoc", "1");
		Handle_StepBasic_CharacterizedObject CharacterizedObject() const;
		%feature("autodoc", "1");
		void SetCharacterizedObject(const Handle_StepBasic_CharacterizedObject &CharacterizedObject);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DocumentFile {
	Handle_StepBasic_DocumentFile GetHandle() {
	return *(Handle_StepBasic_DocumentFile*) &$self;
	}
};
%extend StepBasic_DocumentFile {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DocumentFile {
	~StepBasic_DocumentFile() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DocumentFile\n");}
	}
};

%nodefaultctor StepBasic_SiUnitAndRatioUnit;
class StepBasic_SiUnitAndRatioUnit : public StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_SiUnitAndRatioUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);
		%feature("autodoc", "1");
		void SetRatioUnit(const Handle_StepBasic_RatioUnit &aRatioUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_RatioUnit RatioUnit() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SiUnitAndRatioUnit {
	Handle_StepBasic_SiUnitAndRatioUnit GetHandle() {
	return *(Handle_StepBasic_SiUnitAndRatioUnit*) &$self;
	}
};
%extend StepBasic_SiUnitAndRatioUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SiUnitAndRatioUnit {
	~StepBasic_SiUnitAndRatioUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SiUnitAndRatioUnit\n");}
	}
};

%nodefaultctor StepBasic_ApprovalPersonOrganization;
class StepBasic_ApprovalPersonOrganization : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ApprovalPersonOrganization();
		%feature("autodoc", "1");
		virtual		void Init(const StepBasic_PersonOrganizationSelect &aPersonOrganization, const Handle_StepBasic_Approval &aAuthorizedApproval, const Handle_StepBasic_ApprovalRole &aRole);
		%feature("autodoc", "1");
		void SetPersonOrganization(const StepBasic_PersonOrganizationSelect &aPersonOrganization);
		%feature("autodoc", "1");
		StepBasic_PersonOrganizationSelect PersonOrganization() const;
		%feature("autodoc", "1");
		void SetAuthorizedApproval(const Handle_StepBasic_Approval &aAuthorizedApproval);
		%feature("autodoc", "1");
		Handle_StepBasic_Approval AuthorizedApproval() const;
		%feature("autodoc", "1");
		void SetRole(const Handle_StepBasic_ApprovalRole &aRole);
		%feature("autodoc", "1");
		Handle_StepBasic_ApprovalRole Role() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ApprovalPersonOrganization {
	Handle_StepBasic_ApprovalPersonOrganization GetHandle() {
	return *(Handle_StepBasic_ApprovalPersonOrganization*) &$self;
	}
};
%extend StepBasic_ApprovalPersonOrganization {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ApprovalPersonOrganization {
	~StepBasic_ApprovalPersonOrganization() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ApprovalPersonOrganization\n");}
	}
};

%nodefaultctor StepBasic_ProductDefinitionFormationRelationship;
class StepBasic_ProductDefinitionFormationRelationship : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductDefinitionFormationRelationship();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aId, const Handle_TCollection_HAsciiString &aName, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_ProductDefinitionFormation &aRelatingProductDefinitionFormation, const Handle_StepBasic_ProductDefinitionFormation &aRelatedProductDefinitionFormation);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Id() const;
		%feature("autodoc", "1");
		void SetId(const Handle_TCollection_HAsciiString &Id);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormation RelatingProductDefinitionFormation() const;
		%feature("autodoc", "1");
		void SetRelatingProductDefinitionFormation(const Handle_StepBasic_ProductDefinitionFormation &RelatingProductDefinitionFormation);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormation RelatedProductDefinitionFormation() const;
		%feature("autodoc", "1");
		void SetRelatedProductDefinitionFormation(const Handle_StepBasic_ProductDefinitionFormation &RelatedProductDefinitionFormation);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ProductDefinitionFormationRelationship {
	Handle_StepBasic_ProductDefinitionFormationRelationship GetHandle() {
	return *(Handle_StepBasic_ProductDefinitionFormationRelationship*) &$self;
	}
};
%extend StepBasic_ProductDefinitionFormationRelationship {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ProductDefinitionFormationRelationship {
	~StepBasic_ProductDefinitionFormationRelationship() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductDefinitionFormationRelationship\n");}
	}
};

%nodefaultctor StepBasic_DocumentRepresentationType;
class StepBasic_DocumentRepresentationType : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_DocumentRepresentationType();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aName, const Handle_StepBasic_Document &aRepresentedDocument);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_StepBasic_Document RepresentedDocument() const;
		%feature("autodoc", "1");
		void SetRepresentedDocument(const Handle_StepBasic_Document &RepresentedDocument);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DocumentRepresentationType {
	Handle_StepBasic_DocumentRepresentationType GetHandle() {
	return *(Handle_StepBasic_DocumentRepresentationType*) &$self;
	}
};
%extend StepBasic_DocumentRepresentationType {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DocumentRepresentationType {
	~StepBasic_DocumentRepresentationType() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DocumentRepresentationType\n");}
	}
};

%nodefaultctor StepBasic_ConversionBasedUnitAndPlaneAngleUnit;
class StepBasic_ConversionBasedUnitAndPlaneAngleUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_ConversionBasedUnitAndPlaneAngleUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions, const Handle_TCollection_HAsciiString &aName, const Handle_StepBasic_MeasureWithUnit &aConversionFactor);
		%feature("autodoc", "1");
		void SetPlaneAngleUnit(const Handle_StepBasic_PlaneAngleUnit &aPlaneAngleUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_PlaneAngleUnit PlaneAngleUnit() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ConversionBasedUnitAndPlaneAngleUnit {
	Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit GetHandle() {
	return *(Handle_StepBasic_ConversionBasedUnitAndPlaneAngleUnit*) &$self;
	}
};
%extend StepBasic_ConversionBasedUnitAndPlaneAngleUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ConversionBasedUnitAndPlaneAngleUnit {
	~StepBasic_ConversionBasedUnitAndPlaneAngleUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ConversionBasedUnitAndPlaneAngleUnit\n");}
	}
};

%nodefaultctor StepBasic_SiUnitAndAreaUnit;
class StepBasic_SiUnitAndAreaUnit : public StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_SiUnitAndAreaUnit();
		%feature("autodoc", "1");
		void SetAreaUnit(const Handle_StepBasic_AreaUnit &anAreaUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_AreaUnit AreaUnit() const;
		%feature("autodoc", "1");
		virtual		void SetDimensions(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		Handle_StepBasic_DimensionalExponents Dimensions() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SiUnitAndAreaUnit {
	Handle_StepBasic_SiUnitAndAreaUnit GetHandle() {
	return *(Handle_StepBasic_SiUnitAndAreaUnit*) &$self;
	}
};
%extend StepBasic_SiUnitAndAreaUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SiUnitAndAreaUnit {
	~StepBasic_SiUnitAndAreaUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SiUnitAndAreaUnit\n");}
	}
};

%nodefaultctor StepBasic_ObjectRole;
class StepBasic_ObjectRole : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ObjectRole();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasDescription, const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		Standard_Boolean HasDescription() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ObjectRole {
	Handle_StepBasic_ObjectRole GetHandle() {
	return *(Handle_StepBasic_ObjectRole*) &$self;
	}
};
%extend StepBasic_ObjectRole {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ObjectRole {
	~StepBasic_ObjectRole() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ObjectRole\n");}
	}
};

%nodefaultctor StepBasic_Array1OfProductContext;
class StepBasic_Array1OfProductContext {
	public:
		%feature("autodoc", "1");
		StepBasic_Array1OfProductContext(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_Array1OfProductContext(const Handle_StepBasic_ProductContext &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_ProductContext &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const StepBasic_Array1OfProductContext & Assign(const StepBasic_Array1OfProductContext &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_ProductContext &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_ProductContext & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_StepBasic_ProductContext & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_ProductContext & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductContext & operator()(const Standard_Integer Index);

};
%extend StepBasic_Array1OfProductContext {
	~StepBasic_Array1OfProductContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Array1OfProductContext\n");}
	}
};

%nodefaultctor StepBasic_PersonAndOrganizationRole;
class StepBasic_PersonAndOrganizationRole : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_PersonAndOrganizationRole();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_PersonAndOrganizationRole {
	Handle_StepBasic_PersonAndOrganizationRole GetHandle() {
	return *(Handle_StepBasic_PersonAndOrganizationRole*) &$self;
	}
};
%extend StepBasic_PersonAndOrganizationRole {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_PersonAndOrganizationRole {
	~StepBasic_PersonAndOrganizationRole() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_PersonAndOrganizationRole\n");}
	}
};

%nodefaultctor StepBasic_Action;
class StepBasic_Action : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_Action();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasDescription, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_ActionMethod &aChosenMethod);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		Standard_Boolean HasDescription() const;
		%feature("autodoc", "1");
		Handle_StepBasic_ActionMethod ChosenMethod() const;
		%feature("autodoc", "1");
		void SetChosenMethod(const Handle_StepBasic_ActionMethod &ChosenMethod);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_Action {
	Handle_StepBasic_Action GetHandle() {
	return *(Handle_StepBasic_Action*) &$self;
	}
};
%extend StepBasic_Action {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_Action {
	~StepBasic_Action() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Action\n");}
	}
};

%nodefaultctor StepBasic_DocumentReference;
class StepBasic_DocumentReference : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_DocumentReference();
		%feature("autodoc", "1");
		void Init0(const Handle_StepBasic_Document &aAssignedDocument, const Handle_TCollection_HAsciiString &aSource);
		%feature("autodoc", "1");
		Handle_StepBasic_Document AssignedDocument() const;
		%feature("autodoc", "1");
		void SetAssignedDocument(const Handle_StepBasic_Document &aAssignedDocument);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Source() const;
		%feature("autodoc", "1");
		void SetSource(const Handle_TCollection_HAsciiString &aSource);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DocumentReference {
	Handle_StepBasic_DocumentReference GetHandle() {
	return *(Handle_StepBasic_DocumentReference*) &$self;
	}
};
%extend StepBasic_DocumentReference {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DocumentReference {
	~StepBasic_DocumentReference() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DocumentReference\n");}
	}
};

%nodefaultctor StepBasic_SolidAngleUnit;
class StepBasic_SolidAngleUnit : public StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_SolidAngleUnit();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SolidAngleUnit {
	Handle_StepBasic_SolidAngleUnit GetHandle() {
	return *(Handle_StepBasic_SolidAngleUnit*) &$self;
	}
};
%extend StepBasic_SolidAngleUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SolidAngleUnit {
	~StepBasic_SolidAngleUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SolidAngleUnit\n");}
	}
};

%nodefaultctor StepBasic_DigitalDocument;
class StepBasic_DigitalDocument : public StepBasic_Document {
	public:
		%feature("autodoc", "1");
		StepBasic_DigitalDocument();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DigitalDocument {
	Handle_StepBasic_DigitalDocument GetHandle() {
	return *(Handle_StepBasic_DigitalDocument*) &$self;
	}
};
%extend StepBasic_DigitalDocument {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DigitalDocument {
	~StepBasic_DigitalDocument() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DigitalDocument\n");}
	}
};

%nodefaultctor StepBasic_PersonOrganizationSelect;
class StepBasic_PersonOrganizationSelect : public StepData_SelectType {
	public:
		%feature("autodoc", "1");
		StepBasic_PersonOrganizationSelect();
		%feature("autodoc", "1");
		virtual		Standard_Integer CaseNum(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Handle_StepBasic_Person Person() const;
		%feature("autodoc", "1");
		Handle_StepBasic_Organization Organization() const;
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganization PersonAndOrganization() const;

};
%extend StepBasic_PersonOrganizationSelect {
	~StepBasic_PersonOrganizationSelect() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_PersonOrganizationSelect\n");}
	}
};

%nodefaultctor StepBasic_ProductDefinitionEffectivity;
class StepBasic_ProductDefinitionEffectivity : public StepBasic_Effectivity {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductDefinitionEffectivity();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aId, const Handle_StepBasic_ProductDefinitionRelationship &aUsage);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionRelationship Usage() const;
		%feature("autodoc", "1");
		void SetUsage(const Handle_StepBasic_ProductDefinitionRelationship &aUsage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ProductDefinitionEffectivity {
	Handle_StepBasic_ProductDefinitionEffectivity GetHandle() {
	return *(Handle_StepBasic_ProductDefinitionEffectivity*) &$self;
	}
};
%extend StepBasic_ProductDefinitionEffectivity {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ProductDefinitionEffectivity {
	~StepBasic_ProductDefinitionEffectivity() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductDefinitionEffectivity\n");}
	}
};

%nodefaultctor StepBasic_Certification;
class StepBasic_Certification : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_Certification();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aName, const Handle_TCollection_HAsciiString &aPurpose, const Handle_StepBasic_CertificationType &aKind);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Purpose() const;
		%feature("autodoc", "1");
		void SetPurpose(const Handle_TCollection_HAsciiString &Purpose);
		%feature("autodoc", "1");
		Handle_StepBasic_CertificationType Kind() const;
		%feature("autodoc", "1");
		void SetKind(const Handle_StepBasic_CertificationType &Kind);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_Certification {
	Handle_StepBasic_Certification GetHandle() {
	return *(Handle_StepBasic_Certification*) &$self;
	}
};
%extend StepBasic_Certification {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_Certification {
	~StepBasic_Certification() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Certification\n");}
	}
};

%nodefaultctor StepBasic_GroupAssignment;
class StepBasic_GroupAssignment : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_GroupAssignment();
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Group &aAssignedGroup);
		%feature("autodoc", "1");
		Handle_StepBasic_Group AssignedGroup() const;
		%feature("autodoc", "1");
		void SetAssignedGroup(const Handle_StepBasic_Group &AssignedGroup);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_GroupAssignment {
	Handle_StepBasic_GroupAssignment GetHandle() {
	return *(Handle_StepBasic_GroupAssignment*) &$self;
	}
};
%extend StepBasic_GroupAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_GroupAssignment {
	~StepBasic_GroupAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_GroupAssignment\n");}
	}
};

%nodefaultctor StepBasic_ProductDefinitionFormation;
class StepBasic_ProductDefinitionFormation : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductDefinitionFormation();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aId, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_Product &aOfProduct);
		%feature("autodoc", "1");
		void SetId(const Handle_TCollection_HAsciiString &aId);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Id() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetOfProduct(const Handle_StepBasic_Product &aOfProduct);
		%feature("autodoc", "1");
		Handle_StepBasic_Product OfProduct() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ProductDefinitionFormation {
	Handle_StepBasic_ProductDefinitionFormation GetHandle() {
	return *(Handle_StepBasic_ProductDefinitionFormation*) &$self;
	}
};
%extend StepBasic_ProductDefinitionFormation {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ProductDefinitionFormation {
	~StepBasic_ProductDefinitionFormation() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductDefinitionFormation\n");}
	}
};

%nodefaultctor StepBasic_ProductDefinitionFormationWithSpecifiedSource;
class StepBasic_ProductDefinitionFormationWithSpecifiedSource : public StepBasic_ProductDefinitionFormation {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductDefinitionFormationWithSpecifiedSource();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aId, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_Product &aOfProduct, const StepBasic_Source aMakeOrBuy);
		%feature("autodoc", "1");
		void SetMakeOrBuy(const StepBasic_Source aMakeOrBuy);
		%feature("autodoc", "1");
		StepBasic_Source MakeOrBuy() const;

};
%extend StepBasic_ProductDefinitionFormationWithSpecifiedSource {
	Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource GetHandle() {
	return *(Handle_StepBasic_ProductDefinitionFormationWithSpecifiedSource*) &$self;
	}
};
%extend StepBasic_ProductDefinitionFormationWithSpecifiedSource {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ProductDefinitionFormationWithSpecifiedSource {
	~StepBasic_ProductDefinitionFormationWithSpecifiedSource() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductDefinitionFormationWithSpecifiedSource\n");}
	}
};

%nodefaultctor StepBasic_ConversionBasedUnitAndRatioUnit;
class StepBasic_ConversionBasedUnitAndRatioUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_ConversionBasedUnitAndRatioUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions, const Handle_TCollection_HAsciiString &aName, const Handle_StepBasic_MeasureWithUnit &aConversionFactor);
		%feature("autodoc", "1");
		void SetRatioUnit(const Handle_StepBasic_RatioUnit &aRatioUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_RatioUnit RatioUnit() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ConversionBasedUnitAndRatioUnit {
	Handle_StepBasic_ConversionBasedUnitAndRatioUnit GetHandle() {
	return *(Handle_StepBasic_ConversionBasedUnitAndRatioUnit*) &$self;
	}
};
%extend StepBasic_ConversionBasedUnitAndRatioUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ConversionBasedUnitAndRatioUnit {
	~StepBasic_ConversionBasedUnitAndRatioUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ConversionBasedUnitAndRatioUnit\n");}
	}
};

%nodefaultctor StepBasic_HArray1OfNamedUnit;
class StepBasic_HArray1OfNamedUnit : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_HArray1OfNamedUnit(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_HArray1OfNamedUnit(const Standard_Integer Low, const Standard_Integer Up, const Handle_StepBasic_NamedUnit &V);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_NamedUnit &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_NamedUnit &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_NamedUnit & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_NamedUnit & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const StepBasic_Array1OfNamedUnit & Array1() const;
		%feature("autodoc", "1");
		StepBasic_Array1OfNamedUnit & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_HArray1OfNamedUnit {
	Handle_StepBasic_HArray1OfNamedUnit GetHandle() {
	return *(Handle_StepBasic_HArray1OfNamedUnit*) &$self;
	}
};
%extend StepBasic_HArray1OfNamedUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_HArray1OfNamedUnit {
	~StepBasic_HArray1OfNamedUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_HArray1OfNamedUnit\n");}
	}
};

%nodefaultctor StepBasic_ConversionBasedUnitAndLengthUnit;
class StepBasic_ConversionBasedUnitAndLengthUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_ConversionBasedUnitAndLengthUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions, const Handle_TCollection_HAsciiString &aName, const Handle_StepBasic_MeasureWithUnit &aConversionFactor);
		%feature("autodoc", "1");
		void SetLengthUnit(const Handle_StepBasic_LengthUnit &aLengthUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_LengthUnit LengthUnit() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ConversionBasedUnitAndLengthUnit {
	Handle_StepBasic_ConversionBasedUnitAndLengthUnit GetHandle() {
	return *(Handle_StepBasic_ConversionBasedUnitAndLengthUnit*) &$self;
	}
};
%extend StepBasic_ConversionBasedUnitAndLengthUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ConversionBasedUnitAndLengthUnit {
	~StepBasic_ConversionBasedUnitAndLengthUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ConversionBasedUnitAndLengthUnit\n");}
	}
};

%nodefaultctor StepBasic_OrdinalDate;
class StepBasic_OrdinalDate : public StepBasic_Date {
	public:
		%feature("autodoc", "1");
		StepBasic_OrdinalDate();
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Integer aYearComponent);
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Integer aYearComponent, const Standard_Integer aDayComponent);
		%feature("autodoc", "1");
		void SetDayComponent(const Standard_Integer aDayComponent);
		%feature("autodoc", "1");
		Standard_Integer DayComponent() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_OrdinalDate {
	Handle_StepBasic_OrdinalDate GetHandle() {
	return *(Handle_StepBasic_OrdinalDate*) &$self;
	}
};
%extend StepBasic_OrdinalDate {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_OrdinalDate {
	~StepBasic_OrdinalDate() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_OrdinalDate\n");}
	}
};

%nodefaultctor StepBasic_OrganizationAssignment;
class StepBasic_OrganizationAssignment : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_OrganizationAssignment();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_Organization &aAssignedOrganization, const Handle_StepBasic_OrganizationRole &aRole);
		%feature("autodoc", "1");
		void SetAssignedOrganization(const Handle_StepBasic_Organization &aAssignedOrganization);
		%feature("autodoc", "1");
		Handle_StepBasic_Organization AssignedOrganization() const;
		%feature("autodoc", "1");
		void SetRole(const Handle_StepBasic_OrganizationRole &aRole);
		%feature("autodoc", "1");
		Handle_StepBasic_OrganizationRole Role() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_OrganizationAssignment {
	Handle_StepBasic_OrganizationAssignment GetHandle() {
	return *(Handle_StepBasic_OrganizationAssignment*) &$self;
	}
};
%extend StepBasic_OrganizationAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_OrganizationAssignment {
	~StepBasic_OrganizationAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_OrganizationAssignment\n");}
	}
};

%nodefaultctor StepBasic_HArray1OfDocument;
class StepBasic_HArray1OfDocument : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_HArray1OfDocument(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_HArray1OfDocument(const Standard_Integer Low, const Standard_Integer Up, const Handle_StepBasic_Document &V);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Document &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_Document &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_Document & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_Document & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const StepBasic_Array1OfDocument & Array1() const;
		%feature("autodoc", "1");
		StepBasic_Array1OfDocument & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_HArray1OfDocument {
	Handle_StepBasic_HArray1OfDocument GetHandle() {
	return *(Handle_StepBasic_HArray1OfDocument*) &$self;
	}
};
%extend StepBasic_HArray1OfDocument {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_HArray1OfDocument {
	~StepBasic_HArray1OfDocument() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_HArray1OfDocument\n");}
	}
};

%nodefaultctor StepBasic_ExternalSource;
class StepBasic_ExternalSource : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ExternalSource();
		%feature("autodoc", "1");
		void Init(const StepBasic_SourceItem &aSourceId);
		%feature("autodoc", "1");
		StepBasic_SourceItem SourceId() const;
		%feature("autodoc", "1");
		void SetSourceId(const StepBasic_SourceItem &SourceId);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ExternalSource {
	Handle_StepBasic_ExternalSource GetHandle() {
	return *(Handle_StepBasic_ExternalSource*) &$self;
	}
};
%extend StepBasic_ExternalSource {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ExternalSource {
	~StepBasic_ExternalSource() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ExternalSource\n");}
	}
};

%nodefaultctor StepBasic_DateTimeRole;
class StepBasic_DateTimeRole : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_DateTimeRole();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DateTimeRole {
	Handle_StepBasic_DateTimeRole GetHandle() {
	return *(Handle_StepBasic_DateTimeRole*) &$self;
	}
};
%extend StepBasic_DateTimeRole {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DateTimeRole {
	~StepBasic_DateTimeRole() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DateTimeRole\n");}
	}
};

%nodefaultctor StepBasic_SiUnitAndTimeUnit;
class StepBasic_SiUnitAndTimeUnit : public StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_SiUnitAndTimeUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);
		%feature("autodoc", "1");
		void SetTimeUnit(const Handle_StepBasic_TimeUnit &aTimeUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_TimeUnit TimeUnit() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SiUnitAndTimeUnit {
	Handle_StepBasic_SiUnitAndTimeUnit GetHandle() {
	return *(Handle_StepBasic_SiUnitAndTimeUnit*) &$self;
	}
};
%extend StepBasic_SiUnitAndTimeUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SiUnitAndTimeUnit {
	~StepBasic_SiUnitAndTimeUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SiUnitAndTimeUnit\n");}
	}
};

%nodefaultctor StepBasic_ExternallyDefinedItem;
class StepBasic_ExternallyDefinedItem : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ExternallyDefinedItem();
		%feature("autodoc", "1");
		void Init(const StepBasic_SourceItem &aItemId, const Handle_StepBasic_ExternalSource &aSource);
		%feature("autodoc", "1");
		StepBasic_SourceItem ItemId() const;
		%feature("autodoc", "1");
		void SetItemId(const StepBasic_SourceItem &ItemId);
		%feature("autodoc", "1");
		Handle_StepBasic_ExternalSource Source() const;
		%feature("autodoc", "1");
		void SetSource(const Handle_StepBasic_ExternalSource &Source);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ExternallyDefinedItem {
	Handle_StepBasic_ExternallyDefinedItem GetHandle() {
	return *(Handle_StepBasic_ExternallyDefinedItem*) &$self;
	}
};
%extend StepBasic_ExternallyDefinedItem {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ExternallyDefinedItem {
	~StepBasic_ExternallyDefinedItem() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ExternallyDefinedItem\n");}
	}
};

%nodefaultctor StepBasic_SecurityClassification;
class StepBasic_SecurityClassification : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_SecurityClassification();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName, const Handle_TCollection_HAsciiString &aPurpose, const Handle_StepBasic_SecurityClassificationLevel &aSecurityLevel);
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetPurpose(const Handle_TCollection_HAsciiString &aPurpose);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Purpose() const;
		%feature("autodoc", "1");
		void SetSecurityLevel(const Handle_StepBasic_SecurityClassificationLevel &aSecurityLevel);
		%feature("autodoc", "1");
		Handle_StepBasic_SecurityClassificationLevel SecurityLevel() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SecurityClassification {
	Handle_StepBasic_SecurityClassification GetHandle() {
	return *(Handle_StepBasic_SecurityClassification*) &$self;
	}
};
%extend StepBasic_SecurityClassification {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SecurityClassification {
	~StepBasic_SecurityClassification() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SecurityClassification\n");}
	}
};

%nodefaultctor StepBasic_DimensionalExponents;
class StepBasic_DimensionalExponents : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_DimensionalExponents();
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Real aLengthExponent, const Standard_Real aMassExponent, const Standard_Real aTimeExponent, const Standard_Real aElectricCurrentExponent, const Standard_Real aThermodynamicTemperatureExponent, const Standard_Real aAmountOfSubstanceExponent, const Standard_Real aLuminousIntensityExponent);
		%feature("autodoc", "1");
		void SetLengthExponent(const Standard_Real aLengthExponent);
		%feature("autodoc", "1");
		Standard_Real LengthExponent() const;
		%feature("autodoc", "1");
		void SetMassExponent(const Standard_Real aMassExponent);
		%feature("autodoc", "1");
		Standard_Real MassExponent() const;
		%feature("autodoc", "1");
		void SetTimeExponent(const Standard_Real aTimeExponent);
		%feature("autodoc", "1");
		Standard_Real TimeExponent() const;
		%feature("autodoc", "1");
		void SetElectricCurrentExponent(const Standard_Real aElectricCurrentExponent);
		%feature("autodoc", "1");
		Standard_Real ElectricCurrentExponent() const;
		%feature("autodoc", "1");
		void SetThermodynamicTemperatureExponent(const Standard_Real aThermodynamicTemperatureExponent);
		%feature("autodoc", "1");
		Standard_Real ThermodynamicTemperatureExponent() const;
		%feature("autodoc", "1");
		void SetAmountOfSubstanceExponent(const Standard_Real aAmountOfSubstanceExponent);
		%feature("autodoc", "1");
		Standard_Real AmountOfSubstanceExponent() const;
		%feature("autodoc", "1");
		void SetLuminousIntensityExponent(const Standard_Real aLuminousIntensityExponent);
		%feature("autodoc", "1");
		Standard_Real LuminousIntensityExponent() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DimensionalExponents {
	Handle_StepBasic_DimensionalExponents GetHandle() {
	return *(Handle_StepBasic_DimensionalExponents*) &$self;
	}
};
%extend StepBasic_DimensionalExponents {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DimensionalExponents {
	~StepBasic_DimensionalExponents() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DimensionalExponents\n");}
	}
};

%nodefaultctor StepBasic_ContractAssignment;
class StepBasic_ContractAssignment : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ContractAssignment();
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Contract &aAssignedContract);
		%feature("autodoc", "1");
		Handle_StepBasic_Contract AssignedContract() const;
		%feature("autodoc", "1");
		void SetAssignedContract(const Handle_StepBasic_Contract &AssignedContract);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ContractAssignment {
	Handle_StepBasic_ContractAssignment GetHandle() {
	return *(Handle_StepBasic_ContractAssignment*) &$self;
	}
};
%extend StepBasic_ContractAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ContractAssignment {
	~StepBasic_ContractAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ContractAssignment\n");}
	}
};

%nodefaultctor StepBasic_ApprovalDateTime;
class StepBasic_ApprovalDateTime : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ApprovalDateTime();
		%feature("autodoc", "1");
		void Init(const StepBasic_DateTimeSelect &aDateTime, const Handle_StepBasic_Approval &aDatedApproval);
		%feature("autodoc", "1");
		void SetDateTime(const StepBasic_DateTimeSelect &aDateTime);
		%feature("autodoc", "1");
		StepBasic_DateTimeSelect DateTime() const;
		%feature("autodoc", "1");
		void SetDatedApproval(const Handle_StepBasic_Approval &aDatedApproval);
		%feature("autodoc", "1");
		Handle_StepBasic_Approval DatedApproval() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ApprovalDateTime {
	Handle_StepBasic_ApprovalDateTime GetHandle() {
	return *(Handle_StepBasic_ApprovalDateTime*) &$self;
	}
};
%extend StepBasic_ApprovalDateTime {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ApprovalDateTime {
	~StepBasic_ApprovalDateTime() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ApprovalDateTime\n");}
	}
};

%nodefaultctor StepBasic_LengthMeasureWithUnit;
class StepBasic_LengthMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_LengthMeasureWithUnit();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_LengthMeasureWithUnit {
	Handle_StepBasic_LengthMeasureWithUnit GetHandle() {
	return *(Handle_StepBasic_LengthMeasureWithUnit*) &$self;
	}
};
%extend StepBasic_LengthMeasureWithUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_LengthMeasureWithUnit {
	~StepBasic_LengthMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_LengthMeasureWithUnit\n");}
	}
};

%nodefaultctor StepBasic_ProductDefinition;
class StepBasic_ProductDefinition : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductDefinition();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aId, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_ProductDefinitionFormation &aFormation, const Handle_StepBasic_ProductDefinitionContext &aFrameOfReference);
		%feature("autodoc", "1");
		void SetId(const Handle_TCollection_HAsciiString &aId);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Id() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetFormation(const Handle_StepBasic_ProductDefinitionFormation &aFormation);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormation Formation() const;
		%feature("autodoc", "1");
		void SetFrameOfReference(const Handle_StepBasic_ProductDefinitionContext &aFrameOfReference);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionContext FrameOfReference() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ProductDefinition {
	Handle_StepBasic_ProductDefinition GetHandle() {
	return *(Handle_StepBasic_ProductDefinition*) &$self;
	}
};
%extend StepBasic_ProductDefinition {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ProductDefinition {
	~StepBasic_ProductDefinition() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductDefinition\n");}
	}
};

%nodefaultctor StepBasic_ProductDefinitionWithAssociatedDocuments;
class StepBasic_ProductDefinitionWithAssociatedDocuments : public StepBasic_ProductDefinition {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductDefinitionWithAssociatedDocuments();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aId, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_ProductDefinitionFormation &aFormation, const Handle_StepBasic_ProductDefinitionContext &aFrame, const Handle_StepBasic_HArray1OfDocument &aDocIds);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfDocument DocIds() const;
		%feature("autodoc", "1");
		void SetDocIds(const Handle_StepBasic_HArray1OfDocument &DocIds);
		%feature("autodoc", "1");
		Standard_Integer NbDocIds() const;
		%feature("autodoc", "1");
		Handle_StepBasic_Document DocIdsValue(const Standard_Integer num) const;
		%feature("autodoc", "1");
		void SetDocIdsValue(const Standard_Integer num, const Handle_StepBasic_Document &adoc);

};
%extend StepBasic_ProductDefinitionWithAssociatedDocuments {
	Handle_StepBasic_ProductDefinitionWithAssociatedDocuments GetHandle() {
	return *(Handle_StepBasic_ProductDefinitionWithAssociatedDocuments*) &$self;
	}
};
%extend StepBasic_ProductDefinitionWithAssociatedDocuments {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ProductDefinitionWithAssociatedDocuments {
	~StepBasic_ProductDefinitionWithAssociatedDocuments() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductDefinitionWithAssociatedDocuments\n");}
	}
};

%nodefaultctor StepBasic_EffectivityAssignment;
class StepBasic_EffectivityAssignment : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_EffectivityAssignment();
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Effectivity &aAssignedEffectivity);
		%feature("autodoc", "1");
		Handle_StepBasic_Effectivity AssignedEffectivity() const;
		%feature("autodoc", "1");
		void SetAssignedEffectivity(const Handle_StepBasic_Effectivity &AssignedEffectivity);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_EffectivityAssignment {
	Handle_StepBasic_EffectivityAssignment GetHandle() {
	return *(Handle_StepBasic_EffectivityAssignment*) &$self;
	}
};
%extend StepBasic_EffectivityAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_EffectivityAssignment {
	~StepBasic_EffectivityAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_EffectivityAssignment\n");}
	}
};

%nodefaultctor StepBasic_PersonAndOrganization;
class StepBasic_PersonAndOrganization : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_PersonAndOrganization();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_Person &aThePerson, const Handle_StepBasic_Organization &aTheOrganization);
		%feature("autodoc", "1");
		void SetThePerson(const Handle_StepBasic_Person &aThePerson);
		%feature("autodoc", "1");
		Handle_StepBasic_Person ThePerson() const;
		%feature("autodoc", "1");
		void SetTheOrganization(const Handle_StepBasic_Organization &aTheOrganization);
		%feature("autodoc", "1");
		Handle_StepBasic_Organization TheOrganization() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_PersonAndOrganization {
	Handle_StepBasic_PersonAndOrganization GetHandle() {
	return *(Handle_StepBasic_PersonAndOrganization*) &$self;
	}
};
%extend StepBasic_PersonAndOrganization {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_PersonAndOrganization {
	~StepBasic_PersonAndOrganization() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_PersonAndOrganization\n");}
	}
};

%nodefaultctor StepBasic_Array1OfDocument;
class StepBasic_Array1OfDocument {
	public:
		%feature("autodoc", "1");
		StepBasic_Array1OfDocument(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_Array1OfDocument(const Handle_StepBasic_Document &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Document &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const StepBasic_Array1OfDocument & Assign(const StepBasic_Array1OfDocument &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_Document &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_Document & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_StepBasic_Document & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_Document & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_StepBasic_Document & operator()(const Standard_Integer Index);

};
%extend StepBasic_Array1OfDocument {
	~StepBasic_Array1OfDocument() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Array1OfDocument\n");}
	}
};

%nodefaultctor StepBasic_HArray1OfProductDefinition;
class StepBasic_HArray1OfProductDefinition : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_HArray1OfProductDefinition(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_HArray1OfProductDefinition(const Standard_Integer Low, const Standard_Integer Up, const Handle_StepBasic_ProductDefinition &V);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_ProductDefinition &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_ProductDefinition &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_ProductDefinition & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinition & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const StepBasic_Array1OfProductDefinition & Array1() const;
		%feature("autodoc", "1");
		StepBasic_Array1OfProductDefinition & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_HArray1OfProductDefinition {
	Handle_StepBasic_HArray1OfProductDefinition GetHandle() {
	return *(Handle_StepBasic_HArray1OfProductDefinition*) &$self;
	}
};
%extend StepBasic_HArray1OfProductDefinition {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_HArray1OfProductDefinition {
	~StepBasic_HArray1OfProductDefinition() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_HArray1OfProductDefinition\n");}
	}
};

%nodefaultctor StepBasic_SiUnitAndVolumeUnit;
class StepBasic_SiUnitAndVolumeUnit : public StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_SiUnitAndVolumeUnit();
		%feature("autodoc", "1");
		void SetVolumeUnit(const Handle_StepBasic_VolumeUnit &aVolumeUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_VolumeUnit VolumeUnit() const;
		%feature("autodoc", "1");
		virtual		void SetDimensions(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		Handle_StepBasic_DimensionalExponents Dimensions() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SiUnitAndVolumeUnit {
	Handle_StepBasic_SiUnitAndVolumeUnit GetHandle() {
	return *(Handle_StepBasic_SiUnitAndVolumeUnit*) &$self;
	}
};
%extend StepBasic_SiUnitAndVolumeUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SiUnitAndVolumeUnit {
	~StepBasic_SiUnitAndVolumeUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SiUnitAndVolumeUnit\n");}
	}
};

%nodefaultctor StepBasic_ContractType;
class StepBasic_ContractType : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ContractType();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ContractType {
	Handle_StepBasic_ContractType GetHandle() {
	return *(Handle_StepBasic_ContractType*) &$self;
	}
};
%extend StepBasic_ContractType {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ContractType {
	~StepBasic_ContractType() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ContractType\n");}
	}
};

%nodefaultctor StepBasic_ActionMethod;
class StepBasic_ActionMethod : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ActionMethod();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasDescription, const Handle_TCollection_HAsciiString &aDescription, const Handle_TCollection_HAsciiString &aConsequence, const Handle_TCollection_HAsciiString &aPurpose);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		Standard_Boolean HasDescription() const;
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Consequence() const;
		%feature("autodoc", "1");
		void SetConsequence(const Handle_TCollection_HAsciiString &Consequence);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Purpose() const;
		%feature("autodoc", "1");
		void SetPurpose(const Handle_TCollection_HAsciiString &Purpose);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ActionMethod {
	Handle_StepBasic_ActionMethod GetHandle() {
	return *(Handle_StepBasic_ActionMethod*) &$self;
	}
};
%extend StepBasic_ActionMethod {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ActionMethod {
	~StepBasic_ActionMethod() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ActionMethod\n");}
	}
};

%nodefaultctor StepBasic_ConversionBasedUnitAndSolidAngleUnit;
class StepBasic_ConversionBasedUnitAndSolidAngleUnit : public StepBasic_ConversionBasedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_ConversionBasedUnitAndSolidAngleUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions, const Handle_TCollection_HAsciiString &aName, const Handle_StepBasic_MeasureWithUnit &aConversionFactor);
		%feature("autodoc", "1");
		void SetSolidAngleUnit(const Handle_StepBasic_SolidAngleUnit &aSolidAngleUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_SolidAngleUnit SolidAngleUnit() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ConversionBasedUnitAndSolidAngleUnit {
	Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit GetHandle() {
	return *(Handle_StepBasic_ConversionBasedUnitAndSolidAngleUnit*) &$self;
	}
};
%extend StepBasic_ConversionBasedUnitAndSolidAngleUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ConversionBasedUnitAndSolidAngleUnit {
	~StepBasic_ConversionBasedUnitAndSolidAngleUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ConversionBasedUnitAndSolidAngleUnit\n");}
	}
};

%nodefaultctor StepBasic_VolumeUnit;
class StepBasic_VolumeUnit : public StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_VolumeUnit();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_VolumeUnit {
	Handle_StepBasic_VolumeUnit GetHandle() {
	return *(Handle_StepBasic_VolumeUnit*) &$self;
	}
};
%extend StepBasic_VolumeUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_VolumeUnit {
	~StepBasic_VolumeUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_VolumeUnit\n");}
	}
};

%nodefaultctor StepBasic_ProductCategoryRelationship;
class StepBasic_ProductCategoryRelationship : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductCategoryRelationship();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasDescription, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_ProductCategory &aCategory, const Handle_StepBasic_ProductCategory &aSubCategory);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		Standard_Boolean HasDescription() const;
		%feature("autodoc", "1");
		Handle_StepBasic_ProductCategory Category() const;
		%feature("autodoc", "1");
		void SetCategory(const Handle_StepBasic_ProductCategory &Category);
		%feature("autodoc", "1");
		Handle_StepBasic_ProductCategory SubCategory() const;
		%feature("autodoc", "1");
		void SetSubCategory(const Handle_StepBasic_ProductCategory &SubCategory);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ProductCategoryRelationship {
	Handle_StepBasic_ProductCategoryRelationship GetHandle() {
	return *(Handle_StepBasic_ProductCategoryRelationship*) &$self;
	}
};
%extend StepBasic_ProductCategoryRelationship {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ProductCategoryRelationship {
	~StepBasic_ProductCategoryRelationship() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductCategoryRelationship\n");}
	}
};

%nodefaultctor StepBasic_IdentificationAssignment;
class StepBasic_IdentificationAssignment : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_IdentificationAssignment();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aAssignedId, const Handle_StepBasic_IdentificationRole &aRole);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString AssignedId() const;
		%feature("autodoc", "1");
		void SetAssignedId(const Handle_TCollection_HAsciiString &AssignedId);
		%feature("autodoc", "1");
		Handle_StepBasic_IdentificationRole Role() const;
		%feature("autodoc", "1");
		void SetRole(const Handle_StepBasic_IdentificationRole &Role);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_IdentificationAssignment {
	Handle_StepBasic_IdentificationAssignment GetHandle() {
	return *(Handle_StepBasic_IdentificationAssignment*) &$self;
	}
};
%extend StepBasic_IdentificationAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_IdentificationAssignment {
	~StepBasic_IdentificationAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_IdentificationAssignment\n");}
	}
};

%nodefaultctor StepBasic_ApprovalRelationship;
class StepBasic_ApprovalRelationship : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ApprovalRelationship();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aName, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_Approval &aRelatingApproval, const Handle_StepBasic_Approval &aRelatedApproval);
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetRelatingApproval(const Handle_StepBasic_Approval &aRelatingApproval);
		%feature("autodoc", "1");
		Handle_StepBasic_Approval RelatingApproval() const;
		%feature("autodoc", "1");
		void SetRelatedApproval(const Handle_StepBasic_Approval &aRelatedApproval);
		%feature("autodoc", "1");
		Handle_StepBasic_Approval RelatedApproval() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ApprovalRelationship {
	Handle_StepBasic_ApprovalRelationship GetHandle() {
	return *(Handle_StepBasic_ApprovalRelationship*) &$self;
	}
};
%extend StepBasic_ApprovalRelationship {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ApprovalRelationship {
	~StepBasic_ApprovalRelationship() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ApprovalRelationship\n");}
	}
};

%nodefaultctor StepBasic_RoleAssociation;
class StepBasic_RoleAssociation : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_RoleAssociation();
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_ObjectRole &aRole, const StepBasic_RoleSelect &aItemWithRole);
		%feature("autodoc", "1");
		Handle_StepBasic_ObjectRole Role() const;
		%feature("autodoc", "1");
		void SetRole(const Handle_StepBasic_ObjectRole &Role);
		%feature("autodoc", "1");
		StepBasic_RoleSelect ItemWithRole() const;
		%feature("autodoc", "1");
		void SetItemWithRole(const StepBasic_RoleSelect &ItemWithRole);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_RoleAssociation {
	Handle_StepBasic_RoleAssociation GetHandle() {
	return *(Handle_StepBasic_RoleAssociation*) &$self;
	}
};
%extend StepBasic_RoleAssociation {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_RoleAssociation {
	~StepBasic_RoleAssociation() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_RoleAssociation\n");}
	}
};

%nodefaultctor StepBasic_ApprovalAssignment;
class StepBasic_ApprovalAssignment : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ApprovalAssignment();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_Approval &aAssignedApproval);
		%feature("autodoc", "1");
		void SetAssignedApproval(const Handle_StepBasic_Approval &aAssignedApproval);
		%feature("autodoc", "1");
		Handle_StepBasic_Approval AssignedApproval() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ApprovalAssignment {
	Handle_StepBasic_ApprovalAssignment GetHandle() {
	return *(Handle_StepBasic_ApprovalAssignment*) &$self;
	}
};
%extend StepBasic_ApprovalAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ApprovalAssignment {
	~StepBasic_ApprovalAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ApprovalAssignment\n");}
	}
};

%nodefaultctor StepBasic_PersonAndOrganizationAssignment;
class StepBasic_PersonAndOrganizationAssignment : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_PersonAndOrganizationAssignment();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_PersonAndOrganization &aAssignedPersonAndOrganization, const Handle_StepBasic_PersonAndOrganizationRole &aRole);
		%feature("autodoc", "1");
		void SetAssignedPersonAndOrganization(const Handle_StepBasic_PersonAndOrganization &aAssignedPersonAndOrganization);
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganization AssignedPersonAndOrganization() const;
		%feature("autodoc", "1");
		void SetRole(const Handle_StepBasic_PersonAndOrganizationRole &aRole);
		%feature("autodoc", "1");
		Handle_StepBasic_PersonAndOrganizationRole Role() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_PersonAndOrganizationAssignment {
	Handle_StepBasic_PersonAndOrganizationAssignment GetHandle() {
	return *(Handle_StepBasic_PersonAndOrganizationAssignment*) &$self;
	}
};
%extend StepBasic_PersonAndOrganizationAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_PersonAndOrganizationAssignment {
	~StepBasic_PersonAndOrganizationAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_PersonAndOrganizationAssignment\n");}
	}
};

%nodefaultctor StepBasic_DateAssignment;
class StepBasic_DateAssignment : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_DateAssignment();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_Date &aAssignedDate, const Handle_StepBasic_DateRole &aRole);
		%feature("autodoc", "1");
		void SetAssignedDate(const Handle_StepBasic_Date &aAssignedDate);
		%feature("autodoc", "1");
		Handle_StepBasic_Date AssignedDate() const;
		%feature("autodoc", "1");
		void SetRole(const Handle_StepBasic_DateRole &aRole);
		%feature("autodoc", "1");
		Handle_StepBasic_DateRole Role() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DateAssignment {
	Handle_StepBasic_DateAssignment GetHandle() {
	return *(Handle_StepBasic_DateAssignment*) &$self;
	}
};
%extend StepBasic_DateAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DateAssignment {
	~StepBasic_DateAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DateAssignment\n");}
	}
};

%nodefaultctor StepBasic_WeekOfYearAndDayDate;
class StepBasic_WeekOfYearAndDayDate : public StepBasic_Date {
	public:
		%feature("autodoc", "1");
		StepBasic_WeekOfYearAndDayDate();
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Integer aYearComponent);
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Integer aYearComponent, const Standard_Integer aWeekComponent, const Standard_Boolean hasAdayComponent, const Standard_Integer aDayComponent);
		%feature("autodoc", "1");
		void SetWeekComponent(const Standard_Integer aWeekComponent);
		%feature("autodoc", "1");
		Standard_Integer WeekComponent() const;
		%feature("autodoc", "1");
		void SetDayComponent(const Standard_Integer aDayComponent);
		%feature("autodoc", "1");
		void UnSetDayComponent();
		%feature("autodoc", "1");
		Standard_Integer DayComponent() const;
		%feature("autodoc", "1");
		Standard_Boolean HasDayComponent() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_WeekOfYearAndDayDate {
	Handle_StepBasic_WeekOfYearAndDayDate GetHandle() {
	return *(Handle_StepBasic_WeekOfYearAndDayDate*) &$self;
	}
};
%extend StepBasic_WeekOfYearAndDayDate {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_WeekOfYearAndDayDate {
	~StepBasic_WeekOfYearAndDayDate() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_WeekOfYearAndDayDate\n");}
	}
};

%nodefaultctor StepBasic_DerivedUnit;
class StepBasic_DerivedUnit : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_DerivedUnit();
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_HArray1OfDerivedUnitElement &elements);
		%feature("autodoc", "1");
		void SetElements(const Handle_StepBasic_HArray1OfDerivedUnitElement &elements);
		%feature("autodoc", "1");
		Handle_StepBasic_HArray1OfDerivedUnitElement Elements() const;
		%feature("autodoc", "1");
		Standard_Integer NbElements() const;
		%feature("autodoc", "1");
		Handle_StepBasic_DerivedUnitElement ElementsValue(const Standard_Integer num) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DerivedUnit {
	Handle_StepBasic_DerivedUnit GetHandle() {
	return *(Handle_StepBasic_DerivedUnit*) &$self;
	}
};
%extend StepBasic_DerivedUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DerivedUnit {
	~StepBasic_DerivedUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DerivedUnit\n");}
	}
};

%nodefaultctor StepBasic_ExternalIdentificationAssignment;
class StepBasic_ExternalIdentificationAssignment : public StepBasic_IdentificationAssignment {
	public:
		%feature("autodoc", "1");
		StepBasic_ExternalIdentificationAssignment();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aIdentificationAssignment_AssignedId, const Handle_StepBasic_IdentificationRole &aIdentificationAssignment_Role, const Handle_StepBasic_ExternalSource &aSource);
		%feature("autodoc", "1");
		Handle_StepBasic_ExternalSource Source() const;
		%feature("autodoc", "1");
		void SetSource(const Handle_StepBasic_ExternalSource &Source);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ExternalIdentificationAssignment {
	Handle_StepBasic_ExternalIdentificationAssignment GetHandle() {
	return *(Handle_StepBasic_ExternalIdentificationAssignment*) &$self;
	}
};
%extend StepBasic_ExternalIdentificationAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ExternalIdentificationAssignment {
	~StepBasic_ExternalIdentificationAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ExternalIdentificationAssignment\n");}
	}
};

%nodefaultctor StepBasic_DocumentProductAssociation;
class StepBasic_DocumentProductAssociation : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_DocumentProductAssociation();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasDescription, const Handle_TCollection_HAsciiString &aDescription, const Handle_StepBasic_Document &aRelatingDocument, const StepBasic_ProductOrFormationOrDefinition &aRelatedProduct);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		Standard_Boolean HasDescription() const;
		%feature("autodoc", "1");
		Handle_StepBasic_Document RelatingDocument() const;
		%feature("autodoc", "1");
		void SetRelatingDocument(const Handle_StepBasic_Document &RelatingDocument);
		%feature("autodoc", "1");
		StepBasic_ProductOrFormationOrDefinition RelatedProduct() const;
		%feature("autodoc", "1");
		void SetRelatedProduct(const StepBasic_ProductOrFormationOrDefinition &RelatedProduct);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_DocumentProductAssociation {
	Handle_StepBasic_DocumentProductAssociation GetHandle() {
	return *(Handle_StepBasic_DocumentProductAssociation*) &$self;
	}
};
%extend StepBasic_DocumentProductAssociation {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DocumentProductAssociation {
	~StepBasic_DocumentProductAssociation() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DocumentProductAssociation\n");}
	}
};

%nodefaultctor StepBasic_DocumentProductEquivalence;
class StepBasic_DocumentProductEquivalence : public StepBasic_DocumentProductAssociation {
	public:
		%feature("autodoc", "1");
		StepBasic_DocumentProductEquivalence();

};
%extend StepBasic_DocumentProductEquivalence {
	Handle_StepBasic_DocumentProductEquivalence GetHandle() {
	return *(Handle_StepBasic_DocumentProductEquivalence*) &$self;
	}
};
%extend StepBasic_DocumentProductEquivalence {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_DocumentProductEquivalence {
	~StepBasic_DocumentProductEquivalence() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_DocumentProductEquivalence\n");}
	}
};

%nodefaultctor StepBasic_Array1OfNamedUnit;
class StepBasic_Array1OfNamedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_Array1OfNamedUnit(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_Array1OfNamedUnit(const Handle_StepBasic_NamedUnit &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_NamedUnit &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const StepBasic_Array1OfNamedUnit & Assign(const StepBasic_Array1OfNamedUnit &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_NamedUnit &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_NamedUnit & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_StepBasic_NamedUnit & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_NamedUnit & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_StepBasic_NamedUnit & operator()(const Standard_Integer Index);

};
%extend StepBasic_Array1OfNamedUnit {
	~StepBasic_Array1OfNamedUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Array1OfNamedUnit\n");}
	}
};

%nodefaultctor StepBasic_SourceItem;
class StepBasic_SourceItem : public StepData_SelectType {
	public:
		%feature("autodoc", "1");
		StepBasic_SourceItem();
		%feature("autodoc", "1");
		virtual		Standard_Integer CaseNum(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		virtual		Handle_StepData_SelectMember NewMember() const;
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Identifier() const;

};
%extend StepBasic_SourceItem {
	~StepBasic_SourceItem() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SourceItem\n");}
	}
};

%nodefaultctor StepBasic_Array1OfUncertaintyMeasureWithUnit;
class StepBasic_Array1OfUncertaintyMeasureWithUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_Array1OfUncertaintyMeasureWithUnit(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_Array1OfUncertaintyMeasureWithUnit(const Handle_StepBasic_UncertaintyMeasureWithUnit &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_UncertaintyMeasureWithUnit &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const StepBasic_Array1OfUncertaintyMeasureWithUnit & Assign(const StepBasic_Array1OfUncertaintyMeasureWithUnit &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_UncertaintyMeasureWithUnit &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_UncertaintyMeasureWithUnit & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_StepBasic_UncertaintyMeasureWithUnit & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_UncertaintyMeasureWithUnit & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_StepBasic_UncertaintyMeasureWithUnit & operator()(const Standard_Integer Index);

};
%extend StepBasic_Array1OfUncertaintyMeasureWithUnit {
	~StepBasic_Array1OfUncertaintyMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Array1OfUncertaintyMeasureWithUnit\n");}
	}
};

%nodefaultctor StepBasic_HArray1OfProduct;
class StepBasic_HArray1OfProduct : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_HArray1OfProduct(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_HArray1OfProduct(const Standard_Integer Low, const Standard_Integer Up, const Handle_StepBasic_Product &V);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Product &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_Product &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_Product & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_Product & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const StepBasic_Array1OfProduct & Array1() const;
		%feature("autodoc", "1");
		StepBasic_Array1OfProduct & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_HArray1OfProduct {
	Handle_StepBasic_HArray1OfProduct GetHandle() {
	return *(Handle_StepBasic_HArray1OfProduct*) &$self;
	}
};
%extend StepBasic_HArray1OfProduct {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_HArray1OfProduct {
	~StepBasic_HArray1OfProduct() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_HArray1OfProduct\n");}
	}
};

%nodefaultctor StepBasic_HArray1OfUncertaintyMeasureWithUnit;
class StepBasic_HArray1OfUncertaintyMeasureWithUnit : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_HArray1OfUncertaintyMeasureWithUnit(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_HArray1OfUncertaintyMeasureWithUnit(const Standard_Integer Low, const Standard_Integer Up, const Handle_StepBasic_UncertaintyMeasureWithUnit &V);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_UncertaintyMeasureWithUnit &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_UncertaintyMeasureWithUnit &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_UncertaintyMeasureWithUnit & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_UncertaintyMeasureWithUnit & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const StepBasic_Array1OfUncertaintyMeasureWithUnit & Array1() const;
		%feature("autodoc", "1");
		StepBasic_Array1OfUncertaintyMeasureWithUnit & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_HArray1OfUncertaintyMeasureWithUnit {
	Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit GetHandle() {
	return *(Handle_StepBasic_HArray1OfUncertaintyMeasureWithUnit*) &$self;
	}
};
%extend StepBasic_HArray1OfUncertaintyMeasureWithUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_HArray1OfUncertaintyMeasureWithUnit {
	~StepBasic_HArray1OfUncertaintyMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_HArray1OfUncertaintyMeasureWithUnit\n");}
	}
};

%nodefaultctor StepBasic_HArray1OfPerson;
class StepBasic_HArray1OfPerson : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_HArray1OfPerson(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_HArray1OfPerson(const Standard_Integer Low, const Standard_Integer Up, const Handle_StepBasic_Person &V);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Person &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_Person &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_Person & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_Person & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const StepBasic_Array1OfPerson & Array1() const;
		%feature("autodoc", "1");
		StepBasic_Array1OfPerson & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_HArray1OfPerson {
	Handle_StepBasic_HArray1OfPerson GetHandle() {
	return *(Handle_StepBasic_HArray1OfPerson*) &$self;
	}
};
%extend StepBasic_HArray1OfPerson {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_HArray1OfPerson {
	~StepBasic_HArray1OfPerson() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_HArray1OfPerson\n");}
	}
};

%nodefaultctor StepBasic_PhysicallyModeledProductDefinition;
class StepBasic_PhysicallyModeledProductDefinition : public StepBasic_ProductDefinition {
	public:
		%feature("autodoc", "1");
		StepBasic_PhysicallyModeledProductDefinition();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_PhysicallyModeledProductDefinition {
	Handle_StepBasic_PhysicallyModeledProductDefinition GetHandle() {
	return *(Handle_StepBasic_PhysicallyModeledProductDefinition*) &$self;
	}
};
%extend StepBasic_PhysicallyModeledProductDefinition {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_PhysicallyModeledProductDefinition {
	~StepBasic_PhysicallyModeledProductDefinition() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_PhysicallyModeledProductDefinition\n");}
	}
};

%nodefaultctor StepBasic_Person;
class StepBasic_Person : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_Person();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_TCollection_HAsciiString &aId, const Standard_Boolean hasAlastName, const Handle_TCollection_HAsciiString &aLastName, const Standard_Boolean hasAfirstName, const Handle_TCollection_HAsciiString &aFirstName, const Standard_Boolean hasAmiddleNames, const Handle_Interface_HArray1OfHAsciiString &aMiddleNames, const Standard_Boolean hasAprefixTitles, const Handle_Interface_HArray1OfHAsciiString &aPrefixTitles, const Standard_Boolean hasAsuffixTitles, const Handle_Interface_HArray1OfHAsciiString &aSuffixTitles);
		%feature("autodoc", "1");
		void SetId(const Handle_TCollection_HAsciiString &aId);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Id() const;
		%feature("autodoc", "1");
		void SetLastName(const Handle_TCollection_HAsciiString &aLastName);
		%feature("autodoc", "1");
		void UnSetLastName();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString LastName() const;
		%feature("autodoc", "1");
		Standard_Boolean HasLastName() const;
		%feature("autodoc", "1");
		void SetFirstName(const Handle_TCollection_HAsciiString &aFirstName);
		%feature("autodoc", "1");
		void UnSetFirstName();
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString FirstName() const;
		%feature("autodoc", "1");
		Standard_Boolean HasFirstName() const;
		%feature("autodoc", "1");
		void SetMiddleNames(const Handle_Interface_HArray1OfHAsciiString &aMiddleNames);
		%feature("autodoc", "1");
		void UnSetMiddleNames();
		%feature("autodoc", "1");
		Handle_Interface_HArray1OfHAsciiString MiddleNames() const;
		%feature("autodoc", "1");
		Standard_Boolean HasMiddleNames() const;
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString MiddleNamesValue(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Integer NbMiddleNames() const;
		%feature("autodoc", "1");
		void SetPrefixTitles(const Handle_Interface_HArray1OfHAsciiString &aPrefixTitles);
		%feature("autodoc", "1");
		void UnSetPrefixTitles();
		%feature("autodoc", "1");
		Handle_Interface_HArray1OfHAsciiString PrefixTitles() const;
		%feature("autodoc", "1");
		Standard_Boolean HasPrefixTitles() const;
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString PrefixTitlesValue(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Integer NbPrefixTitles() const;
		%feature("autodoc", "1");
		void SetSuffixTitles(const Handle_Interface_HArray1OfHAsciiString &aSuffixTitles);
		%feature("autodoc", "1");
		void UnSetSuffixTitles();
		%feature("autodoc", "1");
		Handle_Interface_HArray1OfHAsciiString SuffixTitles() const;
		%feature("autodoc", "1");
		Standard_Boolean HasSuffixTitles() const;
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString SuffixTitlesValue(const Standard_Integer num) const;
		%feature("autodoc", "1");
		Standard_Integer NbSuffixTitles() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_Person {
	Handle_StepBasic_Person GetHandle() {
	return *(Handle_StepBasic_Person*) &$self;
	}
};
%extend StepBasic_Person {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_Person {
	~StepBasic_Person() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Person\n");}
	}
};

%nodefaultctor StepBasic_UncertaintyMeasureWithUnit;
class StepBasic_UncertaintyMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_UncertaintyMeasureWithUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_MeasureValueMember &aValueComponent, const StepBasic_Unit &aUnitComponent);
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_MeasureValueMember &aValueComponent, const StepBasic_Unit &aUnitComponent, const Handle_TCollection_HAsciiString &aName, const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &aName);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_UncertaintyMeasureWithUnit {
	Handle_StepBasic_UncertaintyMeasureWithUnit GetHandle() {
	return *(Handle_StepBasic_UncertaintyMeasureWithUnit*) &$self;
	}
};
%extend StepBasic_UncertaintyMeasureWithUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_UncertaintyMeasureWithUnit {
	~StepBasic_UncertaintyMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_UncertaintyMeasureWithUnit\n");}
	}
};

%nodefaultctor StepBasic_ProductConceptContext;
class StepBasic_ProductConceptContext : public StepBasic_ApplicationContextElement {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductConceptContext();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aApplicationContextElement_Name, const Handle_StepBasic_ApplicationContext &aApplicationContextElement_FrameOfReference, const Handle_TCollection_HAsciiString &aMarketSegmentType);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString MarketSegmentType() const;
		%feature("autodoc", "1");
		void SetMarketSegmentType(const Handle_TCollection_HAsciiString &MarketSegmentType);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ProductConceptContext {
	Handle_StepBasic_ProductConceptContext GetHandle() {
	return *(Handle_StepBasic_ProductConceptContext*) &$self;
	}
};
%extend StepBasic_ProductConceptContext {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ProductConceptContext {
	~StepBasic_ProductConceptContext() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductConceptContext\n");}
	}
};

%nodefaultctor StepBasic_ProductOrFormationOrDefinition;
class StepBasic_ProductOrFormationOrDefinition : public StepData_SelectType {
	public:
		%feature("autodoc", "1");
		StepBasic_ProductOrFormationOrDefinition();
		%feature("autodoc", "1");
		virtual		Standard_Integer CaseNum(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		Handle_StepBasic_Product Product() const;
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinitionFormation ProductDefinitionFormation() const;
		%feature("autodoc", "1");
		Handle_StepBasic_ProductDefinition ProductDefinition() const;

};
%extend StepBasic_ProductOrFormationOrDefinition {
	~StepBasic_ProductOrFormationOrDefinition() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ProductOrFormationOrDefinition\n");}
	}
};

%nodefaultctor StepBasic_RatioMeasureWithUnit;
class StepBasic_RatioMeasureWithUnit : public StepBasic_MeasureWithUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_RatioMeasureWithUnit();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_RatioMeasureWithUnit {
	Handle_StepBasic_RatioMeasureWithUnit GetHandle() {
	return *(Handle_StepBasic_RatioMeasureWithUnit*) &$self;
	}
};
%extend StepBasic_RatioMeasureWithUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_RatioMeasureWithUnit {
	~StepBasic_RatioMeasureWithUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_RatioMeasureWithUnit\n");}
	}
};

%nodefaultctor StepBasic_SizeSelect;
class StepBasic_SizeSelect : public StepData_SelectType {
	public:
		%feature("autodoc", "1");
		StepBasic_SizeSelect();
		%feature("autodoc", "1");
		virtual		Standard_Integer CaseNum(const Handle_Standard_Transient &ent) const;
		%feature("autodoc", "1");
		virtual		Handle_StepData_SelectMember NewMember() const;
		%feature("autodoc", "1");
		virtual		Standard_Integer CaseMem(const Handle_StepData_SelectMember &ent) const;
		%feature("autodoc", "1");
		void SetRealValue(const Standard_Real aReal);
		%feature("autodoc", "1");
		Standard_Real RealValue() const;

};
%extend StepBasic_SizeSelect {
	~StepBasic_SizeSelect() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SizeSelect\n");}
	}
};

%nodefaultctor StepBasic_HArray1OfApproval;
class StepBasic_HArray1OfApproval : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_HArray1OfApproval(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_HArray1OfApproval(const Standard_Integer Low, const Standard_Integer Up, const Handle_StepBasic_Approval &V);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Approval &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_Approval &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_Approval & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_Approval & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const StepBasic_Array1OfApproval & Array1() const;
		%feature("autodoc", "1");
		StepBasic_Array1OfApproval & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_HArray1OfApproval {
	Handle_StepBasic_HArray1OfApproval GetHandle() {
	return *(Handle_StepBasic_HArray1OfApproval*) &$self;
	}
};
%extend StepBasic_HArray1OfApproval {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_HArray1OfApproval {
	~StepBasic_HArray1OfApproval() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_HArray1OfApproval\n");}
	}
};

%nodefaultctor StepBasic_TimeUnit;
class StepBasic_TimeUnit : public StepBasic_NamedUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_TimeUnit();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_TimeUnit {
	Handle_StepBasic_TimeUnit GetHandle() {
	return *(Handle_StepBasic_TimeUnit*) &$self;
	}
};
%extend StepBasic_TimeUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_TimeUnit {
	~StepBasic_TimeUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_TimeUnit\n");}
	}
};

%nodefaultctor StepBasic_HArray1OfDerivedUnitElement;
class StepBasic_HArray1OfDerivedUnitElement : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_HArray1OfDerivedUnitElement(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_HArray1OfDerivedUnitElement(const Standard_Integer Low, const Standard_Integer Up, const Handle_StepBasic_DerivedUnitElement &V);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_DerivedUnitElement &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_DerivedUnitElement &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_DerivedUnitElement & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_DerivedUnitElement & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const StepBasic_Array1OfDerivedUnitElement & Array1() const;
		%feature("autodoc", "1");
		StepBasic_Array1OfDerivedUnitElement & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_HArray1OfDerivedUnitElement {
	Handle_StepBasic_HArray1OfDerivedUnitElement GetHandle() {
	return *(Handle_StepBasic_HArray1OfDerivedUnitElement*) &$self;
	}
};
%extend StepBasic_HArray1OfDerivedUnitElement {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_HArray1OfDerivedUnitElement {
	~StepBasic_HArray1OfDerivedUnitElement() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_HArray1OfDerivedUnitElement\n");}
	}
};

%nodefaultctor StepBasic_ActionRequestAssignment;
class StepBasic_ActionRequestAssignment : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_ActionRequestAssignment();
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_VersionedActionRequest &aAssignedActionRequest);
		%feature("autodoc", "1");
		Handle_StepBasic_VersionedActionRequest AssignedActionRequest() const;
		%feature("autodoc", "1");
		void SetAssignedActionRequest(const Handle_StepBasic_VersionedActionRequest &AssignedActionRequest);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_ActionRequestAssignment {
	Handle_StepBasic_ActionRequestAssignment GetHandle() {
	return *(Handle_StepBasic_ActionRequestAssignment*) &$self;
	}
};
%extend StepBasic_ActionRequestAssignment {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_ActionRequestAssignment {
	~StepBasic_ActionRequestAssignment() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_ActionRequestAssignment\n");}
	}
};

%nodefaultctor StepBasic_Array1OfDerivedUnitElement;
class StepBasic_Array1OfDerivedUnitElement {
	public:
		%feature("autodoc", "1");
		StepBasic_Array1OfDerivedUnitElement(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_Array1OfDerivedUnitElement(const Handle_StepBasic_DerivedUnitElement &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_DerivedUnitElement &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const StepBasic_Array1OfDerivedUnitElement & Assign(const StepBasic_Array1OfDerivedUnitElement &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_DerivedUnitElement &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_DerivedUnitElement & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_StepBasic_DerivedUnitElement & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_DerivedUnitElement & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_StepBasic_DerivedUnitElement & operator()(const Standard_Integer Index);

};
%extend StepBasic_Array1OfDerivedUnitElement {
	~StepBasic_Array1OfDerivedUnitElement() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Array1OfDerivedUnitElement\n");}
	}
};

%nodefaultctor StepBasic_Contract;
class StepBasic_Contract : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_Contract();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aName, const Handle_TCollection_HAsciiString &aPurpose, const Handle_StepBasic_ContractType &aKind);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Purpose() const;
		%feature("autodoc", "1");
		void SetPurpose(const Handle_TCollection_HAsciiString &Purpose);
		%feature("autodoc", "1");
		Handle_StepBasic_ContractType Kind() const;
		%feature("autodoc", "1");
		void SetKind(const Handle_StepBasic_ContractType &Kind);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_Contract {
	Handle_StepBasic_Contract GetHandle() {
	return *(Handle_StepBasic_Contract*) &$self;
	}
};
%extend StepBasic_Contract {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_Contract {
	~StepBasic_Contract() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Contract\n");}
	}
};

%nodefaultctor StepBasic_Array1OfPerson;
class StepBasic_Array1OfPerson {
	public:
		%feature("autodoc", "1");
		StepBasic_Array1OfPerson(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		StepBasic_Array1OfPerson(const Handle_StepBasic_Person &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_StepBasic_Person &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const StepBasic_Array1OfPerson & Assign(const StepBasic_Array1OfPerson &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_StepBasic_Person &Value);
		%feature("autodoc", "1");
		const Handle_StepBasic_Person & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_StepBasic_Person & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_StepBasic_Person & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_StepBasic_Person & operator()(const Standard_Integer Index);

};
%extend StepBasic_Array1OfPerson {
	~StepBasic_Array1OfPerson() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_Array1OfPerson\n");}
	}
};

%nodefaultctor StepBasic_CharacterizedObject;
class StepBasic_CharacterizedObject : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		StepBasic_CharacterizedObject();
		%feature("autodoc", "1");
		void Init(const Handle_TCollection_HAsciiString &aName, const Standard_Boolean hasDescription, const Handle_TCollection_HAsciiString &aDescription);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Name() const;
		%feature("autodoc", "1");
		void SetName(const Handle_TCollection_HAsciiString &Name);
		%feature("autodoc", "1");
		Handle_TCollection_HAsciiString Description() const;
		%feature("autodoc", "1");
		void SetDescription(const Handle_TCollection_HAsciiString &Description);
		%feature("autodoc", "1");
		Standard_Boolean HasDescription() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_CharacterizedObject {
	Handle_StepBasic_CharacterizedObject GetHandle() {
	return *(Handle_StepBasic_CharacterizedObject*) &$self;
	}
};
%extend StepBasic_CharacterizedObject {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_CharacterizedObject {
	~StepBasic_CharacterizedObject() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_CharacterizedObject\n");}
	}
};

%nodefaultctor StepBasic_SiUnitAndLengthUnit;
class StepBasic_SiUnitAndLengthUnit : public StepBasic_SiUnit {
	public:
		%feature("autodoc", "1");
		StepBasic_SiUnitAndLengthUnit();
		%feature("autodoc", "1");
		virtual		void Init(const Handle_StepBasic_DimensionalExponents &aDimensions);
		%feature("autodoc", "1");
		virtual		void Init(const Standard_Boolean hasAprefix, const StepBasic_SiPrefix aPrefix, const StepBasic_SiUnitName aName);
		%feature("autodoc", "1");
		void SetLengthUnit(const Handle_StepBasic_LengthUnit &aLengthUnit);
		%feature("autodoc", "1");
		Handle_StepBasic_LengthUnit LengthUnit() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend StepBasic_SiUnitAndLengthUnit {
	Handle_StepBasic_SiUnitAndLengthUnit GetHandle() {
	return *(Handle_StepBasic_SiUnitAndLengthUnit*) &$self;
	}
};
%extend StepBasic_SiUnitAndLengthUnit {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend StepBasic_SiUnitAndLengthUnit {
	~StepBasic_SiUnitAndLengthUnit() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of StepBasic_SiUnitAndLengthUnit\n");}
	}
};