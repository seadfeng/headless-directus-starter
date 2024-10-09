
export type SaveEvent = {
  event: 'items.update' | 'items.create';
  payload: Record<string, any>;
  keys?: string[];
  collection: string;
}  