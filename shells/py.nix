{ pkgs }:
pkgs.mkShell {
  name = "python";
  packages = [
    (pkgs.python3.withPackages (p:
      with p; [
        keras
        numpy
        opencv-python
        pandas
        pillow
        scikit-learn
        tensorflow
        torchaudio
      ]))
  ];
}
