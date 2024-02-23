import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { EntriesModule } from './entries/entries.module';
import { CategoriesModule } from './categories/categories.module';
import { ProductModule } from './product/product.module';

@Module({
  imports: [EntriesModule, CategoriesModule, ProductModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
