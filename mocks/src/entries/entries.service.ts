import { Injectable } from '@nestjs/common';
import { CreateEntryDto } from './dto/create-entry.dto';
import { UpdateEntryDto } from './dto/update-entry.dto';
import { Entries, Entry } from './entities/entry.entity';

@Injectable()
export class EntriesService {
  create(createEntryDto: CreateEntryDto) {
    return 'This action adds a new entry';
  }

  findAll() {
    let entry = new Entry();
    entry.API = 'AdoptAPet'
    entry.Description = 'Resource to help get pets adopted'
    entry.Auth = 'apiKey'
    entry.HTTPS = true
    entry.Cors = 'yes'
    entry.Link = 'https://www.adoptapet.com/public/apis/pet_list.html'
    entry.Category = 'Animals'
    let entries = new Entries()
    entries.count = 1
    entries.entries = [entry]
    return entries;
  }

  findOne(id: number) {
    return `This action returns a #${id} entry`;
  }

  update(id: number, updateEntryDto: UpdateEntryDto) {
    return `This action updates a #${id} entry`;
  }

  remove(id: number) {
    return `This action removes a #${id} entry`;
  }
}
