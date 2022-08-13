import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "JangGaeJaRang",
    product: .app,
    packages: [
        .Firebase,
        .Inject
    ],
    dependencies: [
        .SPM.FirebaseAuth,
        .SPM.FirebaseFirestore,
        .SPM.FirebaseFirestoreSwift,
        .SPM.FirebaseStorage,
        .SPM.Inject
    ],
    resources: ["Resources/**"],
    entitlements: Path("Support/JangGaeJaRang.entitlements"),
    infoPlist: .file(path: "Support/Info.plist")
)
