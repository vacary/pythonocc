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
%module Standard

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


%include Standard_dependencies.i


%include Standard_headers.i

typedef unsigned char Standard_Byte;
typedef jmp_buf Standard_JmpBuf;
typedef Standard_Persistent * Standard_OId;
typedef double Standard_Real;
typedef char const * Standard_CString;
typedef short int const * Standard_ExtString;
typedef GUID Standard_UUID;
typedef char Standard_Character;
typedef unsigned int Standard_Boolean;
typedef float Standard_ShortReal;
typedef int Standard_Integer;
typedef Standard_Character * Standard_PCharacter;
typedef short int Standard_ExtCharacter;
typedef Standard_ErrorHandler * Standard_PErrorHandler;
typedef size_t Standard_Size;
typedef Standard_ExtCharacter * Standard_PExtCharacter;
typedef void * Standard_Address;
typedef pthread_t Standard_ThreadId;

enum Standard_InternalType {
	Standard_Void,
	Standard_Char,
	Standard_ExtChar,
	Standard_LongInt,
	Standard_Bool,
	Standard_Float,
	Standard_LongDouble,
	Standard_String,
	Standard_EString,
	Standard_EntryAddress,
	Standard_DataAddress,
	Standard_EngineHandle,
	Standard_Long64,
	Standard_Array,
	};

enum Standard_WayOfLife {
	Standard_IsNothing,
	Standard_IsAddress,
	Standard_IsTransient,
	Standard_IsPersistent,
	Standard_IsNotLoaded,
	};

enum Standard_KindOfType {
	Standard_IsUnKnown,
	Standard_IsClass,
	Standard_IsEnumeration,
	Standard_IsPrimitive,
	Standard_IsImported,
	Standard_IsPackage,
	};

enum Standard_HandlerStatus {
	Standard_HandlerVoid,
	Standard_HandlerJumped,
	Standard_HandlerProcessed,
	};



%nodefaultctor Handle_Standard_Transient;
class Handle_Standard_Transient {
	public:
		%feature("autodoc", "1");
		Handle_Standard_Transient();
		%feature("autodoc", "1");
		Handle_Standard_Transient(const Standard_Transient *anItem);
		%feature("autodoc", "1");
		Handle_Standard_Transient(const Handle_Standard_Transient &aTid);
		%feature("autodoc", "1");
		void Nullify();
		%feature("autodoc", "1");
		Standard_Boolean IsNull() const;
		%feature("autodoc", "1");
		Standard_Transient * Access();
		%feature("autodoc", "1");
		const Standard_Transient * Access() const;
		%feature("autodoc", "1");
		int operator==(const Handle_Standard_Transient &right) const;
		%feature("autodoc", "1");
		int operator==(const Standard_Transient *right) const;
		%feature("autodoc", "1");
		int operator!=(const Handle_Standard_Transient &right) const;
		%feature("autodoc", "1");
		int operator!=(const Standard_Transient *right) const;
		%feature("autodoc", "1");
		Handle_Standard_Transient const DownCast(const Handle_Standard_Transient &AnObject);
		%feature("autodoc", "1");
		void Dump(Standard_OStream & out) const;

};
%extend Handle_Standard_Transient {
	Standard_Transient* GetObject() {
	return (Standard_Transient*)$self->Access();
	}
};
%extend Handle_Standard_Transient {
	~Handle_Standard_Transient() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_Transient\n");}
	}
};

