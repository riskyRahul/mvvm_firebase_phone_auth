class Dose  {
	List<Problems> ?problems;

	Dose ({this.problems});

	Dose .fromJson(Map<String, dynamic> json) {
		if (json['problems'] != null) {
			problems = <Problems>[];
			json['problems'].forEach((v) { problems!.add(new Problems.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.problems != null) {
      data['problems'] = this.problems!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Problems {
	List<Diabetes>? diabetes;

	Problems({this.diabetes});

	Problems.fromJson(Map<String, dynamic> json) {
		if (json['Diabetes'] != null) {
			diabetes = <Diabetes>[];
			json['Diabetes'].forEach((v) { diabetes!.add(new Diabetes.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.diabetes != null) {
      data['Diabetes'] = this.diabetes!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Diabetes {
	List<Medications>? medications;
	List<Labs>? labs;

	Diabetes({this.medications, this.labs});

	Diabetes.fromJson(Map<String, dynamic> json) {
		if (json['medications'] != null) {
			medications = <Medications>[];
			json['medications'].forEach((v) { medications!.add(new Medications.fromJson(v)); });
		}
		if (json['labs'] != null) {
			labs = <Labs>[];
			json['labs'].forEach((v) { labs!.add(new Labs.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.medications != null) {
      data['medications'] = this.medications!.map((v) => v.toJson()).toList();
    }
		if (this.labs != null) {
      data['labs'] = this.labs!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Medications {
	List<MedicationsClasses>? medicationsClasses;

	Medications({this.medicationsClasses});

	Medications.fromJson(Map<String, dynamic> json) {
		if (json['medicationsClasses'] != null) {
			medicationsClasses = <MedicationsClasses>[];
			json['medicationsClasses'].forEach((v) { medicationsClasses!.add(new MedicationsClasses.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.medicationsClasses != null) {
      data['medicationsClasses'] = this.medicationsClasses!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class MedicationsClasses {
	List<ClassName> ?className;
	List<ClassName>? className2;

	MedicationsClasses({this.className, this.className2});

	MedicationsClasses.fromJson(Map<String, dynamic> json) {
		if (json['className'] != null) {
			className = <ClassName>[];
			json['className'].forEach((v) { className!.add(new ClassName.fromJson(v)); });
		}
		if (json['className2'] != null) {
			className2 = <ClassName>[];
			json['className2'].forEach((v) { className2!.add(new ClassName.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.className != null) {
      data['className'] = this.className!.map((v) => v.toJson()).toList();
    }
		if (this.className2 != null) {
      data['className2'] = this.className2!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class ClassName {
	List<AssociatedDrug>? associatedDrug;
	List<AssociatedDrug> ?associatedDrug2;

	ClassName({this.associatedDrug, this.associatedDrug2});

	ClassName.fromJson(Map<String, dynamic> json) {
		if (json['associatedDrug'] != null) {
			associatedDrug = <AssociatedDrug>[];
			json['associatedDrug'].forEach((v) { associatedDrug!.add(new AssociatedDrug.fromJson(v)); });
		}
		if (json['associatedDrug#2'] != null) {
			associatedDrug2 = <AssociatedDrug>[];
			json['associatedDrug#2'].forEach((v) { associatedDrug2!.add(new AssociatedDrug.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.associatedDrug != null) {
      data['associatedDrug'] = this.associatedDrug!.map((v) => v.toJson()).toList();
    }
		if (this.associatedDrug2 != null) {
      data['associatedDrug#2'] = this.associatedDrug2!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class AssociatedDrug {
	String? name;
	String? dose;
	String? strength;

	AssociatedDrug({this.name, this.dose, this.strength});

	AssociatedDrug.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		dose = json['dose'];
		strength = json['strength'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['dose'] = this.dose;
		data['strength'] = this.strength;
		return data;
	}
}

class Labs {
	String ?missingField;

	Labs({this.missingField});

	Labs.fromJson(Map<String, dynamic> json) {
		missingField = json['missing_field'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['missing_field'] = this.missingField;
		return data;
	}
}

