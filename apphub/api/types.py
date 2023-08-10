from enum import Enum
from typing import List, Literal, Optional, TypedDict, TypeVar

T = TypeVar("T")


class AppBundle(TypedDict):
    value: str
    type: str
    runtime: str
    sdk: str


class BusPermission(TypedDict):
    own: List[str]
    talk: List[str]


class AppPermissions(
    TypedDict(
        "AppPermissions", {"session-bus": BusPermission, "system-bus": BusPermission}
    )
):
    sockets: List[
        Literal[
            "cups",
            "fallback-x11",
            "gpg-agent",
            "pcsc",
            "pulseaudio",
            "session-bus",
            "ssh-auth",
            "system-bus",
            "x11",
            "wayland",
        ]
    ]
    devices: List[Literal["all", "dri", "kvm", "shm"]]
    shared: List[Literal["ipc", "network"]]
    filesystems: List[str]


class AppManifest(TypedDict):
    name: str
    runtime: str
    sdk: str
    command: str
    tags: list[str]
    permissions: AppPermissions


class AppHitJson(TypedDict):
    name: str
    keywords: List[str] | None
    summary: str
    id: str
    description: str
    project_license: str
    is_free_license: bool
    app_id: str
    icon: str
    categories: List[str]
    main_categories: List[str]
    sub_categories: List[str]
    developer_name: str | None
    project_group: str | None
    verification_verified: str
    verification_method: Literal["website", "login_provider", "manual"]
    verification_login_name: str | None
    verification_login_provider: Literal["github", "gitlab", "kde", "gnome"] | None
    verification_login_is_organization: Literal["true", "false"] | None
    verification_website: str | None
    verification_timestamp: str
    runtime: str
    updated_at: int
    added_at: int
    installs_last_month: int
    arches: List[Literal["aarch64", "x86_64"]]
    download_size: int
    timestamp: int
    installed_size: int
    metadata: "AppManifest"


class QueryInfo(TypedDict):
    query: str
    hits: List[AppHitJson]
    processingTimeMs: int
    hitsPerPage: int
    page: int
    totalPages: int
    totalHits: int


class Release(TypedDict):
    timestamp: str
    version: str
    description: str | None


AppMetadata = TypedDict(
    "AppMetadata",
    {
        "flathub::verification::verified": Optional[str],
        "flathub::verification::timestamp": Optional[str],
        "flathub::verification::method": Optional[str],
        "flathub::verification::website": Optional[str],
        "flathub::verification::login_is_organization": Optional[str],
        "X-Flatpak-Tags": Optional[Literal["proprietary"]],
    },
)


class Screenshot(TypedDict):
    default: bool | None
    sizes: dict[str, str]


class AppUrls(TypedDict):
    bugtracker: str | None
    contribute: str | None
    donation: str | None
    help: str | None
    homepage: str | None
    translate: str | None
    vcs_browser: str | None


class FlathubApp(TypedDict):
    description: str
    screenshots: List[Screenshot]
    releases: List[Release]
    urls: AppUrls
    icon: str
    metadata: AppMetadata
    id: str
    name: str
    summary: str
    developer_name: str
    catagories: List[str]
    keywords: List[str]
    kudos: List[str]
    mimetypes: List[str]
    project_license: str
    bundle: AppBundle
