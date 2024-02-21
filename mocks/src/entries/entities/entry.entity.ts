export class Entry {
    API: string;
    Description: string;
    Auth: string;
    HTTPS: boolean;
    Cors: string;
    Link: string;
    Category: string;
}
export class Entries {
    count: number;
    entries: [Entry]
}