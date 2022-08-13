import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "JangGaeJaRang",
    product: .app,
    packages: [
        .Firebase
    ],
    dependencies: [
        .SPM.FirebaseAuth,
        .SPM.FirebaseFirestore,
        .SPM.FirebaseFirestoreSwift,
        .SPM.FirebaseStorage
    ],
    resources: ["Resources/**"],
    entitlements: Path("Support/JangGaeJaRang.entitlements"),
    infoPlist: .file(path: "Support/Info.plist")
)