%nodefaultctor Handle_Standard_Failure;
class Handle_Standard_Failure : public Handle_Standard_Transient {
	public:
		%feature("autodoc", "1");
		Handle_Standard_Failure();
		%feature("autodoc", "1");
		Handle_Standard_Failure(const Handle_Standard_Failure &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_Failure(const Standard_Failure *anItem);
		%feature("autodoc", "1");
		Handle_Standard_Failure const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_Failure {
	Standard_Failure* GetObject() {
	return (Standard_Failure*)$self->Access();
	}
};
%extend Handle_Standard_Failure {
	~Handle_Standard_Failure() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_Failure\n");}
	}
};

%nodefaultctor Handle_Standard_DomainError;
class Handle_Standard_DomainError : public Handle_Standard_Failure {
	public:
		%feature("autodoc", "1");
		Handle_Standard_DomainError();
		%feature("autodoc", "1");
		Handle_Standard_DomainError(const Handle_Standard_DomainError &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_DomainError(const Standard_DomainError *anItem);
		%feature("autodoc", "1");
		Handle_Standard_DomainError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_DomainError {
	Standard_DomainError* GetObject() {
	return (Standard_DomainError*)$self->Access();
	}
};
%extend Handle_Standard_DomainError {
	~Handle_Standard_DomainError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_DomainError\n");}
	}
};

%nodefaultctor Handle_Standard_RangeError;
class Handle_Standard_RangeError : public Handle_Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_RangeError();
		%feature("autodoc", "1");
		Handle_Standard_RangeError(const Handle_Standard_RangeError &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_RangeError(const Standard_RangeError *anItem);
		%feature("autodoc", "1");
		Handle_Standard_RangeError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_RangeError {
	Standard_RangeError* GetObject() {
	return (Standard_RangeError*)$self->Access();
	}
};
%extend Handle_Standard_RangeError {
	~Handle_Standard_RangeError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_RangeError\n");}
	}
};

%nodefaultctor Handle_Standard_NullValue;
class Handle_Standard_NullValue : public Handle_Standard_RangeError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_NullValue();
		%feature("autodoc", "1");
		Handle_Standard_NullValue(const Handle_Standard_NullValue &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_NullValue(const Standard_NullValue *anItem);
		%feature("autodoc", "1");
		Handle_Standard_NullValue const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_NullValue {
	Standard_NullValue* GetObject() {
	return (Standard_NullValue*)$self->Access();
	}
};
%extend Handle_Standard_NullValue {
	~Handle_Standard_NullValue() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_NullValue\n");}
	}
};

%nodefaultctor Handle_Standard_TypeMismatch;
class Handle_Standard_TypeMismatch : public Handle_Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_TypeMismatch();
		%feature("autodoc", "1");
		Handle_Standard_TypeMismatch(const Handle_Standard_TypeMismatch &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_TypeMismatch(const Standard_TypeMismatch *anItem);
		%feature("autodoc", "1");
		Handle_Standard_TypeMismatch const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_TypeMismatch {
	Standard_TypeMismatch* GetObject() {
	return (Standard_TypeMismatch*)$self->Access();
	}
};
%extend Handle_Standard_TypeMismatch {
	~Handle_Standard_TypeMismatch() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_TypeMismatch\n");}
	}
};

%nodefaultctor Handle_Standard_Persistent;
class Handle_Standard_Persistent {
	public:
		%feature("autodoc", "1");
		Handle_Standard_Persistent();
		%feature("autodoc", "1");
		Handle_Standard_Persistent(const Handle_Standard_Persistent &aTid);
		%feature("autodoc", "1");
		Handle_Standard_Persistent(const Standard_Persistent *anItem);
		%feature("autodoc", "1");
		void Dump(Standard_OStream & out) const;
		%feature("autodoc", "1");
		int operator==(const Handle_Standard_Persistent &right) const;
		%feature("autodoc", "1");
		int operator==(const Standard_Persistent *right) const;
		%feature("autodoc", "1");
		int operator!=(const Handle_Standard_Persistent &right) const;
		%feature("autodoc", "1");
		int operator!=(const Standard_Persistent *right) const;
		%feature("autodoc", "1");
		void Nullify();
		%feature("autodoc", "1");
		Standard_Boolean IsNull() const;
		%feature("autodoc", "1");
		Standard_Persistent * Access() const;
		%feature("autodoc", "1");
		Handle_Standard_Persistent const DownCast(const Handle_Standard_Persistent &AnObject);

};
%extend Handle_Standard_Persistent {
	Standard_Persistent* GetObject() {
	return (Standard_Persistent*)$self->Access();
	}
};
%extend Handle_Standard_Persistent {
	~Handle_Standard_Persistent() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_Persistent\n");}
	}
};

%nodefaultctor Handle_Standard_OutOfRange;
class Handle_Standard_OutOfRange : public Handle_Standard_RangeError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_OutOfRange();
		%feature("autodoc", "1");
		Handle_Standard_OutOfRange(const Handle_Standard_OutOfRange &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_OutOfRange(const Standard_OutOfRange *anItem);
		%feature("autodoc", "1");
		Handle_Standard_OutOfRange const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_OutOfRange {
	Standard_OutOfRange* GetObject() {
	return (Standard_OutOfRange*)$self->Access();
	}
};
%extend Handle_Standard_OutOfRange {
	~Handle_Standard_OutOfRange() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_OutOfRange\n");}
	}
};

%nodefaultctor Handle_Standard_NumericError;
class Handle_Standard_NumericError : public Handle_Standard_Failure {
	public:
		%feature("autodoc", "1");
		Handle_Standard_NumericError();
		%feature("autodoc", "1");
		Handle_Standard_NumericError(const Handle_Standard_NumericError &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_NumericError(const Standard_NumericError *anItem);
		%feature("autodoc", "1");
		Handle_Standard_NumericError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_NumericError {
	Standard_NumericError* GetObject() {
	return (Standard_NumericError*)$self->Access();
	}
};
%extend Handle_Standard_NumericError {
	~Handle_Standard_NumericError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_NumericError\n");}
	}
};

%nodefaultctor Handle_Standard_DivideByZero;
class Handle_Standard_DivideByZero : public Handle_Standard_NumericError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_DivideByZero();
		%feature("autodoc", "1");
		Handle_Standard_DivideByZero(const Handle_Standard_DivideByZero &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_DivideByZero(const Standard_DivideByZero *anItem);
		%feature("autodoc", "1");
		Handle_Standard_DivideByZero const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_DivideByZero {
	Standard_DivideByZero* GetObject() {
	return (Standard_DivideByZero*)$self->Access();
	}
};
%extend Handle_Standard_DivideByZero {
	~Handle_Standard_DivideByZero() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_DivideByZero\n");}
	}
};

%nodefaultctor Handle_Standard_NoMoreObject;
class Handle_Standard_NoMoreObject : public Handle_Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_NoMoreObject();
		%feature("autodoc", "1");
		Handle_Standard_NoMoreObject(const Handle_Standard_NoMoreObject &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_NoMoreObject(const Standard_NoMoreObject *anItem);
		%feature("autodoc", "1");
		Handle_Standard_NoMoreObject const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_NoMoreObject {
	Standard_NoMoreObject* GetObject() {
	return (Standard_NoMoreObject*)$self->Access();
	}
};
%extend Handle_Standard_NoMoreObject {
	~Handle_Standard_NoMoreObject() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_NoMoreObject\n");}
	}
};

%nodefaultctor Handle_Standard_Overflow;
class Handle_Standard_Overflow : public Handle_Standard_NumericError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_Overflow();
		%feature("autodoc", "1");
		Handle_Standard_Overflow(const Handle_Standard_Overflow &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_Overflow(const Standard_Overflow *anItem);
		%feature("autodoc", "1");
		Handle_Standard_Overflow const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_Overflow {
	Standard_Overflow* GetObject() {
	return (Standard_Overflow*)$self->Access();
	}
};
%extend Handle_Standard_Overflow {
	~Handle_Standard_Overflow() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_Overflow\n");}
	}
};

%nodefaultctor Handle_Standard_ProgramError;
class Handle_Standard_ProgramError : public Handle_Standard_Failure {
	public:
		%feature("autodoc", "1");
		Handle_Standard_ProgramError();
		%feature("autodoc", "1");
		Handle_Standard_ProgramError(const Handle_Standard_ProgramError &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_ProgramError(const Standard_ProgramError *anItem);
		%feature("autodoc", "1");
		Handle_Standard_ProgramError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_ProgramError {
	Standard_ProgramError* GetObject() {
	return (Standard_ProgramError*)$self->Access();
	}
};
%extend Handle_Standard_ProgramError {
	~Handle_Standard_ProgramError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_ProgramError\n");}
	}
};

%nodefaultctor Handle_Standard_NotImplemented;
class Handle_Standard_NotImplemented : public Handle_Standard_ProgramError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_NotImplemented();
		%feature("autodoc", "1");
		Handle_Standard_NotImplemented(const Handle_Standard_NotImplemented &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_NotImplemented(const Standard_NotImplemented *anItem);
		%feature("autodoc", "1");
		Handle_Standard_NotImplemented const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_NotImplemented {
	Standard_NotImplemented* GetObject() {
	return (Standard_NotImplemented*)$self->Access();
	}
};
%extend Handle_Standard_NotImplemented {
	~Handle_Standard_NotImplemented() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_NotImplemented\n");}
	}
};

%nodefaultctor Handle_Standard_NullObject;
class Handle_Standard_NullObject : public Handle_Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_NullObject();
		%feature("autodoc", "1");
		Handle_Standard_NullObject(const Handle_Standard_NullObject &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_NullObject(const Standard_NullObject *anItem);
		%feature("autodoc", "1");
		Handle_Standard_NullObject const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_NullObject {
	Standard_NullObject* GetObject() {
	return (Standard_NullObject*)$self->Access();
	}
};
%extend Handle_Standard_NullObject {
	~Handle_Standard_NullObject() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_NullObject\n");}
	}
};

%nodefaultctor Handle_Standard_AbortiveTransaction;
class Handle_Standard_AbortiveTransaction : public Handle_Standard_Failure {
	public:
		%feature("autodoc", "1");
		Handle_Standard_AbortiveTransaction();
		%feature("autodoc", "1");
		Handle_Standard_AbortiveTransaction(const Handle_Standard_AbortiveTransaction &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_AbortiveTransaction(const Standard_AbortiveTransaction *anItem);
		%feature("autodoc", "1");
		Handle_Standard_AbortiveTransaction const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_AbortiveTransaction {
	Standard_AbortiveTransaction* GetObject() {
	return (Standard_AbortiveTransaction*)$self->Access();
	}
};
%extend Handle_Standard_AbortiveTransaction {
	~Handle_Standard_AbortiveTransaction() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_AbortiveTransaction\n");}
	}
};

%nodefaultctor Handle_Standard_DimensionError;
class Handle_Standard_DimensionError : public Handle_Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_DimensionError();
		%feature("autodoc", "1");
		Handle_Standard_DimensionError(const Handle_Standard_DimensionError &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_DimensionError(const Standard_DimensionError *anItem);
		%feature("autodoc", "1");
		Handle_Standard_DimensionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_DimensionError {
	Standard_DimensionError* GetObject() {
	return (Standard_DimensionError*)$self->Access();
	}
};
%extend Handle_Standard_DimensionError {
	~Handle_Standard_DimensionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_DimensionError\n");}
	}
};

%nodefaultctor Handle_Standard_LicenseError;
class Handle_Standard_LicenseError : public Handle_Standard_Failure {
	public:
		%feature("autodoc", "1");
		Handle_Standard_LicenseError();
		%feature("autodoc", "1");
		Handle_Standard_LicenseError(const Handle_Standard_LicenseError &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_LicenseError(const Standard_LicenseError *anItem);
		%feature("autodoc", "1");
		Handle_Standard_LicenseError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_LicenseError {
	Standard_LicenseError* GetObject() {
	return (Standard_LicenseError*)$self->Access();
	}
};
%extend Handle_Standard_LicenseError {
	~Handle_Standard_LicenseError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_LicenseError\n");}
	}
};

%nodefaultctor Handle_Standard_NoSuchObject;
class Handle_Standard_NoSuchObject : public Handle_Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_NoSuchObject();
		%feature("autodoc", "1");
		Handle_Standard_NoSuchObject(const Handle_Standard_NoSuchObject &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_NoSuchObject(const Standard_NoSuchObject *anItem);
		%feature("autodoc", "1");
		Handle_Standard_NoSuchObject const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_NoSuchObject {
	Standard_NoSuchObject* GetObject() {
	return (Standard_NoSuchObject*)$self->Access();
	}
};
%extend Handle_Standard_NoSuchObject {
	~Handle_Standard_NoSuchObject() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_NoSuchObject\n");}
	}
};

%nodefaultctor Handle_Standard_DimensionMismatch;
class Handle_Standard_DimensionMismatch : public Handle_Standard_DimensionError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_DimensionMismatch();
		%feature("autodoc", "1");
		Handle_Standard_DimensionMismatch(const Handle_Standard_DimensionMismatch &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_DimensionMismatch(const Standard_DimensionMismatch *anItem);
		%feature("autodoc", "1");
		Handle_Standard_DimensionMismatch const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_DimensionMismatch {
	Standard_DimensionMismatch* GetObject() {
	return (Standard_DimensionMismatch*)$self->Access();
	}
};
%extend Handle_Standard_DimensionMismatch {
	~Handle_Standard_DimensionMismatch() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_DimensionMismatch\n");}
	}
};

%nodefaultctor Handle_Standard_OutOfMemory;
class Handle_Standard_OutOfMemory : public Handle_Standard_ProgramError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_OutOfMemory();
		%feature("autodoc", "1");
		Handle_Standard_OutOfMemory(const Handle_Standard_OutOfMemory &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_OutOfMemory(const Standard_OutOfMemory *anItem);
		%feature("autodoc", "1");
		Handle_Standard_OutOfMemory const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_OutOfMemory {
	Standard_OutOfMemory* GetObject() {
	return (Standard_OutOfMemory*)$self->Access();
	}
};
%extend Handle_Standard_OutOfMemory {
	~Handle_Standard_OutOfMemory() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_OutOfMemory\n");}
	}
};

%nodefaultctor Handle_Standard_Type;
class Handle_Standard_Type : public Handle_Standard_Transient {
	public:
		%feature("autodoc", "1");
		Handle_Standard_Type();
		%feature("autodoc", "1");
		Handle_Standard_Type(const Handle_Standard_Type &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_Type(const Standard_Type *anItem);
		%feature("autodoc", "1");
		Handle_Standard_Type const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_Type {
	Standard_Type* GetObject() {
	return (Standard_Type*)$self->Access();
	}
};
%extend Handle_Standard_Type {
	~Handle_Standard_Type() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_Type\n");}
	}
};

%nodefaultctor Handle_Standard_NegativeValue;
class Handle_Standard_NegativeValue : public Handle_Standard_RangeError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_NegativeValue();
		%feature("autodoc", "1");
		Handle_Standard_NegativeValue(const Handle_Standard_NegativeValue &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_NegativeValue(const Standard_NegativeValue *anItem);
		%feature("autodoc", "1");
		Handle_Standard_NegativeValue const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_NegativeValue {
	Standard_NegativeValue* GetObject() {
	return (Standard_NegativeValue*)$self->Access();
	}
};
%extend Handle_Standard_NegativeValue {
	~Handle_Standard_NegativeValue() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_NegativeValue\n");}
	}
};

%nodefaultctor Handle_Standard_ImmutableObject;
class Handle_Standard_ImmutableObject : public Handle_Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_ImmutableObject();
		%feature("autodoc", "1");
		Handle_Standard_ImmutableObject(const Handle_Standard_ImmutableObject &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_ImmutableObject(const Standard_ImmutableObject *anItem);
		%feature("autodoc", "1");
		Handle_Standard_ImmutableObject const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_ImmutableObject {
	Standard_ImmutableObject* GetObject() {
	return (Standard_ImmutableObject*)$self->Access();
	}
};
%extend Handle_Standard_ImmutableObject {
	~Handle_Standard_ImmutableObject() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_ImmutableObject\n");}
	}
};

%nodefaultctor Handle_Standard_Underflow;
class Handle_Standard_Underflow : public Handle_Standard_NumericError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_Underflow();
		%feature("autodoc", "1");
		Handle_Standard_Underflow(const Handle_Standard_Underflow &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_Underflow(const Standard_Underflow *anItem);
		%feature("autodoc", "1");
		Handle_Standard_Underflow const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_Underflow {
	Standard_Underflow* GetObject() {
	return (Standard_Underflow*)$self->Access();
	}
};
%extend Handle_Standard_Underflow {
	~Handle_Standard_Underflow() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_Underflow\n");}
	}
};

%nodefaultctor Handle_Standard_ConstructionError;
class Handle_Standard_ConstructionError : public Handle_Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_ConstructionError();
		%feature("autodoc", "1");
		Handle_Standard_ConstructionError(const Handle_Standard_ConstructionError &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_ConstructionError(const Standard_ConstructionError *anItem);
		%feature("autodoc", "1");
		Handle_Standard_ConstructionError const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_ConstructionError {
	Standard_ConstructionError* GetObject() {
	return (Standard_ConstructionError*)$self->Access();
	}
};
%extend Handle_Standard_ConstructionError {
	~Handle_Standard_ConstructionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_ConstructionError\n");}
	}
};

%nodefaultctor Handle_Standard_LicenseNotFound;
class Handle_Standard_LicenseNotFound : public Handle_Standard_LicenseError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_LicenseNotFound();
		%feature("autodoc", "1");
		Handle_Standard_LicenseNotFound(const Handle_Standard_LicenseNotFound &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_LicenseNotFound(const Standard_LicenseNotFound *anItem);
		%feature("autodoc", "1");
		Handle_Standard_LicenseNotFound const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_LicenseNotFound {
	Standard_LicenseNotFound* GetObject() {
	return (Standard_LicenseNotFound*)$self->Access();
	}
};
%extend Handle_Standard_LicenseNotFound {
	~Handle_Standard_LicenseNotFound() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_LicenseNotFound\n");}
	}
};

%nodefaultctor Handle_Standard_MultiplyDefined;
class Handle_Standard_MultiplyDefined : public Handle_Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_MultiplyDefined();
		%feature("autodoc", "1");
		Handle_Standard_MultiplyDefined(const Handle_Standard_MultiplyDefined &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_MultiplyDefined(const Standard_MultiplyDefined *anItem);
		%feature("autodoc", "1");
		Handle_Standard_MultiplyDefined const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_MultiplyDefined {
	Standard_MultiplyDefined* GetObject() {
	return (Standard_MultiplyDefined*)$self->Access();
	}
};
%extend Handle_Standard_MultiplyDefined {
	~Handle_Standard_MultiplyDefined() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_MultiplyDefined\n");}
	}
};

%nodefaultctor Handle_Standard_TooManyUsers;
class Handle_Standard_TooManyUsers : public Handle_Standard_LicenseError {
	public:
		%feature("autodoc", "1");
		Handle_Standard_TooManyUsers();
		%feature("autodoc", "1");
		Handle_Standard_TooManyUsers(const Handle_Standard_TooManyUsers &aHandle);
		%feature("autodoc", "1");
		Handle_Standard_TooManyUsers(const Standard_TooManyUsers *anItem);
		%feature("autodoc", "1");
		Handle_Standard_TooManyUsers const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_Standard_TooManyUsers {
	Standard_TooManyUsers* GetObject() {
	return (Standard_TooManyUsers*)$self->Access();
	}
};
%extend Handle_Standard_TooManyUsers {
	~Handle_Standard_TooManyUsers() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Handle_Standard_TooManyUsers\n");}
	}
};

%nodefaultctor Standard_Transient;
class Standard_Transient {
	public:
		%feature("autodoc", "1");
		Standard_Transient();
		%feature("autodoc", "1");
		virtual		void Delete() const;
		%feature("autodoc", "1");
		virtual		Standard_Integer HashCode(const Standard_Integer Upper) const;
		%feature("autodoc", "1");
		virtual		void ShallowDump(Standard_OStream & arg0) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		Standard_Boolean IsInstance(const Handle_Standard_Type &theType) const;
		%feature("autodoc", "1");
		Standard_Boolean IsInstance(const char * theTypeName) const;
		%feature("autodoc", "1");
		Standard_Boolean IsKind(const Handle_Standard_Type &theType) const;
		%feature("autodoc", "1");
		Standard_Boolean IsKind(const char * theTypeName) const;
		%feature("autodoc", "1");
		virtual		Handle_Standard_Transient This() const;
		%feature("autodoc", "1");
		Standard_Integer GetRefCount() const;

};
%extend Standard_Transient {
	Handle_Standard_Transient GetHandle() {
	return *(Handle_Standard_Transient*) &$self;
	}
};
%extend Standard_Transient {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_Transient {
	~Standard_Transient() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_Transient\n");}
	}
};

%nodefaultctor Standard_Failure;
class Standard_Failure : public Standard_Transient {
	public:
		%feature("autodoc", "1");
		Standard_Failure();
		%feature("autodoc", "1");
		Standard_Failure(const Standard_Failure &f);
		%feature("autodoc", "1");
		Standard_Failure(const char * aString);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		void Print(Standard_OStream & s) const;
		%feature("autodoc", "1");
		Standard_CString GetMessageString() const;
		%feature("autodoc", "1");
		void SetMessageString(const char * aMessage);
		%feature("autodoc", "1");
		void Reraise();
		%feature("autodoc", "1");
		void Reraise(const char * aMessage);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_Failure NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		void Jump() const;
		%feature("autodoc", "1");
		Handle_Standard_Failure Caught();

};
%extend Standard_Failure {
	Handle_Standard_Failure GetHandle() {
	return *(Handle_Standard_Failure*) &$self;
	}
};
%extend Standard_Failure {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_Failure {
	~Standard_Failure() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_Failure\n");}
	}
};

%nodefaultctor Standard_LicenseError;
class Standard_LicenseError : public Standard_Failure {
	public:
		%feature("autodoc", "1");
		Standard_LicenseError();
		%feature("autodoc", "1");
		Standard_LicenseError(const char * AString);
		%feature("autodoc", "1");
		Handle_Standard_LicenseError NewInstance(const char * aMessage);

};
%extend Standard_LicenseError {
	Handle_Standard_LicenseError GetHandle() {
	return *(Handle_Standard_LicenseError*) &$self;
	}
};
%extend Standard_LicenseError {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_LicenseError {
	~Standard_LicenseError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_LicenseError\n");}
	}
};

%nodefaultctor Standard_DomainError;
class Standard_DomainError : public Standard_Failure {
	public:
		%feature("autodoc", "1");
		Standard_DomainError();
		%feature("autodoc", "1");
		Standard_DomainError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_DomainError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_DomainError {
	Handle_Standard_DomainError GetHandle() {
	return *(Handle_Standard_DomainError*) &$self;
	}
};
%extend Standard_DomainError {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_DomainError {
	~Standard_DomainError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_DomainError\n");}
	}
};

%nodefaultctor Standard_NoSuchObject;
class Standard_NoSuchObject : public Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Standard_NoSuchObject();
		%feature("autodoc", "1");
		Standard_NoSuchObject(const char * AString);
		%feature("autodoc", "1");
		Handle_Standard_NoSuchObject NewInstance(const char * aMessage);

};
%extend Standard_NoSuchObject {
	Handle_Standard_NoSuchObject GetHandle() {
	return *(Handle_Standard_NoSuchObject*) &$self;
	}
};
%extend Standard_NoSuchObject {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_NoSuchObject {
	~Standard_NoSuchObject() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_NoSuchObject\n");}
	}
};

%nodefaultctor Standard_RangeError;
class Standard_RangeError : public Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Standard_RangeError();
		%feature("autodoc", "1");
		Standard_RangeError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_RangeError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_RangeError {
	Handle_Standard_RangeError GetHandle() {
	return *(Handle_Standard_RangeError*) &$self;
	}
};
%extend Standard_RangeError {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_RangeError {
	~Standard_RangeError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_RangeError\n");}
	}
};

%nodefaultctor Standard_NullValue;
class Standard_NullValue : public Standard_RangeError {
	public:
		%feature("autodoc", "1");
		Standard_NullValue();
		%feature("autodoc", "1");
		Standard_NullValue(const char * AString);
		%feature("autodoc", "1");
		Handle_Standard_NullValue NewInstance(const char * aMessage);

};
%extend Standard_NullValue {
	Handle_Standard_NullValue GetHandle() {
	return *(Handle_Standard_NullValue*) &$self;
	}
};
%extend Standard_NullValue {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_NullValue {
	~Standard_NullValue() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_NullValue\n");}
	}
};

%nodefaultctor Standard_NumericError;
class Standard_NumericError : public Standard_Failure {
	public:
		%feature("autodoc", "1");
		Standard_NumericError();
		%feature("autodoc", "1");
		Standard_NumericError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_NumericError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_NumericError {
	Handle_Standard_NumericError GetHandle() {
	return *(Handle_Standard_NumericError*) &$self;
	}
};
%extend Standard_NumericError {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_NumericError {
	~Standard_NumericError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_NumericError\n");}
	}
};

%nodefaultctor Standard_MMgrRoot;
class Standard_MMgrRoot {
	public:
		%feature("autodoc", "1");
		virtual		Standard_Address Allocate(const Standard_Size theSize);
		%feature("autodoc", "1");
		virtual		Standard_Address Reallocate(Standard_Address & aPtr, const Standard_Size theSize);
		%feature("autodoc", "1");
		virtual		void Free(Standard_Address & aPtr);
		%feature("autodoc", "1");
		virtual		Standard_Integer Purge(Standard_Boolean =0);
		%feature("autodoc", "1");
		virtual		void SetReentrant(Standard_Boolean );

};
%extend Standard_MMgrRoot {
	~Standard_MMgrRoot() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_MMgrRoot\n");}
	}
};

%nodefaultctor Standard_MMgrRaw;
class Standard_MMgrRaw : public Standard_MMgrRoot {
	public:
		%feature("autodoc", "1");
		Standard_MMgrRaw(const Standard_Boolean aClear=0);
		%feature("autodoc", "1");
		virtual		Standard_Address Allocate(const Standard_Size aSize);
		%feature("autodoc", "1");
		virtual		Standard_Address Reallocate(Standard_Address & aPtr, const Standard_Size aSize);
		%feature("autodoc", "1");
		virtual		void Free(Standard_Address & arg0);

};
%extend Standard_MMgrRaw {
	~Standard_MMgrRaw() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_MMgrRaw\n");}
	}
};

%nodefaultctor Standard_NoMoreObject;
class Standard_NoMoreObject : public Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Standard_NoMoreObject();
		%feature("autodoc", "1");
		Standard_NoMoreObject(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_NoMoreObject NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_NoMoreObject {
	Handle_Standard_NoMoreObject GetHandle() {
	return *(Handle_Standard_NoMoreObject*) &$self;
	}
};
%extend Standard_NoMoreObject {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_NoMoreObject {
	~Standard_NoMoreObject() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_NoMoreObject\n");}
	}
};

%nodefaultctor Standard_ProgramError;
class Standard_ProgramError : public Standard_Failure {
	public:
		%feature("autodoc", "1");
		Standard_ProgramError();
		%feature("autodoc", "1");
		Standard_ProgramError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_ProgramError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_ProgramError {
	Handle_Standard_ProgramError GetHandle() {
	return *(Handle_Standard_ProgramError*) &$self;
	}
};
%extend Standard_ProgramError {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_ProgramError {
	~Standard_ProgramError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_ProgramError\n");}
	}
};

%nodefaultctor Standard_NotImplemented;
class Standard_NotImplemented : public Standard_ProgramError {
	public:
		%feature("autodoc", "1");
		Standard_NotImplemented();
		%feature("autodoc", "1");
		Standard_NotImplemented(const char * AString);
		%feature("autodoc", "1");
		Handle_Standard_NotImplemented NewInstance(const char * aMessage);

};
%extend Standard_NotImplemented {
	Handle_Standard_NotImplemented GetHandle() {
	return *(Handle_Standard_NotImplemented*) &$self;
	}
};
%extend Standard_NotImplemented {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_NotImplemented {
	~Standard_NotImplemented() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_NotImplemented\n");}
	}
};

%nodefaultctor Standard_DimensionError;
class Standard_DimensionError : public Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Standard_DimensionError();
		%feature("autodoc", "1");
		Standard_DimensionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_DimensionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_DimensionError {
	Handle_Standard_DimensionError GetHandle() {
	return *(Handle_Standard_DimensionError*) &$self;
	}
};
%extend Standard_DimensionError {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_DimensionError {
	~Standard_DimensionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_DimensionError\n");}
	}
};

%nodefaultctor Standard_ConstructionError;
class Standard_ConstructionError : public Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Standard_ConstructionError();
		%feature("autodoc", "1");
		Standard_ConstructionError(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_ConstructionError NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_ConstructionError {
	Handle_Standard_ConstructionError GetHandle() {
	return *(Handle_Standard_ConstructionError*) &$self;
	}
};
%extend Standard_ConstructionError {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_ConstructionError {
	~Standard_ConstructionError() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_ConstructionError\n");}
	}
};

%nodefaultctor Standard_MMgrOpt;
class Standard_MMgrOpt : public Standard_MMgrRoot {
	public:
		%feature("autodoc", "1");
		Standard_MMgrOpt(const Standard_Boolean aClear=1, const Standard_Boolean aMMap=1, const Standard_Size aCellSize=200, const Standard_Integer aNbPages=10000, const Standard_Size aThreshold=40000, const Standard_Boolean isReentrant=0);
		%feature("autodoc", "1");
		virtual		Standard_Address Allocate(const Standard_Size aSize);
		%feature("autodoc", "1");
		virtual		Standard_Address Reallocate(Standard_Address & aPtr, const Standard_Size aSize);
		%feature("autodoc", "1");
		virtual		void Free(Standard_Address & aPtr);
		%feature("autodoc", "1");
		virtual		Standard_Integer Purge(Standard_Boolean );
		%feature("autodoc", "1");
		virtual		void SetReentrant(Standard_Boolean );

};
%extend Standard_MMgrOpt {
	~Standard_MMgrOpt() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_MMgrOpt\n");}
	}
};

%nodefaultctor Standard_TypeMismatch;
class Standard_TypeMismatch : public Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Standard_TypeMismatch();
		%feature("autodoc", "1");
		Standard_TypeMismatch(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_TypeMismatch NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_TypeMismatch {
	Handle_Standard_TypeMismatch GetHandle() {
	return *(Handle_Standard_TypeMismatch*) &$self;
	}
};
%extend Standard_TypeMismatch {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_TypeMismatch {
	~Standard_TypeMismatch() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_TypeMismatch\n");}
	}
};

%nodefaultctor Standard_Storable;
class Standard_Storable {
	public:
		%feature("autodoc", "1");
		Standard_Storable();
		%feature("autodoc", "1");
		virtual		void Delete();
		%feature("autodoc", "1");
		virtual		Standard_Integer HashCode(const Standard_Integer Upper) const;
		%feature("autodoc", "1");
		Standard_Boolean IsEqual(const Standard_Storable &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean operator==(const Standard_Storable &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean IsSimilar(const Standard_Storable &Other) const;
		%feature("autodoc", "1");
		virtual		void ShallowDump(Standard_OStream & S) const;

};
%extend Standard_Storable {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_Storable {
	~Standard_Storable() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_Storable\n");}
	}
};

%nodefaultctor Standard_DimensionMismatch;
class Standard_DimensionMismatch : public Standard_DimensionError {
	public:
		%feature("autodoc", "1");
		Standard_DimensionMismatch();
		%feature("autodoc", "1");
		Standard_DimensionMismatch(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_DimensionMismatch NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_DimensionMismatch {
	Handle_Standard_DimensionMismatch GetHandle() {
	return *(Handle_Standard_DimensionMismatch*) &$self;
	}
};
%extend Standard_DimensionMismatch {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_DimensionMismatch {
	~Standard_DimensionMismatch() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_DimensionMismatch\n");}
	}
};

%nodefaultctor Standard_Type;
class Standard_Type : public Standard_Transient {
	public:
		%feature("autodoc", "1");
		Standard_CString Name() const;
		%feature("autodoc", "1");
		Standard_Integer Size() const;
		%feature("autodoc", "1");
		Standard_Type(const char * aName, const Standard_Integer aSize);
		%feature("autodoc", "1");
		Standard_Type(const char * aName, const Standard_Integer aSize, const Standard_Integer aNumberOfParent, const Standard_Address aAncestors);
		%feature("autodoc", "1");
		Standard_Type(const char * aName, const Standard_Integer aSize, const Standard_Integer aNumberOfElement, const Standard_Integer aNumberOfParent, const Standard_Address anAncestors, const Standard_Address aElements);
		%feature("autodoc", "1");
		Standard_Type(const char * aName, const Standard_Integer aSize, const Standard_Integer aNumberOfParent, const Standard_Address anAncestors, const Standard_Address aFields);
		%feature("autodoc", "1");
		Standard_Boolean SubType(const Handle_Standard_Type &aOther) const;
		%feature("autodoc", "1");
		Standard_Boolean SubType(const char * theName) const;
		%feature("autodoc", "1");
		Standard_Boolean IsImported() const;
		%feature("autodoc", "1");
		Standard_Boolean IsPrimitive() const;
		%feature("autodoc", "1");
		Standard_Boolean IsEnumeration() const;
		%feature("autodoc", "1");
		Standard_Boolean IsClass() const;
		%feature("autodoc", "1");
		Standard_Integer NumberOfParent() const;
		%feature("autodoc", "1");
		Standard_Integer NumberOfAncestor() const;
		%feature("autodoc", "1");
		void ShallowDump() const;
		%feature("autodoc", "1");
		virtual		void ShallowDump(Standard_OStream & S) const;
		%feature("autodoc", "1");
		void Print(Standard_OStream & s) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_Type {
	Handle_Standard_Type GetHandle() {
	return *(Handle_Standard_Type*) &$self;
	}
};
%extend Standard_Type {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_Type {
	~Standard_Type() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_Type\n");}
	}
};

%nodefaultctor Standard_ErrorHandlerCallback;
class Standard_ErrorHandlerCallback {
	public:
		%feature("autodoc", "1");
		void RegisterCallback();
		%feature("autodoc", "1");
		void UnregisterCallback();
		%feature("autodoc", "1");
		virtual		void DestroyCallback();

};
%extend Standard_ErrorHandlerCallback {
	~Standard_ErrorHandlerCallback() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_ErrorHandlerCallback\n");}
	}
};

%nodefaultctor Standard_NegativeValue;
class Standard_NegativeValue : public Standard_RangeError {
	public:
		%feature("autodoc", "1");
		Standard_NegativeValue();
		%feature("autodoc", "1");
		Standard_NegativeValue(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_NegativeValue NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_NegativeValue {
	Handle_Standard_NegativeValue GetHandle() {
	return *(Handle_Standard_NegativeValue*) &$self;
	}
};
%extend Standard_NegativeValue {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_NegativeValue {
	~Standard_NegativeValue() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_NegativeValue\n");}
	}
};

%nodefaultctor Standard_DivideByZero;
class Standard_DivideByZero : public Standard_NumericError {
	public:
		%feature("autodoc", "1");
		Standard_DivideByZero();
		%feature("autodoc", "1");
		Standard_DivideByZero(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_DivideByZero NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_DivideByZero {
	Handle_Standard_DivideByZero GetHandle() {
	return *(Handle_Standard_DivideByZero*) &$self;
	}
};
%extend Standard_DivideByZero {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_DivideByZero {
	~Standard_DivideByZero() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_DivideByZero\n");}
	}
};

%nodefaultctor Standard_ImmutableObject;
class Standard_ImmutableObject : public Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Standard_ImmutableObject();
		%feature("autodoc", "1");
		Standard_ImmutableObject(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_ImmutableObject NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_ImmutableObject {
	Handle_Standard_ImmutableObject GetHandle() {
	return *(Handle_Standard_ImmutableObject*) &$self;
	}
};
%extend Standard_ImmutableObject {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_ImmutableObject {
	~Standard_ImmutableObject() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_ImmutableObject\n");}
	}
};

%nodefaultctor Standard_AbortiveTransaction;
class Standard_AbortiveTransaction : public Standard_Failure {
	public:
		%feature("autodoc", "1");
		Standard_AbortiveTransaction();
		%feature("autodoc", "1");
		Standard_AbortiveTransaction(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_AbortiveTransaction NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_AbortiveTransaction {
	Handle_Standard_AbortiveTransaction GetHandle() {
	return *(Handle_Standard_AbortiveTransaction*) &$self;
	}
};
%extend Standard_AbortiveTransaction {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_AbortiveTransaction {
	~Standard_AbortiveTransaction() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_AbortiveTransaction\n");}
	}
};

%nodefaultctor Standard_AncestorIterator;
class Standard_AncestorIterator {
	public:
		%feature("autodoc", "1");
		Standard_AncestorIterator(const Standard_AncestorIterator &anOther);
		%feature("autodoc", "1");
		Standard_AncestorIterator(const Handle_Standard_Type &aType);
		%feature("autodoc", "1");
		void Assign(const Standard_AncestorIterator &anOther);
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		Standard_AncestorIterator Iterator() const;
		%feature("autodoc", "1");
		Handle_Standard_Type Value() const;

};
%extend Standard_AncestorIterator {
	~Standard_AncestorIterator() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_AncestorIterator\n");}
	}
};

%nodefaultctor Standard_OutOfMemory;
class Standard_OutOfMemory : public Standard_ProgramError {
	public:
		%feature("autodoc", "1");
		Standard_OutOfMemory();
		%feature("autodoc", "1");
		Standard_OutOfMemory(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_OutOfMemory NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_OutOfMemory {
	Handle_Standard_OutOfMemory GetHandle() {
	return *(Handle_Standard_OutOfMemory*) &$self;
	}
};
%extend Standard_OutOfMemory {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_OutOfMemory {
	~Standard_OutOfMemory() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_OutOfMemory\n");}
	}
};

%nodefaultctor Standard_MultiplyDefined;
class Standard_MultiplyDefined : public Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Standard_MultiplyDefined();
		%feature("autodoc", "1");
		Standard_MultiplyDefined(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_MultiplyDefined NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_MultiplyDefined {
	Handle_Standard_MultiplyDefined GetHandle() {
	return *(Handle_Standard_MultiplyDefined*) &$self;
	}
};
%extend Standard_MultiplyDefined {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_MultiplyDefined {
	~Standard_MultiplyDefined() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_MultiplyDefined\n");}
	}
};

%nodefaultctor Standard_TooManyUsers;
class Standard_TooManyUsers : public Standard_LicenseError {
	public:
		%feature("autodoc", "1");
		Standard_TooManyUsers();
		%feature("autodoc", "1");
		Standard_TooManyUsers(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_TooManyUsers NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_TooManyUsers {
	Handle_Standard_TooManyUsers GetHandle() {
	return *(Handle_Standard_TooManyUsers*) &$self;
	}
};
%extend Standard_TooManyUsers {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_TooManyUsers {
	~Standard_TooManyUsers() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_TooManyUsers\n");}
	}
};

%nodefaultctor Standard_LicenseNotFound;
class Standard_LicenseNotFound : public Standard_LicenseError {
	public:
		%feature("autodoc", "1");
		Standard_LicenseNotFound();
		%feature("autodoc", "1");
		Standard_LicenseNotFound(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_LicenseNotFound NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_LicenseNotFound {
	Handle_Standard_LicenseNotFound GetHandle() {
	return *(Handle_Standard_LicenseNotFound*) &$self;
	}
};
%extend Standard_LicenseNotFound {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_LicenseNotFound {
	~Standard_LicenseNotFound() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_LicenseNotFound\n");}
	}
};

%nodefaultctor Standard;
class Standard {
	public:
		%feature("autodoc", "1");
		Standard();
		%feature("autodoc", "1");
		Standard_Address Allocate(const Standard_Size aSize);
		%feature("autodoc", "1");
		void Free(Standard_Address & aStorage);
		%feature("autodoc", "1");
		Standard_Address Reallocate(Standard_Address & aStorage, const Standard_Size aNewSize);
		%feature("autodoc", "1");
		Standard_Integer Purge();
		%feature("autodoc", "1");
		Standard_Boolean IsReentrant();
		%feature("autodoc", "1");
		void SetReentrant(const Standard_Boolean isReentrant);

};
%extend Standard {
	~Standard() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard\n");}
	}
};

%nodefaultctor Standard_Underflow;
class Standard_Underflow : public Standard_NumericError {
	public:
		%feature("autodoc", "1");
		Standard_Underflow();
		%feature("autodoc", "1");
		Standard_Underflow(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_Underflow NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_Underflow {
	Handle_Standard_Underflow GetHandle() {
	return *(Handle_Standard_Underflow*) &$self;
	}
};
%extend Standard_Underflow {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_Underflow {
	~Standard_Underflow() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_Underflow\n");}
	}
};

%nodefaultctor Standard_Overflow;
class Standard_Overflow : public Standard_NumericError {
	public:
		%feature("autodoc", "1");
		Standard_Overflow();
		%feature("autodoc", "1");
		Standard_Overflow(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_Overflow NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_Overflow {
	Handle_Standard_Overflow GetHandle() {
	return *(Handle_Standard_Overflow*) &$self;
	}
};
%extend Standard_Overflow {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_Overflow {
	~Standard_Overflow() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_Overflow\n");}
	}
};

%nodefaultctor Standard_NullObject;
class Standard_NullObject : public Standard_DomainError {
	public:
		%feature("autodoc", "1");
		Standard_NullObject();
		%feature("autodoc", "1");
		Standard_NullObject(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_NullObject NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_NullObject {
	Handle_Standard_NullObject GetHandle() {
	return *(Handle_Standard_NullObject*) &$self;
	}
};
%extend Standard_NullObject {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_NullObject {
	~Standard_NullObject() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_NullObject\n");}
	}
};

%nodefaultctor Standard_GUID;
class Standard_GUID {
	public:
		%feature("autodoc", "1");
		Standard_GUID();
		%feature("autodoc", "1");
		Standard_GUID(const char * aGuid);
		%feature("autodoc", "1");
		Standard_GUID(const Standard_ExtString aGuid);
		%feature("autodoc", "1");
		Standard_GUID(const Standard_Integer a32b, const Standard_ExtCharacter a16b1, const Standard_ExtCharacter a16b2, const Standard_ExtCharacter a16b3, const Standard_Byte a8b1, const Standard_Byte a8b2, const Standard_Byte a8b3, const Standard_Byte a8b4, const Standard_Byte a8b5, const Standard_Byte a8b6);
		%feature("autodoc", "1");
		Standard_GUID(const Standard_UUID &aGuid);
		%feature("autodoc", "1");
		Standard_GUID(const Standard_GUID &aGuid);
		%feature("autodoc", "1");
		Standard_UUID ToUUID() const;
		%feature("autodoc", "1");
		void ToCString(const Standard_PCharacter aStrGuid) const;
		%feature("autodoc", "1");
		void ToExtString(const Standard_PExtCharacter aStrGuid) const;
		%feature("autodoc", "1");
		Standard_Boolean IsSame(const Standard_GUID &uid) const;
		%feature("autodoc", "1");
		Standard_Boolean operator==(const Standard_GUID &uid) const;
		%feature("autodoc", "1");
		Standard_Boolean IsNotSame(const Standard_GUID &uid) const;
		%feature("autodoc", "1");
		Standard_Boolean operator!=(const Standard_GUID &uid) const;
		%feature("autodoc", "1");
		void Assign(const Standard_GUID &uid);
		%feature("autodoc", "1");
		void Assign(const Standard_UUID &uid);
		%feature("autodoc", "1");
		virtual		void ShallowDump(Standard_OStream & aStream) const;
		%feature("autodoc", "1");
		Standard_Boolean CheckGUIDFormat(const char * aGuid);
		%feature("autodoc", "1");
		Standard_Integer Hash(const Standard_Integer Upper) const;
		%feature("autodoc", "1");
		Standard_Integer HashCode(const Standard_GUID &aguid, const Standard_Integer Upper);
		%feature("autodoc", "1");
		Standard_Boolean IsEqual(const Standard_GUID &string1, const Standard_GUID &string2);
		%feature("autodoc", "1");
		Standard_Integer _CSFDB_GetStandard_GUIDmy32b() const;
		%feature("autodoc", "1");
		void _CSFDB_SetStandard_GUIDmy32b(const Standard_Integer p);
		%feature("autodoc", "1");
		Standard_ExtCharacter _CSFDB_GetStandard_GUIDmy16b1() const;
		%feature("autodoc", "1");
		void _CSFDB_SetStandard_GUIDmy16b1(const Standard_ExtCharacter p);
		%feature("autodoc", "1");
		Standard_ExtCharacter _CSFDB_GetStandard_GUIDmy16b2() const;
		%feature("autodoc", "1");
		void _CSFDB_SetStandard_GUIDmy16b2(const Standard_ExtCharacter p);
		%feature("autodoc", "1");
		Standard_ExtCharacter _CSFDB_GetStandard_GUIDmy16b3() const;
		%feature("autodoc", "1");
		void _CSFDB_SetStandard_GUIDmy16b3(const Standard_ExtCharacter p);
		%feature("autodoc", "1");
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b1() const;
		%feature("autodoc", "1");
		void _CSFDB_SetStandard_GUIDmy8b1(const Standard_Byte p);
		%feature("autodoc", "1");
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b2() const;
		%feature("autodoc", "1");
		void _CSFDB_SetStandard_GUIDmy8b2(const Standard_Byte p);
		%feature("autodoc", "1");
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b3() const;
		%feature("autodoc", "1");
		void _CSFDB_SetStandard_GUIDmy8b3(const Standard_Byte p);
		%feature("autodoc", "1");
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b4() const;
		%feature("autodoc", "1");
		void _CSFDB_SetStandard_GUIDmy8b4(const Standard_Byte p);
		%feature("autodoc", "1");
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b5() const;
		%feature("autodoc", "1");
		void _CSFDB_SetStandard_GUIDmy8b5(const Standard_Byte p);
		%feature("autodoc", "1");
		Standard_Byte _CSFDB_GetStandard_GUIDmy8b6() const;
		%feature("autodoc", "1");
		void _CSFDB_SetStandard_GUIDmy8b6(const Standard_Byte p);

};
%extend Standard_GUID {
	~Standard_GUID() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_GUID\n");}
	}
};

%nodefaultctor Standard_ErrorHandler;
class Standard_ErrorHandler {
	public:
		%feature("autodoc", "1");
		Standard_ErrorHandler();
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		void Unlink();
		%feature("autodoc", "1");
		Standard_Boolean Catches(const Handle_Standard_Type &aType);
		%feature("autodoc", "1");
		Handle_Standard_Failure Error() const;
		%feature("autodoc", "1");
		Handle_Standard_Failure LastCaughtError();
		%feature("autodoc", "1");
		Standard_Boolean IsInTryBlock();

};
%extend Standard_ErrorHandler {
	~Standard_ErrorHandler() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_ErrorHandler\n");}
	}
};

%nodefaultctor Standard_Persistent;
class Standard_Persistent {
	public:
		%feature("autodoc", "1");
		virtual		Handle_Standard_Persistent This() const;
		%feature("autodoc", "1");
		virtual		Handle_Standard_Persistent ShallowCopy() const;
		%feature("autodoc", "1");
		virtual		void Delete() const;
		%feature("autodoc", "1");
		Standard_Persistent();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		Standard_Boolean IsKind(const Handle_Standard_Type &arg0) const;
		%feature("autodoc", "1");
		Standard_Boolean IsInstance(const Handle_Standard_Type &arg0) const;
		%feature("autodoc", "1");
		virtual		Standard_Integer HashCode(const Standard_Integer Upper) const;
		%feature("autodoc", "1");
		virtual		void ShallowDump(Standard_OStream & arg0) const;

};
%extend Standard_Persistent {
	Handle_Standard_Persistent GetHandle() {
	return *(Handle_Standard_Persistent*) &$self;
	}
};
%extend Standard_Persistent {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_Persistent {
	~Standard_Persistent() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_Persistent\n");}
	}
};

%nodefaultctor Standard_OutOfRange;
class Standard_OutOfRange : public Standard_RangeError {
	public:
		%feature("autodoc", "1");
		Standard_OutOfRange();
		%feature("autodoc", "1");
		Standard_OutOfRange(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_Standard_OutOfRange NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend Standard_OutOfRange {
	Handle_Standard_OutOfRange GetHandle() {
	return *(Handle_Standard_OutOfRange*) &$self;
	}
};
%extend Standard_OutOfRange {
	Standard_Integer __hash__() {
	return $self->HashCode(LONG_MAX);
	}
};
%extend Standard_OutOfRange {
	~Standard_OutOfRange() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_OutOfRange\n");}
	}
};

%nodefaultctor Standard_Mutex;
class Standard_Mutex : public Standard_ErrorHandlerCallback {
	public:
		%feature("autodoc", "1");
		Standard_Mutex();
		%feature("autodoc", "1");
		void Lock();
		%feature("autodoc", "1");
		Standard_Boolean TryLock();
		%feature("autodoc", "1");
		void Unlock();

};
%extend Standard_Mutex {
	~Standard_Mutex() {
	char *__env=getenv("PYTHONOCC_VERBOSE");
	if (__env){printf("## Call custom destructor for instance of Standard_Mutex\n");}
	}
};