{pkgs}:
pkgs.mkShell {
  name = "python";
  packages = [
    (pkgs.python3.withPackages (p:
      with p; [
        # ML
        numpy
        opencv-python
        pandas
        pillow
        scikit-learn
        # keras
        # tensorflow
        # torchaudio
      ]))
  ];
}
