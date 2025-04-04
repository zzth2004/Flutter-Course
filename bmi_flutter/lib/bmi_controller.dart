class BMIResult {
  final String gioiTinh;
  final double chieuCaoCm;
  final int canNangKg;
  final int tuoi;
  final double bmi;
  final String phanLoai;

  BMIResult({
    required this.gioiTinh,
    required this.chieuCaoCm,
    required this.canNangKg,
    required this.tuoi,
    required this.bmi,
    required this.phanLoai,
  });

  @override
  String toString() {
    return 'Giới tính: $gioiTinh\nChiều cao: $chieuCaoCm cm\nCân nặng: $canNangKg kg\n'
        'Tuổi: $tuoi\nBMI: ${bmi.toStringAsFixed(2)}\nPhân loại: $phanLoai';
  }
}

BMIResult tinhBMI(
    String gioiTinh, double chieuCaoCm, int canNangKg, int tuoi) {
  double chieuCaoM = chieuCaoCm / 100; // Chuyển đổi cm sang mét
  double bmi = canNangKg / (chieuCaoM * chieuCaoM);

  // Phân loại BMI theo WHO
  String phanLoai;
  if (bmi < 18.5) {
    phanLoai = "Gầy";
  } else if (bmi < 24.9) {
    phanLoai = "Bình thường";
  } else if (bmi < 29.9) {
    phanLoai = "Thừa cân";
  } else {
    phanLoai = "Béo phì";
  }

  return BMIResult(
    gioiTinh: gioiTinh,
    chieuCaoCm: chieuCaoCm,
    canNangKg: canNangKg,
    tuoi: tuoi,
    bmi: bmi,
    phanLoai: phanLoai,
  );
}
